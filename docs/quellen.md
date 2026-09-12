# Quellen für Hardware-Werte

Jeder Wert, der im Code als Adresse, Registeroffset, Bitfeld oder Konstante steht, hat hier einen Eintrag mit Beleg. Ein Wert ohne Eintrag ist ein Fehler.

Stand: 2026-09-12

---

## Maschine und Werkzeuge

| Was | Wert | Beleg |
|---|---|---|
| QEMU | 11.0.3 | `qemu-system-aarch64 --version` |
| Binutils | 2.47.20260726 | `aarch64-elf-as --version` |
| GCC (Cross) | 16.2.0 | Homebrew `aarch64-elf-gcc` |
| GDB | 17.2 | `aarch64-elf-gdb --version` |
| Maschine | `-machine virt -cpu cortex-a72` | Makefile, Ziel `run` |

---

## Aus dem Device Tree der QEMU-virt-Maschine

Erzeugt mit `make dtb`, also `qemu-system-aarch64 -machine virt,dumpdtb=virt.dtb -cpu cortex-a72 -nographic`, dekompiliert mit `dtc -I dtb -O dts`. Reproduzierbar, die Dateien `virt.dtb` und `virt.dts` sind bewusst nicht eingecheckt.

| Was | Wert | Fundstelle im DTS |
|---|---|---|
| RAM-Basis | `0x40000000` | `memory@40000000`, `reg = <0x00 0x40000000 0x00 0x8000000>` |
| RAM-Größe (Default, ohne `-m`) | `0x8000000` = 128 MB | dieselbe Zeile |
| PL011-UART-Basis | `0x09000000` | `pl011@9000000`, `reg = <0x00 0x9000000 0x00 0x1000>` |
| PL011-Registerfenster | `0x1000` | dieselbe Zeile |
| PL011-Interrupt | SPI 1, level-high, INTID 33 | `interrupts = <0x00 0x01 0x04>`, SPI-Basis 32 |
| UART-Takt | `0x16e3600` = 24.000.000 Hz | `apb-pclk`, `clock-frequency`, `clock-output-names = "clk24mhz"` |
| GIC-Variante | GICv2 | `intc@8000000`, `compatible = "arm,cortex-a15-gic"` |
| GIC-Distributor | `0x08000000`, Größe `0x10000` | `intc@8000000`, `reg` erstes Paar |
| GIC-CPU-Interface | `0x08010000`, Größe `0x10000` | `intc@8000000`, `reg` zweites Paar |
| Generic Timer, phys. non-secure | PPI 14, INTID 30 | `timer`, `interrupts` zweiter Eintrag `<0x01 0x0e 0x104>` |

Die GIC- und Timer-Werte sind für Phase 2 notiert, im Code von Phase 1 noch nicht verwendet.

---

## PL011-Registeroffsets und Bitfelder

Beleg: Linux-Quellcode, `include/linux/amba/serial.h` (torvalds/linux, master). Deckungsgleich mit dem ARM PrimeCell UART (PL011) Technical Reference Manual, Kapitel Programmers Model.

| Symbol im Code | Offset | Linux-Name |
|---|---|---|
| `UART_DR` | `0x00` | `UART01x_DR` |
| `UART_FR` | `0x18` | `UART01x_FR` |
| `UART_IBRD` | `0x24` | `UART011_IBRD` |
| `UART_FBRD` | `0x28` | `UART011_FBRD` |
| `UART_LCRH` | `0x2c` | `UART011_LCRH` |
| `UART_CR` | `0x30` | `UART011_CR` |
| `UART_IMSC` | `0x38` | `UART011_IMSC` |

| Symbol im Code | Wert | Linux-Name |
|---|---|---|
| `UART_FR_TXFF` | `1 << 5` | `UART01x_FR_TXFF` |
| `UART_FR_BUSY` | `1 << 3` | `UART01x_FR_BUSY` |
| `UART_CR_UARTEN` | `1 << 0` | `UART01x_CR_UARTEN` |
| `UART_CR_TXE` | `1 << 8` | `UART011_CR_TXE` |
| `UART_CR_RXE` | `1 << 9` | `UART011_CR_RXE` |
| `UART_LCRH_FEN` | `1 << 4` | `UART01x_LCRH_FEN` |
| `UART_LCRH_WLEN_8` | `0x60` | `UART01x_LCRH_WLEN_8` |

### Baudraten-Teiler

Formel aus dem PL011 TRM: Teiler = UARTCLK / (16 × Baudrate), Vorkommateil nach `UARTIBRD`, Nachkommateil mal 64 und gerundet nach `UARTFBRD`.

Bei UARTCLK 24 MHz (belegt oben) und 115200 Baud:

- 24000000 / (16 × 115200) = 13,0208333
- `UART_IBRD_115200` = 13
- 0,0208333 × 64 = 1,333, gerundet 1, also `UART_FBRD_115200` = 1

QEMU wertet die Baudrate bei `-nographic` nicht aus, der Teiler ist trotzdem korrekt gesetzt, damit die Sequenz auf echter Hardware nicht nachgezogen werden muss.

---

## AArch64-Systemregister

Beleg: Arm Architecture Reference Manual for A-profile (ARM DDI 0487), Kapitel D, Beschreibung der jeweiligen Systemregister.

| Symbol im Code | Wert | Bedeutung |
|---|---|---|
| `MPIDR_AFF0_MASK` | `0xff` | `MPIDR_EL1.Aff0`, Kernnummer innerhalb des Clusters |
| `SCR_EL3_NS` | `1 << 0` | Non-secure |
| `SCR_EL3_SMD` | `1 << 7` | SMC-Instruktion sperren |
| `SCR_EL3_HCE` | `1 << 8` | HVC-Instruktion freigeben |
| `SCR_EL3_RW` | `1 << 10` | nächstniedrigeres EL ist AArch64 |
| `HCR_EL2_RW` | `1 << 31` | EL1 ist AArch64 |
| `CNTHCTL_EL2_EL1PCTEN` | `1 << 0` | EL1 darf den physischen Zähler lesen |
| `CNTHCTL_EL2_EL1PCEN` | `1 << 1` | EL1 darf die physischen Timer-Register nutzen |
| `SCTLR_M` | `1 << 0` | MMU aktiv |

### SPSR-Werte für den Exception-Level-Wechsel

Aufbau laut ARM ARM, SPSR_ELx: Bits 9 bis 6 sind D, A, I, F (maskiert = 1), Bits 3 bis 0 sind das Ziel-Mode-Feld.

| Symbol im Code | Wert | Zusammensetzung |
|---|---|---|
| `SPSR_EL2H_DAIF` | `0x3c9` | DAIF maskiert (`0x3c0`) + M[3:0] = `0b1001` (EL2h) |
| `SPSR_EL1H_DAIF` | `0x3c5` | DAIF maskiert (`0x3c0`) + M[3:0] = `0b0101` (EL1h) |

