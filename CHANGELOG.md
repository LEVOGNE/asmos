# Änderungsprotokoll

Entwicklungsgedächtnis von asmOS: Funktionen, Architekturentscheidungen, Sicherheitskorrekturen, Regressionen. Die Messwerte je Runde stehen in `README.md` unter "Messwerte", die Belege für Hardware-Werte in `docs/quellen.md`. Neueste Einträge oben.

## 16.09.2026

### Runde 30: Rechenkern fuer Sprachmodelle als Kernelblock

**Architektur**
- Neuer Block `llm_` mit den Operationen, die in jedem Transformer-Modell und fuer jede Sprache gleich sind: Exponentialfunktion, RMS-Normierung, Softmax, SwiGLU-Verknuepfung, Skalarprodukt mit 8-Bit-Gewichten und Matrixmultiplikation.
- Aktivierungen in 32-Bit-Gleitkomma, Gewichte in 8 Bit. Quantisierungsformat: 32 Gewichte je Block mit einem gemeinsamen Skalar, zusammen 36 Byte, wie `Q8_0` in GGML. Bewusst nur dieses eine Format statt eines vollstaendigen GGUF-Lesers.
- Das Modell ist damit Daten, nicht Programm, genau wie die Schrift. Der Kernel enthaelt die Mathematik, nicht das Modell.
- Die Selbsttests des Starts laufen jetzt ueber `boot_selftests`, weil der Startblock auf das Byte voll ist und kein zusaetzlicher Aufruf hineinpasst.

**Nachweise**
- Sechs Testgruppen gegen Referenzwerte vom Entwicklungsrechner, Toleranz 2e-4 relativ: `LLM KERN OK, 6 Testgruppen`.
- Gegenprobe mit einem um 0,001 verschobenen Erwartungswert: `LLM KERN FEHLER in Gruppe 3`. Der Test ist also nicht blind.
- Ruhebild byteweise gleich, `make check` und `make check-net` laufen durch. Der Selbsttest erscheint in der Befehlsmessung nicht, er ist zu klein.

**Noch nicht enthalten**
- Rotationskodierung der Position, Aufmerksamkeit mit Zwischenspeicher, Zerlegung in Wortstuecke, Modelldateiformat, Auswahl des naechsten Stuecks, Erzeugungsschleife. Der Kern ist skalar; NEON erst nach einer Messung an einem echten Modell.

### Runde 29: Netzhaertung vor der Agentenschicht

**Sicherheit**
- `tls_send_record` prueft jetzt die Laenge der Nutzlast. Vorher schrieb es ungeprueft in einen 512 Byte grossen Puffer, dahinter liegen der Finished-Puffer und der Empfangspuffer. Heute nicht ausloesbar, weil der einzige Aufrufer mit variabler Laenge bei 384 Byte gedeckelt war; der erste POST mit Koerper haette daraus einen stillen Speicherueberschreiber gemacht. Der Sendepuffer ist jetzt 2048 Byte gross, die Grenze wird erzwungen und meldet `TLS FEHLER: Record zu lang`.
- Das Verbindungsende traegt einen Grund (`TCB_END`): sauberer Schluss, Zeitueberschreitung oder Abbruch durch die Gegenstelle. Vorher war eine abgeschnittene Antwort von einer vollstaendigen nicht unterscheidbar, weil beide denselben Rueckruf ausloesten.
- Das Terminal laesst sich waehrend eines laufenden Abrufs mit Escape abbrechen. Vorher verwarf es jede Taste, und eine abgerissene Rueckrufkette sperrte es dauerhaft. `tls_abort` schliesst die Sitzung, wischt die Schluessel und schliesst die Verbindung.

**Nachweise**
- Testbau mit kuenstlich enger Grenze: zwei Sendeversuche melden `Record zu lang` statt zu ueberschreiben.
- Abruf auf einen Host, dessen Port 80 nicht antwortet: nach der Frist erscheint `curl: Gegenstelle antwortete nicht mehr, Inhalt ist unvollstaendig`.
- Derselbe Abruf mit Escape nach 1,5 Sekunden: `curl: abgebrochen`, Prompt zurueck, Terminal bedienbar.
- Ruhebild byteweise gleich dem vorigen Stand, 0 abweichende Bildpunkte ausserhalb des Netzfensters. `make check` und `make check-net` laufen durch.

**Gefunden beim Bau**
- Der neue Abbruchblock lag im Durchfallpfad von `term_input_mark` und erzeugte eine Endlosschleife, die die Hauptschleife einfror. Das Bild blieb auf dem Stand vor dem Tastendruck stehen, was wie eine nicht angekommene Taste aussah.

### Runde 28: Fira Code als Systemschrift, Umlaute, deutsche Tastatur

