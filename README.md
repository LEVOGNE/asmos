<div align="center">

# asmOS

**As**sembler **O**perating **S**ystem

**Ein Betriebssystem, von Hand in Assembler geschrieben, gebaut als Monolith.**

Kein Linux darunter. Keine Bibliotheken. Kein C.<br>
Nur Maschinenbefehle für ARM-Prozessoren, ein Linker-Skript und ein Makefile.

<img src="https://img.shields.io/badge/Architektur-AArch64-blue?style=flat-square" alt="AArch64">
<img src="https://img.shields.io/badge/Sprache-GNU%20Assembler-orange?style=flat-square" alt="Assembler">
<img src="https://img.shields.io/badge/Kernel-65.352%20Byte-brightgreen?style=flat-square" alt="65352 Byte">
<img src="https://img.shields.io/badge/Ziel-QEMU%20virt-lightgrey?style=flat-square" alt="QEMU virt">

<br>

<img src="docs/screenshot.png" width="640" alt="asmOS im Betrieb: Fenster mit TrueType-Titeln und Mauszeiger">

<sub><i>Das laufende System: eigener Bildspeicher, eigene TrueType-Schrift, eigener Mauszeiger, animierte Fenster.</i></sub>

<br><br>

Das fertige System ist <b>65.352&nbsp;Byte</b> groß, also <b>64&nbsp;KB</b>.<br>
Ein handelsüblicher Linux-Kernel ist etwa <b>tausendmal</b> größer.

</div>

---

## Was es heute schon kann

<table>
<tr><td width="190"><b>Selbst starten</b></td><td>Läuft ohne Firmware-Hilfe hoch, richtet Stack und Speicher ein, erkennt selbst, auf welcher Privilegstufe der Prozessor gestartet ist</td></tr>
<tr><td><b>Reden</b></td><td>Serielle Schnittstelle in beide Richtungen: Textausgabe und Tastatureingabe</td></tr>
<tr><td><b>Sich melden</b></td><td>Bei einem Prozessorfehler keine stille Endlosschleife, sondern eine Diagnose mit Ursache, Adresse und Prozessorzustand</td></tr>
<tr><td><b>Zeit messen</b></td><td>Hardware-Zeitgeber mit echten Unterbrechungen. Die Taktfrequenz wird ausgelesen, nicht angenommen</td></tr>
<tr><td><b>Ein Bild malen</b></td><td><b>3840 × 1600</b> Bildpunkte, intern 32 Bit je Punkt mit Alphakanal in der Byte-Reihenfolge der Ausgabe, Rechtecke, Text und Transparenz</td></tr>
<tr><td><b>Schreiben</b></td><td><b>Eigener TrueType-Renderer.</b> Der Kernel liest eine Schriftdatei vom Datenträger, wertet ihre Tabellen aus, zerlegt die Bézierkurven, füllt die Flächen nach der Umlaufregel und glättet die Kanten. Jede Größe scharf, keine eingebauten Glyphen</td></tr>
<tr><td><b>Eine Maus führen</b></td><td>Zeiger bewegt sich, überdeckter Hintergrund wird gesichert und sauber wiederhergestellt. Einfach-, Doppel- und Dreifachklick werden unterschieden</td></tr>
<tr><td><b>Fenster zeigen</b></td><td>Fenster mit Titelleiste und TrueType-Beschriftung. Anklicken holt sie nach vorn, an der Titelleiste lassen sie sich ziehen. Neu gezeichnet wird nur, was sich wirklich geändert hat. Jedes Fenster hält sein fertig gerastertes Bild in einem eigenen Puffer, Ziehen ist dadurch ein Kopieren, kein Neurastern</td></tr>
<tr><td><b>Sich bewegen</b></td><td><b>Eigene Animationsschicht.</b> Fenster blenden ein, Fokuswechsel und Ziehen laufen weich statt sprunghaft. Zeitgesteuert, nicht bildzahlgesteuert, dadurch gleich schnell auf schneller und langsamer Maschine</td></tr>
<tr><td><b>Speicher verwalten</b></td><td>Erkennt selbst, wie viel Arbeitsspeicher da ist, verwaltet ihn seitenweise und schaltet die Speicherverwaltungseinheit des Prozessors ein</td></tr>
<tr><td><b>Dateien lesen</b></td><td>Spricht mit einem Datenträger und liest echte FAT32-Dateien, so wie ein USB-Stick sie enthält</td></tr>
<tr><td><b>Dateien zeigen</b></td><td>Ein Fenster listet den Inhalt des Datenträgers auf, gelesen beim Start aus dem echten Wurzelverzeichnis. Der Text wird auf den Fensterkörper beschnitten, läuft also nie über den Rand</td></tr>
<tr><td><b>Ins Netz gehen</b></td><td><b>Eigener Netzwerktreiber und die ersten Protokolle.</b> virtio-net mit Empfangs- und Sendequeue, Ethernet, ARP, IPv4, ICMP, UDP und DHCP: Beim Start holt sich das System per DHCP Adresse, Gateway und Nameserver, fragt das Gateway per ARP nach seiner Hardwareadresse, schickt ihm ein Ping, löst per DNS einen Namen auf und holt sich per TCP die erste Zeile einer Webseite: <code>HTTP/1.1 200 OK</code> von example.com. Bis zu vier Verbindungen laufen gleichzeitig, jede mit eigenem Sendepuffer und eigener Empfangsroutine. Alles erscheint auf der seriellen Leitung</td></tr>
<tr><td><b>Sich abschalten</b></td><td>Roter Knopf oben rechts: Unterbrechungen sperren, Zeitgeber anhalten, Geräte zurücksetzen, Puffer überschreiben, Maschine abschalten</td></tr>
</table>

---

## Loslegen

**Einmalig die Werkzeuge installieren:**

```bash
brew install aarch64-elf-binutils aarch64-elf-gcc aarch64-elf-gdb qemu
```

Das sind die Programme, die aus Assembler-Text Maschinencode für ARM machen, plus QEMU, das einen ARM-Computer nachbildet.

**Testdatenträger anlegen und starten:**

```bash
make disk
make run
```

`make disk` muss nur einmal laufen. Es öffnet sich ein Fenster mit den Fenstern und dem Mauszeiger. Im Terminal läuft die Konsole mit blinkendem Cursor, dort kannst du tippen.

> **Schneller geht es mit `make fast`.** Das schaltet die Hardware-Beschleunigung des Macs zu und läuft rund **4,4-mal schneller**. Der Code läuft dann allerdings auf dem echten Prozessor des Rechners statt auf einem emulierten Cortex-A72.

### Beenden

**Der saubere Weg: auf den roten Knopf oben rechts klicken.** asmOS fährt geordnet herunter und schaltet die Maschine über PSCI ab. QEMU beendet sich dabei von selbst.

Falls das nicht möglich ist:

| Gestartet mit | Beenden |
|---|---|
| `make run`, `make fast` | Fenster schliessen, oder <kbd>Strg</kbd>+<kbd>C</kbd> im Terminal |
| `make serial` | <kbd>Strg</kbd>+<kbd>A</kbd>, loslassen, dann <kbd>X</kbd> |

Bei `make serial` läuft QEMU mit `-nographic` und legt Konsole und Monitor auf dieselbe Leitung, deshalb gibt es dort das Fluchtzeichen <kbd>Strg</kbd>+<kbd>A</kbd>. Bei `make run` gibt es das nicht, die serielle Leitung geht dort unverändert ins Terminal.

<details>
<summary><b>Alle Befehle im Überblick</b></summary>

<br>

| Befehl | Was passiert |
|---|---|
| `make` | Baut den Kernel |
| `make run` | Startet mit Fenster, Konsole im Terminal. Emuliert einen Cortex-A72 in Software |
| `make fast` | Wie `make run`, aber mit Hardware-Beschleunigung, rund 4,4-mal schneller |
| `make serial` | Startet nur mit Textkonsole, ohne Fenster |
| `make check` | Startet drei Sekunden, schreibt alles mit, prüft und meldet OK oder FEHLER |
| `make shot` | Macht ein Bildschirmfoto nach `screen.png` und beendet sich selbst |
| `make debug` | Startet angehalten mit Debugger-Anschluss auf Port 1234 |
| `make trace` | Misst sechs Sekunden unsichtbar: Instruktionen je Routine, Aufrufreihenfolge der Bildausgabe, Speicherzugriffe je Region. Baut beim ersten Mal drei QEMU-Plugins aus dem QEMU-Quellpaket nach `build/`. `python3 tools/trace.py scenes` misst zusätzlich die Kosten je Mausbewegung und je Ziehschritt, die Eingabe kommt über QMP |
| `make disk` | Erzeugt den FAT32-Testdatenträger neu |
| `make font-rescue` | Holt die Systemschrift aus einem vorhandenen `disk.img` zurück |
| `make dtb` | Liest die Hardwarebeschreibung der Maschine aus |
| `make clean` | Räumt Bauartefakte auf |
| `make distclean` | Räumt zusätzlich den Testdatenträger weg |

`make check` und `make shot` laufen ohne Zutun und beenden sich selbst. Sie sind dafür gedacht, dass später ein Programm das System prüfen kann, ohne dass ein Mensch danebensitzt.

</details>

---

## Die Dateien

### Quelltext

<table>
<tr>
<td width="150"><b><code>kernel.S</code></b><br><sub>432 KB · 17562 Zeilen</sub></td>
<td>Das <b>ganze Betriebssystem in einer einzigen Datei</b>. Das ist Absicht: keine Aufteilung in Module, keine Hilfsdateien. Struktur entsteht im Code, nicht im Dateisystem.</td>
</tr>
<tr>
<td><b><code>linker.ld</code></b><br><sub>2,0 KB</sub></td>
<td>Sagt dem Baukasten, wohin im Speicher was gehört: Code ab Adresse <code>0x40080000</code>, danach Daten, Stack, Bildpuffer. Enthält ausserdem 17 Prüfzusicherungen, die den Bau abbrechen lassen, falls die Tabelle der Fehlerbehandlung verrutscht.</td>
</tr>
<tr>
<td><b><code>Makefile</code></b><br><sub>4,1 KB</sub></td>
<td>Die Kommandozentrale, siehe Befehlstabelle oben.</td>
</tr>
<tr>
<td><b><code>tools/iconc.py</code></b></td>
<td>Wandelt SVG-Icons in das eigene Vektorformat des Kernels. Läuft auf dem Entwicklungsrechner, nicht im System.</td>
</tr>
<tr>
<td><b><code>tools/trace.py</code></b></td>
<td>Messwerkzeug für <code>make trace</code>. Lässt QEMU mit Plugins unsichtbar laufen und ordnet jede Adresse über die Symbole aus <code>kernel.elf</code> einer Routine oder einem Puffer zu. Der Kernel selbst enthält dafür keine einzige Zeile.</td>
</tr>
<tr>
<td><b><code>docs/quellen.md</code></b><br><sub>98 KB · 1409 Zeilen</sub></td>
<td><b>Die wichtigste Datei für die Vertrauenswürdigkeit des Codes.</b> Für jede Hardware-Adresse, jedes Bit und jede Startsequenz steht dort, aus welcher Quelle der Wert stammt. Dazu jeder Fehler mit Ursache, Nachweis und Behebung.</td>
</tr>
</table>

> **Warum eine eigene Datei nur für Quellenangaben?**
> Bei hardwarenaher Programmierung ist Raten die teuerste Fehlerquelle überhaupt. Ein erfundener Registerwert kostet Tage an Fehlersuche. Deshalb gilt hier: **kein Wert ohne Beleg.**