### SCTLR_EL1 beim Wechsel nach EL1

Bewusst wird `SCTLR_EL1` gelesen, nur Bit M gelöscht und zurückgeschrieben, statt eine RES1-Maske als Konstante zu setzen. Grund: die RES1-Bits unterscheiden sich zwischen Architekturversionen. Lesen und gezielt löschen kommt ohne erfundenen Konstantenwert aus und bleibt über Versionen hinweg gültig.

---

## Exception-Vektortabelle (Phase 2a)

Beleg: Linux-Quellcode, `arch/arm64/kernel/entry.S`, Makro `kernel_ventry` und `SYM_CODE_START(vectors)`. Deckungsgleich mit dem Arm Architecture Reference Manual, Kapitel "Exception vectors".

| Was | Wert | Beleg |
|---|---|---|
| Ausrichtung der Tabelle | 2048 Byte | `.align 11` vor `vectors` |
| Größe eines Eintrags | 128 Byte | `.align 7` im Makro `kernel_ventry` |
| Anzahl Einträge | 16 | 16 Aufrufe von `kernel_ventry` |

Reihenfolge der Einträge, Index wie im Code in `x0` übergeben:

| Index | Eintrag | Index | Eintrag |
|---|---|---|---|
| 0 | Synchronous EL1t | 8 | Synchronous 64-bit EL0 |
| 1 | IRQ EL1t | 9 | IRQ 64-bit EL0 |
| 2 | FIQ EL1t | 10 | FIQ 64-bit EL0 |
| 3 | Error EL1t | 11 | Error 64-bit EL0 |
| 4 | Synchronous EL1h | 12 | Synchronous 32-bit EL0 |
| 5 | IRQ EL1h | 13 | IRQ 32-bit EL0 |
| 6 | FIQ EL1h | 14 | FIQ 32-bit EL0 |
| 7 | Error EL1h | 15 | Error 32-bit EL0 |

Im Build verifiziert: die 16 Einträge folgen in Abständen von exakt `0x80`. Die absolute Lage von `vec_table` verschiebt sich mit dem Codeumfang, sie ist über `aarch64-elf-nm` nachprüfbar.

### Register des Panic-Handlers

Beleg: Arm Architecture Reference Manual (ARM DDI 0487), Beschreibung der jeweiligen Register.

| Register | Inhalt |
|---|---|
| `ESR_EL1` | Exception Syndrome, EC in Bits 31:26, IL in Bit 25, ISS in 24:0 |
| `ELR_EL1` | Adresse der auslösenden Instruktion |
| `FAR_EL1` | Fehleradresse bei Speicherzugriffsfehlern |
| `SPSR_EL1` | gesicherter Prozessorzustand vor der Exception |

### Selbsttest

`BOOT_SELFTEST` in `kernel.S` schaltet ein `brk #0` direkt nach dem Banner. Erwartet wird dann Vektor 4 (`EL1h_SYNC`) mit `ESR_EL1` = `0xf2000000`, das entspricht EC `0x3c` (BRK in AArch64) mit gesetztem IL-Bit. `ELR_EL1` muss auf die Adresse der `brk`-Instruktion zeigen. Auf `0` gesetzt entfällt der Selbsttest.

---

## GICv2 und Generic Timer (Phase 2b)

Basisadressen sind oben aus dem Device Tree belegt. Die Registeroffsets stammen aus dem Linux-Quellcode, `include/linux/irqchip/arm-gic.h`, deckungsgleich mit der ARM Generic Interrupt Controller Architecture Specification v2.

| Symbol im Code | Offset | Linux-Name |
|---|---|---|
| `GICD_CTLR` | `0x000` | `GIC_DIST_CTRL` |
| `GICD_ISENABLER` | `0x100` | `GIC_DIST_ENABLE_SET` |
| `GICD_IPRIORITYR` | `0x400` | `GIC_DIST_PRI` |
| `GICC_CTLR` | `0x00` | `GIC_CPU_CTRL` |
| `GICC_PMR` | `0x04` | `GIC_CPU_PRIMASK` |
| `GICC_IAR` | `0x0c` | `GIC_CPU_INTACK` |
| `GICC_EOIR` | `0x10` | `GIC_CPU_EOI` |
| `GIC_INTID_SPURIOUS` | `0x3ff` | `GICC_INT_SPURIOUS` |

### Bewusste Festlegungen

| Was | Wert | Begründung |
|---|---|---|
| `GIC_PMR_UNMASKED` | `0xf0` | Prioritätsschwelle. Interrupts mit numerisch kleinerer Priorität kommen durch. Der Timer wird auf `0` gesetzt, liegt also darunter. |
| Priorität des Timers | `0` über `GICD_IPRIORITYR + 30` | Byte-adressiert, ein Byte je INTID. Explizit gesetzt statt auf den Reset-Wert zu vertrauen. |
| Freischaltung | Bit 30 in `GICD_ISENABLER` | INTID 30 liegt im ersten Register, das die INTIDs 0 bis 31 abdeckt. |
| `DAIF_I` | `2` | Bitmaske für `msr daifclr`, Bit 1 ist das I-Bit. Beleg: ARM ARM, DAIFClr. |
| `IRQ_FRAME_SIZE` | `160` | Platz für x2 bis x19 und x30. `x0`/`x1` liegen bereits durch den Vektoreintrag auf dem Stack. |

### Timer-Frequenz

`CNTFRQ_EL0` wird zur Laufzeit gelesen, es steht **kein** angenommener Wert im Code. Ist das Register `0`, meldet `timer_init` "TIMER UNAVAILABLE" und aktiviert den Timer nicht, statt still einen Timer mit Intervall null zu starten. Das Intervall wird in `timer_interval` abgelegt und bei jedem Tick aus dieser Quelle neu in `CNTP_TVAL_EL0` geschrieben.

### Robustheit im IRQ-Pfad

| Fall | Verhalten |
|---|---|
| INTID `0x3ff` (spurious) | Rückkehr ohne `EOIR`-Schreibzugriff, so verlangt es die GIC-Spezifikation |
| INTID 30 | Timer-Tick, danach `EOIR` |
| jede andere INTID | Ausgabe "IRQ UNEXPECTED iar=" mit dem vollständigen IAR-Wert, danach `EOIR`. Kein stilles Verwerfen. |

`EOIR` bekommt immer den **vollständigen** gelesenen IAR-Wert, nicht die maskierte INTID, weil das CPUID-Feld bei Software-generierten Interrupts mitgeschrieben werden muss.

---

## UART-Empfang und Konsole (Phase 2c)

