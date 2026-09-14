<div align="center">

# asmOS

**As**sembler **O**perating **S**ystem

**Ein Betriebssystem, von Hand in Assembler geschrieben, gebaut als Monolith.**

Kein Linux darunter. Keine Bibliotheken. Kein C.<br>
Nur Maschinenbefehle für ARM-Prozessoren, ein Linker-Skript und ein Makefile.

<img src="https://img.shields.io/badge/Architektur-AArch64-blue?style=flat-square" alt="AArch64">
<img src="https://img.shields.io/badge/Sprache-GNU%20Assembler-orange?style=flat-square" alt="Assembler">
<img src="https://img.shields.io/badge/Kernel-26.704%20Byte-brightgreen?style=flat-square" alt="26704 Byte">
<img src="https://img.shields.io/badge/Ziel-QEMU%20virt-lightgrey?style=flat-square" alt="QEMU virt">

<br>

<img src="docs/screenshot.png" width="640" alt="asmOS im Betrieb: Fenster mit TrueType-Titeln und Mauszeiger">

<sub><i>Das laufende System: eigener Bildspeicher, eigene TrueType-Schrift, eigener Mauszeiger, animierte Fenster.</i></sub>

<br><br>

Das fertige System ist <b>26.704&nbsp;Byte</b> groß, also <b>26&nbsp;KB</b>.<br>
Ein handelsüblicher Linux-Kernel ist etwa <b>tausendmal</b> größer.

</div>

---

## Was es heute schon kann

<table>
<tr><td width="190"><b>Selbst starten</b></td><td>Läuft ohne Firmware-Hilfe hoch, richtet Stack und Speicher ein, erkennt selbst, auf welcher Privilegstufe der Prozessor gestartet ist</td></tr>
<tr><td><b>Reden</b></td><td>Serielle Schnittstelle in beide Richtungen: Textausgabe und Tastatureingabe</td></tr>
<tr><td><b>Sich melden</b></td><td>Bei einem Prozessorfehler keine stille Endlosschleife, sondern eine Diagnose mit Ursache, Adresse und Prozessorzustand</td></tr>
<tr><td><b>Zeit messen</b></td><td>Hardware-Zeitgeber mit echten Unterbrechungen. Die Taktfrequenz wird ausgelesen, nicht angenommen</td></tr>
<tr><td><b>Ein Bild malen</b></td><td><b>3840 × 1600</b> Bildpunkte, intern 64 Bit je Punkt mit Alphakanal, Rechtecke, Text und Transparenz</td></tr>
<tr><td><b>Schreiben</b></td><td><b>Eigener TrueType-Renderer.</b> Der Kernel liest eine Schriftdatei vom Datenträger, wertet ihre Tabellen aus, zerlegt die Bézierkurven, füllt die Flächen nach der Umlaufregel und glättet die Kanten. Jede Größe scharf, keine eingebauten Glyphen</td></tr>
<tr><td><b>Eine Maus führen</b></td><td>Zeiger bewegt sich, überdeckter Hintergrund wird gesichert und sauber wiederhergestellt. Einfach-, Doppel- und Dreifachklick werden unterschieden</td></tr>
<tr><td><b>Fenster zeigen</b></td><td>Fenster mit Titelleiste und TrueType-Beschriftung. Anklicken holt sie nach vorn, an der Titelleiste lassen sie sich ziehen. Neu gezeichnet wird nur, was sich wirklich geändert hat</td></tr>
<tr><td><b>Sich bewegen</b></td><td><b>Eigene Animationsschicht.</b> Fenster blenden ein, Fokuswechsel und Ziehen laufen weich statt sprunghaft. Zeitgesteuert, nicht bildzahlgesteuert, dadurch gleich schnell auf schneller und langsamer Maschine</td></tr>
<tr><td><b>Speicher verwalten</b></td><td>Erkennt selbst, wie viel Arbeitsspeicher da ist, verwaltet ihn seitenweise und schaltet die Speicherverwaltungseinheit des Prozessors ein</td></tr>
<tr><td><b>Dateien lesen</b></td><td>Spricht mit einem Datenträger und liest echte FAT32-Dateien, so wie ein USB-Stick sie enthält</td></tr>
<tr><td><b>Dateien zeigen</b></td><td>Ein Fenster listet den Inhalt des Datenträgers auf, gelesen beim Start aus dem echten Wurzelverzeichnis. Der Text wird auf den Fensterkörper beschnitten, läuft also nie über den Rand</td></tr>
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
<td width="150"><b><code>kernel.S</code></b><br><sub>182 KB · 7832 Zeilen</sub></td>
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
<summary><b>Wie sich die 7832 Zeilen aufteilen</b></summary>