<details>
<summary><b>Wie sich die 17562 Zeilen aufteilen</b></summary>

<br>

In `kernel.S` stecken **1779 Sprungmarken**. Jede gehört zu einem Zuständigkeitsbereich, erkennbar am Namensanfang. Ein Bereich fasst seinen Zustand selbst und wird von aussen nur über seine Einsprungpunkte benutzt:

| Namensanfang | Anzahl | Zuständig für |
|---|---:|---|
| `net_` `tcp_` `dhcp_` `dns_` `http_` | 241 | **Netzwerk**: virtio-net, ARP, IPv4, ICMP, UDP, DHCP, DNS, TCP mit Verbindungstabelle |
| `tls_` | 136 | **TLS 1.3**: ClientHello, ServerHello, Schlüsselableitung, Record-Schicht, Finished, verschlüsselte Anwendungsdaten |
 **Netzwerk**: virtio-net, ARP, IPv4, ICMP, UDP, DHCP, DNS, TCP mit Verbindungstabelle |
| `font_` `glyph_` | 117 | TrueType auswerten und über die Vektor-Engine zeichnen |
| `win_` `dirty_` | 120 | Fenster, Stapelreihenfolge, Ziehen, Teilaktualisierung, Fensterpuffer |
| `term_` `netlog_` `key_` `gui_` `vin_` | 58 | **Terminalfenster**, Netzwerkfenster, Tastaturring, Geräteerkennung für Tablet und Tastatur |
| `fb_` `cursor_` | 86 | Bildschirm, Bildpunkte, Mauszeiger |
| `blk_` `fat_` | 83 | Datenträger und Dateisystem |
| `anim_` | 80 | **Animationsschicht**: Zeitmessung, Verläufe, Beschleunigungskurven |
| `mem_` `pmm_` `mmu_` `fdt_` `ram_` | 82 | Speicherverwaltung und Hardware-Erkennung |
| `virtio_` `mouse_` `click_` | 76 | Gerätetreiber, Maus, Klickerkennung |
| `vg_` `cov_` `edge_` `icon_` | 60 | **Vektor-Engine**: Pfade, Kurven, Füllung, Strich, Kantenglättung, Icons |
| `console_` `string_` `out_` `power_` | 59 | Konsole, Textwerkzeuge, Herunterfahren |
| `sha_` `hmac_` `hkdf_` `aes_` `ghash_` `fe_` `x25519_` `mp_` `ec_` `ecdsa_` `asn1_` `x509_` `crypto_` | 291 | **Kryptografie**: SHA-256, HMAC, HKDF, AES-128-GCM über die ARMv8-Erweiterung, X25519, Montgomery-Arithmetik, ECDSA P-256, DER-Parser für X.509, Selbsttest gegen 25 Vektoren beim Start |
| `vec_` `panic_` `irq_` `gic_` | 50 | Fehlerbehandlung und Unterbrechungen, GICv2 und GICv3 |
| `uart_` | 29 | Serielle Schnittstelle, Textausgabe, Tastatureingabe |
| `boot_` | 15 | Hochfahren, Privilegstufe, Speicher vorbereiten |
| `fwcfg_` | 13 | Konfigurationsschnittstelle des Emulators |
| `timer_` | 10 | Zeitgeber |

</details>

### Was beim Bauen entsteht

| Datei | Größe | Was es ist |
|---|---:|---|
| **`kernel.bin`** | **65.352 Byte** | **Das eigentliche Betriebssystem.** Genau die Bytes, die der Prozessor ausführt |
| `kernel.elf` | 143 KB | Dasselbe mit Namen und Debug-Informationen für den Debugger |
| `kernel.lst` | | Der Maschinencode zurückübersetzt, zum Nachprüfen |
| `kernel.map` | | Wo der Linker jedes Symbol hingelegt hat |
| `disk.img` | 64 MB | Testdatenträger mit echtem FAT32, Testdateien und der Systemschrift |
| `virt.dtb` | | Hardwarebeschreibung, die der Emulator liefert |
| `screen.png` | | Bildschirmfoto aus `make shot` |

Keine dieser Dateien liegt in der Versionsverwaltung, sie entstehen alle neu aus dem Quelltext.

Im Betrieb belegt der Kernel zusätzlich **64,6 MB** Arbeitsspeicher: 23,4 MB interner Bildpuffer und 23,4 MB Ausgabepuffer, beide mit 32 Bit je Punkt, dazu 14,6 MB Fensterpuffer aus einem Budget von 16 MB. Bis zum 14.09.2026 hatte der interne Puffer 64 Bit je Punkt und 46,9 MB, siehe Messwerte. Beim Start genullt wird davon nur der Ausgabepuffer, denn der interne wird ohnehin in der ersten Bildausgabe vollständig überschrieben. Das verkürzte die Nullung damals von 71,5 auf 24,2 MB und den Start um **81 %** im emulierten Betrieb.

---

## Läuft das auf echter Hardware?

> **Kurz: heute noch nicht.** Ein USB-Stick mit Balena Etcher bringt nichts, und zwar aus zwei voneinander unabhängigen Gründen.

**Grund 1: Die Adressen stimmen nicht.**
Ein Betriebssystem spricht mit Hardware, indem es an bestimmte Speicheradressen schreibt. Dieser Kernel schreibt Zeichen an `0x09000000`, weil dort in der emulierten Maschine die serielle Schnittstelle sitzt. Auf einem Raspberry Pi liegt dieselbe Schnittstelle an einer völlig anderen Adresse. Das gilt für **alles**: Unterbrechungssteuerung, Grafik, Eingabe, Datenträger. Andere Adressen, teils völlig andere Bausteine. Der Kernel würde ins Leere schreiben. Kein Absturz, keine Meldung, einfach nichts.

**Grund 2: Es gibt kein startfähiges Medium.**
Ein Raspberry Pi startet nicht einfach irgendeine Datei. Seine Grafikchip-Firmware sucht auf einer FAT-Partition eine `kernel8.img` und eine `config.txt`. Beides erzeugen wir nicht.

<details>
<summary><b>Was nötig wäre, damit es auf einem Raspberry Pi 5 läuft</b></summary>

<br>

Der Pi 5 lagert fast die gesamte Peripherie in einen eigenen Chip namens **RP1** aus, der über PCIe angebunden ist: Eingabe, Netzwerk, die GPIO-geführten seriellen Schnittstellen.

Entscheidend ist deshalb ein Detail: Der Pi 5 hat einen **eigenen dreipoligen Debug-Anschluss** für die serielle Schnittstelle. Nach derzeitigem Kenntnisstand hängt der direkt am Hauptprozessor und nicht am RP1. Trifft das zu, ist das erste Lebenszeichen ohne PCIe möglich.

| Aufgabe | Aufwand |
|---|---|
| Serielle Ausgabe über den Debug-Anschluss | etwa ein Tag, **sofern er wirklich am Hauptprozessor hängt** |
| Speicher, Unterbrechungen, Zeitgeber auf den BCM2712 umstellen | wenige Tage |
| Bild über die Mailbox-Schnittstelle der Grafikeinheit statt `ramfb` | drei bis fünf Tage |
| Datenträger, noch zu klären ob am Hauptprozessor oder am RP1 | etwa eine Woche |
| **PCIe hochfahren und den RP1 ansprechen** | **offen, danach erst Eingabe und Netzwerk** |
| **Maus und Tastatur: vollständiger USB-Stack mit HID-Protokoll** | **mehrere Wochen** |
| Startdateien `kernel8.img` und `config.txt` erzeugen | etwa ein Tag |

Für die serielle Ausgabe braucht es einen USB-Seriell-Adapter mit passendem Kabel, rund zehn bis fünfzehn Euro. Ohne ihn arbeitet man auf echter Hardware buchstäblich im Dunkeln.

**Alle konkreten Adressen werden erst belegt, wenn die Portierung ansteht.** Gerade zum Pi 5 kursiert viel Halbwissen, und im Projekt gilt: kein Wert ohne Quelle. Sollte sich zeigen, dass auch der Debug-Anschluss über den RP1 läuft, wäre ein Pi 4 als Zwischenschritt die bessere Wahl.

</details>

**Warum der Emulator vorerst die bessere Wahl ist:**
In QEMU lässt sich jeder Fehler in Sekunden einkreisen: Debugger anhängen, Einzelschritt durch jeden Maschinenbefehl, alle Register ansehen, Neustart in einer Sekunde. Auf echter Hardware sieht man ohne funktionierende serielle Ausgabe **überhaupt nichts**. Sinnvoller ist, erst so viel Diagnosefähigkeit einzubauen, dass sich das System auf fremder Hardware selbst erklären kann.

---

## Wie das System aufgebaut ist

### Zwei Grundregeln prägen jede Zeile

**Alles in einer Datei.** Daher der Zusatz im Namen: asmOS ist als Monolith gebaut. Struktur entsteht durch klare Namensbereiche und getrennte Verantwortung im Code, nicht durch viele kleine Dateien.

**Jede Logik existiert genau einmal.** Als der Treiber für den Datenträger dazukam, wurde das virtio-Protokoll nicht kopiert, sondern die gemeinsame Einrichtung herausgezogen. Eingabegerät und Datenträger benutzen dieselbe Routine, nur mit anderem Gerätetyp.

### Drei Prinzipien für Verlässlichkeit

**Kein Wert wird geraten.** Jede Adresse stammt aus einer nachprüfbaren Quelle: Hardware-Handbuch, Spezifikation, Linux-Quelltext oder aus der Maschinenbeschreibung, die der Emulator selbst liefert.

**Keine stillen Fehlschläge.** Fehlt ein Gerät, meldet der Kernel das und läuft weiter. Ohne Bildschirm, Maus und Datenträger gestartet:

```
FB UNAVAILABLE
INPUT UNAVAILABLE
BLK UNAVAILABLE
FAT INVALID
```

Kein Absturz, kein Stillstand, nichts stillschweigend übergangen.

**Nichts wird angenommen, was man messen kann.** Die Taktfrequenz des Zeitgebers wird aus dem Prozessor gelesen. Die Größe des Arbeitsspeichers kommt aus der Hardwarebeschreibung. Der Zugriffsschlüssel für den Bildspeicher wird im Verzeichnis des Emulators gesucht statt fest eingetragen.

### Alles ist Vektor

Es gibt im System **keine einzige fertige Bitmap**. Schrift, Mauszeiger und Icons sind Umrisse aus Linien und Kurven, die bei jeder Ausgabe frisch gerastert werden. Die Vektor-Engine zerlegt Bézierkurven in Segmente, sammelt die Kanten, füllt nach der Umlaufregel und berechnet für jeden Randpunkt, zu welchem Anteil er bedeckt ist. Daher sind die Kanten glatt und jede Größe ist scharf.

### Bewegung ist zeitgesteuert, nicht bildgesteuert

Eine Animation merkt sich Startzeitpunkt, Dauer und Start- und Zielwert. Bei jedem Bild wird gefragt: *wie viel Zeit ist vergangen?* Nicht: *das wievielte Bild ist das?* Der Unterschied ist entscheidend, denn sonst liefe dieselbe Bewegung auf schneller Hardware schnell und auf langsamer langsam.

Gerechnet wird in Festkomma mit 32 Vor- und 32 Nachkommastellen, weil ein Kernel ohne Fliesskomma auskommen soll. Fünf Eigenschaften lassen sich animieren: die beiden Bildschirmachsen, die Deckkraft, der Fokus und das Einblenden des ganzen Bildes. Jeder Platz in der Animationsliste trägt einen Generationszähler, damit eine abgelaufene Animation nicht versehentlich einen neu vergebenen Platz beschreibt.

