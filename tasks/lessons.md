# Fehlermuster und Präventionsregeln

Jeder Eintrag beantwortet zwei Fragen: Was ist passiert, und welche Regel verhindert das Wiederkommen. Die älteren Klassen stehen ausführlich in `CLAUDE.md` unter "Fehlerklassen", hier kurz mit ihrer Regel, die neuen ausführlich.

## Register und Stack

**Wert über einen Aufruf in einem flüchtigen Register.** Dreimal getroffen: roter Bildschirm, leere Datei, Zeigerspuren, dazu der Ausschaltknopf.
Regel: Was einen `bl` oder `blr` überlebt, gehört nach `x19` bis `x28` oder auf den Stack. Vor jeder neuen Hilfsroutine nachlesen, welche Register sie benutzt. `uart_putc` zerstört `x1` bis `x5`.

**Aufruf in einer rahmenlosen Routine.**
Regel: Wer einer Routine ohne Rahmen ein `bl` gibt, gibt ihr einen Rahmen. Das Skript für Aufrufe in rahmenlosen Routinen muss danach nur Startcode, Panik und Fehlerpfade zeigen.

**Operandenreihenfolge von `msub` vertauscht** (Runde 26). `msub Rd, Rn, Rm, Ra` rechnet `Ra - Rn * Rm`. Geschrieben war der Rest einer Division als `msub w7, w5, w6, w4`, richtig ist `msub w7, w6, w4, w5`. Aufgefallen erst in der ersten sichtbaren Dezimalausgabe.
Regel: Jede neue Formatierungs- oder Rechenroutine bekommt einen sichtbaren Test mit bekanntem Wert, bevor sie in einer Meldung steckt.

## Strukturen und Daten

**Neues Feld in einen bestehenden Zeiger gelegt.**
Regel: Vor dem Einfügen die Breite aller Nachbarfelder prüfen, nicht nur die Offsets.

**Daten in den Füllraum der Vektortabelle eingefügt.** Dreimal, jedes Mal von der Linker-Zusicherung gemeldet.
Regel: Mit `aarch64-elf-nm` die Sektion des Ankers prüfen. Daten vor `.section .bss`, Code vor `.section .text.vectors`. Auch Routinen wie `mem_init` können im Füllraum liegen.

**Startblock voll** (Runde 26). `.text.boot` ist auf das Byte 2.048 lang, jeder zusätzliche Befehl verschiebt die Vektortabelle.
Regel: Neue Startschritte als Routine in `.text` bauen und im Startblock durch einen einzigen Aufruf ersetzen, der bestehende Befehle zusammenfasst.

## Eingaben von außen

**Daten von außen ungeprüft übernommen.** Schriftdatei, Pakete, Zertifikate.
Regel: Jede Länge gegen die tatsächliche Grenze prüfen, bevor gelesen wird.

**Nur "nicht zu lang" geprüft statt "genau so lang"** (Runden 25 und 26). ServerHello, CertificateVerify und die IP-Gesamtlänge wurden auf Überlauf geprüft, aber Bytes dahinter oder eine kürzere Angabe wurden hingenommen. DER erlaubte nicht minimale Längenformen.
Regel: Jede Längenangabe eines Protokolls wird auf Gleichheit mit dem verbrauchten Bereich geprüft. Überschuss ist ein Fehler, keine Toleranz. Jede Kodierung, die kanonisch sein muss, bekommt einen Testbau mit einer nicht kanonischen Variante.

**Ereignisse fremder Verbindungen verarbeitet** (Runde 26). `tls_on_data` prüfte nicht, zu welcher TCP-Verbindung ein Ereignis gehörte. Solange es nur eine TLS-Verbindung gab, war das unsichtbar; mit curl hätte das späte Ende der Demo-Verbindung die neue Sitzung gelöscht.
Regel: Jeder Empfänger mit Zustand vergleicht die Herkunft des Ereignisses mit seinem eigenen Besitz, bevor er den Zustand anfasst.

**Feste Ziele im Protokollcode** (Runde 26). DNS druckte und wiederholte immer `example.com`, TLS hatte den Servernamen in der Vorlage, die Antwort ging immer an dieselbe Ausgabe.
Regel: Protokollblöcke kennen keine Anwendung. Ziel, Anfrage und Empfänger kommen als Parameter, die Demo ist ein Aufrufer wie jeder andere.

## Nebenläufigkeit

**Code hinter einem Sprung eingefügt, der ihn überspringt.** Netz-Zeitgeber lief nur während Animationen.
Regel: Jeden Sprung vor der Einfügestelle auf sein Ziel prüfen, jede neue Wartezeit bekommt einen Testbau, in dem die Antwort ausbleibt.

**Interrupt druckt selbst** (Runde 26). Zwei Fehlerpfade druckten aus dem Interrupt und konnten eine Ausgabe der Hauptschleife zerschneiden.
Regel: Interrupts setzen Merker, drucken tut die Hauptschleife.

**Arbeit blockiert die Animation** (Runde 26). Selbsttests und Netzkette liefen innerhalb der Einblendung, von 13 Bildern entstanden 10.
Regel: Zeitkritische Übergänge starten erst, wenn die Hauptschleife frei ist. Lange Arbeit wird über den Abschlussaufruf danach angestoßen. Vor jeder Aussage zur Bildrate zählen, wie viele Bilder wirklich entstehen.

## Arbeitsweise

**`git checkout` hat ungesicherte Arbeit gelöscht.**
Regel: Testbauten aus einer Kopie im Scratchpad, nie `git checkout` auf eine Datei mit Änderungen.

**Ein Testbau hat sein eigenes Ergebnis verfälscht** (Runde 26). Der Marker "TCP SENDEPUFFER VOLL" beginnt mit einer Netzvorsilbe und landete als neue Zeile im Netzwerkfenster, das dann nicht mehr gleich war.
Regel: Marker in Testbauten nutzen Texte ohne Netzvorsilbe, und jedes überraschende Ergebnis eines Testbaus wird zuerst gegen den Testbau selbst geprüft.

**Der Emulator erreicht nicht jeden Zustand** (Runde 26). slirp bestätigt einen FIN erst, wenn das Weiterleitungsziel endet, der echte Server schickt sein FIN mit dem close_notify. FIN_WAIT_2 war so nicht erreichbar.
Regel: Ist ein Zustand von außen nicht herstellbar, setzt ein Testbau ihn direkt und misst nur die Logik dahinter. Das Protokoll sagt dann ehrlich, was belegt ist und was nicht.

**Behauptungen aus Durchsichten ungeprüft übernehmen.** Mehrere Durchsichten meldeten Fehler, die am Code nicht bestanden (NEON im Interrupt, Stackfehler, ungültiges Immediate, Pfadlängenzählung).
Regel: Jeder gemeldete Befund wird am Code nachvollzogen, mit Zeile und auslösendem Zustand, bevor er gebaut oder weitergegeben wird.