<br>

In `kernel.S` stecken **792 Sprungmarken**. Jede gehört zu einem Zuständigkeitsbereich, erkennbar am Namensanfang. Ein Bereich fasst seinen Zustand selbst und wird von aussen nur über seine Einsprungpunkte benutzt:

| Namensanfang | Anzahl | Zuständig für |
|---|---:|---|
| `font_` `glyph_` | 117 | TrueType auswerten und über die Vektor-Engine zeichnen |
| `win_` `dirty_` | 85 | Fenster, Stapelreihenfolge, Ziehen, Teilaktualisierung |
| `blk_` `fat_` | 83 | Datenträger und Dateisystem |
| `anim_` | 80 | **Animationsschicht**: Zeitmessung, Verläufe, Beschleunigungskurven |
| `mem_` `pmm_` `mmu_` `fdt_` `ram_` | 70 | Speicherverwaltung und Hardware-Erkennung |
| `virtio_` `mouse_` `click_` | 68 | Gerätetreiber, Maus, Klickerkennung |
| `fb_` `cursor_` | 59 | Bildschirm, Bildpunkte, Mauszeiger |
| `console_` `string_` `out_` `power_` | 56 | Konsole, Textwerkzeuge, Herunterfahren |
| `vg_` `cov_` `edge_` `icon_` | 53 | **Vektor-Engine**: Pfade, Kurven, Füllung, Strich, Kantenglättung, Icons |
| `vec_` `panic_` `irq_` `gic_` | 36 | Fehlerbehandlung und Unterbrechungen |
| `uart_` | 27 | Serielle Schnittstelle, Textausgabe, Tastatureingabe |
| `boot_` | 15 | Hochfahren, Privilegstufe, Speicher vorbereiten |
| `fwcfg_` | 13 | Konfigurationsschnittstelle des Emulators |
| `timer_` | 9 | Zeitgeber |

</details>

### Was beim Bauen entsteht

| Datei | Größe | Was es ist |
|---|---:|---|
| **`kernel.bin`** | **26.704 Byte** | **Das eigentliche Betriebssystem.** Genau die Bytes, die der Prozessor ausführt |
| `kernel.elf` | 143 KB | Dasselbe mit Namen und Debug-Informationen für den Debugger |
| `kernel.lst` | | Der Maschinencode zurückübersetzt, zum Nachprüfen |
| `kernel.map` | | Wo der Linker jedes Symbol hingelegt hat |
| `disk.img` | 64 MB | Testdatenträger mit echtem FAT32, Testdateien und der Systemschrift |
| `virt.dtb` | | Hardwarebeschreibung, die der Emulator liefert |
| `screen.png` | | Bildschirmfoto aus `make shot` |

Keine dieser Dateien liegt in der Versionsverwaltung, sie entstehen alle neu aus dem Quelltext.

Im Betrieb belegt der Kernel zusätzlich **70 MB** Arbeitsspeicher: 46,9 MB interner Bildpuffer mit 64 Bit je Punkt, 23,4 MB Ausgabepuffer mit 32 Bit. Beim Start genullt wird davon nur der Ausgabepuffer, denn der interne wird ohnehin in der ersten Bildausgabe vollständig überschrieben. Das verkürzt die Nullung von 71,5 auf 24,2 MB und den Start um **81 %** im emulierten Betrieb.

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
| 10. Netzwerk bis TCP | offen |
| 11. Verschlüsselte Verbindungen | offen |
| 12. Vektorgrafik | ✅ Schrift, Zeiger und Icons, offen als Zeichenfläche für Anwendungen |
| 13. Animationsschicht und Compositor | teilweise, Animationen laufen, Compositor offen |
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
| Eigener Quelltext | 188 KB in drei Dateien |
| Zeilen Assembler | 7832 |
| Sprungmarken | 792 |
| **Fertiges Betriebssystem** | **26.704 Byte** |
| Speicherbedarf im Betrieb | 70 MB, fast vollständig Bildspeicher |
| Dokumentation | 98 KB Quellenbelege |
| Zielarchitektur | AArch64, ARM 64 Bit |
| Entwicklungsziel | QEMU `virt` |
| Späteres Hardwareziel | Raspberry Pi 5 |

</div>