### Arbeitsteilung zwischen Unterbrechung und Hauptschleife

Unterbrechungsroutinen tun **so wenig wie möglich**: Zeichen in einen Ringpuffer legen, ein Merkmal setzen, quittieren. Alles andere macht die Hauptschleife.

Der Grund: In einer Unterbrechung darf nicht gewartet werden, und es darf nur **eine** Stelle geben, die auf den Bildschirm schreibt. Sonst schöbe sich irgendwann ein blinkender Cursor mitten in eine Textausgabe.

---

## Entwicklungsstand

| Meilenstein | Stand |
|---|---|
| 1. Werkzeuge, `make run` startet | ✅ |
| 2. Eigener Code läuft, Textausgabe | ✅ |
| 3. Fehlerbehandlung und Zeitgeber | ✅ |
| 4. Blinkender Cursor, Tastatureingabe | ✅ |
| 5. Bildschirm, erste Bildpunkte | ✅ |
| 6. Mauszeiger, Klickerkennung | ✅ |
| 7. Speicherverwaltung, MMU aktiv | ✅ |
| 8. Datenträger und FAT32 lesend | ✅ |
| 9. Fenstersystem | ✅ inklusive erstem Fensterinhalt |
| 10. Netzwerk bis TCP | ✅ virtio-net, ARP, ICMP, UDP, DHCP, DNS, TCP-Client mit Verbindungstabelle, eingehende Prüfsummen, zufällige Kennungen und Ports, Härtung Block 1 abgeschlossen |
| 11. Verschlüsselte Verbindungen | ✅ TLS 1.3 gegen example.com: `HTTPS HTTP/1.1 200 OK`, Serversignatur geprüft (ECDSA P-256). Offen: Kette bis zur Wurzel, Name, Gültigkeit |
| 12. Vektorgrafik | ✅ Schrift, Zeiger und Icons, offen als Zeichenfläche für Anwendungen |
| 13. Animationsschicht und Compositor | ✅ Animationen, Fensterpuffer als Ebenen, Gruppendeckkraft; Zoom und Drehung offen |
| 14. Portierung auf Raspberry Pi 5 | offen |

**Bewusst noch nicht enthalten:** Schreiben auf FAT32, Umlaute und andere Zeichen jenseits des Grundzeichensatzes, zusammengesetzte TrueType-Glyphen, Speicherschutz zwischen Programmen.

---

## Lizenzen

Der Code ist vollständig selbst geschrieben.

| Bestandteil | Herkunft |
|---|---|
| **Icons** | <b>Tabler Icons</b>, MIT-Lizenz, Copyright © 2020-2026 Paweł Kuna. Mit <code>tools/iconc.py</code> in ein eigenes Vektorformat gewandelt, die eingebetteten Daten sind abgeleitete Werke |
| **Systemschrift** | <b>Babel Sans</b> von <b>Manfred Klein</b>, bezogen über dafont in der Kategorie Serifenlos, dort als kostenlos geführt. Der Kernel wertet die TrueType-Datei selbst aus |

Die Schriftdatei liegt <b>nicht</b> im Repository, nur der Code, der sie liest. <code>make disk</code> kopiert sie beim Erzeugen des Testdatenträgers vom Entwicklungsrechner und bricht ab, wenn sie fehlt, statt einen Datenträger ohne Schrift zu bauen. <code>make font-rescue</code> holt sie notfalls aus einem vorhandenen <code>disk.img</code> zurück. Die Angabe „kostenlos" ist eine Kategorie der Bezugsseite und kein formaler Lizenztext; wer die Schrift weitergeben will, sollte die Bedingungen des Autors prüfen.

---

## Fehler, aus denen das Projekt gelernt hat

<details>
<summary><b>Neun echte Fälle, alle mit Ursache und Nachweis dokumentiert</b></summary>

<br>

**Der ganze Bildschirm wurde rot.** Eine neue Hilfsroutine benutzte die Register `x2` und `x3` als Zwischenspeicher. Genau dort standen Breite und Höhe des zu zeichnenden Rechtecks. Das Rechteck wurde dadurch unendlich groß.

**Eine Datei wurde gelesen, war aber leer.** Die Länge stimmte auf das Byte genau, der Inhalt bestand aus Nullen. Dieselbe Ursache: ein Wert, der einen Unterprogrammaufruf überleben musste, lag in einem Register, das der Aufruf überschreiben darf.

**Der Mauszeiger hinterliess Spuren.** Wieder dieselbe Ursache, diesmal in der Zeichenschleife des Zeigers selbst. Drei Fehler, ein Muster.

**Ein Absturz beim Lesen der Hardwarebeschreibung.** Die Daten liegen auf 4 Byte ausgerichtet, gelesen wurde in 8-Byte-Schritten. Solange die Speicherverwaltung noch aus ist, verbietet der Prozessor das. Der Fehler war sofort klar, weil die Fehlerbehandlung Ursache und Adresse mit ausgab.

**Der Emulator sprach heimlich ein veraltetes Protokoll.** Er meldete für seine Geräte Version 1 statt 2. Aufgefallen ist es nur, weil der Kernel die Version ausgibt, statt sie vorauszusetzen.

**Ein Hänger, der erst nach 65.536 Mausbewegungen aufgetreten wäre.** Ein Zähler lief als 32-Bit-Wert weiter, verglichen wurde er mit einem 16-Bit-Wert, der überläuft. Gefunden bei einer systematischen Durchsicht, nicht im Betrieb.

**Eine beschädigte Schriftdatei wurde klaglos verarbeitet.** Die Schrift liegt auf dem Datenträger, ist also austauschbar, wurde aber nach dem Laden nirgends geprüft. Mit einem absichtlich verbogenen Tabellenzeiger las der Kernel 16 MB hinter seinen Puffer und verarbeitete Zufallsdaten als Buchstaben, ohne eine einzige Meldung. Gefunden, indem gezielt kaputte Schriften gebaut und untergeschoben wurden.

**Ein neues Feld wurde in einen bestehenden Zeiger hinein gelegt.** Bei der Behebung des vorigen Fehlers sollte die Dateigröße auf einen scheinbar freien Platz in einer Struktur. Dort lag die obere Hälfte eines 8-Byte-Zeigers. Aufgefallen ist es nur, weil ein Bildschirmabzug mit dem Sollbild verglichen wurde.

**Nach 64 Animationen stand das System.** Abgelaufene Animationen gaben ihren Platz nie frei. Schlimmer noch: war die Liste voll, lieferte die Anforderung einen Fehlerwert, den niemand auswertete, und das Bild wurde schwarz. Beide Hälften mussten behoben werden, das Freigeben und das Verhalten im Fehlerfall.

</details>

**Drei dieser neun Fehler gehören zur selben Familie:** Register, die ein Unterprogramm zerstören darf, wurden über den Aufruf hinweg benutzt. Jeder kostete eine eigene Fehlersuche, obwohl die Ursache identisch war. Das ist in Assembler die häufigste Fehlerursache überhaupt. Deshalb gilt im Projekt: Register-Eigentum ist Teil der Schnittstelle, und Werte, die einen Aufruf überleben müssen, gehören in `x19` bis `x28`.

---

<div align="center">

## Zahlen auf einen Blick

| | |
|---|---|
| Eigener Quelltext | 440 KB in drei Dateien |
| Zeilen Assembler | 17562 |
| Sprungmarken | 1779 |
| **Fertiges Betriebssystem** | **65.352 Byte** |
| Speicherbedarf im Betrieb | 64,6 MB: zwei Bildpuffer je 23,4 MB, 14,6 MB Fensterpuffer, 0,3 MB Rest |
| Dokumentation | 98 KB Quellenbelege |
| Zielarchitektur | AArch64, ARM 64 Bit |
| Entwicklungsziel | QEMU `virt` |
| Späteres Hardwareziel | Raspberry Pi 5 |

</div>

---

## Messwerte

Dieser Abschnitt wird nach jeder Messung fortgeschrieben. Alle Zahlen stammen aus `make trace` und `python3 tools/trace.py scenes`: QEMU zählt dabei jede ausgeführte Instruktion und jeden Speicherzugriff, ohne dass im Kernel eine Zeile dafür steht. Eine "Instruktion" ist ein einzelner Maschinenbefehl. Zum Einordnen: Die Emulation schafft in einfachen Schleifen rund zwei Milliarden davon je Sekunde, ein echter Cortex-A76 im Raspberry Pi 5 etwa das Doppelte bis Dreifache.

### Stand 14.09.2026: erste Messung und erste Optimierungsrunde

**Was gemessen wurde.** Drei Lastfälle: der Start (Hochfahren, Einblenden des Bildschirms über 450 ms, ein Fenster gleitet herein), eine einzelne Mausbewegung, und ein einzelner Schritt beim Ziehen des Dateifensters (1400x800 Bildpunkte, 24 Zeilen Text). Dazu die Größe des fertigen Systems und der belegte Arbeitsspeicher.

**Was dabei herauskam.** Nicht die Vektorgrafik war teuer, wie man vermuten könnte, sondern eine unscheinbare Routine namens `fb_present`. Sie übersetzt das interne Bild (8 Byte je Bildpunkt, für saubere Farbmischung) in das Format, das die Grafikausgabe versteht (4 Byte je Bildpunkt). Beim Start entfielen 91 % aller Instruktionen darauf, beim Fensterziehen 52 %. Die gesamte Schrift- und Vektorrasterung zusammen: 1,5 % beim Start. Zweiter Befund: Beim Zeichnen eines Fensters wurde jeder Bildpunkt dreimal gefüllt, erst Hintergrund, dann Rahmen, dann Fläche. Nur die letzte Füllung war sichtbar.

**Was geändert wurde, ohne dass sich am Bild ein einziges Byte ändert.** Das ist der Maßstab: Vor jeder Änderung wurde ein Bildschirmfoto als Referenz gespeichert, nach jeder Änderung neu aufgenommen und byteweise verglichen. Zusätzlich der gedrückte Mauszeiger, der im Referenzbild nicht vorkommt, mit eigenem Vergleich gegen den alten Kernel.

1. Rahmen und Hintergrund werden als Streifen um das oberste Fenster gezeichnet statt vollflächig darunter. Jeder Bildpunkt wird genau einmal gefüllt.
2. `fb_present` und `fb_fill_rect` nutzen die SIMD-Einheit des Prozessors (NEON): acht Bildpunkte je Befehl statt einem. Dafür musste die SIMD-Einheit beim Start erst freigeschaltet werden, sie ist ab Werk gesperrt.
3. Die verringerte Deckkraft des gedrückten Mauszeigers wird einmal beim Start ins Sprite eingerechnet statt bei jeder Bewegung neu.
4. Das Sichern und Wiederherstellen des Hintergrunds unter dem Zeiger läuft ebenfalls über NEON.
5. Die Vektortabelle der Fehlerbehandlung muss an einer 2048-Byte-Grenze liegen. Davor klaffte eine Lücke von 976 Byte Füllung. Jetzt liegt sie direkt hinter dem Startcode, die Lücke ist auf 8 Byte geschrumpft.

**Ergebnis.**

| Lastfall | vorher | nachher | Ersparnis |
|---|---|---|---|
| Start bis Ruhe | 1.189.498.712 Instruktionen | 416.083.185 | **−65 %** |
| eine Mausbewegung | 100.519 | 41.988 | **−58 %** |
| ein Ziehschritt des Dateifensters | 19.111.140 | 5.797.771 | **−70 %** |
| davon `fb_present` | 9.983.433 | 1.713.602 | −83 % |
| davon Füllen | 5.999.757 | 1.002.721 | −83 % |
| davon Schrift | 2.700.000 | 2.700.000 | unverändert, siehe unten |
| Größe des fertigen Systems | 25.976 Byte | 25.608 Byte | −368 Byte, obwohl 568 Byte neuer Code hinzukamen |
| Arbeitsspeicher | 74,55 MB | 74,55 MB | unverändert |