Beleg: Linux-Quellcode, `include/linux/amba/serial.h`.

| Symbol im Code | Wert | Linux-Name |
|---|---|---|
| `UART_MIS` | `0x40` | `UART011_MIS` |
| `UART_ICR` | `0x44` | `UART011_ICR` |
| `UART_FR_RXFE` | `1 << 4` | `UART01x_FR_RXFE` |
| `UART_IMSC_RXIM` | `1 << 4` | `UART011_RXIM` |
| `UART_IMSC_RTIM` | `1 << 6` | `UART011_RTIM` |
| `UART_INTID` | 33 | SPI 1 aus dem Device Tree, SPI-Basis 32 |

`RTIM` wird zusammen mit `RXIM` freigeschaltet. Ohne den Empfangs-Timeout meldet die FIFO erst bei Erreichen der Füllschwelle, einzelne Tastendrücke blieben sonst liegen, bis genug Zeichen zusammenkommen.

Für INTID 33 wird zusätzlich `GICD_ITARGETSR` auf CPU 0 gesetzt. Das ist bei SPIs nötig und bei PPIs wie dem Timer nicht, dort ist die Zuordnung fest.

### Aufteilung zwischen Interrupt und Hauptschleife

| Ort | Aufgabe |
|---|---|
| `uart_rx_isr` | quittiert über `ICR` mit dem gelesenen `MIS`-Wert, leert die FIFO vollständig in den Ringpuffer, sonst nichts |
| `timer_tick` | schaltet die Cursor-Phase um und setzt ein Flag, gibt selbst nichts aus |
| `console_drain` | einzige Stelle, die auf die UART schreibt: Echo, Überlaufmeldung, Cursor |

Grund für die Trennung: im Interrupt wird nicht auf die Sendeleitung gewartet, und es gibt genau einen Schreiber auf die Konsole. Sonst schöbe sich ein Cursor-Zeichen zwischen zwei Zeichen des Echos.

### Ringpuffer

32 Byte, Maske 31. `uart_rx_head` wird nur vom Interrupt geschrieben, `uart_rx_tail` nur von der Hauptschleife. Dadurch braucht es keine Sperre. Läuft der Puffer über, wird die FIFO trotzdem geleert, das Zeichen verworfen und `uart_rx_overflow` gesetzt, die Hauptschleife meldet danach `RX OVERFLOW`. Kein stilles Verwerfen.

### Cursor

`TIMER_HZ` ist 2, das Intervall ergibt sich aus `CNTFRQ_EL0 / TIMER_HZ`. Der Cursor wechselt also zweimal je Sekunde zwischen `_` und Leerzeichen, jeweils gefolgt von einem Rückschritt, damit die Schreibposition erhalten bleibt. Ein eingegebenes Zeichen überschreibt den Cursor an derselben Stelle, ein zusätzliches Löschen ist deshalb nicht nötig.

---

## Framebuffer über ramfb (Phase 3a)

### fw_cfg

| Was | Wert | Beleg |
|---|---|---|
| Basisadresse | `0x09020000`, Größe `0x18` | Device Tree, `fw-cfg@9020000`, `compatible = "qemu,fw-cfg-mmio"` |
| Datenregister | Basis + `0x00`, 64 Bit | QEMU `docs/specs/fw_cfg.rst` |
| Selektorregister | Basis + `0x08`, 16 Bit | ebenda |
| DMA-Adressregister | Basis + `0x10`, 64 Bit | ebenda |
| Endianness | **big-endian** für alle MMIO-Zugriffe und alle Strukturfelder | ebenda |

`FWCfgDmaAccess`: `control` (32 Bit), `length` (32 Bit), `address` (64 Bit), alle big-endian. Steuerbits: Bit 0 Error, Bit 1 Read, Bit 2 Skip, Bit 3 Select mit dem Schlüssel in den oberen 16 Bit, Bit 4 Write.

Der Ablauf wartet, bis `control` auf null steht, und bricht ab, sobald das Error-Bit gesetzt ist. Kein Endlosdrehen bei einem abgelehnten Zugriff.

### Verzeichnissuche statt fester Schlüssel

Der Schlüssel von `etc/ramfb` ist **nicht** fest, er hängt von der Reihenfolge der Einträge ab. Deshalb liest `fwcfg_find_ramfb` erst das Verzeichnis (`FW_CFG_FILE_DIR`, Schlüssel `0x0019`), dann die Einträge einzeln und vergleicht die Namen. Ein Eintrag ist 64 Byte groß: `size` (32 Bit), `select` (16 Bit), 2 Byte reserviert, `name` (56 Byte, nullterminiert). Beleg: QEMU `docs/specs/fw_cfg.rst`.

Nach dem `SELECT` liest jeder weitere `READ` ohne erneutes `SELECT` an der Leseposition weiter, deshalb wird die Kopfzahl einmal mit `SELECT` gelesen und die Einträge danach fortlaufend.

### RAMFBCfg

Beleg: QEMU `hw/display/ramfb.c`, Struktur `RAMFBCfg`, Dateiname `etc/ramfb`, Felder werden dort mit `be32_to_cpu` und `be64_to_cpu` gelesen.

| Feld | Offset | Größe |
|---|---|---|
| `addr` | 0 | 8 |
| `fourcc` | 8 | 4 |
| `flags` | 12 | 4 |
| `width` | 16 | 4 |
| `height` | 20 | 4 |
| `stride` | 24 | 4 |

Gesamtgröße **28 Byte**, aus den Feldern gerechnet (8 + fünf mal 4). Eine Zusammenfassung der Quelle nannte 24 Byte, das widerspricht der eigenen Feldliste und wurde verworfen.

### Pixelformat

`FB_FOURCC_XR24` = `0x34325258`. Beleg: Linux `include/uapi/drm/drm_fourcc.h`, `DRM_FORMAT_XRGB8888 = fourcc_code('X','R','2','4')` mit `fourcc_code(a,b,c,d) = a | b<<8 | c<<16 | d<<24`. Der Kommentar dort lautet `[31:0] x:R:G:B 8:8:8:8 little endian`, ein Pixel ist also ein 32-Bit-Wort der Form `0x00RRGGBB`.

Auflösung 640 mal 480, Stride 2560 Byte, Gesamtgröße 1.228.800 Byte, also `0x12c000`. `fb_memory` liegt seit Einführung der MMU auf einer 2-MB-Grenze, die konkrete Adresse verschiebt sich mit dem Codeumfang und ist über `aarch64-elf-nm` nachprüfbar.

### Speicher und Sichtbarkeit

