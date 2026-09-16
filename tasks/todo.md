# Aufgaben

Stand 16.09.2026, nach Runde 28.

## Erledigt in Runde 26

- [x] Einblendung glätten: Start nach den Selbsttests, Netzkette danach, Netzfenster zeilenweise
- [x] Stackwächter und Meldungstext für CertificateVerify
- [x] Empfangspuffer mit ungültiger Länge neu einreihen
- [x] Tastenring-Überlauf melden, Interrupt-Ausgaben über Merker
- [x] FIN_WAIT_2-Frist nachweisen
- [x] Doppeltes Warten in `net_send` gemessen, bleibt als Besitzgarantie (0,1 % der Befehle)
- [x] DER minimal, BOOLEAN streng, doppelte Erweiterungen, ServerHello nur erlaubte Extensions
- [x] DHCP-Lease mit Erneuerung, NAK, Ablauf
- [x] Terminal mit `hilfe` und `curl` über HTTP und HTTPS
- [x] CLAUDE.md, CHANGELOG.md, README fortgeschrieben

## Erledigt in Runde 27

- [x] Doppelpufferung mit Umschaltung des Bildspeichers, kein Zerreißen mehr
- [x] Zeichnen auf die Anzeigerate getaktet, Position weiter pro Ereignis
- [x] Zeiger und Fenster erscheinen zusammen, weil beide vor der Umschaltung im selben Puffer stehen
- [x] Prüfskript bricht bei Baufehlern ab

## Erledigt in Runde 28

- [x] Fira Code aus den Projektquellen gebaut und als Systemschrift eingesetzt
- [x] Zusammengesetzte Glyphen werden gezeichnet, Umlaute erscheinen
- [x] UTF-8 im Textpfad
- [x] Deutsche Tastatur mit QWERTZ, Umlauten und AltGr, über eingespeiste Tastendrücke geprüft
- [x] Terminal legt Eingaben als UTF-8 ab, Rücktaste löscht ganze Zeichen
- [x] Textgröße an die feste Breite angepasst, keine abgeschnittenen Zeilen mehr

## Offen aus der Fehlersuche vom 16.09.2026

Gefunden, nicht behoben. Reihenfolge nach Dringlichkeit.

- [ ] `llm_dot_q8` verarbeitet immer volle Blöcke zu 32 Gewichten und liest bei anderen Spaltenzahlen über Vektor und Gewichtszeile hinaus
- [ ] `llm_matmul_q8` rundet die Zeilenbreite ab, während das Skalarprodukt aufrundet; bei unter 32 Spalten ist die Schrittweite null
- [ ] `pmm_free_n` prüft weder Eigentümer noch Belegtzustand und kann die Seiten des Device Tree freigeben
- [ ] `sys_value`, `sys_name` und `sys_fmt` prüfen den Index nicht; bei einem zu großen Index wird ein gelesener Wert als Funktionszeiger aufgerufen
- [ ] `pmm_mark_range` und `pmm_bit_get` sind Schreib- und Leseprimitive ohne eigene Grenzprüfung
- [ ] `llm_expf` liefert bei sehr großem Argument null statt des Höchstwerts
- [ ] `font_utf8_next` nimmt überlange Kodierungen an; `C0 80` beendet die Textausgabe
- [ ] Jede Zuteilung fragt zweimal die Statistik, die alle Seiten durchzählt; ein Suchzeiger und ein Zähler je Eigentümer würden das beheben
- [ ] `pol_check` stellt auf dem Fehlerpfad das Kontingent nicht wieder her und löscht alle Ablehnungszähler statt nur den eigenen
- [ ] Die Rückgabewerte von `llm_selftest`, `pmm_check`, `pol_check` und `sys_check` werden verworfen; ein Fehlschlag sperrt nichts
- [ ] `term_put_dec` schneidet Werte über vier Milliarden ab, sichtbar ab vier Gigabyte Arbeitsspeicher
- [ ] `llm_close` und `llm_cmp_arr` werten einen ungültigen Zahlenwert als bestanden

## Erledigt in Runde 33

- [x] Block `pol_`: Kontingente je Eigentümer, Reserve, Ablehnungszähler
- [x] Zuteilung fragt die Politik, Gegenprobe belegt die Wirkung
- [x] Terminalbefehl `politik`, zwei neue Fakten

## Offen, Politik