Ein Ziehschritt kostet emuliert jetzt rund 3 statt 10 Millisekunden. Das Ziehen bleibt damit auch unter Emulation deutlich über 30 Bildern je Sekunde.

**Was noch offen ist, und warum.**

- *Schrift beim Ziehen.* Die 24 Textzeilen des Dateifensters werden bei jedem Ziehschritt neu gerastert (2,7 Mio. Instruktionen), obwohl sich der Text nicht ändert. Die Lösung ist ein Fensterpuffer: einmal rastern, beim Ziehen kopieren. Er kostet 8,5 MB je Fenster und ist im Animationsplan als Schritt 5 vorgesehen.
- *Arbeitsspeicher.* 99,7 % der 74,55 MB sind die beiden Bildpuffer: 49 MB internes Bild mit 8 Byte je Bildpunkt, 24,6 MB Ausgabebild. Alles andere zusammen sind 235 KB. Halbieren ließe sich das nur, indem das interne Bild auf 4 Byte je Bildpunkt umgestellt wird. Das würde `fb_present` sogar ganz überflüssig machen, rechnet aber Farbmischungen mit 8 statt 16 Bit je Kanal. Am Bildschirm kommen ohnehin 8 Bit an, der Unterschied wären Rundungen in mehrfach überlagerten Kanten. Das ist eine Architekturentscheidung, keine Optimierung, und sie ist noch nicht getroffen.
- *Was sich nicht lohnt.* Die Vektor-Engine beschleunigen: sie ist beim Start 1,5 % und fällt beim Ziehen mit dem Fensterpuffer ganz weg. Das Löschen des Ausgabepuffers beim Start: 3 ms, einmalig.

**Nebenbei bestätigt.** Die Animation rechnet zeitbasiert (13 Bilder in 450 ms entsprechen dem 30-Hz-Zeitgeber, keine Bildzählung). Nach dem Ende jeder Animation führt das System bis zur nächsten Eingabe exakt null Instruktionen aus. Die Reihenfolge beim Zeichnen des Mauszeigers (entfernen, Fenster rendern, Zeiger zeichnen, dann ausgeben) ist maschinell bestätigt. In allen Messläufen mit Mausbewegung, Drücken, Ziehen und Loslassen: kein einziger `PANIC`.

### Stand 14.09.2026, zweite Runde: internes Bild auf 32 Bit je Bildpunkt

**Die Entscheidung.** Bis hierher rechnete der Kernel intern mit 16 Bit je Farbkanal (64 Bit je Bildpunkt), die Ausgabe hat 8 Bit je Kanal. Die zusätzlichen 8 Bit erreichten den Bildschirm nie, sie halfen nur als Zwischenpräzision, wenn ein Bildpunkt mehrfach halbtransparent überlagert wird. Jeder Desktop, jede Grafikkarte rechnet in 8 Bit je Kanal, und `ramfb` kann kein HDR. Also wurde das interne Bild auf 32 Bit je Bildpunkt umgestellt, und zwar in genau der Byte-Reihenfolge, die die Ausgabe erwartet. Damit ist `fb_present` keine Formatwandlung mehr, sondern eine Kopie.

**Der Beweis ohne Byte-Identität.** Ein byteweiser Vergleich kann hier nicht mehr gelten, weil 8-Bit-Rundung an Kanten um 1 abweichen darf. Deshalb ein Toleranzvergleich: Jeder Farbkanal jedes Bildpunkts wurde mit der 64-Bit-Referenz verglichen, und für jede Abweichung wurde geprüft, ob sie auf einer Fläche liegt (alle vier Nachbarn gleich) oder an einer Kante.

| Bild | Kanalwerte | abweichend | Betrag | davon auf Flächen |
|---|---|---|---|---|
| Desktop nach dem Start | 18.432.000 | 5.046 (0,027 %) | alle genau 1 | **0** |
| mit gedrücktem Mauszeiger | 18.432.000 | 5.832 (0,032 %) | 5.678 mal 1, 154 mal 2 | 243, alle im Inneren des 46-px-Pfeils, gleichmäßig um 1 verschoben |

Die zweite Zeile ist die erwartete doppelte Rundung: Die 91 % Deckkraft des gedrückten Zeigers werden erst ins Sprite gerechnet und dann gemischt, beides jetzt in 8 Bit. Nichts davon ist mit dem Auge zu unterscheiden.

**Ergebnis der zweiten Runde, verglichen mit der ersten.**

| Lastfall | Runde 1 | Runde 2 | Ersparnis | seit Beginn |
|---|---|---|---|---|
| ein Ziehschritt des Dateifensters | 5.797.771 | 4.052.089 | −30 % | **−79 %** |
| eine Mausbewegung | 41.988 | 34.778 | −17 % | **−65 %** |
| ein Vollbild ausgeben (ohne Einblenden) | rund 27 Mio. | rund 2,3 Mio. | −91 % | −97 % gegenüber 83 Mio. |
| Start bis Ruhe | 416 Mio. | 457 Mio. | siehe unten | −62 % |
| Arbeitsspeicher | 74,55 MB | 49,93 MB | **−33 %** | −33 % |
| Größe des fertigen Systems | 25.608 Byte | 25.432 Byte | −176 Byte | −544 Byte |

Zum Start: Die Zahl schwankt von Lauf zu Lauf um rund 10 %, weil die Anzahl der Teilausgaben des hereingleitenden Fensters vom Zeitgeber abhängt. Der Start besteht jetzt fast nur noch aus dem Einblenden: 13 Vollbilder mal 6,1 Mio. Bildpunkte, jeder mit dem Einblendfaktor multipliziert, 4,5 Befehle je Bildpunkt. Das ist die einzige Vollbild-Animation im System und läuft nur einmal.

Beim Ziehschritt bleibt als größter Posten die Schrift (1,24 Mio., 31 %), dann Füllen (0,56 Mio.) und die Ausgabe (0,48 Mio.). Der nächste Schritt wäre der Fensterpuffer, der jetzt 4,3 MB je Fenster kostet statt 8,5.

### Stand 14.09.2026, dritte Runde: der Fensterpuffer

**Was gebaut wurde.** Jedes Fenster bekommt beim Anlegen einen Puffer in seiner eigenen Größe aus einem festen Budget von 16 MB. Sein Inhalt (Rahmen, Titelleiste, Fläche, Text, Dateiliste) wird nur dann gerastert, wenn er sich ändert, zum Beispiel beim Fokuswechsel, wenn die Titelleiste die Farbe wechselt. Beim Zeichnen des Bildschirms wird der Puffer an die aktuelle Position kopiert, 16 Bildpunkte je Befehl. Ist das Budget erschöpft, meldet der Kernel das über die serielle Schnittstelle, und das Fenster zeichnet direkt wie bisher, es geht also nichts verloren, nur die Beschleunigung.

**Ist das noch Vektorgrafik?** Ja. Die Philosophie sagt, woher jede Form kommt: aus Kurven, gerastert auf dem Gerät in der gerade nötigen Größe. Sie sagt nicht, dass jede Form bei jedem Bild neu gerastert werden muss. Der Puffer ist ein Zwischenspeicher des Ergebnisses, der verworfen wird, sobald sich Inhalt oder Größe ändern. Im System ist weiterhin keine einzige fertige Bitmap gespeichert.

**Nebeneffekt: echtes Einblenden.** Vorher wurde beim Einblenden eines Fensters jede Farbe einzeln mit dem Hintergrund gemischt, ein Fenster über einem anderen zeigte dabei kurz die Desktopfarbe durch. Jetzt wird das fertige Fensterbild als Ganzes mit seiner Deckkraft über das gelegt, was tatsächlich darunter liegt. Das ist die Ebenen-Struktur, die der Animationsplan für Stufe B fordert, und sie läuft über NEON mit 4 Bildpunkten je Schritt. Nachweis: Ein Bild mitten im Einblenden (Deckkraft 217 von 255) stimmt in 42.720 Stichproben exakt mit der Formel überein.

**Ergebnis.** Das Endbild ist byteweise identisch mit der zweiten Runde, geprüft am Desktop und am gedrückten Mauszeiger.

| Lastfall | Runde 2 | Runde 3 | Ersparnis | seit Beginn |
|---|---|---|---|---|
| ein Ziehschritt des Dateifensters | 4.052.089 | **1.399.301** | −65 % | **−93 %** |
| eine Mausbewegung | 34.778 | 34.876 | unverändert | −65 % |
| Start bis Ruhe | 457 Mio. | 474 Mio. | gleich, im Rahmen der Streuung | −60 % |
| Arbeitsspeicher | 49,93 MB | 64,6 MB | **+14,6 MB** für drei Fensterpuffer | −13 % |
| Größe des fertigen Systems | 25.432 Byte | 26.352 Byte | +920 Byte | +376 Byte |

Ein Ziehschritt kostet emuliert jetzt rund 0,7 Millisekunden. Von den 1,4 Millionen Instruktionen sind 0,54 Mio. das Kopieren des Fensterbilds, 0,48 Mio. die Ausgabe, 0,08 Mio. die Hintergrundstreifen und 0,08 Mio. Schrift (die Titelleiste färbt sich beim Anklicken um, dafür wird der Puffer einmal neu gerastert).

**Warum der Speicher wieder steigt.** Das ist der Preis des Puffers, im Bericht der ersten Runde angekündigt. Drei Fenster mit 1240x840, 1400x800 und 1600x1040 Bildpunkten belegen 14,6 MB. Das Budget von 16 MB ist eine feste Obergrenze, mehr kann der Puffer nie kosten.

**Messgenauigkeit.** Die Differenzmessungen (`scenes`) laufen jetzt mit QEMU-`icount`, die Gastuhr hängt damit an der Instruktionszahl statt an der Wanduhr. Zwei Läufe unterscheiden sich um 0,006 % statt vorher bis zu 10 %. Das Startprofil läuft ohne `icount`, weil es sonst weniger Einblendbilder gäbe und die Zahl nicht mehr mit den früheren Runden vergleichbar wäre.

**Was jetzt noch offen ist.** Nichts mehr auf der Leistungsseite. Ein Ziehschritt liegt unter einer Millisekunde, ab hier begrenzen der 30-Hz-Zeitgeber und die Abtastrate der Grafikausgabe, nicht der Prozessor. Die nächste Arbeit ist wieder ein Feature.

### Stand 14.09.2026, vierte Runde: Titelleiste statt ganzes Fenster

Beim Anklicken eines Fensters wechselt die Titelleiste über 180 ms ihre Farbe. Bisher wurde dafür in jedem Bild der Animation der komplette Fensterpuffer neu gerastert, samt Dateiliste. Jetzt merkt sich das Fenster nur "Titelleiste ungültig", und der Zeichner rastert mit einem Clip auf die Titelleiste: Fläche und Dateiliste fallen am Clip weg, übrig bleiben Titelfüllung und Titeltext. Kein neuer Zeichencode, nur ein anderer Ausschnitt.

| Lastfall | vorher | nachher |
|---|---|---|
| ein Klick auf eine Titelleiste (Fokuswechsel, 6 Bilder) | 15.446.746 | **8.369.690** (−46 %) |
| ein Ziehschritt (das Szenario beginnt mit so einem Klick) | 1.445.168 | **1.243.728** (−14 %) |