Der Framebuffer liegt in `.bss` und wird dadurch von `boot_clear_bss` genullt, der Schirm startet schwarz. Weil die MMU noch aus ist, sind alle Datenzugriffe nicht zwischengespeichert, geschriebene Pixel sind für den Emulator sofort sichtbar. **Sobald die MMU in Phase 4 aktiviert wird, ändert sich das** und der Framebuffer braucht passende Speicherattribute oder einen Cache-Flush. Offener Punkt, hier vermerkt.

### QEMU-Aufruf

`ramfb` ist kein Gerät der `virt`-Maschine, es muss mit `-device ramfb` hinzugefügt werden. Steht es nicht in der Kommandozeile, findet die Verzeichnissuche `etc/ramfb` nicht und der Kernel meldet `FB UNAVAILABLE`, statt stumm zu bleiben.

---

## virtio-input und Mauszeiger (Phase 3b)

### Transport

| Was | Wert | Beleg |
|---|---|---|
| MMIO-Basis | `0x0a000000`, 32 Steckplätze à `0x200` | Device Tree, 32 Knoten `virtio_mmio@a000000` bis `@a003e00` |
| Interrupt | SPI 16 für Steckplatz 0, fortlaufend | Device Tree, `interrupts = <0x00 0x10 0x01>` am ersten Knoten |
| INTID-Formel | `48 + Steckplatznummer` | SPI-Basis 32 plus SPI 16. Im Lauf bestätigt: Gerät auf `0x0a003e00` ergibt `0x4f` = 79 |
| Magic | `0x74726976` | Linux `include/uapi/linux/virtio_mmio.h` |
| Registeroffsets | siehe Quelltext, Block `VIRTIO_REG_*` | ebenda |
| Statusbits | ACK 1, DRIVER 2, DRIVER_OK 4, FEATURES_OK 8, FAILED `0x80` | Linux `include/uapi/linux/virtio_config.h` |
| `VIRTIO_F_VERSION_1` | Bit 32, also Bit 0 bei Feature-Auswahl 1 | ebenda |
| Gerätekennung virtio-input | 18 | im Lauf bestätigt: `id=0x12` |

**Wichtiger Befund:** QEMU meldet virtio-mmio standardmäßig als **Version 1**, also das alte Interface mit PFN-basiertem Queue-Setup. Der Kernel spricht das moderne Interface, deshalb läuft QEMU mit `-global virtio-mmio.force-legacy=false`, dann meldet das Gerät Version 2. Das wurde im Lauf gemessen, nicht angenommen.

### Virtqueue

Struktur und Flags aus Linux `include/uapi/linux/virtio_ring.h`:

| Struktur | Aufbau |
|---|---|
| `vring_desc` | `addr` 8, `len` 4, `flags` 2, `next` 2, zusammen 16 Byte |
| `vring_avail` | `flags` 2, `idx` 2, danach `ring[]` à 2 Byte |
| `vring_used` | `flags` 2, `idx` 2, danach Einträge à 8 Byte (`id` 4, `len` 4) |
| `VRING_DESC_F_WRITE` | 2, das Gerät beschreibt den Puffer |

Queue-Größe 8. Alle acht Deskriptoren zeigen auf je einen 8-Byte-Puffer und sind beschreibbar markiert. Nach dem Verarbeiten wandert der Deskriptor sofort zurück in den `avail`-Ring, die Queue läuft also nie leer.

### Ereignisse

`struct virtio_input_event`: `type` 2 Byte, `code` 2 Byte, `value` 4 Byte, little-endian. Beleg: Linux `include/uapi/linux/virtio_input.h`. Queue 0 ist die Ereigniswarteschlange.

Codes aus Linux `include/uapi/linux/input-event-codes.h`: `EV_SYN` 0, `EV_KEY` 1, `EV_REL` 2, `REL_X` 0, `REL_Y` 1, `BTN_LEFT` `0x110`.

Im Lauf bestätigt: Startposition 320/240, nach `mouse_move 50 30` steht `x=0x172` und `y=0x10e`, also 370/270, nach `mouse_move -20 10` dann 350/280. Negative Deltas rechnen korrekt.

### Mauszeiger

Der Zeiger ist ein 8 mal 12 Pixel großes Muster aus `cursor_bitmap`, ein Byte je Zeile, höchstwertiges Bit links. Vor dem Zeichnen wird der überdeckte Hintergrund in `cursor_backing` gesichert und beim nächsten Bewegen zuerst zurückgeschrieben.

**Randbegrenzung:** Breite und Höhe werden auf `FB_WIDTH - x` und `FB_HEIGHT - y` begrenzt. Ohne das würde der Zeiger am rechten oder unteren Rand über das Ende des Framebuffers hinausschreiben. Die Mausposition selbst ist zusätzlich auf 0 bis 639 und 0 bis 479 geklemmt.

### Klick-Zeitfenster

`CLICK_WINDOW_MS` ist 400. Das Fenster wird beim Start aus `CNTFRQ_EL0` gerechnet und in Zählertakten abgelegt, gemessen wird mit `CNTPCT_EL0`. Liegt ein Tastendruck innerhalb des Fensters nach dem vorigen, steigt `click_count`, sonst beginnt er wieder bei 1. Bei `CLICK_MAX` = 3 fängt die Zählung erneut bei 1 an.

Im Lauf bestätigt: zwei schnelle Klicks ergeben `n=2`, ein Klick nach über einer Sekunde ergibt wieder `n=1`.

**Bewusste Festlegung:** Die Hauptschleife liest den Klickzustand, sie führt keine Ereigniswarteschlange. Bei einem schnellen Doppelklick sieht sie deshalb nur den Endstand `n=2`. Für die Doppelklickerkennung ist das gewollt.

### Registerkonvention, teuer gelernt

`fb_pixel_addr` benutzte zunächst `x2` und `x3` als Zwischenspeicher. Das sind bei `fb_fill_rect` Breite und Höhe, die Folge war ein bildschirmfüllendes rotes Rechteck. Hilfsroutinen im Grafikpfad benutzen deshalb ausschließlich `x9` und `x10` als Zwischenspeicher, entsprechend AAPCS64.

---

## Speicher, MMU, Blockgerät, FAT32 (Phase 4)

### Warum der Kernel jetzt als Binärimage startet

QEMU übergibt die Adresse des Device Tree in `x0`, aber **nur über den Boot-Stub des Linux-Bootpfads**. Bei `-kernel kernel.elf` springt QEMU direkt an den ELF-Einsprungpunkt, der Stub entfällt und `x0` ist null. Im Lauf gemessen: `FDT at=0`.

Mit `-kernel kernel.bin`, also dem rohen Binärimage, nimmt QEMU den Linux-Bootpfad, lädt an RAM-Basis plus `0x80000` und setzt `x0`. Im Lauf gemessen: DTB bei `0x44000000`. Das Makefile baut weiter beide Dateien, `kernel.elf` bleibt für GDB.