- [ ] Politik vom Datenträger laden, damit sie ohne Neubau änderbar ist
- [ ] Zweiter Entscheidungspunkt: was bei Knappheit weichen muss, nicht nur wer nichts bekommt
- [ ] Werkzeug, mit dem ein Agent ein Kontingent ändern darf, mit Bestätigung

## Erledigt in Runde 32

- [x] Faktentabelle `sys_` mit 24 Einträgen, Selbstprüfung und Gegenprobe
- [x] Terminalbefehl `zustand`

## Offen, Selbstauskunft

- [ ] Fakten maschinenlesbar ausgeben, nicht nur als Text für Menschen
- [ ] Fakten nach Präfix filtern, etwa `zustand netz`
- [ ] Ereignisse und Zähler ergänzen: Interrupts, Pakete, Bilder je Sekunde, Stackbedarf

## Erledigt in Runde 31

- [x] Seitenallokator in Betrieb, mehrere zusammenhängende Seiten
- [x] Eigentümer je Seite, Statistik je Eigentümer, Adresse nach Eigentümer auflösbar
- [x] Terminalbefehl `speicher`, acht Prüfschritte mit Gegenprobe

## Erledigt in Runde 30

- [x] Block `llm_`: Exponentialfunktion, RMS-Normierung, Softmax, SwiGLU, Q8-Skalarprodukt, Matrixmultiplikation
- [x] Sechs Testgruppen mit Gegenprobe, Belege in `docs/quellen.md`

## Offen, Rechenkern

- [ ] Rotationskodierung der Position (RoPE)
- [ ] Aufmerksamkeit mit Schlüssel-Wert-Zwischenspeicher
- [ ] Modelldateiformat und Lader vom Datenträger
- [ ] Zerlegung in Wortstücke (Tokenizer)
- [ ] Auswahl des nächsten Stücks und Erzeugungsschleife
- [ ] NEON für das Skalarprodukt, erst nach Messung an einem echten Modell

## Erledigt in Runde 29

- [x] `tls_send_record` prüft die Nutzlastlänge, Sendepuffer auf 2048 Byte
- [x] Verbindungsende trägt einen Grund, Zeitüberschreitung ist von sauberem Schluss unterscheidbar
- [x] Abbruch eines laufenden Abrufs mit Escape, `tls_abort` schließt die Sitzung sauber

## Offen, klein

- [ ] Mausposition in einem Stück übernehmen, heute kann ein Bild einen Zeiger mit neuem x und altem y zeigen
- [ ] Glyphen-Cache für Titel und Terminal, jede Terminalzeile wird bei Änderung neu gerastert
- [ ] Terminal zeilenweise ergänzen wie das Netzwerkfenster
- [ ] curl: Umleitungen, Ausgabe von Kopfzeilen auf Wunsch
- [ ] Mehrere Wurzelzertifikate vom Datenträger
- [ ] Bauteile mit eigener Skalierungsmatrix zeichnen, heute werden sie übersprungen
- [ ] Glyphen über 256 Punkten oder 16 Konturen, betrifft nur Rasterflächen
- [ ] Kerneltexte auf echte Umlaute umstellen, bisher sind sie umschrieben

## Offen, Fahrplan

- [ ] TCP-Empfangsfenster, TIME_WAIT, IP-Fragmente
- [ ] Sperrlisten und OCSP, Namensbeschränkungen, Sitzungswiederaufnahme, Key Update
- [ ] RSA-Signaturen für Zertifikate
- [ ] Eigener TLS-Testserver für Prüfungen gegen bösartige Gegenstellen
- [ ] FAT32 schreibend
- [ ] Meilenstein 14: Portierung Raspberry Pi 5, zuerst Beleg für den Debug-UART am BCM2712
- [ ] Meilenstein 15: Inferenzschicht

## Zusammenfassung

Runde 28 hat die Systemschrift ersetzt und den Renderer um zusammengesetzte Glyphen erweitert. Jeder Punkt ist am laufenden System belegt, die Tastatur über eingespeiste Tastendrücke.

Runde 26 hat alle offenen Punkte der drei Fehlersuchen und der fremden Durchsicht abgearbeitet und das Terminal zum ersten bedienbaren Netzwerkwerkzeug gemacht. Jeder Punkt hat einen Testbau oder eine Messung, die ihn belegt.