Bild byteweise identisch, geprüft auch nach einem Fokuswechsel gegen den alten Kernel.

**Nebenbei am Werkzeug repariert.** Die Szenarien starteten bisher nach einer festen Wartezeit von drei Sekunden. Unter `icount` läuft der Gast gedrosselt, und je nach Rechnerlast war der Start nach drei Sekunden noch nicht fertig; der Rest des Starts landete dann im Ergebnis des Szenarios. Jetzt startet QEMU angehalten, das Werkzeug verbindet sich mit der seriellen Leitung, lässt den Gast laufen und wartet auf `BOOT OK` plus vier Sekunden Ruhe. Erst dann beginnt die Eingabe. Dazu ein Szenario `click`, und ein Abbruch im Werkzeug beendet QEMU jetzt immer mit, statt ein Abbild gesperrt zurückzulassen.

### Stand 14.09.2026, fünfte Runde: das Netzwerk kommt dazu

Kein Optimierungslauf, sondern eine Messung nach neuer Funktion, damit die Zahlen ehrlich bleiben. Meilenstein 10 ist eingebaut: virtio-net, ARP, ICMP, UDP, DHCP, DNS und ein TCP-Client, der beim Start `HTTP/1.1 200 OK` von example.com holt.

| Kennzahl | vor dem Netzwerk | mit Netzwerk |
|---|---|---|
| Größe des fertigen Systems | 26.408 Byte | **33.016 Byte** (+6.608 für sechs Protokolle, der Plan sah 35 bis 50 KB allein für TCP/IP vor) |
| Zeilen Assembler | 8.424 | 10.547 |
| Start bis Ruhe | 474 Mio. | 475 Mio., das gesamte Netzwerk beim Start (DHCP, ARP, Ping, DNS, TCP mit HTTP) kostet unter 1 Mio. Instruktionen, `net_send` allein 0,65 Mio. |
| Arbeitsspeicher | 64,6 MB | 64,6 MB, plus 18 KB Empfangs- und Sendepuffer |

Der Netzwerkverkehr fällt in der Messung nicht ins Gewicht. Was Zeit kostet, ist weiterhin das Bild.

### Stand 14.09.2026, sechste Runde: Netzwerk per Interrupt

Bisher fragte die Hauptschleife das Netzgerät bei jedem Aufwachen ab, also mit dem 30-Hz-Zeitgeber, und jedes Protokoll zählte seine Wartezeit bei jeder Abfrage weiter. Jetzt meldet sich das Gerät per Interrupt, sobald ein Rahmen da ist; der Handler quittiert nur und setzt ein Merkmal, verarbeitet wird wie immer in der Hauptschleife. Die Wartezeiten von DHCP, DNS und TCP zählt der Zeitgeber, aber nur, solange ein Protokoll tatsächlich auf eine Antwort wartet.

| Messung über 10 s ab Start | Wert |
|---|---|
| Netz-Interrupts | 14 |
| empfangene Rahmen | 10 |
| Verarbeitungsläufe (mehrere Rahmen je Lauf) | 9 |
| Zeitgeber-Ticks für das Netz während der ganzen Kette | 2 |
| Netzarbeit nach Ende der Kette | keine, auch nach 10 s nicht |

**Zwei Dinge, die dabei aufgefallen sind.** Erstens meldete die Linker-Zusicherung, dass eine Routine im Füllraum der Fehlerbehandlungstabelle zu groß geworden war, genau die Prüfung, die dafür gebaut wurde; die Routine wurde gegen zwei kleinere getauscht. Zweitens wuchs der Startcode still um 16 Byte über seine 2048-Byte-Grenze, und die Tabelle rutschte um 2 KB nach hinten, ohne Meldung, nur am Größensprung zu sehen. Dafür gibt es jetzt ebenfalls eine Zusicherung: Ein Überlauf des Startcodes ist ein Baufehler. Größe des fertigen Systems: 33.336 Byte.

### Stand 14.09.2026, siebte Runde: die Verbindungstabelle

Bisher kannte der TCP-Teil genau eine Verbindung, deren Zustand in festen Variablen lag, und die Anfrage wurde direkt aus dem Code heraus gesendet. Jetzt gibt es eine Tabelle mit vier Plätzen. Jeder Platz hält Zustand, Ports, Gegenstelle, Sequenznummern, Zeitgeber, einen eigenen Sendepuffer von 1 KB und einen Zeiger auf die Routine, die ankommende Daten bekommt. Wer eine Verbindung öffnet, übergibt Adresse, Port und diese Routine und bekommt einen Platz zurück; `tcp_write` legt Daten in den Puffer, gesendet wird segmentweise, bestätigte Bytes rutschen aus dem Puffer, unbestätigte werden nach 1,5 s neu gesendet. Der HTTP-Test ist damit nur noch ein Aufrufer: er öffnet, schreibt seine Anfrage und liest die erste Zeile der Antwort.

| Kennzahl | vorher | nachher |
|---|---|---|
| Größe des fertigen Systems | 33.336 Byte | **34.128 Byte** (+792 für Tabelle, Sendepuffer, `tcp_open`, `tcp_write`, `tcp_close`, beide FIN-Wartezustände) |
| gleichzeitige Verbindungen | 1 | 4, die fünfte meldet `TCP TABELLE VOLL` |
| Arbeitsspeicher für TCP | 32 Byte | 4.288 Byte |
| Netz-Interrupts über 10 s | 14 | 13 |
| TCP-Segmente gesendet | 5 | 5 |
| Zeitgeber-Ticks für das Netz | 2 | 2 |
| Netzarbeit nach Ende der Kette | keine | keine |

Nachgewiesen mit einem Testbau, der beim Start fünf Verbindungen zu example.com öffnet: vier Mal `TCP VERBUNDEN`, vier Mal `HTTP HTTP/1.1 200 OK`, vier Mal `TCP GESCHLOSSEN`, ein Mal `TCP TABELLE VOLL`, keine Panik. Das Bild ist byteweise gleich der Referenz, denn am Bild hat sich nichts geändert.

### Stand 14.09.2026, achte Runde: eingehende Prüfsummen

Bisher prüfte das System nur, was es selbst sendet, und nahm jeden ankommenden Rahmen für bare Münze. Jetzt wird jede Prüfsumme nachgerechnet, bevor ein Paket verarbeitet wird: der IP-Kopf, ICMP, UDP (wenn der Absender eine Prüfsumme gesetzt hat, bei IPv4 ist sie freiwillig) und TCP. Ein Paket mit falscher Summe wird verworfen und auf der seriellen Leitung gemeldet, `NET PRUEFSUMME TCP` zum Beispiel, damit nichts still verschwindet. Die Rechnung für den Pseudokopf, den TCP und UDP in ihre Summe einbeziehen, gibt es dabei nur noch einmal (`net_pseudo_sum`), das Senden benutzt dieselbe Routine.

| Kennzahl | vorher | nachher |
|---|---|---|
| Größe des fertigen Systems | 34.128 Byte | **34.424 Byte** (+296) |
| geprüfte Rahmen beim Start | 0 | 3 UDP, 5 TCP, 1 ICMP, alle IP-Köpfe |
| Netz-Interrupts über 10 s | 13 | 13 |
| Netzarbeit nach Ende der Kette | keine | keine |

Bewiesen mit vier Testbauten, die jeweils ein Byte eines ankommenden Pakets absichtlich verfälschen: Verfälschung im IP-Kopf stoppt alles bei `NET PRUEFSUMME IP`, im UDP-Teil bei `NET PRUEFSUMME UDP` (kein DHCP), im ICMP-Teil bei `NET PRUEFSUMME ICMP` (DHCP und ARP laufen, der Ping fehlt), im TCP-Teil bei `NET PRUEFSUMME TCP` (bis DNS läuft alles, die Antwort auf das SYN wird verworfen). Der unverfälschte Bau läuft die ganze Kette wie zuvor durch, das Bild ist byteweise gleich.

### Stand 14.09.2026, neunte Runde: Fehlersuche im Netzwerkblock

Eine Durchsicht des gesamten Netzwerkcodes, Zeile für Zeile, auf die Fehlerklassen, die dieses Projekt schon getroffen haben. Drei Funde, alle behoben und je mit einem Testbau bewiesen.

| Fund | Wirkung | Nachweis |
|---|---|---|
| **Der Netz-Zeitgeber lief nur während einer Animation.** Beim Einbau der Netz-Zeitgeberabfrage in den Zeitgeber-Interrupt landete sie hinter einem Sprung, der bei stehender Animation direkt zum Cursorblinken springt. Solange etwas animiert wurde, lief alles; danach nie wieder. Die Startkette lief nur deshalb durch, weil das Fenster beim Start 220 ms hereingleitet und alle Antworten in dieser Zeit eintreffen | Keine Wiederholung bei ausbleibender Antwort, keine Zeitüberschreitung, ein hängender Platz in der Verbindungstabelle bleibt für immer belegt | Testbau mit DNS-Anfrage an eine tote Adresse: vorher in 13 s keine Meldung, nachher nach 9 s `DNS KEINE ANTWORT` (drei Versuche à 3 s). Testbau mit TCP an eine tote Adresse: `TCP KEINE ANTWORT` nach 6 s (vier Versuche à 1,5 s) |
| **IP-Fragmente wurden als ganze Pakete gelesen.** Ein zerlegtes Paket hätte mit einem Bruchstück die Prüfsumme nicht bestanden (TCP), oder bei UDP ohne Prüfsumme falsche Daten geliefert | Fehldeutung fragmentierter Pakete | Fragmente werden jetzt verworfen und gemeldet: `NET FRAGMENT VERWORFEN`. Im Emulator kommt keines vor, die Kette läuft unverändert |
| **Das Überspringen eines DNS-Namens kannte das Paketende nicht.** Ein bösartig gebautes Paket ohne abschließendes Nullbyte hätte den Leser über das Paket hinaus in den Nachbarspeicher laufen lassen | Lesen außerhalb des Pakets | Der Überspringer bekommt jetzt die Paketgrenze mit und bleibt an ihr stehen; die Kette läuft unverändert |

Größe des fertigen Systems: 34.520 Byte (+96). Das Bild ist byteweise gleich der Referenz, über 10 s weiterhin 13 Interrupts und keine Netzarbeit nach Ende der Kette.

### Stand 14.09.2026, zehnte Runde: nichts mehr vorhersagbar

Bisher waren drei Dinge im Netzwerk fest oder leicht zu erraten: die Kennung jeder DNS-Anfrage (immer `0x6173`), der eigene TCP-Port (49152 plus Platznummer) und die Startsequenznummer einer Verbindung (der Zählerstand des Zeitgebers). Wer das weiß, kann gefälschte DNS-Antworten unterschieben oder fremde Segmente in eine Verbindung einschleusen. Jetzt liefert ein kleiner Zufallsgenerator (`net_random`, xorshift64, bei jedem Aufruf mit dem Zeitgeberstand vermischt) alle drei Werte. Der Port wird aus dem gesamten dynamischen Bereich 49152 bis 65535 gezogen und gegen die anderen offenen Verbindungen geprüft. Dazu zwei kleine Funde aus der letzten Fehlersuche: ein RST in der Verbindungsaufbauphase zählt nur noch, wenn er sich auf unser SYN bezieht, und eine neue Namensauflösung beginnt wieder mit drei Versuchen.

