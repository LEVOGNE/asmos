import sys, os, re, bisect, hashlib, subprocess, tarfile, time, urllib.request, collections, socket, json

QEMU_VERSION = "11.1.1"
QEMU_URL = f"https://download.qemu.org/qemu-{QEMU_VERSION}.tar.xz"
QEMU_SHA256 = "079ffbff8a7111bbc89022107cbabf3bbfd614d5fc9d7cc675991196aca12482"
PLUGINS = ("hotblocks", "hotpages", "execlog")
ICOUNT_SHIFT = 2
PIPELINE = ("fb_present", "fb_present_all", "cursor_hide", "cursor_show", "cursor_present",
            "cursor_render", "win_repaint_render", "win_repaint_present", "vg_fill", "anim_tick")


class Projekt:
    def __init__(self):
        self.wurzel = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        self.build = os.path.join(self.wurzel, "build", "trace")
        os.makedirs(self.build, exist_ok=True)

    def pfad(self, *teile):
        return os.path.join(self.wurzel, *teile)

    def makefile_wert(self, name):
        text = open(self.pfad("Makefile")).read()
        m = re.search(r"^%s\s*:=\s*(.*)$" % re.escape(name), text, re.M)
        if not m:
            raise SystemExit(f"FEHLER: {name} nicht im Makefile gefunden")
        wert = m.group(1)
        for var in set(re.findall(r"\$\((\w+)\)", wert)):
            wert = wert.replace(f"$({var})", self.makefile_wert(var))
        return wert

    def geraete(self):
        disk = self.pfad(self.makefile_wert("DISK"))
        if not os.path.exists(disk):
            raise SystemExit("FEHLER: disk.img fehlt. Zuerst make disk ausfuehren.")
        return self.makefile_wert("DEVICES").replace(self.makefile_wert("DISK"), disk).split()

    def kernel(self):
        k = self.pfad("kernel.bin")
        if not os.path.exists(k) or not os.path.exists(self.pfad("kernel.elf")):
            raise SystemExit("FEHLER: kernel.bin oder kernel.elf fehlt. Zuerst make ausfuehren.")
        return k


class PluginBau:
    def __init__(self, projekt):
        self.p = projekt
        self.paket = os.path.join(projekt.build, f"qemu-{QEMU_VERSION}.tar.xz")
        self.quelle = os.path.join(projekt.build, f"qemu-{QEMU_VERSION}")

    def dylib(self, name):
        return os.path.join(self.p.build, f"lib{name}.dylib")

    def fertig(self):
        return all(os.path.exists(self.dylib(n)) for n in PLUGINS)

    def version_pruefen(self):
        aus = subprocess.run(["qemu-system-aarch64", "--version"], capture_output=True, text=True).stdout
        if QEMU_VERSION not in aus:
            raise SystemExit(f"FEHLER: installiertes QEMU ist nicht {QEMU_VERSION}: {aus.strip().splitlines()[0]}\n"
                             f"QEMU_VERSION und QEMU_SHA256 in tools/trace.py anpassen.")

    def paket_holen(self):
        if not os.path.exists(self.paket):
            print(f"lade {QEMU_URL}")
            urllib.request.urlretrieve(QEMU_URL, self.paket)
        h = hashlib.sha256(open(self.paket, "rb").read()).hexdigest()
        if h != QEMU_SHA256:
            os.remove(self.paket)
            raise SystemExit(f"FEHLER: Pruefsumme des QEMU-Pakets stimmt nicht: {h}")

    def entpacken(self):
        wollen = [f"qemu-{QEMU_VERSION}/include/plugins/qemu-plugin.h"] + \
                 [f"qemu-{QEMU_VERSION}/contrib/plugins/{n}.c" for n in PLUGINS]
        with tarfile.open(self.paket) as t:
            for name in wollen:
                t.extract(name, self.p.build, filter="data")

    def glib(self):
        praefix = subprocess.run(["brew", "--prefix", "glib"], capture_output=True, text=True).stdout.strip()
        if not praefix:
            raise SystemExit("FEHLER: glib nicht ueber Homebrew gefunden (Abhaengigkeit von qemu).")
        return praefix

    def bauen(self):
        self.version_pruefen()
        self.paket_holen()
        self.entpacken()
        g = self.glib()
        for n in PLUGINS:
            cmd = ["cc", "-O2", "-fPIC", "-shared", "-Wl,-undefined,dynamic_lookup",
                   "-I", os.path.join(self.quelle, "include", "plugins"),
                   "-I", os.path.join(g, "include", "glib-2.0"),
                   "-I", os.path.join(g, "lib", "glib-2.0", "include"),
                   "-L", os.path.join(g, "lib"), "-lglib-2.0",
                   "-o", self.dylib(n), os.path.join(self.quelle, "contrib", "plugins", f"{n}.c")]
            r = subprocess.run(cmd, capture_output=True, text=True)
            if r.returncode:
                raise SystemExit(f"FEHLER beim Bauen von {n}:\n{r.stderr}")
            print(f"gebaut: {self.dylib(n)}")


