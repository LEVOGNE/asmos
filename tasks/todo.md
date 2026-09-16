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