| Kennzahl | vorher | nachher |
|---|---|---|
| Größe des fertigen Systems | 34.520 Byte | **34.696 Byte** (+176) |
| DNS-Kennung in drei Starts | `0x6173`, `0x6173`, `0x6173` | `0x3f9a`, `0x9d28`, `0x0c3c` |
| eigener TCP-Port in drei Starts | 49152, 49152, 49152 | 61730, 50039, 64051 |
| Startsequenz in drei Starts | Zeitgeberstand | `0x3f15b0f9`, `0xdacc08ce`, `0x6af503c9` |

Nachgewiesen über einen Paketmitschnitt von QEMU (`filter-dump`), aus dem ein Skript die Werte liest. Der Kollisionsschutz für Ports ist mit einem Testbau bewiesen, der nur vier mögliche Ports zulässt und vier Verbindungen öffnet: alle vier bekamen verschiedene Ports, alle vier holten `HTTP/1.1 200 OK`. Ein Testbau, der einen geschlossenen Port anspricht, meldet weiterhin `TCP RST VOM SERVER`. Das Bild ist byteweise gleich der Referenz.

### Stand 14.09.2026, elfte Runde: SHA-256, der erste Baustein für verschlüsselte Verbindungen

Meilenstein 11 beginnt. TLS braucht vier Rechenbausteine: eine Prüfsummenfunktion (SHA-256), eine Schlüsselableitung darauf (HKDF), eine Verschlüsselung (AES-GCM) und einen Schlüsseltausch (X25519). Der erste ist eingebaut. Der Prozessor bringt dafür eigene Befehle mit (ARMv8 Cryptography Extension: `sha256h`, `sha256h2`, `sha256su0`, `sha256su1`), ein 64-Byte-Block kostet damit rund 120 Befehle statt einiger tausend. Ob die Erweiterung vorhanden ist, prüft das System beim Start am Prozessorregister und meldet sonst `SHA256 FEHLT`.

Beim Start läuft jedes Mal ein Selbsttest gegen fünf bekannte Ergebnisse aus dem Standard: `abc`, die leere Nachricht, eine Nachricht von genau 56 Byte (erzwingt einen zusätzlichen Füllblock), eine von 55 Byte (der Grenzfall, bei dem die Länge gerade noch in den Block passt) und eine Million `a`, eingespeist in 1.000 Stücken zu 1.000 Byte, damit auch das Zusammensetzen über Blockgrenzen hinweg geprüft ist. Erst wenn alle fünf stimmen, erscheint `SHA256 OK, 5 Testvektoren`.

| Kennzahl | vorher | nachher |
|---|---|---|
| Größe des fertigen Systems | 34.696 Byte | **36.640 Byte** (+1.944: 256 Byte Rundenkonstanten, 160 Byte Testvektoren, der Rest Code und Selbsttest) |
| Start bis Ruhe | 475 Mio. Befehle | 476,8 Mio., der Selbsttest mit 15.625 Blöcken kostet 2,3 Mio. (0,5 %) |
| ein Block SHA-256 | | 117 Befehle |
| Geprüft auf | | QEMU-Emulation (Cortex-A72) **und** Apple Silicon direkt (`accel=hvf`, `-cpu host`), beide `SHA256 OK` |

Das Bild ist byteweise gleich der Referenz, die Netzwerkkette läuft unverändert. Beim Einbau meldete die Linker-Zusicherung zum dritten Mal ihren Wert: Die Testvektoren und die Konstantentabelle waren hinter `BOOT OK` eingefügt worden, und dieser Text liegt im Füllraum eines Fehlerbehandlungseintrags. Zehn Einträge wären verschoben worden, der Bau brach ab, die Daten liegen jetzt im Datenbereich.

### Stand 14.09.2026, zwölfte Runde: HMAC und HKDF

Die Bausteine zwei und drei für TLS. HMAC ist die Prüfsummenfunktion mit Schlüssel (RFC 2104), HKDF leitet daraus aus einem Geheimnis beliebig viele Schlüssel ab (RFC 5869); TLS 1.3 gewinnt sämtliche Sitzungsschlüssel auf diesem Weg. Beide sind reine Aufrufer von SHA-256, es kam kein neuer Rechenkern dazu. Der Zustand liegt auf dem Stack und wird nach Gebrauch überschrieben; ein Schlüssel, der länger als 64 Byte ist, wird zuerst gehasht, genau wie der Standard es verlangt.

Der Selbsttest beim Start prüft jetzt zwölf Vektoren: fünf für SHA-256, vier für HMAC aus RFC 4231 (darunter zwei mit 131-Byte-Schlüssel, der den Hash-Pfad erzwingt) und drei für HKDF aus RFC 5869 (darunter der lange Fall mit 80-Byte-Salz und 82 Byte Ausgabe über drei Runden, und der Fall ohne Salz und ohne Info). Alle Erwartungswerte wurden vor dem Einbau auf dem Entwicklungsrechner nachgerechnet.

| Kennzahl | vorher | nachher |
|---|---|---|
| Größe des fertigen Systems | 36.640 Byte | **39.176 Byte** (+2.536, davon 1.014 Byte Testdaten: Schlüssel, Nachrichten, Erwartungswerte) |
| Start bis Ruhe | 476,8 Mio. Befehle | 476,8 Mio., die sieben neuen Vektoren fallen nicht ins Gewicht |
| Selbsttest-Ausgabe | `SHA256 OK, 5 Testvektoren` | dazu `HMAC OK, 4 Testvektoren` und `HKDF OK, 3 Testvektoren` |
| Geprüft auf | TCG und hvf | TCG und hvf |

Das Bild ist byteweise gleich der Referenz. Dabei aufgefallen: Jeder Selbsttest-Aufruf im Startcode kostet dort 4 Byte, und der Startblock hatte nur noch 8 Byte Luft bis zu seiner 2048er-Grenze. Alle Kryptotests hängen jetzt an einem einzigen Einstieg `crypto_selftest`, der außerhalb des Startblocks liegt; künftige Bausteine kosten dort nichts mehr.

### Stand 14.09.2026, dreizehnte Runde: AES-128-GCM

Baustein vier: die Verschlüsselung selbst. TLS 1.3 verpackt jede Nachricht mit AES im Galois/Counter-Modus, der Vertraulichkeit und Fälschungsschutz in einem Schritt liefert. Der Prozessor bringt die Rundenfunktion (`aese`, `aesmc`) und die Polynommultiplikation für den Fälschungsschutz (`pmull`) als eigene Befehle mit; die Schlüsselaufbereitung nutzt denselben Befehl mit einem Trick (Nullschlüssel, alle vier Wörter gleich), so dass keine S-Box-Tabelle im Kernel liegt. Ob AES und PMULL vorhanden sind, prüft der Start am Prozessorregister, sonst `AES-GCM FEHLT`.

Die Schnittstelle: `aes_gcm_setkey` bereitet einen Schlüssel auf (192 Byte Kontext), `aes_gcm_encrypt` und `aes_gcm_decrypt` verarbeiten Nonce, Zusatzdaten und Nachricht beliebiger Länge und erzeugen beziehungsweise prüfen den 16-Byte-Tag. Die Prüfung läuft in konstanter Zeit, und bei falschem Tag wird der entschlüsselte Text überschrieben, bevor der Aufrufer ihn sieht. Rundenschlüssel bleiben nur während des Aufrufs in Vektorregistern und werden danach genullt.

Der Selbsttest prüft die vier klassischen Vektoren von McGrew und Viega für AES-128 (leer, ein Nullblock, vier Blöcke, 60 Byte mit 20 Byte Zusatzdaten, also je einen unvollständigen Block bei Daten und Zusatzdaten), jeweils Verschlüsseln und Entschlüsseln, und danach einen Tag mit einem gekippten Bit: Er muss abgelehnt werden und der Puffer leer sein.

| Kennzahl | vorher | nachher |
|---|---|---|
| Größe des fertigen Systems | 39.176 Byte | **41.608 Byte** (+2.432, davon 400 Byte Testvektoren) |
| Start bis Ruhe | 476,8 Mio. Befehle | 476,8 Mio. |
| Selbsttest-Ausgabe | drei Zeilen | dazu `AES-GCM OK, 4 Testvektoren, Manipulation erkannt` |
| Geprüft auf | TCG und hvf | TCG und hvf |

**Ein Fehler beim Einbau, im ersten Lauf gefunden.** Der Fälschungsschutz rechnet in einem Zahlenkörper, dessen Bitreihenfolge dem Prozessor entgegengesetzt ist. Die erste Fassung drehte dafür die Bits jedes Bytes und zusätzlich die Reihenfolge der Bytes; Vektor 2 (der erste, der diese Rechnung überhaupt braucht) schlug fehl. Richtig ist, nur die Bits je Byte zu drehen, weil ein Prozessorwort seine Bits ohnehin byteweise aufsteigend zählt. Vektor 1 hätte den Fehler nie gezeigt, denn bei leerer Nachricht ist das Ergebnis der Rechnung immer null. Das Bild ist byteweise gleich der Referenz.

### Stand 14.09.2026, vierzehnte Runde: X25519, der Schlüsseltausch

Der fünfte und letzte Rechenbaustein. Mit X25519 einigen sich zwei Seiten über eine abgehörte Leitung auf ein gemeinsames Geheimnis; TLS 1.3 leitet daraus alle Sitzungsschlüssel ab. Dafür gibt es keine Prozessorbefehle, die Rechnung ist Arithmetik mit 255-Bit-Zahlen modulo der Primzahl 2²⁵⁵−19, in vier 64-Bit-Gliedern mit `mul` und `umulh`. Die Multiplikation zweier solcher Zahlen kostet 16 Produkte plus die Rückführung des Überlaufs, eine ganze Schlüsselvereinbarung 255 Leiterschritte mit je zehn Multiplikationen und am Ende eine Inversion über 265 weitere.

Alles läuft in konstanter Zeit: Die Montgomery-Leiter macht in jedem Schritt dieselbe Arbeit, welcher Zweig gemeint ist, entscheidet ein Maskentausch ohne Sprung, und die abschließende Reduktion wählt per `csel` statt per Verzweigung. Der geheime Schlüssel bestimmt also weder Laufzeit noch Sprungmuster. Zwischenwerte liegen nur im Stackrahmen und werden am Ende überschrieben.

Der Selbsttest prüft sechs Vektoren aus RFC 7748: die beiden Einzelrechnungen aus Abschnitt 5.2, den ersten Schritt des Iterationstests, und aus Abschnitt 6.1 die beiden öffentlichen Schlüssel von Alice und Bob (über `x25519_base`) sowie ihr gemeinsames Geheimnis.

| Kennzahl | vorher | nachher |
|---|---|---|
| Größe des fertigen Systems | 41.640 Byte | **44.568 Byte** (+2.928, davon 480 Byte Testvektoren) |
| Start bis Ruhe | 476,8 Mio. Befehle | 479,3 Mio., sechs Schlüsselvereinbarungen kosten 2,5 Mio. |
| eine Schlüsselvereinbarung | | rund 410.000 Befehle, davon 315.000 in `fe_mul` |
| Selbsttest-Ausgabe | vier Zeilen | dazu `X25519 OK, 6 Testvektoren` |
| Geprüft auf | TCG und hvf | TCG und hvf |

Das Bild ist byteweise gleich der Referenz. Alle sechs Vektoren stimmten im ersten Lauf; der einzige Baufehler war ein Stackrahmen von 576 Byte, den der Befehl `stp` mit Vorabzug nicht anlegen kann (Grenze 512), also Abzug und Speichern getrennt.

### Stand 14.09.2026, fünfzehnte Runde: TLS 1.3, die erste verschlüsselte Verbindung