### Device-Tree-Format

Am echten `virt.dtb` verifiziert, nicht aus einer Fremdquelle übernommen:

| Feld | Offset | Wert im Test |
|---|---|---|
| `magic` | 0 | `0xd00dfeed` |
| `off_dt_struct` | 8 | `0x40` |
| `off_dt_strings` | 12 | `0x1bc8` |

Tokens: 1 Knotenanfang, 2 Knotenende, 3 Eigenschaft, 4 Leerschritt, 9 Ende. Alle Felder big-endian. Ein Eigenschaftskopf ist 12 Byte (`len`, `nameoff`), Daten danach auf 4 Byte ausgerichtet.

**Alignment-Falle:** Die Eigenschaftsdaten sind nur 4-Byte-ausgerichtet. Ein 64-Bit-Zugriff darauf löst ohne MMU einen Alignment Fault aus, weil ungemappter Speicher als Gerätespeicher behandelt wird. Der Panic-Handler meldete `esr=0x96000021`, also EC `0x25` mit DFSC `0x21`. Die Werte werden deshalb in zwei 32-Bit-Zugriffen gelesen und zusammengesetzt.

Im Lauf bestätigt: `RAM base=0x40000000 size=0x8000000`, mit `-m 512M` entsprechend `0x20000000`. Der Wert wird also wirklich gelesen.

### Physischer Seitenallokator

Bitmap, ein Bit je 4-KB-Seite, Bereich ab dem auf 4 KB aufgerundeten Ende des Images bis zum RAM-Ende, begrenzt auf `PMM_MAX_PAGES` = 131072, also 512 MB. Wird der RAM größer, wird der Rest ignoriert, die gemeldete Seitenzahl zeigt das.

Im Lauf bestätigt: drei Anforderungen liefern aufeinanderfolgende Seiten, nach Freigabe der mittleren liefert die nächste Anforderung exakt diese Seite zurück.

### Seitentabellen

4-KB-Granule, 39 Bit virtuelle Adresse (`T0SZ` = 25), Identitätsabbildung über `TTBR0_EL1`, `TTBR1_EL1` abgeschaltet (`EPD1`).

| Ebene | Inhalt |
|---|---|
| L1 Eintrag 0 | 1-GB-Block `0x0` bis `0x40000000`, Gerätespeicher, nicht ausführbar |
| L1 Eintrag 1 | Tabellenverweis auf die L2-Tabelle |
| L2 | 2-MB-Blöcke ab `0x40000000`, so viele wie RAM vorhanden, höchstens 512 |

Deskriptorbits belegt aus Linux `arch/arm64/include/asm/pgtable-hwdef.h`: Block `0b01`, Tabelle `0b11`, Access Flag Bit 10, Shareable Bits [9:8], Attributindex Bits [4:2].

`MAIR_EL1` = `0x44ff00`: Index 0 Gerätespeicher `nGnRnE`, Index 1 normal zwischengespeichert, Index 2 normal ohne Zwischenspeicher.

**Der Framebuffer** liegt auf einer 2-MB-Grenze (`.balign BLOCK_SIZE`, im Build auf `0x40400000`) und bekommt als einziger Block den Attributindex 2. Ohne diese Trennung müsste entweder der ganze Kernel ohne Zwischenspeicher laufen oder das Bild könnte im Cache hängenbleiben. Im Lauf bestätigt: das Testbild ist mit aktiver MMU unverändert sichtbar.

### virtio-blk

Beleg: Linux `include/uapi/linux/virtio_blk.h`. Gerätekennung 2. Anfragekopf `virtio_blk_outhdr`: `type` 4 Byte, `ioprio` 4 Byte, `sector` 8 Byte, zusammen 16 Byte. `VIRTIO_BLK_T_IN` = 0, Status `VIRTIO_BLK_S_OK` = 0, Sektorgröße 512.

Eine Anfrage belegt drei Deskriptoren: Kopf nur lesbar, Datenpuffer beschreibbar, Statusbyte beschreibbar, verkettet über `VRING_DESC_F_NEXT`. Gelesen wird durch Abfragen mit Zähler-Zeitgrenze (`BLK_TIMEOUT`), nicht per Interrupt, weil Blockzugriffe im Startpfad synchron sind. Läuft die Zeitgrenze ab, meldet der Aufruf einen Fehler statt endlos zu drehen.

Die Einrichtung teilt sich mit virtio-input die Routine `virtio_setup`, der Gerätetyp wird an `virtio_find` übergeben. Es gibt keine zweite Kopie der Feature-Aushandlung.

### FAT32

Bootsektor-Felder: `BPB_BYTES_PER_SEC` `0x0b`, `BPB_SEC_PER_CLUS` `0x0d`, `BPB_RESERVED` `0x0e`, `BPB_NUM_FATS` `0x10`, `BPB_SEC_PER_FAT32` `0x24`, `BPB_ROOT_CLUSTER` `0x2c`, Signatur `0xaa55` bei `0x1fe`.

Verzeichniseintrag, 32 Byte: Name 11 Byte im 8.3-Format, Attribut bei `0x0b`, Clusternummer hoch bei `0x14`, niedrig bei `0x1a`, Größe bei `0x1c`. Attribut `0x0f` kennzeichnet einen Eintrag für lange Namen und wird übersprungen, `0x08` das Datenträgerlabel.

FAT-Eintrag: 32 Bit, nur die unteren 28 gelten (`0x0fffffff`), Kettenende ab `0x0ffffff8`.

Geprüft gegen ein mit `newfs_msdos -F 32` erzeugtes Abbild. Der Kernel meldet `res=0x20`, `spf=0x3f0`, `data=0x800`, `root=2`, das entspricht exakt der Ausgabe des Formatierwerkzeugs (32 reservierte Sektoren, 1008 Sektoren je FAT, Wurzelcluster 2). Das Wurzelverzeichnis listet `HELLO.TXT` mit 31 Byte und `DATA.BIN` mit 13 Byte, beides die tatsächlichen Größen. Der Inhalt von `HELLO.TXT` wird über die Clusterkette korrekt ausgegeben.

Die FAT-Sektoren werden in einen eigenen Puffer gelesen, damit das Verfolgen der Kette den Datenpuffer nicht überschreibt.

### Registerkonvention, zweiter Fall

`mem_read16` benutzt `x2` als Zwischenspeicher. In `fat_find` hielt ich dort die obere Hälfte der Clusternummer über einen zweiten Aufruf hinweg, die Datei wurde daraufhin aus Cluster 0 gelesen und war leer, bei korrekter Länge. Werte, die einen Aufruf überleben müssen, gehören in `x19` bis `x28`.

---