**Funktionen**
- Systemschrift ist Fira Code, 2.060 Glyphen, aus den Projektquellen mit fontmake gebaut, weil das Verzeichnis keine fertige Datei enthält und der offizielle Weg über Docker liefe.
- Zusammengesetzte Glyphen werden gezeichnet: der Lader merkt sich die Bauteilliste, eine neue Routine zeichnet jedes Bauteil mit verschobenem Ursprung über denselben Weg wie eine einfache Glyphe. Dadurch erscheinen Umlaute und alle Zeichen mit Akzent.
- Der Textpfad liest UTF-8 statt einzelner Bytes.
- Deutsche Tastatur mit QWERTZ, Umlauten und dritter Ebene über AltGr. Der Tastenring führt Codepunkte statt Bytes.
- Das Terminal legt Eingaben als UTF-8 ab, die Rücktaste löscht ein ganzes Zeichen, der Zeilenumbruch bricht kein Zeichen auf.

**Architektur**
- Rekursion mit Tiefenbegrenzung auf vier Ebenen, damit eine beschädigte Schrift den Stack nicht füllen kann.
- Bauteile mit eigener Skalierungsmatrix werden übersprungen statt falsch gezeichnet.
- Schriftpuffer von 64 KB auf 320 KB, die Schrift ist 204.776 Byte groß.
- Fenstertext von Größe 26 auf 19, weil Fira Code feste Breiten hat und eine Zeile mit 96 Zeichen sonst nicht in das Fenster passt.

**Messung**
- Kernel 76.105 auf 77.433 Byte, Start 623,3 auf 597,1 Mio. Befehle.
- Von 2.060 Glyphen liegen acht über den Grenzen des Renderers, ausschließlich Rasterflächen und Zeichen des privaten Bereichs.

**Gefunden beim Bau**
- Ein längerer Fenstertitel im Testbau verschob die Vektortabelle, die Linker-Zusicherung meldete es. Testtexte müssen die Bytelänge des Originals behalten.

### Runde 27: Doppelpufferung und Anzeigetakt

**Architektur**
- Zwei Ausgabepuffer. Gezeichnet wird in den nicht angezeigten, danach schaltet `fb_flip` über den fw_cfg-Eintrag `etc/ramfb` auf den fertigen Puffer um. Der angezeigte Puffer wird nie beschrieben, damit kann kein halb fertiges Bild mehr sichtbar werden.
- Nachziehen nur der Rechtecke des eben gezeigten Bildes. Ein Vollbild markiert den anderen Puffer als vollständig veraltet, das nächste Teilbild repariert ihn einmalig. Die Einblendung kostet dadurch weiterhin eine Vollausgabe je Bild.
- Zeichnen ist auf den Zeitgeber getaktet, 30 mal je Sekunde. Die Fensterposition folgt davon unabhängig jedem Mausereignis.

**Messung**
- Schnelles Ziehen: Fensterbewegungen 281 auf 2.706 je Sekunde, Bildausgaben 651 auf 136 je Sekunde, Umschaltungen 30 je Sekunde.
- Start unverändert: 13 Einblendbilder, 623 Mio. Befehle.

**Gefunden beim Bau**
- `ccmp` nimmt nur Werte bis 31, der Vergleich mit der Bildhöhe muss über ein Register laufen.
- Das Prüfskript hielt einen fehlgeschlagenen Bau für erfolgreich, weil die alte `kernel.bin` noch dalag. Es prüft jetzt den Rückgabewert.

## 15.09.2026

### Runde 26: glatte Einblendung, Aufräumen, Terminal mit curl

**Funktionen**
- Terminal wertet Befehle aus: `hilfe`, `curl http://host/pfad`, `curl https://host/pfad`. Statuszeile und Inhalt erscheinen im Terminal, Fehler werden dort gemeldet.
- DHCP liest die Leasezeit und erneuert nach halber Laufzeit, NAK und Ablauf führen zu neuer Anfrage.
- Stackwächter am Stackboden, geprüft im Blinktakt, Meldung `PANIC STACK UEBERLAUF`.
- Tastenring meldet Überlauf.

**Architektur**
- DNS und TLS nehmen Hostname, Anfrage und Empfänger als Parameter (`dns_resolve` mit Handler, `tls_configure`). Die Startdemo mit example.com ist nur noch ein Aufrufer.
- ClientHello wird mit variablem Servernamen gebaut, für example.com byteweise gleich der alten Vorlage.
- Einblendung startet nach den Selbsttests, die Netzkette über den Abschlussaufruf der Animation.
- Netzfenster ergänzt neue Zeilen direkt im Fensterpuffer, bildgleich zur Vollrasterung nachgewiesen.
- Die Klassenmethode für den Schmutzstatus kennt drei Antworten: nichts, Puffer neu rastern, nur ausgeben.
- Interrupts drucken nicht mehr, sie setzen Merker.