Die fünf Bausteine sind zusammengesetzt. Das System öffnet beim Start neben der Klartextverbindung auf Port 80 eine zweite auf Port 443, handelt mit example.com eine TLS-1.3-Sitzung aus und holt darüber dieselbe erste Zeile: `HTTPS HTTP/1.1 200 OK`. Ablauf, wie RFC 8446 ihn vorschreibt: ClientHello mit Servername, X25519-Schlüsselanteil und dem einen angebotenen Verfahren AES-128-GCM mit SHA-256; ServerHello mit dem Gegenanteil; daraus über X25519 das gemeinsame Geheimnis, über HKDF die Handshake-Schlüssel; die verschlüsselten Nachrichten des Servers (Erweiterungen, Zertifikat, Signatur, Finished) entschlüsseln, den Finished-Wert über HMAC gegen den Gesprächsverlauf prüfen, den eigenen Finished-Wert senden, auf die Anwendungsschlüssel wechseln, GET senden, Antwort entschlüsseln. Am Ende schickt der Server den regulären Abschieds-Alert (`TLS ALERT 1 0`, close_notify).

Was bewusst noch fehlt: Das Zertifikat wird empfangen (3.682 Byte) und in den Gesprächsverlauf gerechnet, aber nicht geprüft. Die serielle Ausgabe sagt das jedes Mal deutlich: `TLS ZERTIFIKAT 3682 Byte, NICHT GEPRUEFT`. Bis die Prüfung eingebaut ist, schützt die Verbindung gegen Mitlesen, aber nicht gegen einen Angreifer, der sich als example.com ausgibt.

| Kennzahl | vorher | nachher |
|---|---|---|
| Größe des fertigen Systems | 44.568 Byte | **49.106 Byte** (+4.538 für den gesamten Handshake, Record-Schicht und Meldungen) |
| Arbeitsspeicher | 64,6 MB | 64,6 MB plus 35 KB für Sitzungszustand, Record-Puffer (16,6 KB) und Handshake-Puffer (16 KB) |
| Befehle bis Ruhe, 8 s, mit Handshake | 479,3 Mio. | 480,5 Mio.; der ganze Handshake mit Schlüsseltausch, Ableitung und Entschlüsselung des Zertifikats kostet rund 1,2 Mio. |
| Zeilen Assembler | 12.989 | 14.149 |

Zwei Läufe hintereinander, beide durchgängig, das Bild byteweise gleich der Referenz. Dass alles im ersten Anlauf lief, verdankt sich den Testvektoren der Bausteine: Der Handshake selbst enthält keine neue Rechnung, nur Buchführung über Zustände, Längen und Puffer.

**Ein Nebenbefund, unabhängig von TLS.** Unter `hvf` (Apple Silicon direkt statt Emulation) blieb die Netzwerkkette nach `NET MAC` stehen. Aufgeklärt in der nächsten Runde.

### Stand 14.09.2026, sechzehnte Runde: der hvf-Fehler, oder warum es keinen Interrupt gab

Die Fehlersuche begann mit einer Vermutung (Speicherordnung an den Geräteringen) und endete woanders. Unter `hvf` kam nicht nur kein Netzwerkpaket an, es kam **gar kein Interrupt** an: kein Zeitgeber, keine Maus, kein Netz. Der Startvorgang lief trotzdem bis `BOOT OK`, weil er auf keinen Interrupt wartet, und die Kette brach erst dort ab, wo sie den ersten braucht, nämlich bei der DHCP-Antwort.

Die Ursache liegt im Interrupt-Controller. QEMU stellt der `virt`-Maschine unter Emulation einen GICv2 hin, ein Baustein, den das System seit Meilenstein 3 bedient. Unter `hvf` gibt es den nicht: Apples Hypervisor bringt seinen eigenen Interrupt-Controller mit, einen GICv3, und QEMU kann darunter keinen GICv2 nachbilden (`HVF does not support GICv2 emulation`). Der GICv3 hat ein anderes Programmiermodell: die Prozessorseite wird nicht über Speicheradressen, sondern über Systemregister angesprochen, jeder Prozessorkern hat einen eigenen "Redistributor" für seine privaten Interrupts, und der muss erst aus dem Schlaf geholt werden. Das System schrieb seine Einstellungen in Register, die es dort nicht gab, und der Controller blieb stumm.

Jetzt liest der Kernel beim Start aus dem Device Tree, welcher Controller verbaut ist (`compatible = "arm,gic-v3"` oder `"arm,cortex-a15-gic"`), meldet `GIC v2` oder `GIC v3` und bedient beide. Der erste Versuch, die Version an einem Kennungsregister des Controllers selbst abzulesen, endete mit einem Speicherfehler, weil dieses Register beim GICv2 an einer anderen Stelle liegt als beim GICv3; der Device Tree ist die verlässliche Quelle, und die Suche darin ist jetzt allgemein (`fdt_find_prop`), die Speichergröße wird über denselben Weg gefunden wie zuvor.

| Lauf | vorher | nachher |
|---|---|---|
| Emulation, GICv2 (`make check`) | vollständig bis `HTTPS HTTP/1.1 200 OK` | unverändert vollständig |
| Emulation, GICv3 (`make check MACHINE_EXTRA=,gic-version=3`) | nicht möglich | vollständig bis `HTTPS HTTP/1.1 200 OK` |
| Apple Silicon direkt (`hvf`, GICv3) | Stillstand nach `NET MAC` | **vollständig bis `HTTPS HTTP/1.1 200 OK`**, der TLS-Handshake läuft damit erstmals auf echten Befehlen |
| Größe des fertigen Systems | 49.106 Byte | 49.597 Byte (+491) |

Das Bild ist byteweise gleich der Referenz. Der Raspberry Pi 5 hat einen GICv2 (GIC-400), der bisherige Pfad bleibt also der wichtigere; der GICv3-Pfad ist die Eintrittskarte für schnelle Läufe auf dem Mac und für spätere Boards mit GICv3.

### Stand 15.09.2026, zwanzigste Runde: Zertifikatskette bis zur Wurzel

Bisher prüfte asmOS nur, dass der Server den Schlüssel zum vorgezeigten Zertifikat besitzt. Jetzt prüft es auch, ob dieses Zertifikat etwas wert ist: Die Kette wird bis zu einer Wurzel verfolgt, die als Datei `ROOT.DER` auf dem Datenträger liegt (`make disk` legt das Wurzelzertifikat "SSL.com TLS ECC Root CA 2022" dorthin, die Datei selbst liegt im Repository unter `roots/`). Beim Start wird sie gelesen und zerlegt, die serielle Ausgabe meldet `TLS WURZEL ROOT.DER geladen, 574 Byte, ECDSA P-384`.

Der Zertifikatsparser kennt jetzt beide Kurven (prime256v1, secp384r1) und beide Signaturarten (ECDSA mit SHA-256 und mit SHA-384), merkt sich Aussteller- und Inhabernamen als DER-Bytes und die Erweiterungen. Die Certificate-Nachricht wird vollständig zerlegt (bis zu vier Zertifikate); das vierte, das der Server mitschickt, ist ein RSA-signiertes Kreuzzertifikat und wird ohne Fehler übergangen, weil die Kette schon vorher an der Wurzel ankommt. Für jedes Glied gilt: Aussteller des Kindes muss byteweise dem Inhaber des Elternteils gleichen, dann wird der TBS-Teil mit dem passenden Hash gehasht und mit dem Elternschlüssel auf dessen Kurve geprüft. Der Name kommt aus der SAN-Erweiterung (nur dNSName), Vergleich ohne Groß und Klein, ein Platzhalter `*.` deckt genau eine Ebene ab.

Ergebnis am laufenden System: `TLS KETTE GEPRUEFT: 3 Zertifikate bis zur Wurzel, Name example.com passt`, dann wie bisher `TLS SIGNATUR GEPRUEFT` und `HTTPS HTTP/1.1 200 OK`, unter TCG (GICv2 und v3) und hvf. Vier Gegenproben, jede mit eigenem Datenträger oder Testbau: ohne `ROOT.DER` bricht die Verbindung mit `keine Wurzel geladen` ab; eine Wurzel mit einem gekippten Bit im Schlüssel liefert `ZERTIFIKATSKETTE UNGUELTIG`; ein fremdes Zertifikat als Wurzel liefert `AUSSTELLER UNBEKANNT`; ein Bau mit dem Hostnamen `example.org` liefert `NAME PASST NICHT ZUM ZERTIFIKAT`. In keinem der vier Fälle kam eine HTTPS-Antwort zustande. Der Selbsttest beim Start zerlegt das eingebaute Blattzertifikat und prüft `example.com`, `www.EXAMPLE.com` (Platzhalter, Groß und Klein) und die Ablehnung von `example.org`.

| Kennzahl | vorher | nachher |
|---|---|---|
| Größe des fertigen Systems | 62.984 Byte | **65.352 Byte** (+2.368) |
| Befehle bis Ruhe, 8 s | 575,0 Mio. | 599,1 Mio.; die Kette kostet zwei P-384-Prüfungen und eine P-256-Prüfung |
| Montgomery-Multiplikation | 48,2 Mio. (8,4 %) | 82,2 Mio. (13,7 %) |
| Geprüft auf | TCG, hvf | TCG, hvf, plus vier Gegenproben |

Das Referenzbild wurde einmalig neu gesetzt: Das Dateifenster zeigt jetzt `ROOT.DER`, und der neu erzeugte Datenträger enthält keinen macOS-Rest (`FSEVEN~2`) mehr. Außerhalb des Dateifensters ist das Bild byteweise gleich. Noch offen: der Gültigkeitszeitraum, dafür fehlt eine Uhr (pl031).

### Stand 14.09.2026, neunzehnte Runde: SHA-384 und P-384

Die Kette von example.com hängt nicht an P-256 allein: Die beiden Zwischenzertifikate sind mit ECDSA über P-384 und SHA-384 unterschrieben, und das Wurzelzertifikat "SSL.com TLS ECC Root CA 2022" hat einen P-384-Schlüssel. Dafür kamen zwei Bausteine dazu. SHA-384 rechnet mit 64-Bit-Wörtern und 80 Runden; anders als bei SHA-256 gibt es dafür auf dem Cortex-A72 keine Prozessorbefehle, die Runden sind ausgeschrieben, acht je Schleifendurchlauf mit rotierenden Registerrollen. Und die Kurvenarithmetik nimmt jetzt einen Kurvenkontext entgegen (Primzahl, Ordnung, `b`, Basispunkt, Bytelänge); P-256 und P-384 laufen durch denselben Code, die Zahlenschlitze sind einheitlich 48 Byte breit. Die Montgomery-Multiplikation war von Anfang an für beliebige Gliederzahl geschrieben, genau dafür.

Der Selbsttest prüft SHA-384 gegen drei Vektoren (`abc`, leer, die 112-Byte-Nachricht aus dem Standard) und ECDSA P-384 gegen den Vektor aus RFC 6979 (Anhang A.2.6), dazu die Ablehnung eines gekippten Bits; die P-256-Fälle laufen unverändert durch den neuen gemeinsamen Code.

| Kennzahl | vorher | nachher |
|---|---|---|
| Größe des fertigen Systems | 58.944 Byte | **62.984 Byte** (+4.040, davon 640 Byte Rundenkonstanten und 480 Byte Vektoren) |
| Befehle bis Ruhe, 8 s | 565,1 Mio. | 575,0 Mio.; eine P-384-Prüfung kostet rund 14 Mio., zwei davon im Selbsttest |
| Montgomery-Multiplikation | 19,0 Mio. | 48,2 Mio. (8,4 %) |
| Geprüft auf | TCG, hvf | TCG, hvf |