class Symbole:
    def __init__(self, projekt):
        aus = subprocess.run(["aarch64-elf-nm", "-n", projekt.pfad("kernel.elf")],
                             capture_output=True, text=True).stdout
        self.code, self.alle = [], []
        for zeile in aus.splitlines():
            a, t, n = zeile.split()
            eintrag = (int(a, 16), n)
            self.alle.append(eintrag)
            if t in "tT":
                self.code.append(eintrag)
        self.code.sort()
        self.alle.sort()
        self.code_adr = [a for a, _ in self.code]
        self.alle_adr = [a for a, _ in self.alle]

    def marke(self, adr):
        i = bisect.bisect_right(self.code_adr, adr) - 1
        return self.code[i][1] if i >= 0 else "?"

    def region(self, adr):
        i = bisect.bisect_right(self.alle_adr, adr) - 1
        return self.alle[i][1] if i >= 0 else "?"

    def adresse(self, name):
        for a, n in self.code:
            if n == name:
                return a
        raise SystemExit(f"FEHLER: Marke {name} nicht im ELF")

    def routine(self, marke, koepfe):
        beste = marke
        for k in koepfe:
            if marke.startswith(k + "_") and len(k) < len(beste):
                beste = k
        return beste


class Eingabe:
    ABS_MAX = 32767

    def __init__(self, sockpfad, breite, hoehe):
        self.sockpfad, self.breite, self.hoehe = sockpfad, breite, hoehe
        self.sock = None

    def verbinden(self):
        for _ in range(100):
            try:
                self.sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
                self.sock.connect(self.sockpfad)
                break
            except OSError:
                time.sleep(0.1)
        else:
            raise SystemExit("FEHLER: QMP-Socket nicht erreichbar")
        self.datei = self.sock.makefile("r")
        self.datei.readline()
        self.befehl("qmp_capabilities")

    def befehl(self, name, **args):
        self.sock.sendall((json.dumps({"execute": name, "arguments": args}) + "\n").encode())
        while True:
            antwort = json.loads(self.datei.readline())
            if "return" in antwort or "error" in antwort:
                if "error" in antwort:
                    raise SystemExit(f"FEHLER QMP {name}: {antwort['error']}")
                return antwort["return"]

    def bewegen(self, x, y):
        self.befehl("input-send-event", events=[
            {"type": "abs", "data": {"axis": "x", "value": x * self.ABS_MAX // (self.breite - 1)}},
            {"type": "abs", "data": {"axis": "y", "value": y * self.ABS_MAX // (self.hoehe - 1)}}])

    def taste(self, unten):
        self.befehl("input-send-event", events=[{"type": "btn", "data": {"down": unten, "button": "left"}}])

    def schliessen(self):
        self.datei.close()
        self.sock.close()


class Szenario:
    WARTEN = 3.0
    SCHRITT = 0.02

    def __init__(self, name, breite, hoehe):
        self.name, self.breite, self.hoehe = name, breite, hoehe

    def abspielen(self, eingabe):
        time.sleep(self.WARTEN)
        if self.name == "idle":
            return
        eingabe.verbinden()
        if self.name == "move":
            for i in range(200):
                eingabe.bewegen(200 + i * 12, 300 + (i % 40) * 8)
                time.sleep(self.SCHRITT)
        elif self.name == "drag":
            x, y = 960 + 700, 640 + 26
            eingabe.bewegen(x, y)
            time.sleep(0.2)
            eingabe.taste(True)
            time.sleep(0.2)
            for i in range(100):
                eingabe.bewegen(x + i * 6, y + i * 3)
                time.sleep(self.SCHRITT)
            eingabe.taste(False)
            time.sleep(0.3)
        eingabe.schliessen()


class Lauf:
    def __init__(self, projekt, bau, name, sekunden, szenario=None):
        self.p, self.bau, self.name, self.sekunden, self.szenario = projekt, bau, name, sekunden, szenario
        self.log = os.path.join(projekt.build, f"{name}.plugin")
        self.serial = os.path.join(projekt.build, f"{name}.serial")
        self.qmp = os.path.join(projekt.build, f"{name}.qmp")

    def starten(self, plugin_arg):
        for f in (self.log, self.serial, self.qmp):
            if os.path.exists(f):
                os.remove(f)
        cmd = ["qemu-system-aarch64", "-machine", "virt", "-cpu", "cortex-a72"] + self.p.geraete() + \
              ["-display", "none", "-serial", f"file:{self.serial}", "-monitor", "stdio",
               "-qmp", f"unix:{self.qmp},server,nowait"] + \
              (["-icount", f"shift={ICOUNT_SHIFT},sleep=on"] if self.szenario else []) + \
              ["-kernel", self.p.kernel(), "-plugin", plugin_arg, "-d", "plugin", "-D", self.log]
        proc = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, text=True)
        if self.szenario:
            self.szenario.abspielen(Eingabe(self.qmp, self.szenario.breite, self.szenario.hoehe))
        else:
            time.sleep(self.sekunden)
        try:
            _, err = proc.communicate(input="quit\n", timeout=60)
        except subprocess.TimeoutExpired:
            proc.kill()
            raise SystemExit("FEHLER: QEMU hat auf quit nicht beendet")
        if proc.returncode:
            raise SystemExit(f"FEHLER: QEMU Exit {proc.returncode}\n{err}")
        seriell = open(self.serial, errors="replace").read() if os.path.exists(self.serial) else ""
        ok = "BOOT OK" in seriell
        panik = "PANIC" in seriell
        print(f"{self.name}: {self.sekunden} s, BOOT OK: {'ja' if ok else 'NEIN'}, PANIC: {'JA' if panik else 'nein'}, "
              f"Protokoll {os.path.getsize(self.log) if os.path.exists(self.log) else 0} Byte")
        if panik or not ok:
            print(seriell)
            raise SystemExit("FEHLER: Lauf nicht sauber")
        return open(self.log).read().splitlines()


class Profil:
    def __init__(self, projekt, bau, symbole, sekunden):
        self.p, self.bau, self.s, self.sekunden = projekt, bau, symbole, sekunden

    def erheben(self, name="hotblocks", szenario=None):
        zeilen = Lauf(self.p, self.bau, name, self.sekunden, szenario).starten(f"{self.bau.dylib('hotblocks')},limit=100000")
        je_marke, bloecke = collections.Counter(), 0
        for z in zeilen:
            m = re.match(r"0x([0-9a-f]+),\s*(\d+),\s*(\d+),\s*(\d+)", z)
            if not m:
                continue
            bloecke += 1
            je_marke[self.s.marke(int(m.group(1), 16))] += int(m.group(3)) * int(m.group(4))
        koepfe = sorted(je_marke, key=len)
        je_routine = collections.Counter()
        for marke, n in je_marke.items():
            je_routine[self.s.routine(marke, koepfe)] += n
        return bloecke, je_routine

    def ausfuehren(self):
        bloecke, je_routine = self.erheben()
        gesamt = sum(je_routine.values())
        print(f"\nBloecke: {bloecke}, Instruktionen: {gesamt:,}")
        print(f"{'Routine':<30}{'Instruktionen':>16}{'Anteil':>9}")
        summe = 0
        for name, n in je_routine.most_common(25):
            summe += n
            print(f"{name:<30}{n:>16,}{100 * n / gesamt:>8.1f}%")
        print(f"{'(Summe der Liste)':<30}{summe:>16,}{100 * summe / gesamt:>8.1f}%")


class Szenen:
    EREIGNISSE = {"move": 200, "drag": 100}

    def __init__(self, projekt, bau, symbole):
        self.p, self.bau, self.s = projekt, bau, symbole
        text = open(projekt.pfad("kernel.S")).read()
        self.breite = int(re.search(r"^\.equ FB_WIDTH,\s*(\d+)", text, re.M).group(1))
        self.hoehe = int(re.search(r"^\.equ FB_HEIGHT,\s*(\d+)", text, re.M).group(1))

    def ausfuehren(self):
        profil = Profil(self.p, self.bau, self.s, 0)
        _, ruhe = profil.erheben("szene_idle", Szenario("idle", self.breite, self.hoehe))
        for name, anzahl in self.EREIGNISSE.items():
            _, last = profil.erheben(f"szene_{name}", Szenario(name, self.breite, self.hoehe))
            diff = collections.Counter({r: last[r] - ruhe.get(r, 0) for r in last})
            gesamt = sum(v for v in diff.values() if v > 0)
            print(f"\nSzenario {name}: {anzahl} Ereignisse, {gesamt:,} Instruktionen mehr als Ruhe, "
                  f"{gesamt // anzahl:,} je Ereignis")
            print(f"{'Routine':<30}{'Instruktionen':>16}{'je Ereignis':>13}{'Anteil':>8}")
            for r, n in diff.most_common(18):
                if n <= 0:
                    break
                print(f"{r:<30}{n:>16,}{n // anzahl:>13,}{100 * n / gesamt:>7.1f}%")


class Aufrufe:
    def __init__(self, projekt, bau, symbole, sekunden, marken):
        self.p, self.bau, self.s, self.sekunden, self.marken = projekt, bau, symbole, sekunden, marken

    def ausfuehren(self):
        adressen = {self.s.adresse(n): n for n in self.marken}
        arg = ",".join([self.bau.dylib("execlog")] + [f"afilter=0x{a:x}" for a in adressen])
        zeilen = Lauf(self.p, self.bau, "execlog", self.sekunden).starten(arg)
        folge = []
        for z in zeilen:
            m = re.match(r"\d+, 0x([0-9a-f]+),", z)
            if m and int(m.group(1), 16) in adressen:
                folge.append(adressen[int(m.group(1), 16)])
        print(f"\nAufrufe gesamt: {len(folge)}")
        for name, n in collections.Counter(folge).most_common():
            print(f"  {name:<24}{n:>8}")
        gruppen = []
        for name in folge:
            if gruppen and gruppen[-1][0] == name:
                gruppen[-1][1] += 1
            else:
                gruppen.append([name, 1])
        print("\nReihenfolge:")
        print(" -> ".join(f"{n}x{k}" if k > 1 else n for n, k in gruppen))


class Seiten:
    def __init__(self, projekt, bau, symbole, sekunden, seitengroesse):
        self.p, self.bau, self.s, self.sekunden, self.groesse = projekt, bau, symbole, sekunden, seitengroesse

    def ausfuehren(self):
        zeilen = Lauf(self.p, self.bau, "hotpages", self.sekunden).starten(
            f"{self.bau.dylib('hotpages')},sortby=writes,pagesize={self.groesse}")
        regionen = {}
        lesen = schreiben = 0
        for z in zeilen:
            m = re.match(r"0x([0-9a-f]+),\s*0x[0-9a-f]+,\s*(\d+),\s*0x[0-9a-f]+,\s*(\d+)", z)
            if not m:
                continue
            r = self.s.region(int(m.group(1), 16))
            e = regionen.setdefault(r, [0, 0, 0])
            e[0] += int(m.group(2))
            e[1] += int(m.group(3))
            e[2] += 1
            lesen += int(m.group(2))
            schreiben += int(m.group(3))
        print(f"\nSeitengroesse {self.groesse} Byte, Lesezugriffe {lesen:,}, Schreibzugriffe {schreiben:,}")
        print(f"{'Region':<24}{'Seiten':>7}{'Lese':>15}{'Schreib':>15}{'Schreibanteil':>15}")
        for r, (rc, wc, n) in sorted(regionen.items(), key=lambda x: -x[1][1]):
            print(f"{r:<24}{n:>7}{rc:>15,}{wc:>15,}{100 * wc / schreiben if schreiben else 0:>14.1f}%")


class Befehl:
    HILFE = """tools/trace.py  QEMU-Plugin-Messungen gegen kernel.bin, headless

  build                     Plugins hotblocks, hotpages, execlog aus dem QEMU-Quellpaket bauen (nach build/trace)
  profile [SEK]             Instruktionen je Routine (Standard 6 s)
  calls [SEK] [MARKE ...]   Aufrufreihenfolge der Bildpipeline oder der genannten Marken
  pages [SEK] [BYTES]       Lese- und Schreibzugriffe je Speicherregion (Standard 1 MiB Seiten)
  scenes                    Mehrkosten je Mausbewegung und je Ziehschritt gegenueber Ruhe (Eingabe ueber QMP)
  all [SEK]                 profile, calls und pages nacheinander"""

    def __init__(self, argv):
        self.argv = argv
        self.p = Projekt()
        self.bau = PluginBau(self.p)

    def sekunden(self, i=2, standard=6):
        return int(self.argv[i]) if len(self.argv) > i and self.argv[i].isdigit() else standard

    def sicherstellen(self):
        if not self.bau.fertig():
            self.bau.bauen()

    def ausfuehren(self):
        if len(self.argv) < 2 or self.argv[1] not in ("build", "profile", "calls", "pages", "scenes", "all"):
            print(self.HILFE)
            return 1
        was = self.argv[1]
        if was == "build":
            self.bau.bauen()
            return 0
        self.sicherstellen()
        s = Symbole(self.p)
        sek = self.sekunden()
        if was == "scenes":
            Szenen(self.p, self.bau, s).ausfuehren()
            return 0
        if was in ("profile", "all"):
            Profil(self.p, self.bau, s, sek).ausfuehren()
        if was in ("calls", "all"):
            marken = [a for a in self.argv[2:] if not a.isdigit()] or list(PIPELINE)
            Aufrufe(self.p, self.bau, s, sek, marken).ausfuehren()
        if was in ("pages", "all"):
            extra = [a for a in self.argv[3:] if a.isdigit()]
            Seiten(self.p, self.bau, s, sek, int(extra[0]) if extra else 1048576).ausfuehren()
        return 0


if __name__ == "__main__":
    sys.exit(Befehl(sys.argv).ausfuehren())