## Ladeadresse des Kernels

`linker.ld` legt den Kernel auf `0x40080000`.

- RAM beginnt laut Device Tree bei `0x40000000`, belegt oben.
- Der Versatz von `0x80000` ist **Konvention, kein Datenblattwert**. Er stammt aus dem `TEXT_OFFSET` der arm64-Portierung von Linux und hält die ersten 512 KB des RAM frei für den Boot-Stub, den QEMU bei `-kernel` selbst ablegt, sowie für das von QEMU erzeugte Device Tree.
- **Offener Punkt:** Wo genau QEMU das DTB im RAM platziert, ist noch nicht belegt. Solange der Kernel das DTB nicht liest, ist das folgenlos. Bevor das DTB zur Laufzeit ausgewertet wird (spätestens bei der Portierung), muss die Platzierung aus `hw/arm/boot.c` des QEMU-Quellcodes belegt und gegen den Stackbereich geprüft werden.

---

## Bitmap-Schrift

### Herkunft und Lizenz

`font8x8_basic` von Daniel Hepper, **Public Domain**. Beruht auf dem 8x8-Font von Marcel Sondaar, ebenfalls Public Domain. Quelle: `github.com/dhepper/font8x8`, Datei `font8x8_basic.h`.

Damit ist die Übernahme lizenzrechtlich unproblematisch, anders als bei GPL-Quellen wie KolibriOS. Die Datei wurde **roh geladen und lokal ausgewertet**, nicht über eine Zusammenfassung, damit kein einzelnes Bit verfälscht wird.

### Umwandlung

Der Originalfont legt das **niederwertigste** Bit nach links. Der Mauszeiger im Kernel benutzt die umgekehrte Anordnung. Damit es im Kernel nur eine Konvention gibt, wurden alle Bytes beim Umwandeln gespiegelt, im Kernel gilt durchgehend: höchstwertiges Bit ist das linke Pixel.

Übernommen wurden die druckbaren Zeichen `0x20` bis `0x7e`, also 95 Glyphen à 8 Byte, zusammen 760 Byte. Der Index in `font_data` ist `Zeichen - 0x20`.

### Zeichenroutinen

| Routine | Aufgabe |
|---|---|
| `fb_glyph` | ein Zeichen an Pixelposition, Vordergrundfarbe, Hintergrund bleibt stehen |
| `fb_text` | nullterminierte Zeichenkette, Vorschub 8 Pixel je Zeichen |

Zeichen außerhalb von `0x20` bis `0x7e` werden übersprungen, ebenso Positionen, an denen das Zeichen über den rechten oder unteren Rand ragen würde. Ohne diese Prüfung würde über das Ende des Framebuffers hinaus geschrieben.

Im Lauf bestätigt: Groß- und Kleinbuchstaben, Ziffern und Satzzeichen erscheinen korrekt im Testbild.

---

## Durchsicht nach dem Schriftrenderer

Statische Prüfung sauber: keine doppelten Marken, keine offenen Sprungziele, keine ungesicherten Register, Stackrahmen überall ausgeglichen. Fünf Befunde aus der Durchsicht des Verhaltens.

| # | Befund | Wirkung | Behebung |
|---|---|---|---|
| 1 | Die Hauptschleife gab bei **jedem Durchlauf** `BOOT OK` aus | Eine frühere Ersetzung hatte nicht nur den Sprung am Ende der Startfolge getroffen, sondern auch den Rücksprung in der Schleife. Im Protokoll standen Dutzende Meldungen, die ich für Cursor-Blinken hielt | Rücksprung bereinigt, im Lauf bestätigt: genau ein Vorkommen |
| 2 | `console_pending` fehlte nach der Wiederherstellung | Damit war die Interrupt-Sperre wieder über die **gesamte** Konsolenausgabe gezogen statt nur über die kurze Zustandsprüfung | Routine wieder eingesetzt |
| 3 | `EDGE_MAX` war mit 512 zu klein | Der komplexeste Glyph dieser Schrift erzeugt **800 Kanten**, sechs von 244 Glyphen liegen über der Grenze. Überzählige Kanten verschwanden **still**, der Buchstabe wurde falsch gefüllt | Grenze auf 2048, zusätzlich Meldung |
| 4 | Alle Grenzen im Renderer brachen **still** ab: Kanten, Schnittpunkte je Zeile, Breite des Deckungspuffers, Punkt- und Konturzahl, zusammengesetzte Glyphen | Gegen das Gesetz "keine stillen Fehlschläge". Ein unvollständig gezeichneter Buchstabe sah aus wie ein Schriftfehler | Gemeinsame Meldung `TTF GRENZE ERREICHT`, einmalig je Lauf. Gegenprobe mit absichtlich zu kleiner Grenze: Meldung erscheint, im Normalbetrieb schweigt sie |
| 5 | Kurven wurden immer in **acht** Stücke zerlegt, unabhängig von der Größe | Bei kleiner Schrift verschwendet, bei großer zu grob | Zerlegung nach Länge des Kontrollpolygons, zwischen 2 und 16 Stücken. Im Lauf bestätigt: Titel mit 181 Helligkeitsstufen statt vorher weniger |

### Grenzen, an der Schrift nachgerechnet

| Grenze | Wert | Höchster Bedarf bei BabelSans |
|---|---:|---|
| Punkte je Glyph | 256 | 121 |
| Konturen je Glyph | 16 | 7 |
| Kanten je Glyph | 2048 | 800 |
| Breite des Deckungspuffers | 512 | 400 bei 400 Punkt Schriftgröße |
| Zusammengesetzte Glyphen | nicht unterstützt | kommen in dieser Schrift nicht vor |

Zusammengesetzte Glyphen, also solche aus Bestandteilen anderer Glyphen, werden erkannt und gemeldet, aber nicht gezeichnet. Bei Schriften, die Umlaute so aufbauen, fehlen diese Zeichen. BabelSans tut das nicht, alle 244 Glyphen sind eigenständig.

### Verhalten in Randfällen

Ohne Bildschirm, Eingabegerät und Datenträger meldet der Kernel `FB UNAVAILABLE`, `INPUT UNAVAILABLE`, `BLK UNAVAILABLE`, `FAT INVALID`, `TTF UNAVAILABLE` und erreicht trotzdem `BOOT OK`. Fenstertitel bleiben dann leer, weil ohne geladene Schrift kein Maßstab existiert.

---

## Raspberry Pi 5, belegte Werte für die spätere Portierung

Stand der Vorarbeit. **Noch kein Code**, nur Belege. Quellen: Device Tree des Linux-Kernels für den BCM2712 und die Platine Pi 5 B, sowie die Raspberry-Pi-Dokumentation zu `config.txt`.