**Zwei Fehler beim Bau, beide vom Rahmen.** Nach dem Umbau stürzte der erste P-256-Test mit einem Rücksprung ins Nichts ab (`elr = 0xfffffffe`): In der Skalarmultiplikation war für den Eingabepunkt Platz für zwei Koordinaten reserviert, geschrieben werden drei, die dritte landete 32 Byte hinter dem Rahmen, genau auf den gesicherten Rücksprungregistern des Aufrufers. Und die modulare Addition und Subtraktion hatten Rahmen, die für vier Glieder genau reichten und für sechs nicht. Gefunden mit Marken in der Prüfroutine, die die Phase bis zum Absturz ausgeben. Das Bild ist byteweise gleich der Referenz.

### Stand 14.09.2026, achtzehnte Runde: Terminal und Netzwerkfenster

Die drei Fenster stehen jetzt nebeneinander: links **Terminal**, in der Mitte **Netzwerk**, rechts **Dateien**. Das Terminal nimmt Tastatureingaben an, aber nur, wenn es das aktive Fenster ist; ein Klick auf ein anderes Fenster nimmt ihm den Fokus, der Cursor verschwindet, und Tastendrücke werden verworfen, wie bei einem Terminal unter macOS. Befehle gibt es noch nicht: Eingabe, Löschen, Eingabetaste, neue Zeile mit Prompt, Bildlauf nach 24 Zeilen.

Dafür kam eine echte Tastatur dazu: QEMU stellt sie als zweites virtio-input-Gerät neben dem Tablet, der Treiber bedient jetzt zwei Geräte mit je eigenen Ringen und erkennt an der Gerätekonfiguration, welches die Tastatur ist (das Tablet meldet Achsen, die Tastatur nicht), unabhängig von der Reihenfolge. Die Tastencodes sind die von Linux, umgesetzt nach US-Belegung mit Umschalttaste; QEMU meldet die physische Tastenposition, auf einer deutschen Tastatur sind deshalb Y und Z vertauscht.

Das Netzwerkfenster ist der Beweis, dass das Netz läuft: Es schreibt jede Netzmeldung mit, die auf der seriellen Leitung erscheint (DHCP, ARP, Ping, DNS, TCP, HTTP, TLS, HTTPS), über einen Mitschreiber in der Zeichenausgabe, der Zeilen mit diesen Vorsilben in den Fensterpuffer übernimmt. Ehrlich gesagt gibt es unter QEMU kein WLAN, nur eine virtuelle Kabelkarte; das steht in der ersten Zeile des Fensters.

| Kennzahl | vorher | nachher |
|---|---|---|
| Größe des fertigen Systems | 56.749 Byte | **58.944 Byte** (+2.195) |
| Befehle bis Ruhe, 6 s | 508,9 Mio. | 565,1 Mio.; die 56 Mio. mehr sind fast vollständig das Netzwerkfenster, das bei jeder eintreffenden Zeile alle 24 Textzeilen neu rastert |
| Fenster | 1240×840, 1400×800, 1600×1040 | dreimal 1180×1160 nebeneinander, alle drei im 16-MiB-Fensterpuffer |

Nachgewiesen headless über die QEMU-Steuerung: "hi Aasm", Eingabetaste, "123" getippt, Bild; Klick auf die Titelleiste von Netzwerk, "xyz" getippt, Bild (kein Cursor, nichts erscheint); Klick zurück auf Terminal, "ok" getippt, Bild (`asmOS> 123ok_`). Der Bildvergleich gegen das Referenzbild blendet seither das Innere des Netzwerkfensters aus, weil dessen Zeilen zeitabhängig eintreffen; außerhalb davon ist das Bild byteweise gleich.

**Fehlersuche danach.** Stresstest per QEMU-Steuerung: fünfmal Löschen vor dem Prompt, 120 Zeichen in eine Zeile (Grenze 95), 30 Zeilen hintereinander (Bildlauf), Umschalttaste mit Ziffern und Satzzeichen (`!@#AB_<>?`), schnelles Tippen mit 5 ms Abstand. Keine Panik, Netzkette unverändert, Bild wie erwartet. Durchsicht aller Aufrufer von `uart_putc`, das jetzt mehr Register benutzt: kein Aufrufer hält dort etwas über den Aufruf hinweg. Zwei Funde beim Lesen, beide behoben: Die Gerätesuche ab einer Startadresse hätte bei einer Adresse hinter dem Ende einen negativen Zähler bekommen und über den Gerätebereich hinaus gelesen (tritt heute nicht ein, ist jetzt abgefangen); und der Tastenring war der Schlafprüfung der Hauptschleife unbekannt, ein Tastendruck im falschen Moment wäre bis zum nächsten Zeitgeber-Interrupt liegen geblieben, höchstens 33 ms, jetzt wird der Ring mitgeprüft.

Benannt, nicht angefasst: Die Neuzeichnung je Zeile ist verschwenderisch. Eine Teilaktualisierung nur der neuen Zeile oder ein Glyphenspeicher würde die 56 Mio. auf einen Bruchteil bringen; im laufenden Betrieb kostet das Fenster nichts, nur beim Start.

### Stand 14.09.2026, siebzehnte Runde: die Sitzung gehört jetzt zum Zertifikat

Bisher war die Verbindung verschlüsselt, aber nicht an eine Identität gebunden: Jeder, der sich in die Leitung stellt, hätte den Handshake mit seinem eigenen Schlüssel führen können. TLS 1.3 verlangt vom Server deshalb eine Unterschrift über den gesamten bisherigen Gesprächsverlauf mit dem privaten Schlüssel seines Zertifikats (CertificateVerify). Diese Unterschrift wird jetzt geprüft.

Dafür kamen drei Dinge dazu. Erstens ein Parser für DER-kodierte Daten (ASN.1), der aus dem Zertifikat den öffentlichen Schlüssel holt und aus der Signatur die beiden Zahlen `r` und `s`. Zweitens Ganzzahlarithmetik beliebiger Gliederzahl mit Montgomery-Multiplikation, geschrieben mit Schleifen über die Glieder, damit derselbe Kern später auch die Kurve P-384 rechnet. Drittens die Kurve P-256 in Jacobi-Koordinaten mit Punktverdopplung, Punktaddition, Skalarmultiplikation und der ECDSA-Prüfung selbst. Da nur öffentliche Werte verarbeitet werden, muss nichts davon in konstanter Zeit laufen.

Der Selbsttest beim Start prüft den Vektor aus RFC 6979 (Anhang A.2.5), lehnt dieselbe Signatur mit einem gekippten Bit ab, und zerlegt das echte Zertifikat von example.com (1.002 Byte, im Kernel als Testdatum), holt den Schlüssel heraus und prüft die Unterschrift der ausstellenden Stelle darauf. Live gegen example.com: `TLS SIGNATUR GEPRUEFT, ECDSA P-256, Sitzung an Zertifikat gebunden`. Ein Testbau mit einem gekippten Bit in der Serversignatur endet mit `TLS FEHLER: SIGNATUR DES SERVERS FALSCH`, und die Verbindung wird nicht weitergeführt.

| Kennzahl | vorher | nachher |
|---|---|---|
| Größe des fertigen Systems | 49.597 Byte | **56.749 Byte** (+7.152, davon 1.400 Byte Testdaten: das Zertifikat, Schlüssel, Vektoren) |
| Befehle bis Ruhe, 8 s | 480,5 Mio. | 508,9 Mio.; eine ECDSA-Prüfung kostet rund 5,7 Mio., drei davon im Selbsttest, eine im Handshake |
| davon in der Montgomery-Multiplikation | | 19,0 Mio. (3,7 %) |
| Geprüft auf | TCG, hvf | TCG (GICv2), hvf |

Das Bild ist byteweise gleich der Referenz. Ehrlich benannt: Geprüft ist die Unterschrift des Servers mit dem Schlüssel aus dem ersten Zertifikat der Kette, noch nicht die Kette selbst bis zu einer vertrauten Wurzel, nicht der Name im Zertifikat und nicht der Gültigkeitszeitraum. Bis dahin ist die Bindung an "irgendein Zertifikat", nicht an "das Zertifikat von example.com". Die Multiplikation ist bewusst allgemein geschrieben und deshalb langsam; eine ausgerollte Fassung für vier Glieder würde sie um das Drei- bis Fünffache beschleunigen.

**Fehlersuche im X25519-Block, kein Fund.** Sechs Vektoren aus dem RFC prüfen die Leiter, aber nicht die Ränder der Zahlenarithmetik. Ein Testbau hat deshalb 42 weitere Fälle gerechnet und gegen die Referenz des Entwicklungsrechners verglichen: 32 Schlüsselvereinbarungen mit Mustereingaben, zwei absichtlich unsaubere Kodierungen der Basiszahl 9 (einmal um die Primzahl vergrößert, einmal mit gesetztem oberstem Bit, beide müssen den Alice-Schlüssel ergeben) und acht Rechnungen der Feldarithmetik mit dem größtmöglichen Wert 2²⁵⁶−1: Quadrat, Summe, `0−1`, `a−a`, die Normierung selbst, `1−a`, die Multiplikation mit 121665 und die Inversion. Genau diese Extremwerte treiben die Überlaufbehandlung in ihre zweite Runde. **0 Abweichungen.** Dazu nachgerechnet: Nach jeder Faltung des Überlaufs mit 38 ist höchstens noch ein zweiter Übertrag möglich, ein dritter nicht; die zweite Runde im Code ist also ausreichend, nicht nur vorsichtig.

**Fehlersuche im AES-Block, ein echter Fund.** Ein Testbau hat 64 Fälle mit Nachrichten von 0 bis 79 Byte und Zusatzdaten von 0 bis 36 Byte verschlüsselt, jedes Ergebnis auf die serielle Leitung geschrieben und gegen die Referenz des Entwicklungsrechners geprüft: 0 Abweichungen. Derselbe Testbau hat jede Nachricht danach **an Ort und Stelle** entschlüsselt, also mit demselben Puffer für Ein- und Ausgabe, wie es TLS mit seinem Empfangspuffer tun wird. Ergebnis vor dem Fix: 60 von 64 abgelehnt, nämlich alle, deren Länge kein Vielfaches von 16 ist. Ursache: Beim letzten, unvollständigen Block schrieb die Routine erst den Klartext in den Puffer und las danach für den Fälschungsschutz den Geheimtext von derselben Adresse, also den Klartext. Der Tag stimmte nicht, die Nachricht wurde verworfen. Der Fälschungsschutz liest jetzt vor dem Überschreiben. Nach dem Fix: 64 von 64 angenommen. Der feste Selbsttest beim Start entschlüsselt seither ebenfalls an Ort und Stelle, damit der Fehler nicht wiederkommen kann. Größe des fertigen Systems: 41.640 Byte.

**Fehlersuche im SHA-Block.** Die fünf Vektoren decken die Blockgrenzen ab, nicht aber jede Kombination aus Füllstand und Stückgröße. Ein Testbau hat deshalb 201 Nachrichten der Längen 0 bis 200 gehasht, jede in Stücken wechselnder Größe (1 bis 17 Byte) eingespeist, und jedes Ergebnis auf die serielle Leitung geschrieben; ein Skript verglich alle 201 mit der Referenz des Entwicklungsrechners. **0 Abweichungen.** Dazu geprüft: Unterbrechungsroutinen nutzen keine Vektorregister (der Hash darf also unterbrochen werden), das Alignment-Prüfbit des Prozessors ist aus (Daten dürfen an beliebiger Adresse liegen, im Test ab Offset 24 nachgewiesen), der Vergleich zweier Ergebnisse läuft in konstanter Zeit (nötig, sobald damit Nachrichtenkennungen geprüft werden).