**Sicherheit**
- DER-Längen nur minimal, BOOLEAN nur 00 oder FF mit Länge 1, doppelte Zertifikatserweiterungen abgelehnt.
- ServerHello nur mit supported_versions und key_share.
- `tls_on_data` verarbeitet nur Ereignisse der eigenen Verbindung.

**Gefunden beim Bau**
- `msub` mit vertauschten Operanden lieferte falsche Dezimalziffern, sichtbar in der ersten curl-Ausgabe.
- Ein Testbau-Marker mit Netzvorsilbe landete selbst im Netzfenster und verfälschte den Bildvergleich.

### Runde 25: Stackmessung und fünf Pakete

- Stack gemessen: 3.312 von 16.384 Byte.
- RST außerhalb SYN_SENT nur bei `SEQ == RCV_NXT`, FIN_WAIT_2 mit vollen Intervallen, abgeschnittene IP-Datagramme verworfen, DHCP an Kennung, MAC, Quellport, Server-ID und Angebot gebunden.
- DNS-Antworten an Klasse IN, Owner-Name und CNAME-Kette gebunden.
- close_notify in beide Richtungen, andere Alerts sind Fehler.
- `make check-net` als Prüfziel für die ganze Kette.
- ServerHello, CertificateVerify, CCS, innerer Record-Typ und Signaturalgorithmus streng geprüft, Schlüssel auf allen Fehlerpfaden gelöscht.

### Runde 24: dritte Fehlersuche

- Zeilensammler setzt sich am Zeilenende zurück.
- CLOSE_WAIT: fremdes FIN bei unbestätigten Daten schließt erst nach der Bestätigung.
- Nach dem ServerHello keine Klartext-Handshake-Nachrichten mehr.

### Runden 22 und 23: Kompression, Fensterklassen, achtzehn Befunde

- Kernel bei gleicher Funktion um 2.478 Byte kleiner: Schleifen statt ausgerollter Runden, Kurvenformeln als Rechentabellen.
- Fenster sind Klassen mit Elternkette, Knöpfe für Einklappen und Schließen, Höhen- und Ausblendanimation mit Abschlussaufruf.
- TLS-Nachrichtenfolge, Nullgeheimnis, Selbsttests sperren TLS, Schlüssel gelöscht, Kalender, DNS-Zuordnung, virtio-Indizes und Barrieren, TCP-Überlappung und verzögerter FIN, stückweise TLS-Puffer, Statuszeile über Paketgrenzen, Zeitgeber-Ticks gezählt, Pufferverdichtung, X.509-Erweiterungen, virtio-rng.

### TLS-Zertifikate, Schritte B2 und C

- Kette bis zur Wurzel von `ROOT.DER`, Name über SAN, Gültigkeitszeitraum gegen pl031.

## 14.09.2026

- TLS-Kette ab Schritt B1: SHA-384 und P-384 über gemeinsamen Kurvenkontext.
- Terminal und Netzwerkfenster mit virtio-Tastatur.
- ECDSA P-256, DER-Parser, CertificateVerify.
- GICv2 und GICv3 über den Device Tree, damit läuft das System unter hvf.
- TLS-1.3-Handshake gegen example.com.
- Kryptobausteine SHA-256, HMAC, HKDF, AES-128-GCM, X25519 mit Testvektoren. Regression gefunden: Entschlüsseln an Ort und Stelle hashte den Klartext.
- Netzwerk Stufe 1 bis 6 bis TCP und HTTP, danach Empfang per Interrupt, Verbindungstabelle, Prüfsummen, Zufall.
- Messwerkzeug `tools/trace.py`, erste Optimierungsrunde: NEON-Ausgabe, Streifenfüllung, internes Bild auf 32 Bit, Fensterpuffer.
- Überlauf des Startblocks ist ein Baufehler.

## 13.09.2026

- Ausschaltknopf mit geordnetem Herunterfahren.
- Absolute Maus, Vektor-Engine mit Icons.
- Animationsschicht, Fokuswechsel, Einblenden, Ziehen mit Nachlauf.
- Virtueller statt physischer Zeitgeber, `make fast`.
- Regression behoben: volle Animationsliste ließ den Bildschirm schwarz.
- Systemschrift gegen Verlust abgesichert.

## 12.09.2026

- Erster Stand: Start, UART, Ausnahmen, Zeitgeber, Framebuffer, MMU, FAT32.
- Hardwareziel Raspberry Pi 5.
- TrueType als Systemschrift.