### Der entscheidende Unterschied zu QEMU: zwei Adressräume

Der BCM2712 unterscheidet **Busadressen** und **CPU-Adressen**. Der Device Tree nennt Busadressen, die über die `ranges`-Eigenschaft des `soc`-Knotens umgerechnet werden:

```
ranges = <0x00000000  0x10 0x00000000  0x80000000>
```

Das bedeutet: Busadresse `0x0` entspricht der CPU-Adresse `0x10_00000000`, der Bereich ist 2 GB groß. **Jede Peripherieadresse aus dem Device Tree muss also um `0x10_00000000` erhöht werden.**

Wer das übersieht, schreibt ins Leere und sucht tagelang.

### Umgerechnete Adressen

| Was | Busadresse | **CPU-Adresse** | Fundstelle |
|---|---|---|---|
| System-UART (PL011) | `0x7d001000` | **`0x10_7d001000`** | `bcm2712.dtsi`, Knoten `uart10`, Größe `0x200` |
| GIC-400 Distributor | `0x7fff9000` | **`0x10_7fff9000`** | ebenda, `compatible = "arm,gic-400"`, Größe `0x1000` |
| GIC-400 CPU-Interface | `0x7fffa000` | **`0x10_7fffa000`** | ebenda, Größe `0x2000` |

Die Peripherie liegt damit bei rund **66 GB**. Unser virtueller Adressraum mit 39 Bit reicht dafür aus, aber die Seitentabelle muss einen völlig anderen Eintrag der obersten Ebene abbilden als heute. Bisher belegen wir nur die Einträge 0 und 1.

### Interrupts

| Was | Nummer | Ergibt INTID |
|---|---|---|
| System-UART | GIC_SPI 121 | 32 + 121 = **153** |
| Generic Timer, phys. non-secure | GIC_PPI 14 | **30** |

Der Interrupt-Controller ist ein **GIC-400**, also GICv2, dieselbe Bauart wie in unserer QEMU-Maschine. Unser vorhandener Treiber sollte mit geänderten Basisadressen funktionieren.

Die Timer-Interruptnummern sind **identisch** mit QEMU, PPI 13, 14, 11, 10.

### Welche UART ist der Debug-Anschluss

Im Board-Device-Tree `bcm2712-rpi-5-b.dts` ist genau eine UART mit dem Kommentar "The system UART" aktiviert:

```
// The system UART
uart10: &_uart0 { status = "okay"; };
```

Diese UART sitzt **im BCM2712**, nicht im RP1. Eine zweite UART namens `uarta` ist für Bluetooth vorgesehen.

**Noch offen und vor dem ersten Code zu klären:** ob der dreipolige Debug-Stecker auf der Platine physisch an dieser `uart10` hängt. Der Device Tree belegt, dass die UART im Hauptprozessor existiert und aktiv ist, nicht, wo ihre Leitungen enden. Dafür braucht es den Schaltplan der Platine.

Ausdrücklich **nicht** derselbe Weg: `enable_uart=1` in der `config.txt` schaltet die serielle Konsole auf die GPIO-Pins 14 und 15, und die laufen über den RP1.

### Startdateien

| Was | Wert | Quelle |
|---|---|---|
| Kernel-Dateiname Pi 5 | `kernel_2712.img`, Rückfall `kernel8.img` | Raspberry-Pi-Dokumentation zu `config.txt` |
| 64-Bit-Modus | `arm_64bit=1` | ebenda |
| Abweichender Name | `kernel=` | ebenda |

### Noch nicht belegt

- Physische Verbindung des Debug-Steckers zur `uart10`
- Ladeadresse, an die die Firmware den Kernel legt, und Registerzustand beim Einsprung
- Taktfrequenz der System-UART, für den Baudratenteiler nötig
- Weg zum Bildspeicher: ob die Mailbox-Schnittstelle wie beim Pi 4 funktioniert
- Anbindung von SD-Karte und Netzwerk, jeweils ob am BCM2712 oder am RP1
- PCIe-Einrichtung für den Zugriff auf den RP1

---

## Externe Durchsicht, zweite Runde

Eine unabhängige Durchsicht brachte zwölf Befunde plus zwei bedingte. Alle wurden nachgeprüft und behoben. Die drei zuerst genannten wogen am schwersten, weil sie **jedes andere Testergebnis entwerteten**.

### Befunde an der Werkzeugkette

| # | Befund | Warum es zählt | Behebung |
|---|---|---|---|
| 1 | `run`, `check`, `shot` hingen von `kernel.elf` ab, starteten aber `kernel.bin` | Nach einer Quelländerung wurde das ELF neu gebaut, gestartet aber ein **veralteter** Kernel | Alle Startziele hängen jetzt am tatsächlich gestarteten Artefakt |
| 11 | `check` prüfte nur, ob `asmos` im Log steht | Dieses Banner erscheint als **erstes**, vor Speicher, Grafik und Dateisystem. Ein Absturz danach blieb unentdeckt | Der Kernel meldet am Ende der Startfolge `BOOT OK`. `check` verlangt diese Marke **und** verbietet `PANIC`. Gegenprobe: mit eingeschaltetem Panic-Selbsttest meldet `check` jetzt einen Fehler |
| 12 | `make disk` schrieb auf den festen Pfad `/Volumes/MONOLITH` | Existiert dort ein **fremdes** Volume gleichen Namens, werden dessen Dateien überschrieben | Der tatsächliche Einhängepfad wird aus der Ausgabe von `hdiutil` übernommen und geprüft |

### Befunde im Kernel

