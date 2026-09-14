<div align="center">

# asmOS

**As**sembler **O**perating **S**ystem

**Ein Betriebssystem, von Hand in Assembler geschrieben, gebaut als Monolith.**

Kein Linux darunter. Keine Bibliotheken. Kein C.<br>
Nur Maschinenbefehle für ARM-Prozessoren, ein Linker-Skript und ein Makefile.

<img src="https://img.shields.io/badge/Architektur-AArch64-blue?style=flat-square" alt="AArch64">
<img src="https://img.shields.io/badge/Sprache-GNU%20Assembler-orange?style=flat-square" alt="Assembler">
<img src="https://img.shields.io/badge/Kernel-36.640%20Byte-brightgreen?style=flat-square" alt="36640 Byte">
<img src="https://img.shields.io/badge/Ziel-QEMU%20virt-lightgrey?style=flat-square" alt="QEMU virt">

<br>

<img src="docs/screenshot.png" width="640" alt="asmOS im Betrieb: Fenster mit TrueType-Titeln und Mauszeiger">

<sub><i>Das laufende System: eigener Bildspeicher, eigene TrueType-Schrift, eigener Mauszeiger, animierte Fenster.</i></sub>

<br><br>

Das fertige System ist <b>36.640&nbsp;Byte</b> groß, also <b>36&nbsp;KB</b>.<br>
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
<td width="150"><b><code>kernel.S</code></b><br><sub>269 KB · 11463 Zeilen</sub></td>
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
<summary><b>Wie sich die 11463 Zeilen aufteilen</b></summary>

<br>

In `kernel.S` stecken **1150 Sprungmarken**. Jede gehört zu einem Zuständigkeitsbereich, erkennbar am Namensanfang. Ein Bereich fasst seinen Zustand selbst und wird von aussen nur über seine Einsprungpunkte benutzt:

| Namensanfang | Anzahl | Zuständig für |
|---|---:|---|
| `net_` `tcp_` `dhcp_` `dns_` `http_` | 241 | **Netzwerk**: virtio-net, ARP, IPv4, ICMP, UDP, DHCP, DNS, TCP mit Verbindungstabelle |
| `font_` `glyph_` | 117 | TrueType auswerten und über die Vektor-Engine zeichnen |
| `win_` `dirty_` | 110 | Fenster, Stapelreihenfolge, Ziehen, Teilaktualisierung, Fensterpuffer |
| `fb_` `cursor_` | 86 | Bildschirm, Bildpunkte, Mauszeiger |
| `blk_` `fat_` | 83 | Datenträger und Dateisystem |
| `anim_` | 80 | **Animationsschicht**: Zeitmessung, Verläufe, Beschleunigungskurven |
| `mem_` `pmm_` `mmu_` `fdt_` `ram_` | 74 | Speicherverwaltung und Hardware-Erkennung |
| `virtio_` `mouse_` `click_` | 73 | Gerätetreiber, Maus, Klickerkennung |
| `vg_` `cov_` `edge_` `icon_` | 60 | **Vektor-Engine**: Pfade, Kurven, Füllung, Strich, Kantenglättung, Icons |
| `console_` `string_` `out_` `power_` | 59 | Konsole, Textwerkzeuge, Herunterfahren |
| `sha_` | 41 | **Kryptografie**: SHA-256 über die ARMv8-Erweiterung, Selbsttest gegen fünf Vektoren |
| `vec_` `panic_` `irq_` `gic_` | 37 | Fehlerbehandlung und Unterbrechungen |
| `uart_` | 29 | Serielle Schnittstelle, Textausgabe, Tastatureingabe |
| `boot_` | 15 | Hochfahren, Privilegstufe, Speicher vorbereiten |
| `fwcfg_` | 13 | Konfigurationsschnittstelle des Emulators |
| `timer_` | 10 | Zeitgeber |

</details>

### Was beim Bauen entsteht

| Datei | Größe | Was es ist |
|---|---:|---|
| **`kernel.bin`** | **36.640 Byte** | **Das eigentliche Betriebssystem.** Genau die Bytes, die der Prozessor ausführt |
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
| 11. Verschlüsselte Verbindungen | 🔧 begonnen: SHA-256 über die Prozessorerweiterung, fünf Testvektoren beim Start geprüft |
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
| Eigener Quelltext | 274 KB in drei Dateien |
| Zeilen Assembler | 11463 |
| Sprungmarken | 1150 |
| **Fertiges Betriebssystem** | **36.640 Byte** |
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

**Fehlersuche danach.** Die fünf Vektoren decken die Blockgrenzen ab, nicht aber jede Kombination aus Füllstand und Stückgröße. Ein Testbau hat deshalb 201 Nachrichten der Längen 0 bis 200 gehasht, jede in Stücken wechselnder Größe (1 bis 17 Byte) eingespeist, und jedes Ergebnis auf die serielle Leitung geschrieben; ein Skript verglich alle 201 mit der Referenz des Entwicklungsrechners. **0 Abweichungen.** Dazu geprüft: Unterbrechungsroutinen nutzen keine Vektorregister (der Hash darf also unterbrochen werden), das Alignment-Prüfbit des Prozessors ist aus (Daten dürfen an beliebiger Adresse liegen, im Test ab Offset 24 nachgewiesen), der Vergleich zweier Ergebnisse läuft in konstanter Zeit (nötig, sobald damit Nachrichtenkennungen geprüft werden).