| # | Befund | Behebung |
|---|---|---|
| 2 | `blk_desc` lag acht Byte neben der geforderten 16-Byte-Grenze, im ELF nachgemessen | eigene Ausrichtung vor der Deskriptortabelle |
| 3 | Speicherbarrieren fehlten an den Übergabestellen: `avail.idx` wurde veröffentlicht, bevor die Deskriptoren sichtbar waren, und nach dem Lesen von `used.idx` fehlte die Lesebarriere. `fwcfg_dma` löste den Auftrag aus, bevor die Struktur abgesichert war | `dmb ishst` vor dem Veröffentlichen, `dmb ishld` nach dem Lesen, bei fw_cfg `dsb sy` **vor** dem Auslösen |
| 4 | Nach einer Zeitüberschreitung beim Blockgerät wurden dieselben Puffer wiederverwendet. Eine verspätete Fertigmeldung konnte als Abschluss des **nächsten** Auftrags gelten | Das Gerät wird gesperrt und gemeldet, weitere Zugriffe scheitern kontrolliert |
| 5 | Schlug die RAM-Erkennung fehl, wurde die MMU trotzdem aktiviert, mit leeren Tabellen. Damit fehlten Abbildungen für den laufenden Code, die Diagnose endete in Folgefehlern | `mmu_init` bricht bei unbekanntem RAM ab und meldet `MMU SKIPPED`. Im Lauf bestätigt: Start ohne Device Tree erreicht sauber `BOOT OK` |
| 6 | Der Allokator rechnete in 4-KB-Seiten, die Abbildung in 2-MB-Blöcken. Bei 129 MB RAM wären 256 vergebene Seiten nicht abgebildet gewesen | Der Allokator rundet seine Obergrenze auf dieselbe Blockgrenze ab |
| 7 | Ein Lesefehler in der Clusterkette lieferte das Kettenende-Kennzeichen und sah aus wie ein normales Dateiende. Eine Datei konnte stillschweigend abgeschnitten erscheinen | Lesefehler liefern Cluster `0`, das ist als Kettenglied ungültig. `fat_cat` meldet `FAT READ ERROR` und bei zu kurzer Kette `FAT CHAIN SHORT` |
| 8 | Eine vorhandene **leere** Datei hat Startcluster 0, das wurde als "nicht gefunden" gewertet | `fat_find` gibt Fund und Werte getrennt zurück. Im Lauf bestätigt: leere Datei erzeugt keine Ausgabe und keine Fehlmeldung, fehlende Datei meldet weiterhin `FILE NOT FOUND` |
| 9 | `BPB_ExtFlags` wurde nicht ausgewertet, es wurde immer die erste FAT gelesen. Bei abgeschalteter Spiegelung wäre eine veraltete Kette verfolgt worden | Ist die Spiegelung aus, zeigt der FAT-Anfang auf die aktive Kopie |
| 10 | Die FAT32-Erkennung ließ auch FAT16-Bootsektoren durch, und Cluster 1 adressierte vor den Datenbereich | Zusätzlich geprüft: `FATSz32` ungleich null, `FATSz16` gleich null, Wurzelcluster mindestens 2. Cluster unter 2 gelten als ungültig |
| A | `pmm_reserve` verwarf Bereiche vollständig, die unterhalb des verwalteten Anfangs begannen, aber hineinreichten | Der Anfang wird auf den verwalteten Bereich geklemmt |
| B | Die Interrupt-Sperre umfasste die **gesamte** Konsolenausgabe samt Wartezeit auf die Sendeleitung | Gesperrt wird nur noch die kurze Zustandsprüfung vor dem Schlafenlegen |

### Verstoß gegen die eigene Kapselungsregel

`cursor_show` las direkt `mouse_x`, `timer_init` schrieb direkt `click_window`. Nach Goldener Regel 2 darf kein Block fremden Zustand direkt anfassen. Behoben über `mouse_get_pos` und `click_init`.

Dabei ist mir prompt derselbe Fehler unterlaufen, vor dem die Regel warnt: `timer_init` hatte keinen Stack-Rahmen, das eingefügte `bl` zerstörte die Rücksprungadresse. Der neue `check` hat es sofort gemeldet, genau dafür wurde er gebaut.

---

## Fehlersuche nach Phase 4

Systematische Durchsicht, maschinell und von Hand. Ergebnis: Stack-Bilanz und Sicherung der Register `x19` bis `x28` sind in allen Routinen sauber. Vier Befunde, alle behoben.

| # | Befund | Wirkung | Behebung |
|---|---|---|---|
| 1 | In `virtio_input_poll` zählte der laufende Index als 32-Bit-Wert hoch, verglichen wurde er mit einem 16-Bit-Wert aus `ldrh` | Die virtio-Indizes laufen bei 65536 über. Danach wäre der Vergleich nie wieder gleich und die Schleife liefe Milliarden Runden, das System hinge. Bei einer Maus mit etwa 100 Ereignissen je Sekunde nach rund elf Minuten Dauerbewegung | `and w21, w21, #VRING_IDX_MASK` nach dem Erhöhen |
| 2 | Die Hauptschleife prüfte den Zustand und ging danach in `wfi`, ohne Interrupts zu sperren | Ein Ereignis, das genau zwischen Prüfung und `wfi` eintrifft, bleibt bis zum nächsten Interrupt liegen. Durch den 2-Hz-Cursor höchstens 500 ms, ohne Timer wäre es ein echter Stillstand | Interrupts um Prüfung und `wfi` gesperrt. `wfi` wacht auch bei maskiertem I-Bit auf, danach gibt `daifclr` den Handler frei |
| 3 | `fwcfg_dma_wait` drehte endlos, falls das Gerät weder Fertigmeldung noch Fehler setzt | Stillstand ohne jede Meldung | Zähler-Zeitgrenze `FWCFG_TIMEOUT`, danach Fehlerrückgabe |
| 4 | Das Device Tree liegt bei `0x44000000`, also mitten im Bereich des Seitenallokators | Sobald genug Seiten angefordert werden, überschreibt der Allokator das Device Tree | `pmm_reserve` markiert den Bereich beim Start als belegt. Im Lauf bestätigt: 256 belegte Seiten bei einem 1 MB großen Device Tree |

### Bekannte Grenze, bewusst nicht behoben

`fat_find` und `fat_list_root` lesen nur den **ersten Sektor** des Wurzelverzeichnisses, also höchstens 16 Einträge bei einem Sektor je Cluster. Liegt eine Datei dahinter, meldet die Suche "nicht gefunden", obwohl sie existiert. Das Verfolgen der Clusterkette ist in `fat_cat` bereits vorhanden und müsste für das Verzeichnis nachgezogen werden. Für die aktuelle Testbelegung mit fünf Einträgen reicht es.

### Verhalten ohne Geräte

Ohne `-device ramfb`, ohne Eingabegerät und ohne Datenträger gestartet, meldet der Kernel der Reihe nach `FB UNAVAILABLE`, `INPUT UNAVAILABLE`, `BLK UNAVAILABLE`, `FAT INVALID`, `BLK READ FAILED` und läuft weiter. Kein Absturz, kein Stillstand, kein stilles Übergehen.

---

## Offene Fragen und ungeprüfte Pfade

| Punkt | Stand |
|---|---|
| EL3-Pfad in `boot_from_el3` | Ungetestet. `-machine virt` startet ohne `secure=on` nicht in EL3. Der Pfad ist Vorsorge und bisher durch keinen Lauf belegt. |
| Einstiegs-Exception-Level bei QEMU 11 | Bewusst nicht als Annahme im Code. `_start` liest `CurrentEL` und behandelt EL3, EL2 und EL1 getrennt. |
| DTB-Platzierung durch QEMU | siehe oben, noch nicht belegt |
| Stackgröße 16 KB | Willkürlich gewählter Startwert, kein belegter Bedarf. Zu prüfen, sobald Aufrufketten tiefer werden. |
