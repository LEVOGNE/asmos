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
| `CPTR_EL2_TFP` | `1 << 10` | `CPTR_EL2.TFP`, bei gesetztem Bit werden FP/SIMD-Befehle aus EL0/EL1 nach EL2 getrappt. Wird beim Abstieg aus EL2 gelöscht |
| `CPACR_EL1_FPEN` | `3 << 20` | `CPACR_EL1.FPEN` Bits [21:20], `0b11` = kein Trap für FP/SIMD in EL0 und EL1. Reset-Wert ist `0b00`, ohne diese Freigabe löst die erste NEON-Instruktion eine Ausnahme aus. Gesetzt in `boot_el1_entry`, per Lesen-Ändern-Schreiben wie `SCTLR_EL1` |
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

`FB_FOURCC_XR24` = `0x34325258`. Beleg: Linux `include/uapi/drm/drm_fourcc.h`, `DRM_FORMAT_XRGB8888 = fourcc_code('X','R','2','4')` mit `fourcc_code(a,b,c,d) = a | b<<8 | c<<16 | d<<24`. Der Kommentar dort lautet `[31:0] x:R:G:B 8:8:8:8 little endian`, ein Pixel ist also ein 32-Bit-Wort der Form `0x00RRGGBB`. Seit dem 14.09.2026 hat der interne Renderpuffer dieselbe Anordnung mit dem Alphakanal im obersten Byte (`0xAARRGGBB`, Konstanten `CH_SHIFT_B` 0, `CH_SHIFT_G` 8, `CH_SHIFT_R` 16, `CH_SHIFT_A` 24), so dass `fb_present` eine reine Kopie ist. Die Ausgabe ignoriert das X-Byte, deshalb darf dort das Alpha stehen.

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

---

## Handoptimierung des Kernelabbilds

Ausgangslage 24.304 Byte, danach 17.864 Byte. Gemessen mit `stat -f%z kernel.bin`, nicht geschätzt. Bei jedem Schritt wurde gegengeprüft, dass Bild und serielle Ausgabe byteweise unverändert bleiben.

| Schritt | Ersparnis | Beleg |
|---|---:|---|
| Alte Bitmap-Schrift entfernt (`font_data`, `fb_glyph`, `fb_text`, `fb_testcard`, Zeichensatz-Texte) | 2.000 Byte | Seit der Umstellung auf die TrueType-Schrift rief `fb_testcard` niemand mehr auf. Gegenprobe: kein Vorkommen der Namen mehr in der Quelle |
| Mauszeiger-Deckmaske lauflängenkodiert | 1.216 Byte | 2.304 Byte roh zu 1.002 Byte Paare plus 96 Byte Zeilentabelle. Verlustfrei, in Python gegen die Rohdaten rückgerechnet. Der Zeilenzugriff bleibt direkt, weil die Tabelle je Zeile einen Anfangsversatz führt |
| Vektortabelle in eigenen Abschnitt `.text.vectors` | 2.032 Byte | Die `.balign 0x800` der Tabelle zwang den gesamten Hauptcode auf 2048 Byte Ausrichtung und riss hinter dem Startcode eine Lücke von 1.648 Byte auf. Sichtbar in `kernel.map` als `*fill*` |
| Fünf Routinen in die Vektorlücken gelegt | (im Wert oben enthalten) | Jeder Eintrag nutzt 16 von 128 Byte. Der Code fiel dadurch unter eine 2048-Grenze, die Tabelle rückte von `0x40084000` auf `0x40083800` |
| 91 Meldungstexte in die restlichen Vektorlücken | 1.024 Byte | `.rodata` von 2.600 auf 1.576 Byte |
| Unerreichbarer Code und tote Texte entfernt | 168 Byte | `fb_clear`, `cursor_bitmap` (Rest des alten 12x12-Zeigers), Texte der TTF-Selbsttests |

### Warum die Lücke vor der Vektortabelle nicht durch Umsortieren verschwindet

Die Tabelle muss auf 2048 Byte ausgerichtet liegen, weil `VBAR_EL1` die unteren elf Bit nicht speichert. Die Lücke davor hängt allein davon ab, wie weit der Code über die letzte 2048-Grenze hinausragt, nicht von der Reihenfolge. Sie verschwindet erst, wenn der Code unter die nächste Grenze fällt. Genau das wurde durch das Füllen der Tabelleneinträge erreicht.

Dasselbe gilt für den Arbeitsspeicher: `fb_output` braucht 2 MB Ausrichtung für die Blockabbildung der MMU, davor bleiben 1.015.680 Byte ungenutzt. Ein Umsortieren der Puffer ändert daran nichts, weil die Summe vor `fb_output` gleich bleibt. Der Bereich ist benannt, aber nicht angetastet.

### Absicherung gegen Verrutschen

Code in den Vektorlücken ist nur tragfähig, wenn kein Eintrag verschoben wird. Das Linkerskript prüft alle sechzehn Einträge und die Ausrichtung der Tabelle:

    ASSERT(vec_at_5 - vec_table == 640, "Vektoreintrag 5 verschoben")

Gegenprobe mit einem absichtlich zu großen Füllblock: der Linker bricht mit `Vektoreintrag 3 verschoben` ab. Zu große Füllung ist damit ein Baufehler, kein Laufzeitfehler.

### Gegenproben

| Prüfung | Ergebnis |
|---|---|
| Bildschirmabzug gegen den Stand vor der Optimierung | byteweise identisch |
| Serielle Ausgabe gegen den Stand vor der Optimierung | byteweise identisch, 1.052 Byte |
| Zeigertabelle `panic_names` im Binärabbild aufgelöst | alle 16 Zeiger treffen ihren Text |
| Echte Ausnahme ausgelöst (Lesen von `0xffff000000000000`) | `PANIC EL1h_SYNC esr=...96000004`, Eintrag 4 korrekt getroffen |
| Start ohne Geräte und ohne Datenträger | alle Meldungen wie zuvor, `BOOT OK` |
| Start mit 1 GB Arbeitsspeicher | `RAM size=0000000040000000`, `BOOT OK` |

### Was bewusst nicht gemacht wurde

Die Mischformel für Rot, Grün und Blau steht neunmal ausgeschrieben da, sechsmal in `fb_blend_pixel` und dreimal in der Zeichenschleife des Mauszeigers. Als Schleife über drei Kanäle ließen sich rund 270 Byte sparen. Das Zusammenfassen kostet aber Laufzeit in genau dem Pfad, der bei 3840 mal 1600 Bildpunkten am heißesten läuft. Bei einem Abbild von 17 KB steht das in keinem Verhältnis.

Die nächste 2048er-Stufe ist nicht erreichbar: Der Code müsste um weitere 1.480 Byte fallen, die Vektorlücken fassen nur noch 98 Byte.

`TTF_SELFTEST` ist ein toter Schalter, er wird nirgends ausgewertet. Die übrigen Schalter umschließen nur die Aufrufe, nicht die Testroutinen selbst, deshalb ändert ihr Abschalten die Abbildgröße kaum. Beides steht hier als Befund, geändert wurde es nicht.

---

## Fehlersuche nach der Handoptimierung

Zuerst als Rückversicherung gegen die Umbauten: Der Maschinencode jeder Routine wurde mit dem Stand davor verglichen. Bis auf die beabsichtigten Stellen (Mauszeiger-Schleife, entfernte Bitmap-Schrift) sind alle Routinen instruktionsgleich. Datenflussanalyse über alle 460 Marken: kein Wert überlebt einen `bl` in einem Register zwischen `x2` und `x18`. Stackbilanz bei jedem `ret` ausgeglichen.

### Befund 1: Die Schriftdatei wurde nach dem Laden nirgends geprüft

Die Schrift liegt auf dem Datenträger und ist damit austauschbar. Der Kernel übernahm aus ihr Tabellenzahl, Tabellen-Offsets und Glyph-Index ungeprüft.

| Stelle | Was fehlte | Gemessene Wirkung ohne Prüfung |
|---|---|---|
| `ttf_find_table` | Tabellenzahl aus dem Kopf ohne Obergrenze | Bei `numTables=0xFFFF` durchsucht die Schleife 65535 Einträge, also 1 MB hinter dem 64-KB-Puffer, sobald eine Tabelle fehlt |
| `ttf_find_table` | Tabellen-Offset nicht gegen die Dateigröße geprüft | Mit einem `glyf`-Offset von `0x00ffff00` meldete der Kernel unverändert `TTF units=1000 glyphs=244` und las 16 MB hinter dem Puffer. Zufallsdaten wurden als Glyphen verarbeitet |
| `ttf_glyph_offset` | Glyph-Index nicht gegen `numGlyphs` geprüft | Zugriff hinter die `loca`-Tabelle |
| `ttf_load_glyph` | Glyph-Ende nicht gegen die Dateigröße geprüft | Ein verbogener `loca`-Eintrag für den Buchstaben `a` ließ den Kernel 131 KB hinter den Puffer lesen, **ohne jede Meldung** |

Behoben: `fat_load` liefert die Dateigröße bereits zurück, sie wurde nur verworfen. Sie wird jetzt in `font_state` gehalten und gegen alle vier Stellen geprüft. Ungültige Tabellen führen zu `TTF UNAVAILABLE`, ein Glyph außerhalb der Datei meldet einmalig über `ttf_limit_report` und wird übersprungen.

Gegenprobe mit drei absichtlich beschädigten Schriften:

| Beschädigung | vorher | nachher |
|---|---|---|
| `numTables` auf 0xFFFF | lud scheinbar normal | `TTF UNAVAILABLE`, `BOOT OK` |
| `glyf`-Offset hinter das Dateiende | lud scheinbar normal, rechnete mit Müll | `TTF UNAVAILABLE`, `BOOT OK` |
| `loca`-Ende von `a` hinter das Dateiende | keine Meldung, las 131 KB darüber hinaus | `TTF GRENZE ERREICHT`, Zeichen übersprungen |

Die intakte Schrift wird unverändert dargestellt, Bildschirmabzug byteweise gleich.

### Befund 2: `win_add` verwarf Fenster ohne Meldung

Bei erreichtem `WIN_MAX` sprang die Routine still zum Rücksprung. Ein Fenster verschwand spurlos. Jetzt meldet sie `WIN LISTE VOLL, Fenster verworfen`. Weil `win_add` keinen Stackrahmen hat, bekam nur der Fehlerzweig einen eigenen, sonst hätte der Aufruf `x30` zerstört. Gegenprobe mit zwölf Fenstern: genau vier Meldungen bei `WIN_MAX` gleich acht.

### Eigener Fehler bei der Behebung, festgehalten als Regel

Die Dateigröße sollte zunächst auf Offset 76 in `font_state`. Dort liegt aber die obere Hälfte des 8-Byte-Zeigers `FONT_CMAP4` (Offset 72). Der Schreibzugriff zerstörte den Zeiger, die Schrift wurde nicht mehr gefunden. Aufgefallen ist es, weil der Bildschirmabzug vom Sollbild abwich und die Grenzmeldung bei einer intakten Schrift erschien.

**Regel: Vor dem Einfügen eines neuen Feldes in eine Struktur die Breite aller Nachbarfelder prüfen, nicht nur deren Offsets.** Ein Offset allein sagt nichts darüber, wie weit das Feld reicht. Hier war die Strukturgröße 80 korrekt belegt, die scheinbare Lücke bei 76 war die zweite Hälfte eines Zeigers. Das Feld liegt jetzt auf 80, die Struktur ist 88 Byte groß.

### Geprüft und in Ordnung

| Prüfung | Ergebnis |
|---|---|
| `fb_fill_rect` und `fb_clip_set` | Clipping begrenzt sauber auf den Bildschirm, leere Flächen brechen ab. Ein Fenster über dem Bildrand kann nicht über den Puffer hinaus schreiben |
| Überlauf der Liste veränderter Bereiche | Fällt auf Vollbild zurück statt Bereiche zu verlieren |
| `blk_read_check` | Sieht wie toter Code aus, die Marke ist nirgends referenziert. Der Code wird aber per Durchfall aus `blk_read` erreicht. **Nicht entfernen** |
| Ausnahmebehandlung nach dem Umbau der Vektortabelle | Echte Ausnahme ausgelöst, `PANIC EL1h_SYNC` aus Eintrag 4, alle 16 Namenszeiger korrekt |

### Offene Befunde, bewusst nicht behoben

**Der Textpfad kennt kein UTF-8.** `ttf_text` liest mit `ldrb` einzelne Bytes und reicht jedes direkt als Zeichenpunkt weiter. Ein deutscher Umlaut steht in UTF-8 als zwei Bytes und erschiene als zwei fremde Zeichen. Bisher fällt das nicht auf, weil alle Texte im Kernel Umlaute umschreiben, etwa `unvollstaendig`. Für ein deutschsprachiges System ist das eine fehlende Funktion, keine Regression, und sie zu ergänzen ist eine eigene Aufgabe.

**Zusammengesetzte Glyphen** werden erkannt und gemeldet, aber nicht gezeichnet. BabelSans hat keine, viele andere Schriften bauen Umlaute so auf.

**`tasks/todo.md` und `tasks/lessons.md` existieren nicht.** Die internen Arbeitsvorgaben sehen beide vor. Bisher wurde stattdessen diese Belegdatei geführt. Ob die Dateien angelegt werden sollen, ist eine Entscheidung des Projektinhabers.

---

## Zweite Durchsicht, Grenzwerte und Randfälle

Diese Runde suchte gezielt nach Überläufen, ungeschützten Divisionen und Wettläufen. **Keine akuten Fehler gefunden.** Die Prüfungen und ihre Zahlen:

| Geprüft | Ergebnis |
|---|---|
| Alle Grenzen des Schriftrenderers gegen die echte Schrift nachgerechnet | Punkte 121 von 256, Konturen 7 von 16, Schnittpunkte je Bildzeile 12 von 64. Reichlich Luft |
| Puffer für Dezimalausgabe | 24 Byte, eine 64-Bit-Zahl braucht höchstens 20 Stellen |
| Alle sieben Divisionen auf Division durch Null | Fünf haben konstante Divisoren. Die Bézier-Schrittzahl ist auf mindestens 2 geklemmt. Waagerechte Kanten werden in `edge_add` verworfen, deshalb ist die Höhendifferenz dort nie null. Auf AArch64 wirft eine Division durch Null keine Ausnahme, sie liefert stillschweigend 0, ein ungeschützter Fall wäre also besonders tückisch |
| Ringpuffer der Tastatureingabe | Sauber getrennt: die Unterbrechungsroutine verändert nur `head`, die Hauptschleife nur `tail`. Auf einem Kern ohne Barriere korrekt |
| Mauszeiger in den Bildschirmecken | Startposition testweise auf `(0,0)`, `(FB_WIDTH-1, FB_HEIGHT-1)` und 20 Punkte vor der Ecke gesetzt. Alle drei Läufe erreichen `BOOT OK` ohne Panik |
| Speicherallokator bei Erschöpfung | Gibt sauber null zurück |

### Latente Befunde, heute ohne Wirkung

**`cursor_show` prüft nicht, ob der Zeiger bereits sichtbar ist.** Zweimaliges Anzeigen ohne dazwischenliegendes Verstecken würde den Zeiger in den gesicherten Hintergrund einbrennen und eine Spur hinterlassen. Heute unmöglich, weil der einzige Aufrufer `cursor_update` immer zuerst versteckt und der Start ihn genau einmal anzeigt. Bei Schritt 9d, dem Ziehen von Fenstern, wird das relevant.

**`win_repaint` beachtet den Zeiger nicht.** Wird ein Bereich neu gezeichnet, während der Zeiger sichtbar ist, veraltet der gesicherte Hintergrund, und das nächste Verstecken schreibt alten Inhalt zurück. Heute ohne Wirkung, weil `win_repaint` nur aus dem abgeschalteten Selbsttest aufgerufen wird und dort vor dem ersten Anzeigen läuft.

**In `edge_add` liegen drei Instruktionen zwischen `cmp` und dem zugehörigen `b.lo`.** `ladr`, `mov` und `madd` verändern keine Bedingungsbits, der Code ist korrekt. Er ist aber fragil: eine dort eingefügte flagsetzende Instruktion würde die Richtungsentscheidung der Kante still verdrehen.

---

## Ausschaltknopf und geordnetes Herunterfahren

### Beleg für den Abschaltbefehl

Der Abschaltbefehl wurde nicht geraten, sondern aus dem Device Tree der laufenden Maschine gelesen (`make dtb`, dann `virt.dts`):

    psci {
        migrate = <0xc4000005>;
        cpu_on = <0xc4000003>;
        cpu_off = <0x84000002>;
        cpu_suspend = <0xc4000001>;
        method = "hvc";
        compatible = "arm,psci-1.0", "arm,psci-0.2", "arm,psci";
    };

| Wert | Bedeutung | Quelle |
|---|---|---|
| `hvc #0` | Aufrufweg für PSCI | `method = "hvc"` im Device Tree der `virt`-Maschine |
| `0x84000008` | Funktionsnummer `SYSTEM_OFF` | PSCI-Spezifikation ab 0.2. Der Device Tree meldet `arm,psci-1.0`, ab 0.2 sind die Nummern festgelegt und stehen deshalb nicht mehr einzeln im Knoten. Das Nummernschema ist durch die dort aufgeführten Werte bestätigt: `cpu_off` ist 0x84000002, also Funktion 2 im selben Block |

Empirisch bestätigt: QEMU beendet sich nach dem Aufruf mit Rückgabewert 0 in unter einer Sekunde, und die Meldung `SHUTDOWN FEHLGESCHLAGEN` bleibt aus. Kehrt der Aufruf wider Erwarten zurück, meldet der Kernel das und geht in eine `wfi`-Schleife, statt stillschweigend weiterzulaufen.

**Für den Raspberry Pi 5 ist dieser Wert neu zu prüfen.** Dort gibt es keinen QEMU-Device-Tree, und ob die Firmware PSCI in dieser Form bereitstellt, ist offen.

### Was beim Herunterfahren geschieht

In dieser Reihenfolge: Interrupts sperren, Zeitgeber abschalten (`cntp_ctl_el0` auf null), virtio-Geräte über ihr Statusregister zurücksetzen, dann die Puffer überschreiben, `dsb sy` als Barriere, zuletzt `SYSTEM_OFF`.

Überschrieben werden `fb_render` (46,9 MB), `fb_output` (23,4 MB), der Schriftpuffer, die beiden Sektorpuffer, der Tastaturringpuffer und der gesicherte Hintergrund unter dem Mauszeiger. Zusammen rund 70 MB, in QEMU nicht messbar verzögernd.

### Darstellung des Knopfes

Der Knopf ist ein Kreis mit weicher Kante, gezeichnet über den Abstandstest `dx² + dy²` je Bildpunkt. Zwischen `(r-1)²` und `(r+1)²` wird die Deckung linear aus der Quadratdifferenz abgeleitet, der Nenner ist `4r`. Das kommt ohne Wurzel und ohne Winkelfunktionen aus. Das Standby-Symbol entsteht aus drei Kreisen und zwei Rechtecken: weisser Kreis, kleinerer Kreis in Knopffarbe ergibt den Ring, ein Balken in Knopffarbe öffnet ihn oben, ein schmales Rechteck in Weiss bildet den Strich.

Die Trefferfläche ist derselbe Kreis. Geprüft mit vier Punkten: Mittelpunkt und zwei Bildpunkte innerhalb des Randes treffen, vier Bildpunkte ausserhalb und ein entfernter Punkt treffen nicht.

### Ein Fehler beim Bauen, dieselbe Familie wie immer

Die erste Fassung zeichnete statt eines gefüllten Kreises nur einen dünnen Bogen, und der Ring erschien als Rechteck. Ursache: Das Quadrat des senkrechten Abstands lag in `w2` und sollte die ganze Zeile überleben. `fb_pixel_addr` und `fb_blend_pixel` dürfen dieses Register aber zerstören. Nach dem ersten Bildpunkt jeder Zeile rechnete die Routine mit Müll, deshalb blieb genau der erste Punkt jeder Zeile stehen, also ein Bogen.

**Das ist bereits die dritte Wiederholung derselben Fehlerklasse in diesem Projekt.** Behoben, indem der Abstand je Bildpunkt neu berechnet wird und die Schleifengrenzen einmalig in `x19` bis `x28` geklemmt werden. Die Bildpunktkoordinaten liegen über den Aufruf hinweg auf dem Stack, nicht in flüchtigen Registern.

---

## Vektorgrafik als Kernbestandteil, Icons als Daten

### Der Renderer war bereits da

Für Icons musste keine neue Engine entstehen. Der TrueType-Renderer **ist** eine Vektor-Engine, sie lag nur unter dem Namen `ttf_`. Nachgewiesen allgemein verwendbar: `ttf_bezier` nimmt sechs Koordinaten und kennt keine Schrift, `ttf_fill` braucht keinen Schriftzustand. Nur `ttf_build_edges` liest Glyphdaten.

Deshalb wurde umbenannt statt neu gebaut: `vg_` für die Engine, `font_` für die TrueType-Auswertung, `icon_` für Icons. Die Umbenennung wurde gegen den Maschinencode geprüft, er ist bis auf vier Adressverschiebungen identisch. Diese vier stammen daher, dass `ttf_scale`, `ttf_origin_x` und `ttf_origin_y` aus dem Schriftblock in die Engine gehoben wurden, wo sie hingehören.

Kurvenzerlegung und Flächenfüllung existieren damit **einmal**. Schrift und Icons unterscheiden sich nur darin, wohin die Zerlegung ihre Segmente schickt: die Schrift an `vg_edge_add` (Füllung), Icons an `vg_seg` (Strich). Das Ziel steht in `vg_emit` und wird von `vg_edge_reset` auf den Standard zurückgesetzt.

### Warum die Icons nicht in den Kernel gehören

Gemessen, nicht geschätzt: alle **5.130** Outline-Icons von Tabler umgewandelt, **0 Fehler**, zusammen **394 KB**, im Schnitt 79 Byte je Icon. Der gesamte Kernel ist 20 KB. Die vollständige Bibliothek wäre also das Zwanzigfache des Systems.

Entscheidung analog zur Schrift: wenige Icons fest im Kernel, die vor dem Dateisystem gebraucht werden, der Rest als Datei auf dem Datenträger. Derzeit eingebettet: `power`, `home`, `folder`, `settings`, `trash`.

### Das Datenformat

Tabler-Icons sind **strichbasiert**, nicht gefüllt: `fill="none"`, `stroke-width="2"`, runde Enden und Ecken. Sie nutzen ausserdem elliptische Bögen, etwa `a7.75 7.75 0 1 0 10 0` im Power-Icon. Ein Befehlssatz aus nur MOVE, LINE und CLOSE reicht dafür nicht.

Der Konverter `tools/iconc.py` läuft auf dem Entwicklungsrechner und wandelt Bögen und kubische Kurven in quadratische um, die der Kernel bereits beherrscht. Entscheidend: **Kurven bleiben Kurven.** Zerlegt man sie schon im Konverter in Geraden, ist die Auflösung fest eingebrannt und die Darstellung wird bei Vergrösserung eckig. Der Unterschied ist messbar, `settings` braucht 190 statt 406 Byte und bleibt dabei beliebig skalierbar.

| Feld | Grösse | Bedeutung |
|---|---|---|
| Kopf | 2 Byte | Anzahl Konturen, Strichbreite in Achtelneinheiten |
| Kontur | 1 Byte | Anzahl Befehle, höchstes Bit markiert geschlossen |
| MOVE, LINE | 3 Byte | Befehl, x, y |
| QUAD | 5 Byte | Befehl, Kontrollpunkt, Endpunkt |

Koordinaten liegen in Achtelneinheiten mit einem Versatz von vier Einheiten in je einem Byte. Der Versatz ist nötig, weil vier Koordinaten im Gesamtbestand negativ sind, die kleinste bei -3,17.

### Einheitliche Systemgrösse

Icons werden systemweit in **32 Punkt** gezeichnet, passend zur 52 Punkt hohen Titelleiste und zur 34 Punkt grossen Titelschrift. Die Skalierung steht als Konstante fest und wird zur Assemblierzeit berechnet, `icon_draw` hat deshalb keinen Grössenparameter.

Das löst zugleich einen geometrischen Grenzfall: Bei sehr grosser Darstellung, wo ein Kurvenradius etwa der Strichbreite entspricht, überschlägt sich die Innenkante des Strichs. Der Türbogen im Haus-Icon hat einen Radius von zwei Einheiten bei zwei Einheiten Strichbreite, bei 300 Punkt sichtbar als Zerfaserung. In der Systemgrösse tritt der Fall nicht auf.

### Drei Fehler beim Bau, einer davon selbst verursacht

| Befund | Wirkung | Ursache |
|---|---|---|
| Deckungspuffer auf 512 Bildpunkte begrenzt | Striche fehlten vollständig, wurden keilförmig, Kurven brachen mitten ab | Erbstück aus der Schrift, wo 512 reichte. Für systemweite Vektorgrafik muss der Puffer die Bildschirmbreite abdecken. Jetzt `FB_WIDTH` |
| Kurvenschleife rief weiterhin die Füllroutine | Genau die Kurvensegmente fehlten, sichtbar als lose Knoten ohne Verbindung | Die erste Umleitung traf die falsche Textstelle |
| Zwischensicherung in `vg_quad` überschrieb das gesicherte `x28` | Latent: der Aufrufer bekam ein zerstörtes Register zurück | Ablage bei Rahmenversatz 88, dort liegt bereits `x28`. Jetzt 96 |

Der schwerste Schaden war eigenes Werk: Bei einer automatischen Textersetzung landete ein Testblock **innerhalb** von `icon_draw`, die Routine rief sich dadurch selbst auf und der Kernel hing bei jedem Icon. Aus der Sicherung wiederhergestellt.

**Regel daraus: Vor einer skriptgesteuerten Einfügung prüfen, in welcher Routine der Einfügepunkt tatsächlich liegt.** Eine Textmarke wie `win_draw_all_done:` sagt nichts darüber, wo die nächste passende Endmarke liegt.

### Lizenz der Icon-Daten

Die eingebetteten Icons sind abgeleitete Werke aus **Tabler Icons**, MIT-Lizenz, Copyright (c) 2020-2026 Paweł Kuna. Die MIT-Lizenz verlangt, dass Copyright- und Lizenzhinweis in allen Kopien und wesentlichen Teilen enthalten bleiben. Der Hinweis steht deshalb in `README.md` und hier. Verändern und kommerzielle Nutzung sind erlaubt.

---

## Durchsicht einer externen Analyse, geprüfte und behobene Befunde

Eine externe Durchsicht meldete mehrere Logikfehler. Ich habe jeden am Code nachgeprüft, bevor ich ihn behoben habe. Die folgenden sind bestätigt und erledigt.

### Der Zeiger bewegte sich nicht: EV_ABS wurde nie verarbeitet

Das Makefile startet ein `virtio-tablet-device`. Dieses meldet **absolute** Positionen als `EV_ABS`. `mouse_apply` behandelte nur `EV_REL`, `EV_KEY` und `EV_SYN`. Die Positionsereignisse fielen deshalb ersatzlos weg, während Klicks weiterhin ankamen, weil sie `EV_KEY` sind.

Die Achsenmaxima wurden bereits beim Start korrekt ermittelt, gemessen `maxx=0x7fff maxy=0x7fff`, aber nirgends benutzt.

Behoben durch Abbildung auf Bildschirmkoordinaten: `bildschirm = wert × Bildbreite / Achsenmaximum`, anschliessend begrenzt. Mit einem Einheitentest belegt, der `mouse_apply` direkt mit bekannten Werten aufruft:

| Eingabe | Ergebnis | Erwartung |
|---|---|---|
| `ABS_X` 16384 | 1920 | Bildmitte |
| `ABS_Y` 8192 | 400 | ein Viertel der Höhe |
| `ABS_X` 32767 | 3839 | rechter Rand |

**Zur Testbarkeit:** Der QEMU-Monitorbefehl `mouse_move` speist bei einem absoluten Gerät keine Ereignisse ein, weder mit noch ohne Fenster. Gemessen: nach `mouse_move` kommen null Ereignisse vom Typ 3 an, nach `mouse_button` dagegen `EV_KEY` und `EV_SYN`. Mit einem relativen `virtio-mouse-device` bewegt sich der Zeiger über denselben Monitorbefehl sofort. Der gesamte Pfad aus Unterbrechung, Warteschlange und Zeigerdarstellung war also immer in Ordnung. Der Endnachweis für die absolute Eingabe braucht eine echte Mausbewegung im Fenster.

### Weitere bestätigte und behobene Befunde

| Befund | Prüfung | Behebung |
|---|---|---|
| `vg_dot` benutzt `w27`, sicherte aber nur `x19` bis `x26` | Im Quelltext nachgezählt: drei Zugriffe auf `w27` bei einem Rahmen ohne dessen Sicherung | Rahmen auf 96 Byte, `x27` gesichert. Verstoss gegen AAPCS64, latent gefährlich, weil `icon_draw` denselben Registerbereich nutzt |
| `fb_present` prüfte nur auf Breite oder Höhe gleich null | Kein Abschneiden gegen den Bildrand vorhanden | Rechteck wird jetzt beidseitig auf den Bildschirm begrenzt, leere Flächen brechen ab |
| `vg_edge_add` ordnete Koordinaten mit dem vorzeichenlosen `b.lo` | Kanten über `y = 0` können dadurch verkehrt gespeichert werden | `b.lt`, also vorzeichenbehaftet |
| `font_fill_row` verglich Zeilengrenzen vorzeichenlos, und die Endzeile wurde nur nach oben begrenzt | Eine Form oberhalb des Bildschirms, etwa `y = -20 … -10`, ergibt Startzeile 0 und Endzeile -9. Vorzeichenlos gelesen sind das 4.294.967.287 | Beide Grenzen beidseitig geklemmt, Vergleich mit `b.ge` |
| Die Flächenfüllung beachtete den aktiven Zeichenbereich nicht | Nutzte `FB_HEIGHT` statt `fb_clip`, dadurch konnte eine Teilaktualisierung Bildpunkte ausserhalb ihres Rechtecks verändern | Grenzen kommen jetzt aus `fb_clip` |
| Der Koordinatenversatz stimmte zwischen Konverter und Kernel nicht überein | `iconc.py` schrieb `Koordinate × 8`, der Kernel zog beim Lesen zusätzlich 32 ab. Alle Icons lagen dadurch um vier Designeinheiten versetzt, negative Koordinaten wurden beim Wandeln abgeschnitten | Der Konverter rechnet jetzt `(Koordinate + 4) × 8`. Gegenprobe über 800 Icons: keine einzige Koordinate fällt mehr aus dem Bytebereich. Sichtbar am Ausschaltknopf, dessen Symbol jetzt mittig sitzt |

### Bestätigt, aber bewusst noch offen

`win_repaint` übergibt an `fb_present` weiterhin das ungeklemmte Rechteck, und der Mauszeiger wird vor einer Neuzeichnung nicht entfernt. Beides wirkt erst mit interaktivem Fensterverschieben, das noch fehlt. Die Begrenzung in `fb_present` fängt den gefährlichen Teil inzwischen ab.

Die Prüfung der Schriftdatei ist weiterhin unvollständig: Tabellenlängen, Untertabellen der Zeichenzuordnung und die einzelnen Lesezugriffe innerhalb einer Glyphe sind nicht gegen einen geprüften Bereich abgesichert. Der grobe Rahmen (Tabellenanfang, Glyphenende, Glyphenindex) ist es.

### Berichtigung einer früheren Aussage

In einem früheren Abschnitt steht, ein Fenster über dem Bildrand könne grundsätzlich nicht über den Puffer hinaus schreiben. Diese Aussage galt nur für `fb_fill_rect`. Für `fb_present` traf sie nicht zu, bis der Befund oben behoben wurde.

---

## Animationskern, Schritt 1: die Rechenbasis in 32.32

Umgesetzt nach dem internen Zusatzplan für Animation und Compositor. Sechs Routinen mit dem Präfix `anim_`, fest im Kernel.

| Routine | Aufgabe |
|---|---|
| `anim_one` | Liefert 1,0 im Format 32.32, also 4.294.967.296 |
| `anim_qmul` | Multipliziert zwei 32.32-Werte über ein 128-Bit-Zwischenergebnis |
| `anim_lerp` | Interpoliert zwischen Start- und Zielwert |
| `anim_progress` | Berechnet den Fortschritt aus Zeitstempeln |
| `anim_ease` | Bildet den Fortschritt über einen Verlauf ab |
| `anim_to_raster` | Rechnet 32.32 in das 16.16-Format des Renderers um |

### Warum 128 Bit nötig sind

Bei 32.32 ergibt `1,0 × 1,0` vor dem Zurückskalieren 2⁶⁴, also mehr als ein 64-Bit-Register fasst. Die Multiplikation nutzt deshalb `mul` für die untere und `smulh` für die obere Hälfte des Produkts und schiebt das 128-Bit-Ergebnis um 32 zurück. Gerundet wird durch Addition von 2³¹ auf das Doppelwort, mit Übertrag in die obere Hälfte. Das bleibt ein reiner 64-Bit-Kernel.

### Ein Überlauf, der abgefangen ist

Die naheliegende Formel für den Fortschritt lautet `(verstrichen << 32) / dauer`. Bei einem Zeitgeber von 62,5 MHz überläuft die Verschiebung ab **2.147.483.648 Takten, also 34,4 Sekunden Animationsdauer**. Für Oberflächenbewegungen von 220 ms weit entfernt, aber ein stiller Fehlschlag wäre gegen die Projektgesetze.

`anim_progress` prüft deshalb zuerst auf abgelaufene und auf null Dauer und halbiert danach Zähler und Nenner gemeinsam, bis die Verschiebung sicher passt. Dadurch bleibt das Ergebnis auch bei sehr langen Dauern richtig, nur mit weniger Nachkommastellen.

### Referenzvergleich

Jede Routine wurde im laufenden Kernel mit bekannten Werten aufgerufen und gegen eine unabhängige Rechnung geprüft. Alle fünfzehn Fälle stimmen exakt:

| Fall | Kernel | Referenz |
|---|---:|---:|
| `1,0 × 1,0` | 1,000000 | 1,000000 |
| `0,5 × 0,5` | 0,250000 | 0,250000 |
| `-1,0 × 0,5` | -0,500000 | -0,500000 |
| Interpolation 0 nach 100 bei 0,5 | 50,000000 | 50,000000 |
| Interpolation -200 nach 0 bei 0,25 | -150,000000 | -150,000000 |
| Fortschritt 110 von 220 | 0,500000 | 0,500000 |
| Fortschritt 300 von 220 | 1,000000 | 1,000000 |
| Fortschritt bei Dauer null | 1,000000 | 1,000000 |
| quadratisches Ausklingen bei 0,5 | 0,750000 | 0,750000 |
| kubisches Ausklingen bei 0,5 | 0,875000 | 0,875000 |
| sanfter Verlauf bei 0,5 | 0,500000 | 0,500000 |
| sanfter Verlauf bei 1,0 | 1,000000 | 1,000000 |
| Umrechnung 1,0 ins Rasterformat | 65536 | 65536 |
| Umrechnung -1,5 ins Rasterformat | -98304 | -98304 |

Damit sind die im Plan geforderten Punkte belegt: Symmetrie bei negativen Werten, exakte Endpunkte, Dauer null übernimmt sofort den Zielzustand.

Beim Schreiben war die Formel für den sanften Verlauf zunächst falsch, `1 - 2t` statt `3 - 2t`. Aufgefallen beim erneuten Durchlesen vor dem Test, nicht erst durch den Referenzvergleich.

### Noch nicht umgesetzt

Schritt 2 und folgende aus dem Plan: Animationsliste mit Platzkennung und Generation, getrennte Zeitverwaltung für Cursorblinken und Animationsbilder, danach Verschiebung und Ausschnitt. Der Zeitgeber läuft weiterhin mit 2 Hz.

---

## Animationskern, Schritt 2 und 3

### Schritt 3 zuerst: der Zeitgeber gehört jetzt einem Block

Der Zeitgeber lief mit 2 Hz und schaltete bei jedem Interrupt den Konsolencursor um. Er läuft jetzt mit **60 Hz** und trägt zwei getrennte Fälligkeiten:

- Ein Teiler `BLINK_DIVIDER = TIMER_HZ / BLINK_HZ` schaltet den Cursor weiterhin mit 2 Hz.
- Läuft mindestens eine Animation, setzt der Interrupt zusätzlich das Merkmal `anim_pending`.

Der Interrupt rechnet nichts. Ausgewertet wird in der Hauptschleife, und nur wenn das Merkmal gesetzt ist. Ohne laufende Animation entsteht keine zusätzliche Arbeit.

**Gegenprobe zur Blinkrate:** In fünf Sekunden nach dem Start erscheinen fünf sichtbare Cursorphasen. Bei 2 Hz sind das genau zehn Umschaltungen, davon fünf sichtbar. Bei ungeteilten 60 Hz wären es rund 300. Das Blinkverhalten ist also unverändert.

### Schritt 2: Animationsliste mit Platzkennung und Generation

64 Einträge zu je 80 Byte, zusammen 5 KiB, auf 16 Byte ausgerichtet. Feste Struktur nach dem Plan: Zielobjekt, Startzeit, Dauer, Start- und Zielwert, zuletzt berechneter Wert, Gruppe, Eigenschaft, Verlauf, Zustand, Optionen, Abschlusskennung, Generation.

Ein Handle ist `(Generation << 16) | Platznummer`. `anim_slot_addr` prüft beide Teile. Ein Auftrag, dessen Platz inzwischen neu vergeben wurde, findet damit sein Ziel nicht mehr, statt ein fremdes Objekt zu verändern. Generation 0 wird nie vergeben, deshalb ist Handle 0 immer ungültig.

Öffentliche Einsprungpunkte: `anim_init`, `anim_start`, `anim_cancel`, `anim_cancel_target`, `anim_tick`, `anim_value`, `anim_state`, `anim_count_active`, dazu `anim_now` und `anim_ms_to_ticks`.

Startet eine zweite Animation derselben Eigenschaft am selben Ziel, wird der laufende Verlauf zum aktuellen Zeitpunkt ausgewertet und der neue Start beginnt bei diesem Wert. Ein Richtungswechsel springt also nicht.

### Nachweis am laufenden System

Eine Bewegung von -200 auf 0 über 200 ms, linear:

| Zeitpunkt | Wert | Erwartung |
|---|---:|---:|
| 0 ms | -200,000 | -200 |
| 100 ms | -99,740 | -100 |
| 200 ms | **0,000** | 0 |

Die Abweichung bei 100 ms entspricht der Zeit, die zwischen Warteschleife und Auswertung tatsächlich vergeht, also 0,26 Bildpunkten. Der Endwert wird **exakt** gesetzt, nicht interpoliert. Dreifaches Auswerten nach Ablauf ändert nichts, damit ist die geforderte Unabhängigkeit von der Bildanzahl belegt.

| Weitere Prüfung | Ergebnis |
|---|---|
| Tabelle füllen | 64 Plätze belegt, der 65. Start meldet `ANIM LISTE VOLL` und gibt 0 zurück |
| Veraltetes Handle nach Abbruch | `anim_value` liefert 0, kein Zugriff auf den neu vergebenen Platz |
| `anim_cancel_target` | beendet alle 64 Einträge eines Ziels, danach null aktive |
| Zustand nach Ablauf | `ANIM_FINISHED`, der Zähler aktiver Animationen geht auf null |

### Ein Fehler beim Bauen

`anim_ms_to_ticks` las anfangs `timer_freq`, das erst in `timer_init` gesetzt wird. Der Selbsttest lief davor, bekam Dauer null und war sofort fertig, was im ersten Durchlauf wie eine korrekte Animation aussah. Die Routine liest jetzt `cntfrq_el0` selbst und meldet `ANIM OHNE ZEITQUELLE`, wenn keine Zeitquelle vorhanden ist. Damit gibt es keine Reihenfolgeabhängigkeit beim Start mehr.

### Noch nicht umgesetzt

Gruppen mit gemeinsamer Zeitbasis, Abschlussmeldungen zum Abholen, und `anim_next_deadline` für einen bedarfsgerechten Zeitgeber. Vor allem aber: Die Werte werden bisher nur berechnet, noch kein Fenster liest sie. Das ist Schritt 4.

---

## Animationskern Schritt 4 und Abschluss des Fenstersystems

### Ein Fehler, der Schritt 4 sofort lahmgelegt hätte

Die Durchsicht vor dem Ausbau förderte zutage: **Abgelaufene Animationen gaben ihren Platz nie frei.** Gemessen mit 64 kurzen Animationen, die alle durchliefen:

    1. gestartet          = 64
    2. aktiv nach Ablauf  = 0
    3. Start nach Ablauf  = ANIM LISTE VOLL

Nach 64 Animationen war die Engine tot. Bei 60 Bildern je Sekunde wäre das eine Sache von Sekunden gewesen. Die Belegung nimmt jetzt freie Plätze zuerst und greift danach auf abgelaufene zurück. Die Generation wird dabei erhöht, alte Handles werden also ungültig, die Wiederverwendung ist damit nicht still.

### Schritt 4: die Werte erreichen ein Fenster

Die Fensterstruktur trennt jetzt Layout und Darstellung: `WIN_X` und `WIN_Y` bleiben die logische Position, `WIN_TX` und `WIN_TY` tragen eine Verschiebung in 32.32. Beim Zeichnen wird die effektive Position einmal berechnet, der ganzzahlige Anteil der Verschiebung addiert.

`anim_apply` schreibt die Werte, prüft dabei Zielindex und Eigenschaft und markiert **alten und neuen** Bereich als verändert. Ohne die alte Markierung blieben Bildreste stehen. `win_dirty_rect` musste dafür ebenfalls die Verschiebung berücksichtigen, sonst markiert es den falschen Bereich.

**Nachweis:** Ein Fenster gleitet in 700 ms mit kubischem Ausklingen von 1500 Bildpunkten links außerhalb an seine Zielposition. Bei 0,55 s ist der Titel als `ster A` angeschnitten, das Fenster ragt also noch heraus. Am Ende steht es sauber.

**Abnahme erfüllt:** Der Endzustand nach der Bewegung ist **byteweise identisch** zum statischen Bild ohne Animation. Keine Reste.

### Zwei Reihenfolgefehler beim Einbau

`anim_init` lief nach dem ersten Animationsstart und löschte die eben angelegte Animation wieder. Das Handle war 0, obwohl der Zähler eine aktive Animation meldete. `anim_init` steht jetzt am Anfang der Startfolge.

Der neue Abschnitt in der Ablaufkette der Hauptschleife wurde übersprungen, weil die vorherigen Zweige direkt zum Blinkteil sprangen. Aufgefallen, weil trotz laufender Animation keine einzige Auswertung stattfand.

### Fenstersystem abgeschlossen

| Funktion | Umsetzung |
|---|---|
| Treffererkennung | `win_hit` sucht von oben nach unten, mit effektiver Position einschliesslich Verschiebung |
| Fokuswechsel | `win_raise` hebt das Fenster ans Listenende, dort wird es zuletzt gezeichnet und als aktiv dargestellt |
| Ziehen | `win_drag_begin` merkt den Griffpunkt, aber nur auf der Titelleiste. `win_drag_move` folgt der Maus, solange die Taste gedrückt ist, und beendet sich beim Loslassen selbst |

**Nachweis Fokuswechsel:** Ein Klick in die Bildmitte trifft das mittlere Fenster, das nicht oben liegt. Nach dem Klick liegt es vorn und trägt die aktive Titelleiste, das vorher oberste Fenster ist dahinter und grau.

Das Ziehen ist eingebaut, aber nicht maschinell nachweisbar: Der QEMU-Monitor kann bei einem absoluten Gerät keine Mausbewegung einspeisen. Es braucht eine echte Mausbewegung im Fenster.

### Ein bekannter Befund wurde dadurch akut und ist behoben

`win_repaint` zeichnete unter dem sichtbaren Mauszeiger hindurch. Dessen gesicherter Hintergrund veraltete dadurch, und das nächste Verstecken schrieb alten Inhalt zurück. Solange nichts bewegt wurde, fiel das nicht auf. Beim Ziehen passiert es bei jeder Mausbewegung. Alle drei Neuzeichenpfade entfernen den Zeiger jetzt vorher und setzen ihn danach wieder. Gegenprobe: Das Ergebnis eines Klicks ist unverändert.

### Maschinelle Nachprüfung des neuen Codes

Werte über Aufrufe hinweg in flüchtigen Registern: keine. Routinen mit unausgeglichenem Stack: keine. Alle drei Startkonfigurationen erreichen `BOOT OK`.

---

## Herkunft der Systemschrift

**Babel Sans**, Autor **Manfred Klein**, bezogen über dafont in der Kategorie Serifenlos, dort als kostenlos geführt, vier Schriftdateien im Paket. Verwendet wird `BabelSans-Oblique.ttf` mit 50.516 Byte, 244 Glyphen, 1000 Einheiten je Geviert.

Der Kernel wertet die Datei vollständig selbst aus: `head`, `maxp`, `loca`, `glyf`, `cmap` Format 4, `hmtx` und `hhea`. Auf dem Entwicklungsrechner wird nichts vorgerastert.

Die Datei liegt nicht im Repository. `make disk` kopiert sie beim Erzeugen des Testdatenträgers aus `FONT_SRC`. Fehlt sie, meldet der Kernel `TTF UNAVAILABLE` und läuft ohne Schrift weiter.

**Zur Einordnung:** „100 Prozent kostenlos" ist eine Kategorie der Bezugsseite, kein formaler Lizenztext wie MIT oder OFL. Für die Nutzung im Projekt reicht das; vor einer Weitergabe der Datei wären die Bedingungen des Autors zu prüfen. Deshalb bleibt sie vorerst ausserhalb des Repositoriums.

---

## Aufgeräumte Startausgabe und weicher Fokuswechsel

### Was aus der Ausgabe verschwunden ist

Die Dateisystem-Selbsttests sind abgeschaltet: keine Verzeichnisliste mehr, kein Inhalt von `HELLO.TXT`, `EMPTY.TXT` und `NOSUCH.TXT`, keine Signatur- und Herstellerzeile des Blockgeräts. Ebenfalls entfernt: die Meldung bei jedem Mausklick, die aus der Zeit stammt, als ein Klick noch keine sichtbare Wirkung hatte. Inzwischen wechselt er den Fokus oder zieht ein Fenster.

Die Startausgabe umfasst jetzt nur noch die Diagnose, die beim Hochfahren wirklich zählt:

    asmOS
    RAM base=... size=...
    FDT at=... len=...
    PMM base=... pages=...
    MMU ON
    FB 3840x1600, intern 64 Bit je Punkt
    VIRTIO at=... id=... ver=...
    INPUT READY
    BLK READY
    FAT res=... spf=... data=... root=...
    TTF units=1000 glyphs=244
    BOOT OK

Die Leseroutinen des Dateisystems bleiben im Kernel, nur ihre Testaufrufe sind fort. Sie werden gebraucht, sobald die Icon-Bibliothek vom Datenträger kommt.

Auch die Startanimation ist entfernt. Sie war der Nachweis für Schritt 4, nicht als dauerhaftes Verhalten gedacht.

### Der Fokuswechsel läuft jetzt weich

Ein Klick auf ein hinteres Fenster holte es bisher hart nach vorn, die Titelleiste wechselte schlagartig die Farbe. Jetzt läuft der Wechsel über die Animationsengine.

Die Fensterstruktur trägt dafür `WIN_FOCUS`, einen Wert zwischen 0 und 1 in 32.32. Beim Zeichnen mischt `win_mix_color` die Titelfarbe kanalweise zwischen inaktiv und aktiv, jeder der vier RGBA16-Kanäle einzeln und geklemmt. Beim Anheben startet für das neue oberste Fenster eine Animation auf 1 und für alle anderen mit Fokuswert auf 0, jeweils 180 ms mit quadratischem Ausklingen.

**Ein Punkt, der Sorgfalt brauchte:** Animationen zielen auf den Fensterindex, und `win_raise` sortiert die Liste um. Laufende Übergänge würden danach auf das falsche Fenster wirken. Deshalb beendet `win_focus_cancel` alle Animationen, bevor umsortiert wird, und `win_focus_start` setzt sie danach mit den neuen Indizes neu auf.

**Nachweis:** 70 ms nach dem Klick ist die Titelleiste des angeklickten Fensters noch gräulich gemischt, nach 670 ms voll aktiv. Der Zwischenzustand ist also sichtbar und nicht nur ein Umschalten.

### Was das noch nicht ist

Dies ist ein Farbübergang, kein Fenster-Fade. Ein ganzes Fenster ein- oder auszublenden setzt voraus, dass es als zusammenhängendes Bild vorliegt und mit einer Gesamtdeckkraft gemischt wird. Das ist Schritt 5 des Zusatzplans und braucht den Compositor sowie eine Mischroutine, die das Zielalpha mitführt. Der vorhandene Pixelmischer setzt es fest auf vollständig deckend.

---

## Drei Übergänge: Start, Fenster, Ziehen

### Aufblenden beim Start

Der Bildschirm beginnt schwarz und blendet in 450 ms auf. Der Faktor sitzt an der günstigsten Stelle: in der Umwandlung von 64 auf 32 Bit, durch die ohnehin jeder Bildpunkt läuft. Damit kostet der Fade nur eine Multiplikation je Farbkanal.

Damit der Normalbetrieb unberührt bleibt, gibt es **zwei Schleifen**. Steht der Faktor auf voll, läuft die bisherige ohne Multiplikation. Die Entscheidung fällt einmal je Bildzeile.

Gemessen an der Fensterfläche, Zielwert R=200:

| Zeitpunkt | R | G | B |
|---|---:|---:|---:|
| 0,32 s | 50 | 51 | 52 |
| 0,45 s | 153 | 156 | 159 |
| 0,62 s | 198 | 202 | 206 |
| 1,2 s | 200 | 204 | 208 |

### Fenster blenden auf

Jedes neu angelegte Fenster startet bei Deckkraft null und blendet in 260 ms auf. Ein einzelnes Fenster über seinem Untergrund zu mischen hiesse, jeden seiner rund 1,1 Millionen Bildpunkte einzeln zu verrechnen. Stattdessen werden die **vier Fensterfarben** einmal gegen die Hintergrundfarbe gewichtet, danach wird normal gefüllt. Der Aufwand liegt damit bei vier Mischungen statt einer Million.

Gemessen, Zielwert wieder R=200:

| Zeitpunkt | R | G | B |
|---|---:|---:|---:|
| 0,36 s | 14 | 15 | 15 |
| 0,48 s | 123 | 125 | 128 |
| 0,62 s | 199 | 203 | 207 |

**Die Grenze dieses Verfahrens:** Es mischt gegen die Hintergrundfarbe, nicht gegen das, was tatsächlich darunter liegt. Für ein Fenster über dem Desktop stimmt das Ergebnis. Über einem anderen Fenster wäre es genau genommen falsch. Ein echtes Ausblenden eines ganzen Fensters bleibt Schritt 5 mit dem Compositor.

### Ziehen mit weichem Nachlauf

Das Fenster klebte bisher hart an der Maus. Jetzt springt die **logische** Position sofort mit, und die **Darstellung** zieht in 90 Grad quadratisch ausklingend nach. Umgesetzt über die vorhandene Trennung: Beim Setzen der neuen Layout-Position wird die Verschiebung so nachgeführt, dass das Fenster optisch zunächst stehen bleibt, und danach eine Animation dieser Verschiebung auf null gestartet.

Nicht maschinell nachweisbar, weil der QEMU-Monitor bei absoluten Geräten keine Mausbewegung einspeist.

### Ein Fehler beim Bauen, wieder eine Textersetzung

`win_fade_all` landete in `win_repaint_full` statt in `win_demo`. Damit startete das Aufblenden bei **jedem** Vollbild neu und blieb dauerhaft bei null, die Fenster waren unsichtbar. Sichtbar wurde es erst durch die Farbmessung: Die Fensterfläche zeigte exakt die Hintergrundfarbe R=16 G=32 B=48.

Dazu ein Reihenfolgefehler: Während des Bildschirm-Fades sprang die Hauptschleife am Neuzeichnen vorbei und gab nur neu aus. Der Fenster-Fade lief in dieser Zeit ab, ohne je gezeichnet zu werden. Jetzt wird erst gezeichnet, dann bei Bedarf zusätzlich vollständig ausgegeben.

---

## Warum es in QEMU zäh läuft, und was auf echter Hardware zu erwarten ist

### Gemessen, nicht geschätzt

Zeit für ein Vollbild, im laufenden Kernel über den Zeitgeber gemessen:

| Schritt | Software-Emulation | mit Hardware-Beschleunigung | Faktor |
|---|---:|---:|---:|
| Vollbild zeichnen | 64,9 ms | 11,65 ms | 5,6 |
| Ausgabe umwandeln | 41,1 ms | 12,54 ms | 3,3 |
| **zusammen** | **106,0 ms** | **24,19 ms** | **4,4** |
| Bilder je Sekunde | 9,4 | 41,3 | |

Der Grund ist die Betriebsart. `make run` startet mit `-cpu cortex-a72`, und damit übersetzt QEMU jede Instruktion in Software. Mit `-machine virt,accel=hvf -cpu host` führt der Prozessor den Gastcode direkt aus. Dafür gibt es jetzt `make fast`.

Der Unterschied ist also **kein Fehler im Kernel**, sondern der Preis der Emulation.

### Dabei ein echter Fehler gefunden

Mit Hardware-Beschleunigung stürzte der Kernel ab: `PANIC EL1h_SYNC esr=0x02000000` bei `msr cntv_tval_el0`, damals noch `cntp_tval_el0`. Ursache: Der Kernel benutzte den **physischen** Zeitgeber. Unter Virtualisierung gehört der dem Hypervisor und wird abgefangen.

Umgestellt auf den **virtuellen** Zeitgeber, der in beiden Fällen funktioniert. Die Interruptnummer ändert sich dabei mit und ist aus dem Device Tree belegt:

    timer {
        interrupts = <0x01 0x0d 0x104   0x01 0x0e 0x104
                      0x01 0x0b 0x104   0x01 0x0a 0x104>;
    };

Die vier Einträge sind nach der ARM-Bindung sicherer, nicht-sicherer, virtueller und Hypervisor-Zeitgeber. Der virtuelle ist PPI 11, also Interrupt **27** statt bisher 30.

Der Startcode setzte `cntvoff_el2` bereits auf null und gab die Zeitgeber für EL1 frei. Die virtuelle Zeit läuft damit auch ohne Hypervisor synchron zur physischen.

**Das war ein latenter Fehler auch für den Raspberry Pi**, je nachdem, in welchem Zustand die Firmware EL2 verlässt.

Gegenprobe: Die Blinkrate bleibt bei beiden Betriebsarten 2 Hz, obwohl der Zeitgeber unterschiedlich schnell läuft, 62,5 MHz emuliert gegenüber 24 MHz beschleunigt. Der Kernel liest die Frequenz zur Laufzeit, deshalb stimmt die Zeit in beiden Fällen.

### Was auf dem Raspberry Pi 5 zu erwarten ist

Die Messung erlaubt eine belastbarere Aussage als eine reine Bandbreitenrechnung. Ein Vollbild bewegt 70,3 MiB. Mit Hardware-Beschleunigung auf Apple Silicon, das über hundert GB/s Speicherbandbreite hat, erreicht die Umwandlung trotzdem nur **5,88 GB/s**.

Daraus folgt: **Der Engpass ist nicht die Speicherbandbreite, sondern die skalare Schleife**, die jeden Bildpunkt einzeln zerlegt und wieder zusammensetzt.

Der Pi 5 hat vier Cortex-A76 bei 2,4 GHz und LPDDR4X mit theoretisch etwa 17 GB/s. Seine Kerne sind langsamer als die von Apple Silicon. Zu erwarten ist deshalb eher der Bereich zwischen den gemessenen Werten, also spürbar besser als die Emulation, aber nicht automatisch flüssig.

Der wirksame Hebel ist damit benannt und liegt nicht bei der Hardware: die Umwandlungsschleife auf NEON umstellen und weniger Fläche neu zeichnen. Beides steht bereits im Zusatzplan.

---

## Durchsicht nach Animation und Fenstersystem

Diese Runde galt dem neuen Code: Animationsengine, Fensterinteraktion, Übergänge. **Ein Befund, drei widerlegte Verdachtsmomente.**

### Behoben: Ziehen war unbegrenzt

Ein Fenster liess sich vollständig aus dem Bild ziehen und war danach nicht mehr erreichbar, weil kein Teil der Titelleiste mehr angeklickt werden konnte. Kein Absturz, aber ein Zustand ohne Ausweg. Die Zielposition wird jetzt so begrenzt, dass immer mindestens 120 Bildpunkte des Fensters sichtbar bleiben, an allen vier Rändern. Damit erfüllt das Verhalten die Vorgabe aus dem Zusatzplan: teilweise ausserhalb liegen dürfen, aber wieder hineingeschoben werden können.

### Widerlegt: die Liste veränderter Bereiche läuft nicht über

Vermutung war, dass laufende Animationen die Liste sprengen: Jede Wertänderung markiert zwei Bereiche, bei mehreren gleichzeitigen Animationen und 60 Bildern je Sekunde wären das hunderte Markierungen je Sekunde bei nur 16 Plätzen. Ein Überlauf würde auf Vollbild zurückfallen und die Teilaktualisierung entwerten.

Gemessen mit einem Zähler im Überlaufpfad, über Start, zwei Fokuswechsel und alle Übergänge hinweg: **null Überläufe**. Grund ist die vorhandene Zusammenfassung überlappender Bereiche. Alte und neue Position eines bewegten Fensters überlappen fast immer und werden zu einem Bereich verschmolzen.

### Widerlegt: die Animationsliste läuft beim Ziehen nicht voll

Beim Ziehen werden je Mausbewegung zwei Animationen gestartet. Da `anim_start` eine laufende Animation derselben Eigenschaft am selben Ziel findet und fortsetzt, bleibt es bei zwei Einträgen. Abgelaufene Plätze werden seit der letzten Durchsicht wiederverwendet.

### Geprüft: Fenster über den Bildrändern

Fenster testweise auf `x = -400, y = -200` gesetzt, also über den linken und oberen Rand hinaus. Beide Betriebsarten erreichen `BOOT OK`, keine Panik, keine Grenzmeldung, im Bild sauber abgeschnitten ohne Artefakte. Das ist das Abnahmekriterium aus Schritt 0 des Zusatzplans.

### Maschinelle Nachprüfung

Über alle 606 Marken: kein Wert überlebt einen Aufruf in einem flüchtigen Register, keine Routine mit unausgeglichenem Stack. Geprüft wird jetzt in **beiden** Betriebsarten, emuliert und beschleunigt.

---

## Durchsicht unter Last: der Rückfall bei voller Animationsliste fehlte

### Was der Dauerlauf zeigte

Achtzig Klicks in zwei Schüben, dazwischen alle Übergänge: keine Panik, keine Grenzmeldung, keine volle Liste, sauberes Bild am Ende. Der Betrieb selbst ist stabil.

### Der Befund

Der Zusatzplan verlangt für den Fall einer vollen Animationsliste: *Fehler zurückgeben, die Oberfläche kann den Endzustand direkt setzen.* Der erste Teil war umgesetzt, der zweite nicht. Die Aufrufer prüften den Rückgabewert gar nicht.

Künstlich nachgestellt, indem alle 64 Plätze mit langlaufenden Animationen belegt wurden, bevor die Übergänge starten. Ergebnis: vier Meldungen `ANIM LISTE VOLL`, und der **Bildschirm blieb vollständig schwarz**, gemessen R=0 G=0 B=0. Der Helligkeitsfaktor stand auf null, weil das Aufblenden nie begann, und die Fenster hatten Deckkraft null.

Das ist kein Absturz, aber ein unbrauchbares System nach einer Meldung, die nur im Protokoll steht.

**Ein Hinweis zur Testkonstruktion:** Der erste Versuch schlug fehl, weil alle Füllanimationen dasselbe Ziel und dieselbe Eigenschaft hatten. `anim_start` findet eine laufende Animation derselben Eigenschaft am selben Ziel und setzt sie fort, deshalb blieb es bei einem einzigen Eintrag. Erst mit 64 verschiedenen Zielen war die Liste wirklich voll.

### Behoben an drei Stellen

| Stelle | Rückfall |
|---|---|
| Aufblenden des Bildschirms | Helligkeit sofort auf voll, **und neu ausgeben** |
| Aufblenden der Fenster | Deckkraft des betroffenen Fensters sofort auf voll |
| Fokuswechsel | Fokuswert des neuen obersten auf eins, der übrigen auf null |

Beim ersten Versuch griff der Rückfall nicht, obwohl der Wert korrekt gesetzt wurde: Das Bild war zu diesem Zeitpunkt bereits ausgegeben, und niemand löste eine Neuausgabe aus. Der Fehler lag also nicht im Setzen, sondern im fehlenden Anstoss danach.

Gegenprobe mit voller Liste: vorher R=0, nachher R=200, also normale Darstellung. Der Normalfall blendet unverändert auf, gemessen R=14 bei 0,36 s, R=121 bei 0,48 s, R=200 am Ende.

---

## Durchsicht der Gerätetreiber, offene Punkte der externen Analyse

Diese Runde arbeitete die Treiberbefunde ab, die bisher nur vermerkt waren. **Drei bestätigt und behoben.**

### Die vom Gerät gelieferte Deskriptor-Kennung war ungeprüft

`virtio_input_poll` nahm die Kennung aus dem Rückgabering und verwendete sie unmittelbar als Index in den Ereignispuffer. Der Puffer fasst acht Einträge zu je acht Byte, also 64 Byte. Eine Kennung von 65535 hätte einen Zugriff **524.216 Byte hinter dem Puffer** ergeben.

Bei einem korrekt arbeitenden Gerät tritt das nicht auf, bei einem fehlerhaften oder böswilligen schon. Die Kennung wird jetzt gegen die Warteschlangengrösse geprüft; bei Verstoss meldet der Kernel `VIRTIO UNGUELTIGE DESKRIPTOR-ID` und überspringt den Eintrag, statt ins Leere zu greifen.

### Fehlende Barriere vor dem Veröffentlichen des Index

Zwischen dem Eintragen des zurückgegebenen Deskriptors in den Ring und dem Erhöhen des Index fehlte `dmb ishst`. Die Virtio-Spezifikation verlangt diese Reihenfolge ausdrücklich: Das Gerät darf den neuen Index nicht sehen, bevor der Ringeintrag sichtbar ist. Auf einem einzelnen Kern unter QEMU folgenlos, auf echter Hardware mit eigenständigem Gerätezugriff nicht.

### Die Geräteversion wurde ausgegeben, aber nicht geprüft

`virtio_find` prüfte Kennung und Magic, nicht aber die MMIO-Version. Ein Gerät der Version 1 hat ein anderes Warteschlangenformat und wäre falsch angesteuert worden. Das Makefile erzwingt zwar Version 2, aber der Kernel verliess sich darauf.

Gegenprobe ohne die erzwingende Option:

    VIRTIO ALTE VERSION, Geraet uebersprungen
    INPUT UNAVAILABLE
    VIRTIO ALTE VERSION, Geraet uebersprungen
    BLK UNAVAILABLE
    BOOT OK

Statt eines falsch angesteuerten Geräts also eine klare Meldung und ein weiterlaufendes System. Genau dieser Fall, virtio meldet Version 1, hat in der Projektgeschichte schon einmal Zeit gekostet.

### Die Dateisystem-Geometrie war nur halb geprüft

Die Sektoren je Cluster wurden nur gegen null geprüft. Die FAT-Spezifikation lässt ausschliesslich Zweierpotenzen von 1 bis 128 zu. Ein Wert wie 255 hätte die Clusterberechnung mit dem Faktor 255 mal 512 weitergeführt.

Belegt mit einem Abbild, dessen Byte an Offset 0x0D auf 255 gesetzt wurde:

| Stand | Ergebnis |
|---|---|
| vorher | `FAT res=... spf=... data=... root=...`, das Dateisystem wurde angenommen |
| nachher | `FAT INVALID`, sauber abgelehnt, `BOOT OK` |

### Noch offen aus derselben Liste

Ein Zeitüberschreitung beim Blockgerät setzt nur den Basiszeiger auf null und beendet keinen laufenden Auftrag. `power_device_off` bestätigt den abgeschlossenen Rücksetzvorgang nicht. `fat_find` führt einen Lesefehler auf denselben Rückgabepfad wie „nicht gefunden" und filtert Verzeichnis- und Datenträgereinträge nicht.

---

## Durchsicht nach der externen Überarbeitung

Der Kernel wurde extern überarbeitet, rund 1.125 eingefügte und 661 entfernte Zeilen. Ich habe den Stand gegen alle Prüfungen laufen lassen, die in diesem Projekt aufgebaut wurden.

### Was Bestand hat

| Prüfung | Ergebnis |
|---|---|
| Drei Startkonfigurationen | laufen |
| Beschädigte Schriften: Tabellenzahl, Tabellenoffset, verbogener Glyphzeiger | alle drei weiterhin abgefangen |
| Verbogene Dateisystem-Geometrie | `FAT INVALID` |
| Gerät mit alter Schnittstellenversion | übersprungen |
| Datenfluss über 662 Marken, Stackbilanz | ohne Befund |
| Abbild | 24.576 statt 24.800 Byte |

Der Stack liegt jetzt nachweislich **vor** den Bildpuffern, also ausserhalb des nicht zwischengespeicherten Bereichs. Das Wurzelverzeichnis wird über die ersten sechzehn Einträge hinaus gelesen: Eine Schrift hinter dreissig anderen Dateien wird gefunden.

### Zur Geschwindigkeit: weniger als der Bericht nahelegt

Fair gemessen, also bei voller Helligkeit und nicht während des Aufblendens:

| Schritt | vorher | jetzt |
|---|---:|---:|
| Vollbild zeichnen | 11,65 ms | 9,50 ms |
| Ausgabe umwandeln | 12,54 ms | 13,86 ms |
| zusammen | 24,19 ms | 23,36 ms |

Der Rasterizer ist also spürbar schneller, die Ausgabe etwas langsamer, in Summe drei Prozent besser. Der Gewinn dürfte bei textlastigen Bereichen deutlich grösser ausfallen als in diesem Testbild.

### Der dringendste Fund hat nichts mit dem Kernel zu tun

**Die Quellschrift war von der Festplatte verschwunden.** Der Pfad in `FONT_SRC` zeigte auf ein Verzeichnis, das es nicht mehr gibt. Die einzige verbliebene Kopie lag **im Datenträgerabbild**, das `make distclean` löscht. Da die Schrift aus Lizenzgründen nicht im Repository liegt, wäre sie damit unwiederbringlich weg gewesen.

Gesichert unter `~/Desktop/asmos-assets/`, 50.516 Byte, Prüfsumme beginnt mit `1009de51b079e174`, Dateikopf `00010000`, also gültiges TrueType. `FONT_SRC` zeigt jetzt dorthin, `make disk` erzeugt wieder einen Datenträger mit Schrift. In `.gitignore` steht zusätzlich `*.ttf`, damit die Datei nicht versehentlich ins öffentliche Repository gerät.

### Beim Start werden 71,5 MiB genullt

Gemessen: 12,3 ms beschleunigt, 45,9 ms emuliert. Davon entfallen **98 Prozent auf die beiden Bildpuffer**, die unmittelbar danach vollständig überschrieben werden. Das ist kein Fehler, aber vermeidbare Arbeit. Für den Ausgabepuffer ist das Nullen sinnvoll, weil die Anzeige ihn liest, bevor der Kernel das erste Bild zeichnet; für den internen Puffer nicht.

### Eigener Fehlalarm, zweimal

Ich meldete zuerst, die Warnung bei verbogenem Glyphzeiger fehle. Mein Test hatte die Schrift wegen eines Pfadfehlers gar nicht eingespielt. Und beim Verzeichnistest kopierte ich versehentlich eine Lizenzdatei als Schrift, weil die Quelle fehlte, und hielt das Ergebnis für einen Fehler im Kernel. Beide Male lag es am Testaufbau.

---

## Startnullung auf das Nötige begrenzt (13.09.2026)

`boot_clear_bss` nullte bis hierher alles von `__bss_start` bis `__bss_end`, und `__bss_end` lag hinter beiden Bildpuffern. Gemessen wurden **71,50 MiB**, davon 98 Prozent Bildpuffer.

Der Ausgabepuffer muss genullt werden, denn `ramfb` liest ihn, bevor der Kernel das erste Bild zeichnet; ohne Nullung zeigt der Bildschirm beim Start Speichermüll. Der interne Puffer muss es nicht: `win_draw_all` füllt über `fb_fill_rect` die gesamte Fläche, bevor irgendetwas davon gelesen wird.

**Umsetzung.** In `linker.ld` wurde `__bss_end` vor die Abschnitte `.render` und `.framebuffer` gezogen, der Ausgabepuffer bekam die eigenen Marken `__fb_out_start` und `__fb_out_end`. In `kernel.S` nullt `boot_clear_bss_done` nur noch diesen Bereich eigens.

**Stolperstelle beim Bau.** Das Makro `ladr` erzeugt kurze Adressierung mit ±1 MB Reichweite. Für `__fb_out_start` und `__fb_out_end`, die 47 MiB hinter dem Code liegen, meldet der Linker `relocation truncated to fit`. Hier ist `ladr_far` mit `adrp`/`add` nötig. Der Baufehler ist ein Glücksfall: Der Linker fängt genau den Fall ab, der sonst still auf eine falsche Adresse gezeigt hätte.

**Messung.** Zähler `cntvct_el0` vor und nach der Nullung, Frequenz aus `cntfrq_el0`:

| Betriebsart | genullt vorher | genullt jetzt | Zeit vorher | Zeit jetzt | gespart |
|---|---:|---:|---:|---:|---:|
| beschleunigt (`accel=hvf`) | 71,50 MiB | 24,19 MiB | 12,3 ms | 9,0 ms | 27 % |
| emuliert (`cortex-a72`) | 71,50 MiB | 24,19 MiB | 45,9 ms | 8,9 ms | 81 % |

Im emulierten Betrieb ist der Gewinn deutlich grösser, weil dort jeder Speicherzugriff durch die Übersetzungsschicht läuft und die reine Datenmenge stärker durchschlägt.

**Gegenprobe.** `make shot` liefert ein Bild, das byteweise identisch mit dem vorherigen Stand ist, obwohl der interne Puffer beim Start jetzt uninitialisiert bleibt. Das belegt, dass er tatsächlich vollständig überschrieben wird. `make check` erreicht `BOOT OK` ohne `PANIC`. Das Abbild bleibt unverändert 24.576 Byte gross, die Messinstrumentierung wurde nach der Messung wieder entfernt.

---

## Fensterinhalt: Beschneidung und Dateiliste (13.09.2026)

### Die Beschneidung war schon da, sie war nur nicht verschachtelbar

`fb_clip` mit `CLIP_X`/`CLIP_Y`/`CLIP_X2`/`CLIP_Y2` existiert seit der Teilaktualisierung, und **alle** Zeichenwege werten es aus: `fb_fill_rect` lädt es und gibt es an `fb_rect_clip`, `vg_fill` klemmt seine Zeilen- und Spaltengrenzen dagegen, womit auch Schrift und Icons erfasst sind. Gesetzt wurde es bisher nur von `win_repaint` auf das jeweilige Aktualisierungsrechteck und von `fb_clip_full` auf den ganzen Bildschirm.

Was fehlte, war der Schnitt zweier Bereiche: Beim Zeichnen von Fensterinhalt muss gleichzeitig das Aktualisierungsrechteck **und** der Fensterkörper gelten. Dafür `fb_clip_intersect` (schneidet das übergebene Rechteck in das bestehende und liefert das alte als zwei 64-Bit-Werte zurück) und `fb_clip_restore`. Beide ohne Stackrahmen, weil sie keine Aufrufe enthalten.

Ein leeres Ergebnis ist sicher: `fb_rect_clip` bricht bei `w2 <= 0` ab, `vg_fill` bei `b.le` nach `subs`. Deshalb klemmt `fb_clip_intersect` X2 auf mindestens X statt negative Breiten entstehen zu lassen.

### Nachweis der Beschneidung

Ein Datenträger mit 35 Einträgen, davon 24 erfasst, in ein Fenster von 800 Punkten Höhe, in das 19 Zeilen passen.

| Aufbau | Ergebnis |
|---|---|
| mit Zeilenprüfung in `files_draw` | 19 Zeilen, endet an der Fensterkante |
| **ohne Zeilenprüfung**, nur Beschneidung | **19 Zeilen, identisches Bild** |

Der zweite Lauf ist der eigentliche Beleg: Alle 24 Zeilen werden gezeichnet, fünf davon liegen unterhalb des Fensters, und kein Bildpunkt davon erreicht den Bildschirm. Die Zeilenprüfung bleibt trotzdem im Code, weil sie die Arbeit spart statt sie nur zu verwerfen.

### Die Dateiliste

`fat_root_walk` nimmt einen Callback und reicht ihm einen Zeiger auf den 32 Byte grossen Verzeichniseintrag **im Sektorpuffer**, der beim nächsten Sektor überschrieben wird. `files_collect` kopiert deshalb sofort heraus: Name in 8.3 zu `NAME.EXT` umgeschrieben, Grösse über `mem_read32`, Attribut. Einträge mit `(attr & 0x0f) == 0x0f` sind Langnamen-Fragmente und werden übersprungen, `fat_root_walk` filtert nur Datenträgerbezeichnungen.

`win_draw_one` berechnet die Farbe über `win_fade_color` und übergibt sie an `files_draw`. Das ist nötig, weil `win_fade_color` den Fensterzeiger in `x19` erwartet, also nur innerhalb des `win_`-Blocks gültig ist. Ohne diesen Weg bliebe der Listentext beim Einblenden sofort voll sichtbar, während das Fenster noch aufblendet.

### Zwei Fehler in dieser Runde, beide vom Werkzeug gefangen

**Die Texte lagen in der Vektortabelle.** `win_title_1` bis `win_title_3` stehen nicht in `.rodata`, sondern in den ungenutzten 112 Byte von Vektoreintrag 14. Meine zwei neuen Meldungstexte mit zusammen 27 Byte sprengten das, der Linker meldete `Vektoreintrag 15 verschoben`. Genau dafür sind die Zusicherungen im Linkerskript da. Die Texte liegen jetzt in `.rodata`.

**Der Testaufbau war falsch, nicht der Kernel.** `printf 'x' > "$MP/UEBER%03d.DAT" $i` ersetzt das Format im Dateinamen nicht, alle dreissig Schreibvorgänge gingen in dieselbe Datei. Das Ergebnis sah nach einem Fehler in der Liste aus. Zum dritten Mal in diesem Projekt lag es am Testaufbau.

### Stille Grenze beseitigt

`FILES_MAX` ist 24. Wurde das überschritten, brach `files_collect` den Lauf ab und liess den Rest kommentarlos weg. Jetzt erscheint `FILES LIST FULL`, bevor abgebrochen wird.

### Der Testdatenträger enthielt Geisterdateien

Die erste Liste zeigte jede Datei doppelt, als `HELLO.TXT` und `_HELL~2.TXT`. Das war kein Fehler der Liste: macOS legt beim Schreiben über `hdiutil` zu jeder Datei eine AppleDouble-Nebendatei `._NAME` an, dazu `.fseventsd`. Die Liste zeigte also korrekt an, was wirklich auf dem Datenträger stand. Behoben an der Ursache, `make disk` räumt diese Einträge jetzt vor dem Aushängen weg.

### Beinahe-Verlust der Systemschrift, zum zweiten Mal

`make disk` meldete `FONT_SRC fehlt`. Das Verzeichnis `~/Desktop/asmos-assets/` war verschwunden, und der Befehl hatte zuvor bereits `disk.img` überschrieben, also die letzte verbliebene Kopie.

Gerettet aus einem Datenträgerabbild im Arbeitsverzeichnis dieser Sitzung: 50.516 Byte, SHA-256 beginnt `1009de51b079e174`, Dateikopf `00010000`. Beides stimmt mit der früheren Dokumentation überein, es ist nachweislich dieselbe Datei.

**Ursache war ein stiller Fehlschlag im Makefile.** Bei fehlender Schrift gab `make disk` nur einen Hinweis aus und baute den Datenträger trotzdem, also ein unbrauchbares Abbild ohne sichtbaren Fehler. `make disk` bricht jetzt ab, bevor irgendetwas überschrieben wird.

### Fehlersuche nach der Dateiliste (13.09.2026)

Geprüft wurden die drei Fehlerklassen des Projekts, die Ausfallpfade und die neuen Grenzfälle.

| Prüfung | Ergebnis |
|---|---|
| Registerverträge der neuen Routinen | `files_draw` sichert x19 bis x25 und benutzt genau diese, `font_text` ebenso, `win_mix_color` fasst keine callee-saved Register an. Ohne Befund |
| Rahmenaufbau gegen Rahmenabbau, alle 230 Routinen | alle gleich gross, ohne Befund |
| Sicherung ausserhalb des eigenen Rahmens | ohne Befund |
| `bl` vor gesichertem `x30` | drei Treffer, alle in Routinen, die nie zurückkehren (`b boot_park`, Abschaltung, Hauptschleife). Ohne Befund |
| Strukturvergrösserung auf 64 Byte | `win_swap` und `win_raise` rechnen mit `WIN_SIZE`, `anim_apply` adressiert nur bis Offset 48. Ohne Befund |
| Start ohne Datenträger | `FILES SCAN FAIL`, `FILES n=0`, `BOOT OK`, kein `PANIC` |
| Start mit beschädigter FAT | dito |
| Fenster bei x=-400 und y=-30 | keine Reste, kein Absturz, Liste korrekt ausserhalb |
| Fenster bei y=-200 | obere Zeilen sauber weggeschnitten, nichts auf dem Hintergrund |
| Fenster mit Inhalt animiert bewegen | Liste wandert mit, während der Bewegung keine Fragmente, am Ende keine Reste |
| `make disk` ohne Schrift | bricht ab, `disk.img` byteweise unverändert, keine Zwischendateien, nichts gemountet |

### Leerer Schnitt wird jetzt erkannt

Bei einem Fokuswechsel markiert `win_dirty_title` nur die Titelleiste, `win_draw_all` zeichnet aber alle Fenster. Für das Dateifenster ist der Schnitt aus Aktualisierungsbereich und Fensterkörper dann leer, die Textrasterung lief trotzdem und wurde vollständig verworfen. `fb_clip_intersect` liefert nun in `w2`, ob etwas übrig bleibt.

**Der Gewinn ist kleiner als vermutet:** gemessen über hundert Fokuswechsel 2,901 statt 2,947 ms, also 1,6 Prozent. `vg_fill` klemmt früh genug, dass wenig Arbeit anfällt. Die Prüfung bleibt trotzdem, sie kostet fünf Befehle und wächst mit mehr Fensterinhalt. Das Bild ist byteweise identisch.

### Offener Befund: Textinhalt verteuert das Ziehen deutlich

Gemessen über fünfzig vollständige Neuzeichnungen des Dateifensters mit 24 Einträgen:

| Betriebsart | ohne Liste | mit Liste | Aufschlag |
|---|---:|---:|---:|
| emuliert (`cortex-a72`) | 26,50 ms | **40,47 ms** | +53 Prozent |
| beschleunigt (`accel=hvf`) | | **8,20 ms** | |

Das sind **0,582 ms je Textzeile**. Emuliert fällt die Bildrate damit von 37,7 auf 24,7 Hz, also unter die angestrebten 30 Hz, beschleunigt bleiben 122 Hz.

Mit dem heutigen Testdatenträger und seinen fünf Einträgen kostet es rund 2,9 ms und fällt nicht auf. Der Fall wird erst bei gut gefüllten Verzeichnissen spürbar, und zwar nur im emulierten Betrieb. Die saubere Lösung ist der Fensterpuffer aus Schritt 5 des Animationsplans: Der Text würde einmal gerastert und beim Ziehen nur noch kopiert. Bis dahin bleibt es als bekannte Grenze stehen.

### Zweite Runde Fehlersuche, breit über den Bestand (13.09.2026)

Diesmal nicht nach Routinen, sondern nach Fehlermustern gesucht. **Kein Fehler gefunden.**

| Muster | Ergebnis |
|---|---|
| Pufferindizes gegen ihre Grenzen | `VG_XS_MAX`, `VG_EDGE_MAX` und `FILES_MAX` prüfen und melden über `font_limit_report` beziehungsweise `FILES LIST FULL` |
| `DIRTY_MAX` überschritten | `dirty_add_overflow` fällt geordnet auf Vollbild zurück, kein Überlauf |
| **Alle 18 Divisionen** | jeder Teiler abgesichert, siehe unten |
| Endlosschleifen ohne Abbruch | drei Treffer, alle gewollt (`boot_park`, `power_off_halt`, `panic_halt`) |
| Vorzeichenlose Vergleiche auf Koordinaten | `win_hit` nutzt durchweg `b.lt`/`b.ge`, also signed. Korrekt für Fenster jenseits des Randes |
| Fremde Schriftdatei | siehe unten |

**Zu den Divisionen.** Auf AArch64 gibt es keinen Trap, `x/0` liefert stillschweigend 0, ein Fehler bliebe also unsichtbar. Drei Teiler stammen aus Fremddaten und sind alle geprüft: `font_set_size` prüft `cbz w1` auf `units_per_em` aus der Schriftdatei, `fat_init_total` fängt es über `cbz w0` nach der Division ab, `mouse_apply_abs` prüft beide Achsenmaxima vor Gebrauch. Bei den geometrischen Divisionen ist der Teiler logisch ausgeschlossen: `vg_seg` bricht bei Länge null über `cbz x0` ab, und in `font_fill_scan` kann `YBOT == YTOP` nicht eintreten, weil die beiden vorangehenden Vergleiche `w27 >= YTOP` und `w27 < YBOT` sich dann widersprächen.

**Fremde Schriften.** Der Kernel bekam nacheinander drei Schriften untergeschoben, die er nie gesehen hat:

| Datei | Grösse | Ergebnis |
|---|---:|---|
| SFCompact.ttf | 1.890.660 | `TTF UNAVAILABLE`, kein `PANIC` |
| NISC18030.ttf | 7.110.352 | `TTF UNAVAILABLE`, kein `PANIC` |
| Arial Rounded Bold.ttf | 49.296 | **angenommen und korrekt dargestellt** |

Die dritte ist der interessante Fall: Sie arbeitet intern mit `units=2048` statt der 1000 der Systemschrift, hat 243 statt 244 Glyphen und ist aufrecht statt kursiv. Fenstertitel und Dateiliste erscheinen damit sauber, also stimmen Skalierung, Kantenglättung und Vorschubbreiten auch für eine völlig andere Schrift. Der Test lief nur lokal, die Datei liegt weder im Repository noch auf dem Testdatenträger.

### Drei als offen geführte Mängel sind in Wahrheit behoben

Beim Nachprüfen der intern geführten offenen Punkte zeigte sich, dass der Code weiter ist als seine Beschreibung:

| Bisher als offen geführt | Tatsächlich im Code |
|---|---|
| „Eine Zeitüberschreitung beim Blockgerät beendet keinen laufenden Auftrag, sie setzt nur den Basiszeiger auf null" | `blk_read_stop` ruft **`virtio_reset`**, setzt das Gerät also zurück und verwirft den Auftrag, **bevor** `blk_base` genullt wird |
| „`fat_find` filtert Verzeichniseinträge nicht" | `fat_find_entry` prüft `tst w1, #DIR_ATTR_DIR` und überspringt Verzeichnisse |
| „`fat_find` unterscheidet Lesefehler nicht von nicht gefunden" | Der Rückgabewert unterscheidet 1, 0 und -1. Beide Aufrufer werten das aus: `fat_load` mit `cmp w0, #1`, `fat_cat` mit `tbnz w0, #31` und anschliessendem `cbz` |

Ein einziger Punkt bleibt offen und ist hier festgehalten: `virtio_reset` springt bei Misserfolg nach `boot_park`, hält also das System an. Das trifft im laufenden Betrieb auch den Fall, dass nur eine einzelne Datei nicht gelesen werden konnte. Es ist keine stille Fehlfunktion, die Meldung erscheint vorher, aber die Reaktion ist hart.

### Nachtrag: die Sektorgrenze des Wurzelverzeichnisses ist längst gefallen

Intern stand noch als Grenze vermerkt, `fat_find` und `fat_list_root` läsen nur den ersten Sektor, also höchstens sechzehn Einträge. Das trifft nicht mehr zu. `fat_root_walk` zählt in `fat_root_sector` über `FAT_SEC_PER_CLUS` und folgt danach über `fat_next_cluster` der Clusterkette.

Beleg aus dem Überlauftest: Auf einem Datenträger mit 35 Einträgen wurden 24 erfasst, und 24 ist die Grenze `FILES_MAX`, nicht die Sektorgrenze. Ein Sektor fasst hart sechzehn Einträge, 512 geteilt durch 32. Der Vermerk ist gestrichen.

---

## Die Systemschrift ist zum zweiten Mal verschwunden (13.09.2026)

Wenige Minuten nach der Wiederherstellung aus einem Datenträgerabbild war `~/Desktop/asmos-assets/` erneut samt Inhalt weg. Gesucht und nicht gefunden: in iCloud Drive, im Papierkorb, an jeder anderen Stelle unterhalb des Benutzerverzeichnisses. **Die Ursache ist unbekannt und wird hier nicht geraten.** Die Tatsache genügt: derselbe Ort hat zweimal in einer Sitzung versagt.

Gerettet wurde erneut aus `disk.img`, nachweislich dieselbe Datei: 50.516 Byte, SHA-256 `1009de51b079e174d6b313a2269f2137db976bc98113718e20a4307ffbdeb50e`, Dateikopf `00010000`.

### Ein Fehler, der sich wiederholt, ist ein Konstruktionsfehler

Die Ablage liegt jetzt unter `~/.asmos/fonts/`, schreibgeschützt mit 444, und das Makefile ist gegen alle drei Fälle abgesichert, die tatsächlich eingetreten sind.

| Fall | Verhalten | geprüft |
|---|---|---|
| Schrift nirgends auffindbar | `make disk` bricht ab, **bevor** das bestehende `disk.img` angefasst wird, und nennt beide Suchorte | `disk.img` byteweise unverändert |
| Schrift nur am Rückfallort | Sicherung wird selbst angelegt, mit Hinweis | Datei erscheint unter `~/.asmos/fonts/`, 50.516 Byte |
| Sicherung verloren, Abbild vorhanden | `make font-rescue` holt sie zurück und zeigt die Prüfsumme | Prüfsumme stimmt mit dem Sollwert überein, nichts bleibt gemountet |

`FONT_SRC` wird über `$(firstword $(wildcard ...))` aufgelöst und nimmt den neuen Ort zuerst, den alten Desktop-Pfad als Rückfall. Damit läuft ein Rechner, auf dem die Datei noch am alten Ort liegt, unverändert weiter und legt beim nächsten `make disk` von selbst die Sicherung an.

Was bewusst **nicht** gemacht wurde: die Schrift ins Repository legen. Die Bezugsseite führt sie als kostenlos, das ist eine Kategorie und kein Lizenztext.

## Netzwerk, Stufe 1 bis 3: virtio-net, ARP, ICMP (14.09.2026)

### virtio-net

Beleg: Virtual I/O Device (VIRTIO) Version 1.2, Kapitel 5.1 "Network Device".

| Symbol im Code | Wert | Bedeutung | Fundstelle |
|---|---|---|---|
| `VIRTIO_ID_NET` | `1` | Device ID des Netzwerkgeräts | 5.1.1 Device ID |
| `VIRTIO_NET_F_MAC` | `1 << 5` | Gerät stellt eine MAC-Adresse im Konfigurationsraum bereit | 5.1.3 Feature bits |
| `NET_QUEUE_RX`, `NET_QUEUE_TX` | `0`, `1` | receiveq1 ist Queue 0, transmitq1 ist Queue 1 | 5.1.2 Virtqueues |
| `VIRTIO_REG_CONFIG + 0` | 6 Byte | `struct virtio_net_config.mac`, gültig nur bei ausgehandeltem `VIRTIO_NET_F_MAC` | 5.1.4 Device configuration layout |
| `NET_HDR_SIZE` | `12` | `struct virtio_net_hdr` mit `num_buffers`; bei `VIRTIO_F_VERSION_1` immer 12 Byte, nur der Legacy-Treiber ohne `MRG_RXBUF` hatte 10 | 5.1.6 Device Operation, Legacy Interface |
| `NET_BUF_SIZE` | `2048` | Empfangspuffer. Ohne `VIRTIO_NET_F_MRG_RXBUF` muss jeder Puffer einen ganzen Rahmen fassen, mindestens 1526 Byte (12 Kopf + 1514 Rahmen) | 5.1.6.3 Setting Up Receive Buffers |

Der Sendekopf wird genullt (`flags` 0, `gso_type` NONE, keine Prüfsummenauslagerung), weil keines der Offload-Features ausgehandelt wird. Die MAC wird byteweise gelesen; der Konfigurationsgenerationszähler wird nicht geprüft, weil die MAC statisch ist.

Reihenfolge der Aushandlung wie bei Block und Eingabe (`virtio_negotiate`): Reset, ACKNOWLEDGE, DRIVER, Features lesen, `VIRTIO_F_VERSION_1` Pflicht, gewünschte niedrige Bits mit dem Angebot verschneiden, FEATURES_OK schreiben und zurücklesen, Queues (`virtio_queue_setup`), DRIVER_OK. Beleg: VIRTIO 1.2, 3.1.1 Driver Requirements: Device Initialization.

### QEMU-Nutzermodus (slirp)

Beleg: QEMU-Dokumentation "Using the user mode network stack" (`docs/system/devices/net.rst`), Abschnitt zu `-netdev user`.

| Symbol im Code | Wert | Bedeutung |
|---|---|---|
| `NET_IP_SELF` | `10.0.2.15` | erste Adresse, die der DHCP-Server des Nutzermodus vergibt; bis DHCP gebaut ist, fest eingetragen |
| `NET_IP_GATEWAY` | `10.0.2.2` | Gateway und Adresse des Hosts im Gastnetz |
| MAC des Gateways | `52:55:0a:00:02:02` | Antwort auf die ARP-Anfrage, entspricht `52:55` gefolgt von der IP `0a:00:02:02` |

Die Gast-MAC `52:54:00:12:34:56` ist die QEMU-Voreinstellung für die erste Netzwerkkarte. Beide MACs wurden am laufenden System bestätigt (`make check`).

### Ethernet, ARP, IPv4, ICMP

| Symbol im Code | Wert | Beleg |
|---|---|---|
| `ETH_TYPE_IP` `0x0800`, `ETH_TYPE_ARP` `0x0806` | EtherType | IEEE 802.3, IANA "IEEE 802 Numbers" |
| Ethernet-Kopf: Ziel 0..5, Quelle 6..11, Typ 12..13 | 14 Byte | IEEE 802.3 |
| ARP-Felder `HTYPE` 0, `PTYPE` 2, `HLEN` 4, `PLEN` 5, `OPER` 6, `SHA` 8, `SPA` 14, `THA` 18, `TPA` 24 | 28 Byte, HTYPE 1 = Ethernet, OPER 1 Anfrage, 2 Antwort | RFC 826 |
| IPv4-Kopf: `VER_IHL` 0 (`0x45`), Gesamtlänge 2, ID 4, Flags 6, TTL 8, Protokoll 9, Prüfsumme 10, Quelle 12, Ziel 16 | 20 Byte, Protokoll 1 = ICMP | RFC 791 |
| ICMP: Typ 0, Code 1, Prüfsumme 2, ID 4, Sequenz 6 | Typ 8 Echo Request, Typ 0 Echo Reply | RFC 792 |
| Prüfsumme | Einerkomplement der 16-Bit-Summe im Netzwerkbyteorder, Übertrag zurückgefaltet, Prüfsummenfeld beim Rechnen 0 | RFC 1071 |

Alle Mehrbytefelder werden über `mem_read16be`, `mem_read32be`, `mem_write16be`, `mem_write32be` byteweise in Netzwerkbyteorder gelesen und geschrieben; es gibt keinen Wortzugriff, der von der Ausrichtung des Rahmens abhängt.

### Was noch fehlt

Empfang läuft per Abfrage aus der Hauptschleife (`net_poll` in `console_drain`), geweckt vom 30-Hz-Zeitgeber, noch nicht per Interrupt. Senden wartet auf die Fertigmeldung des Geräts (`net_send`), ein Sendepuffer. IP-Fragmente, Optionen, Prüfsummen eingehender IP-Köpfe und ARP-Cache-Alterung sind nicht behandelt. DHCP, UDP, DNS und TCP folgen.

## Netzwerk, Stufe 4: UDP und DHCP (14.09.2026)

| Symbol im Code | Wert | Beleg |
|---|---|---|
| `IP_PROTO_UDP` | `17` | RFC 791 / IANA Protocol Numbers |
| UDP-Kopf: Quellport 0, Zielport 2, Länge 4, Prüfsumme 6 | 8 Byte, Prüfsumme 0 = keine Prüfsumme (bei IPv4 erlaubt) | RFC 768 |
| `UDP_PORT_DHCP_SERVER`, `UDP_PORT_DHCP_CLIENT` | `67`, `68` | RFC 2131, Abschnitt 4.1 |
| BOOTP-Kopf: `op` 0, `htype` 1, `hlen` 2, `hops` 3, `xid` 4, `secs` 8, `flags` 10, `ciaddr` 12, `yiaddr` 16, `siaddr` 20, `giaddr` 24, `chaddr` 28 (16 Byte), `sname` 44 (64), `file` 108 (128) | Optionen ab 236 | RFC 2131, Abschnitt 2, Tabelle "Format of a DHCP message" |
| `DHCP_MAGIC` | `0x63825363` | Magic Cookie `99.130.83.99` vor den Optionen, RFC 2131 Abschnitt 3, RFC 1497 |
| `DHCP_FLAG_BROADCAST` | `0x8000` | höchstes Bit des Flags-Felds, Server antwortet per Broadcast, RFC 2131 Abschnitt 4.1 |
| Optionen 1 Subnetzmaske, 3 Router, 6 DNS, 50 angeforderte Adresse, 53 Nachrichtentyp, 54 Server-Kennung, 55 Parameterliste, 255 Ende, 0 Füllung | | RFC 2132 |
| Nachrichtentypen `DHCPDISCOVER` 1, `DHCPOFFER` 2, `DHCPREQUEST` 3, `DHCPACK` 5 | | RFC 2132, Abschnitt 9.6 |
| `DHCP_MIN_SIZE` | `300` | kleinste BOOTP-Nachricht, die ältere Server und Relays erwarten (RFC 1542 Abschnitt 2.1: "minimum 300 octets"); die Nachricht wird auf diese Länge mit Nullen aufgefüllt |
| `DHCP_XID_VALUE` | `0x61736d4f` | Transaktionskennung, ASCII "asmO", frei gewählt, Antworten mit anderer Kennung werden verworfen |
| `DHCP_RETRY_TICKS`, `DHCP_RETRY_MAX` | `60`, `5` | Wiederholung nach zwei Sekunden am 30-Hz-Zeitgeber, fünf Versuche, dann Meldung `DHCP KEINE ANTWORT`. Bewusste Festlegung, RFC 2131 empfiehlt exponentielles Backoff ab 4 s; im Nutzermodus antwortet der Server sofort |

Ablauf: `DHCPDISCOVER` (Quelle 0.0.0.0, Ziel 255.255.255.255, Broadcast-Flag), `DHCPOFFER` liefert `yiaddr` und Server-Kennung, `DHCPREQUEST` mit Option 50 und 54, weiterhin Quelle 0.0.0.0, `DHCPACK` setzt Adresse, Gateway, DNS und Maske. Erst danach ARP an das Gateway und Ping. Solange keine Adresse gebunden ist, nimmt der IP-Empfang jedes Ziel an, verarbeitet aber nur UDP-Port 68.

Gemessen im QEMU-Nutzermodus: `DHCP ip 10.0.2.15 gw 10.0.2.2 dns 10.0.2.3 mask 255.255.255.0`, deckungsgleich mit der QEMU-Dokumentation.

## Netzwerk, Stufe 5: DNS (14.09.2026)

| Symbol im Code | Wert | Beleg |
|---|---|---|
| `UDP_PORT_DNS` | `53` | RFC 1035, Abschnitt 4.2.1 |
| DNS-Kopf: ID 0, Flags 2, QDCOUNT 4, ANCOUNT 6, NSCOUNT 8, ARCOUNT 10 | 12 Byte | RFC 1035, Abschnitt 4.1.1 |
| `DNS_FLAG_RD` `0x0100`, `DNS_FLAG_QR` `0x8000`, RCODE in den unteren 4 Bit | | RFC 1035, Abschnitt 4.1.1 |
| Namensform: Längenbyte gefolgt von Zeichen je Label, abgeschlossen mit 0, Label höchstens 63 Zeichen | | RFC 1035, Abschnitt 3.1 und 2.3.4 |
| Kompressionszeiger: zwei Byte, obere zwei Bit `11` | beim Überspringen von Namen in Antworten | RFC 1035, Abschnitt 4.1.4 |
| Ressourceneintrag: Name, TYPE 2, CLASS 2, TTL 4, RDLENGTH 2, RDATA | `DNS_TYPE_A` 1, `DNS_CLASS_IN` 1, RDATA eines A-Eintrags ist 4 Byte | RFC 1035, Abschnitt 3.2.1 und 3.4.1 |
| `UDP_PORT_DNS_LOCAL` `4321`, `DNS_ID_VALUE` `0x6173` | fester Quellport und feste Kennung, Antworten mit anderer Kennung werden verworfen. Für eine einzelne Testanfrage ausreichend; echte Zufallswerte gegen Cache-Poisoning (RFC 5452) sind offen |
| `DNS_RETRY_TICKS` `90`, `DNS_RETRY_MAX` `3` | Wiederholung nach drei Sekunden, drei Versuche, dann `DNS KEINE ANTWORT` |

Der Nutzermodus von QEMU leitet Anfragen an `10.0.2.3` an den Resolver des Hosts weiter. Gemessen: `DNS example.com = 104.20.23.154`. Der Wert hängt vom Resolver ab und ist kein Beleg für eine Adresse, nur dafür, dass Anfrage und Antwort korrekt gebaut und ausgewertet werden. Alle Längen werden gegen das Ende des empfangenen Pakets geprüft, bevor gelesen wird.

## Netzwerk, Stufe 6: TCP-Client (14.09.2026)

| Symbol im Code | Wert | Beleg |
|---|---|---|
| `IP_PROTO_TCP` | `6` | RFC 791 / IANA Protocol Numbers |
| TCP-Kopf: Quellport 0, Zielport 2, Sequenz 4, Bestätigung 8, Datenoffset und Flags 12, Fenster 14, Prüfsumme 16, Dringend 18 | 20 Byte ohne Optionen; Datenoffset in 32-Bit-Wörtern in den oberen 4 Bit des Worts bei Offset 12 | RFC 793, Abschnitt 3.1 |
| Flags `FIN` 1, `SYN` 2, `RST` 4, `PSH` 8, `ACK` 16 | untere 6 Bit des Worts bei Offset 12 | RFC 793, Abschnitt 3.1 |
| `TCP_OPT_MSS` `2`, Länge 4, `TCP_MSS` `1460` | Option nur im SYN; 1460 = 1500 MTU − 20 IP − 20 TCP | RFC 793 Abschnitt 3.1, RFC 879 |
| Prüfsumme über Pseudokopf (Quell-IP, Ziel-IP, 0, Protokoll 6, TCP-Länge) und Segment | Nutzt `net_checksum_seed` mit der Summe des Pseudokopfs als Startwert | RFC 793, Abschnitt 3.1 "Checksum" |
| `TCP_LOCAL_PORT` `49152` | erster Port des dynamischen Bereichs | RFC 6335, Abschnitt 6 |
| `TCP_WINDOW_SIZE` `4096` | angebotenes Empfangsfenster, bewusst klein, da Daten sofort verarbeitet werden | Festlegung |
| `TCP_RETRY_TICKS` `45`, `TCP_RETRY_MAX` `4` | SYN und unbestätigte Daten werden nach 1,5 s neu gesendet, vier Versuche, dann `TCP KEINE ANTWORT` | Festlegung, RFC 6298 empfiehlt ab 1 s mit Verdopplung |
| `HTTP_PORT` `80`, Anfrage `GET / HTTP/1.0` mit `Host` | | RFC 1945, RFC 2616 |

Zustandsautomat (Ausschnitt aus RFC 793, Abschnitt 3.2): `CLOSED` → SYN gesendet → `SYN_SENT`; SYN+ACK mit Bestätigung ISS+1 → ACK gesendet → `ESTABLISHED`, sofort die Anfrage; Daten in Reihenfolge (Sequenz gleich `rcv_nxt`) werden übernommen und bestätigt, andere nur bestätigt (Duplikat-ACK, der Server sendet neu); FIN des Servers in Reihenfolge → FIN+ACK gesendet → `LAST_ACK`; Bestätigung des eigenen FIN → `CLOSED`. RST in jedem Zustand → `CLOSED`. Die Sequenznummer beginnt mit den unteren 32 Bit von `cntvct_el0` (RFC 793 verlangt einen taktbasierten Startwert; RFC 6528 empfiehlt zusätzlich einen geheimen Anteil, offen).

**Gefundener Fehler beim Bau:** Die Nutzlastlänge wurde aus der Rahmenlänge statt aus der IP-Gesamtlänge abgeleitet. Ein reines ACK ist per Ethernet auf 60 Byte aufgefüllt, die 6 Füllbytes wurden als Daten übernommen. Behoben in `net_ip_handle`: die verarbeitete Länge ist das Minimum aus Rahmenlänge und IP-Gesamtlänge (RFC 791, "Total Length"; RFC 894, Auffüllung auf Mindestlänge).

Nicht enthalten: Fenstersteuerung beim Senden (die Anfrage ist kleiner als jedes Fenster), Sendepuffer für mehr als ein Segment, gleichzeitige Verbindungen, `TIME_WAIT`, Optionen jenseits MSS, Prüfung eingehender Prüfsummen. Gemessen: `TCP SYN an 104.20.23.154:80`, `TCP VERBUNDEN, sende GET`, `HTTP HTTP/1.1 200 OK`, `TCP GESCHLOSSEN`. Sendepuffer und gleichzeitige Verbindungen sind seit Härtung 2 enthalten.

## Netzwerk, Härtung 1: Empfang per Interrupt (14.09.2026)

Gleicher Weg wie bei virtio-input: Interruptnummer = `VIRTIO_MMIO_IRQ_BASE` + Steckplatz (Basisadresse minus `VIRTIO_MMIO_BASE`, geteilt durch `VIRTIO_MMIO_STRIDE`), freigeschaltet über `gic_enable_irq`. Beleg für die Nummerierung: Device Tree der QEMU-virt-Maschine (`make dtb`), Eintrag `virtio_mmio@a000000` mit `interrupts = <0 16 1>` aufsteigend je Steckplatz, SPI 16 entspricht Interrupt-ID 48.

Im Handler (`irq_other`, außerhalb der Vektortabelle) wird `InterruptStatus` gelesen und nach `InterruptACK` zurückgeschrieben (VIRTIO 1.2, 4.2.2 MMIO Device Register Layout: Bit 0 "Used Buffer Notification"), dann nur das Merkmal `net_pending` gesetzt. Verarbeitet wird in der Hauptschleife (`console_drain` → `net_poll`), wie bei allen anderen Ereignisquellen.

Die Protokoll-Zeitgeber (DHCP, DNS, TCP-Wiederholung) laufen über `net_tick`, ausgelöst vom 30-Hz-Zeitgeber, aber nur solange `net_timer_armed` gesetzt ist. Scharf gestellt wird beim Senden einer Nachricht, die eine Antwort erwartet; `net_timer_check` löscht das Merkmal, sobald kein Zustand mehr wartet. Gemessen über 10 s: 14 Interrupts, 2 Netz-Ticks, danach null Netzarbeit.

**Nebenbefund:** `console_pending` lag im Füllraum von Vektoreintrag 3 und überschritt mit zwei neuen Merkmalen die 128 Byte; die Linker-Zusicherung hat es gemeldet. Getauscht gegen `net_timer_arm` und `net_timer_check` (108 Byte), `console_pending` liegt jetzt in `.text`.

**Nachtrag, stumme Verschiebung der Vektortabelle:** Die fünf neuen Zeilen in `timer_tick` ließen `.text.boot` auf 2.064 Byte wachsen, 16 über der 2048er-Grenze. Der Linker rückte die Vektortabelle auf Offset 4096 und füllte 2.032 Byte, ohne Meldung; aufgefallen nur am Größensprung von 33.016 auf 35.336 Byte. Behoben durch Verschieben von `string_starts_with` (36 Byte) aus `.text.boot`, Füllung jetzt 16 Byte. Neue Zusicherung im Linkerskript: `vec_table - ADDR(.text) == 0x800`, ein Überlauf des Startblocks ist damit ein Baufehler. Regel: Wer Code in `.text.boot` (`boot_`, `vec_init`, `fwcfg_`, `mmu_`, `fdt_`, `gic_`, `timer_`) ändert, prüft die Füllung in `kernel.map`.

## Netzwerk, Härtung 2: Verbindungstabelle (14.09.2026)

Der Verbindungsblock (TCB, RFC 793 Abschnitt 3.2 "Transmission Control Block") liegt viermal in `tcp_table`, je `TCB_SIZE` = 48 + 1024 Byte:

| Feld | Offset | Breite | Inhalt |
|---|---|---|---|
| `TCB_STATE` | 0 | 1 | `CLOSED` 0, `SYN_SENT` 1, `ESTABLISHED` 2, `LAST_ACK` 3, `FIN_WAIT_1` 4, `FIN_WAIT_2` 5 |
| `TCB_TRIES` | 1 | 1 | Wiederholungen seit der letzten Bestätigung |
| `TCB_SEEN` | 2 | 1 | frei für den Aufrufer (HTTP: erste Zeile schon ausgegeben) |
| `TCB_LOCAL_PORT` | 4 | 4 | `TCP_LOCAL_PORT_BASE` + Platznummer |
| `TCB_REMOTE_IP`, `TCB_REMOTE_PORT` | 8, 12 | 4, 4 | Gegenstelle |
| `TCB_ISS`, `TCB_SND_NXT`, `TCB_SND_UNA`, `TCB_RCV_NXT` | 16, 20, 24, 28 | 4 | Sequenzvariablen nach RFC 793 Abschnitt 3.3 |
| `TCB_TIMER` | 32 | 4 | Ticks seit dem letzten Senden |
| `TCB_TX_LEN` | 36 | 4 | belegte Bytes im Sendepuffer, gezählt ab `SND_UNA` |
| `TCB_HANDLER` | 40 | 8 | Routine, aufgerufen mit `x0` = TCB, `x1` = Daten, `w2` = Länge; Länge 0 bedeutet Verbindungsende |
| `TCB_TX_BUF` | 48 | 1024 | Sendepuffer |

Schnittstelle: `tcp_open(w0 IP, w1 Port, x2 Handler)` gibt den TCB oder 0 (`TCP TABELLE VOLL`) zurück, `tcp_write(x0 TCB, x1 Daten, w2 Länge)` legt in den Puffer und sendet sofort, was in `ESTABLISHED` gesendet werden darf, `tcp_close(x0 TCB)` sendet FIN und geht nach `FIN_WAIT_1`. Eingehende Segmente werden über Zielport, Quellport und Quelladresse (`net_last_src`) dem Platz zugeordnet; unbekannte Vierertupel werden verworfen, ohne RST (RFC 793 verlangt RST, offen).

Senden: `tcp_flush` schickt alles zwischen `SND_NXT` und `SND_UNA + TX_LEN` in Segmenten bis `TCP_MSS`; das Empfangsfenster der Gegenstelle wird noch nicht beachtet (die Sendemenge des Systems ist mit 1 KB kleiner als jedes übliche Fenster). Eine Bestätigung im Bereich `SND_UNA < ACK ≤ SND_NXT` rückt `SND_UNA` vor und schiebt die bestätigten Bytes aus dem Puffer (RFC 793 Abschnitt 3.9, "SEGMENT ARRIVES", fünfter Schritt). Wiederholung nach `TCP_RETRY_TICKS` ab `SND_UNA`, nach `TCP_RETRY_MAX` Versuchen `TCP KEINE ANTWORT`; `FIN_WAIT_2` wird ebenfalls gezählt und nach derselben Frist beendet, damit kein Platz an einer Gegenstelle hängen bleibt, die ihr FIN nie schickt.

Abbau: FIN der Gegenstelle in `ESTABLISHED` → FIN+ACK → `LAST_ACK`; in `FIN_WAIT_1` (gleichzeitiger Abbau) → ACK → `LAST_ACK`; in `FIN_WAIT_2` → ACK → `CLOSED`. Kein `TIME_WAIT`: der Platz ist sofort wieder frei, und die Startsequenz der nächsten Verbindung stammt aus `cntvct_el0` plus Platznummer × 65536, so dass sich alte Segmente nicht mit neuen überlagern sollten; RFC 793 fordert `TIME_WAIT` mit 2 × MSL, offen.

Der Zeitgeber ist nur scharf, solange ein Platz wartet: `tcp_tick` gibt in `w0` zurück, ob ein Platz in `SYN_SENT`, `LAST_ACK`, `FIN_WAIT_1`, `FIN_WAIT_2` oder mit unbestätigten Daten ist; `net_tick` verknüpft das mit DHCP und DNS und schreibt `net_timer_armed` direkt (das frühere `net_timer_check` ist entfallen, im Füllraum von Vektoreintrag 3 liegt jetzt `net_put_ip`).

Gemessen mit einem Testbau, der fünf Verbindungen gleichzeitig öffnet: vier `TCP VERBUNDEN`, vier `HTTP HTTP/1.1 200 OK`, vier `TCP GESCHLOSSEN`, einmal `TCP TABELLE VOLL`. Im normalen Bau über 10 s: 13 Interrupts, 5 gesendete Segmente, 2 Netz-Ticks, danach keine Netzarbeit.

## Netzwerk, Härtung 3: eingehende Prüfsummen (14.09.2026)

| Prüfung | Regel | Beleg |
|---|---|---|
| IP-Kopf | Einerkomplement-Summe über IHL × 4 Byte einschließlich Prüfsummenfeld muss 0 ergeben (`net_checksum` liefert das Komplement, also 0 bei gültigem Kopf) | RFC 791, Abschnitt 3.1 "Header Checksum"; RFC 1071, Abschnitt 1 |
| ICMP | Summe über die gesamte ICMP-Nachricht (IP-Nutzlast) muss 0 ergeben | RFC 792, "Checksum" |
| UDP | Summe über Pseudokopf (Quell-IP, Ziel-IP, 0, 17, UDP-Länge) und UDP-Länge Bytes muss 0 ergeben; Feld 0 bedeutet "keine Prüfsumme", dann keine Prüfung | RFC 768, "Checksum" |
| TCP | Summe über Pseudokopf (Quell-IP, Ziel-IP, 0, 6, Segmentlänge) und das Segment muss 0 ergeben | RFC 793, Abschnitt 3.1 "Checksum" |

Der Pseudokopf wird in `net_pseudo_sum(w0 Quell-IP, w1 Ziel-IP, w2 Protokoll, w3 Länge)` gebildet und als Startwert an `net_checksum_seed` übergeben; das Senden (`tcp_send`) benutzt dieselbe Routine. Die Ziel-IP des Pakets landet in `net_last_dst`, weil DHCP-Antworten an 255.255.255.255 gehen und die Summe mit der tatsächlichen Zieladresse gebildet werden muss, nicht mit der eigenen.

Voraussetzung: virtio-net liefert vollständige Prüfsummen, weil `VIRTIO_NET_F_GUEST_CSUM` nicht ausgehandelt wird (VIRTIO 1.2, 5.1.6.4.1: ohne dieses Merkmal sind die Flags im Paketkopf 0 und die Prüfsummen gültig). Wird das Merkmal später für Beschleunigung ausgehandelt, muss die Prüfung `VIRTIO_NET_HDR_F_NEEDS_CSUM` auswerten.

Ein verworfenes Paket meldet `NET PRUEFSUMME IP|ICMP|UDP|TCP`. Nachweis mit vier Testbauten, die je ein Byte im ankommenden Paket verfälschen (Bit 0 des TTL beziehungsweise des letzten Nutzlastbytes): jede Verfälschung wird an genau der erwarteten Stelle erkannt, der unverfälschte Bau läuft bis `HTTP HTTP/1.1 200 OK` durch. Über 10 s: 8 Aufrufe von `net_sum_check` (3 UDP, 5 TCP), 0 Fehlschläge.

## Netzwerk, Fehlersuche (14.09.2026)

| Fund | Behebung | Beleg |
|---|---|---|
| `timer_tick`: Netz-Zeitgeberabfrage hinter `cbz w1, timer_tick_blink`, lief nur bei aktiver Animation | eigenes Sprungziel `timer_tick_net`, keine Größenänderung in `.text.boot` (Füllung weiterhin 16 Byte) | Testbau DNS an 10.0.2.99: `DNS KEINE ANTWORT` nach 3 × 90 Ticks; Testbau TCP an 10.0.2.99:80: `TCP KEINE ANTWORT` nach 4 × 45 Ticks |
| IP-Fragmente (MF-Bit oder Fragment-Offset ≠ 0) wurden als vollständige Pakete verarbeitet | `IP_FRAGMENT_MASK` `0x3fff` über dem Wort bei Offset 6: Bit 13 "More Fragments" und 13 Bit Fragment-Offset; Treffer → `NET FRAGMENT VERWORFEN` | RFC 791, Abschnitt 3.1 "Flags" und "Fragment Offset" |
| `dns_skip_name` ohne Paketgrenze | zweites Argument `x1` = Paketende, Überschreiten liefert das Ende zurück, die Längenprüfungen dahinter greifen dann | RFC 1035, Abschnitt 4.1.4 (Namen als Labelfolge oder Zeiger) |

Bewusst nicht enthalten: Wiederzusammensetzen von Fragmenten (RFC 791, Abschnitt 3.2). Das System sendet mit `TCP_MSS` 1460 und bietet 4096 Byte Fenster, im Emulator entstehen keine Fragmente; auf echter Hardware hinter einem Router mit kleinerer MTU wäre es der nächste Schritt.

## Netzwerk, Härtung 4: Zufall für Kennungen, Ports und Startsequenz (14.09.2026)

| Symbol | Wert | Beleg |
|---|---|---|
| `net_random` | xorshift64 mit Verschiebungen 13, 7, 17; Zustand 64 Bit in `net_rand_state`, vor jedem Schritt mit `cntvct_el0` per XOR vermischt, Rückgabe die oberen 32 Bit; Zustand 0 wird durch `NET_RAND_SEED` ersetzt, weil xorshift bei 0 stehen bliebe | Marsaglia, "Xorshift RNGs", Journal of Statistical Software 8(14), 2003, Abschnitt 3, Tripel (13, 7, 17) für 64 Bit |
| `NET_RAND_SEED` | `0x9e3779b97f4a7c15` | 2⁶⁴ / φ, die übliche Konstante für Streuung (Knuth, TAOCP Band 3, Abschnitt 6.4, multiplikatives Hashing); hier nur Rückfall gegen den Nullzustand |
| DNS-Kennung | 16 Bit aus `net_random` je Anfrage, in `dns_id` gemerkt und in `dns_handle` verglichen | RFC 5452, Abschnitt 9.2: unvorhersagbare Kennung gegen untergeschobene Antworten |
| TCP-Quellport | `TCP_LOCAL_PORT_BASE` + (`net_random` und `TCP_PORT_MASK` `0x3fff`), also 49152 bis 65535, neu gezogen bei Gleichheit mit einem belegten Platz | RFC 6335, Abschnitt 6 (dynamischer Bereich); RFC 6056, Abschnitt 3.3.1 (Zufallsport) |
| TCP-Startsequenz | 32 Bit aus `net_random` | RFC 793, Abschnitt 3.3; RFC 6528 verlangt einen für Außenstehende nicht ableitbaren Anteil |
| RST in `SYN_SENT` | nur angenommen, wenn ACK gesetzt und `SEG.ACK` = `ISS` + 1 | RFC 793, Abschnitt 3.9, "SEGMENT ARRIVES", Zustand SYN-SENT, zweiter Schritt |

Einordnung: `virt` hat keinen Hardware-Zufall (kein `RNDR`, Cortex-A72 ist ARMv8.0). Die Entropie stammt aus dem Zeitgeberstand beim Start und bei jedem Aufruf, also aus dem Zeitpunkt, zu dem Pakete ankommen. Das genügt gegen blindes Raten von außen, ist aber kein kryptografischer Generator; für TLS (Meilenstein 11) braucht es eine eigene, belegte Quelle.

`dns_resolve` ist der neue öffentliche Einstieg (setzt `dns_tries` zurück und fällt in `dns_query`), `dns_query` bleibt der Wiederholpfad für `dns_tick`.

Nachweis über Paketmitschnitt (`-object filter-dump`): drei Starts liefern die DNS-Kennungen `0x3f9a`, `0x9d28`, `0x0c3c`, die Ports 61730, 50039, 64051 und die Startsequenzen `0x3f15b0f9`, `0xdacc08ce`, `0x6af503c9`. Kollisionsschutz: Testbau mit `TCP_PORT_MASK` 3 und vier Verbindungen ergab in zwei Läufen jeweils die vier verschiedenen Ports 49152 bis 49155 und viermal `HTTP/1.1 200 OK`. Regression RST: Testbau gegen 10.0.2.2:9 meldet `TCP RST VOM SERVER`.

## TLS, Baustein 1: SHA-256 (14.09.2026)

| Symbol | Wert | Beleg |
|---|---|---|
| `sha_k256` | 64 Rundenkonstanten, erste `0x428a2f98`, letzte `0xc67178f2` | FIPS 180-4, Abschnitt 4.2.2 (die ersten 32 Bit der Kubikwurzeln der ersten 64 Primzahlen) |
| `sha_iv` | `0x6a09e667 … 0x5be0cd19` | FIPS 180-4, Abschnitt 5.3.3 |
| Auffüllung | `0x80`, Nullen bis 56 mod 64, dann Länge in Bit als 64-Bit big-endian | FIPS 180-4, Abschnitt 5.1.1 |
| `sha256h`, `sha256h2`, `sha256su0`, `sha256su1` | vier Runden je Befehlspaar, Zustand `abcd` in `q0`, `efgh` in `q1`, `sha256h2` bekommt die Kopie von `abcd` vor der Runde | ARM DDI 0487, Abschnitt C7.2 (SHA256H: "SHA256 hash update (part 1)", SHA256H2, SHA256SU0 "schedule update 0", SHA256SU1) |
| Nachrichtenplan | `su0(W[t−16..t−13], W[t−12..t−9])`, dann `su1(…, W[t−8..t−5], W[t−4..t−1])`, zwölfmal, die letzten vier Runden ohne Plan | ARM DDI 0487, Pseudocode zu SHA256SU0/SU1; FIPS 180-4, Abschnitt 6.2.2 Schritt 1 |
| `ID_AA64ISAR0_EL1.SHA2`, Bits [15:12] | `0b0001` = SHA256 vorhanden, `0b0000` = nicht vorhanden | ARM DDI 0487, D19.2 (Register `ID_AA64ISAR0_EL1`, Feld SHA2) |
| `.arch armv8-a+crypto` | schaltet die Erweiterung im Assembler frei; Cortex-A72 (QEMU) und Apple Silicon (`hvf`) melden das Feld als 1 | binutils, "AArch64 Options", `-march` Erweiterung `crypto` |
| Byte-Reihenfolge | Eingabe und Ausgabe big-endian (`rev32`), Zustand intern in Maschinenreihenfolge | FIPS 180-4, Abschnitt 3.1 |

Testvektoren: `abc` und die 56-Byte-Nachricht aus FIPS 180-2, Anhang B.1 und B.2; leere Nachricht und eine Million `a` aus NIST CAVP (SHA Test Vectors for Hashing Byte-Oriented Messages) beziehungsweise FIPS 180-2 Anhang B.3; der 55-Byte-Grenzfall (Länge passt gerade noch in den Block, kein Füllblock) mit `hashlib` auf dem Entwicklungsrechner gebildet und im Erzeugungsskript gegen alle fünf Erwartungen nachgerechnet.

Kontext `SHA_CTX`: Zustand 0 (32 Byte), Puffer 32 (64), Byte-Zähler 96 (8), Füllstand 104 (4), Größe 112. `sha256_final` überschreibt den Kontext danach mit Nullen. `sha256_block` ist rahmenlos und ruft nichts auf; sie benutzt nur `v0`–`v7` und `v16`–`v19`, alle aufruferseitig zu sichern. Keine Unterbrechungsroutine des Systems benutzt NEON (geprüft: `timer_tick`, `uart_rx_isr`, `virtio_input_poll`), deshalb bleibt der Vektorzustand über einen Interrupt hinweg erhalten.

Gemessen: Selbsttest 15.625 Blöcke in 2,3 Mio. Befehlen, ein Block 117 Befehle. `SHA256 OK, 5 Testvektoren` unter TCG (Cortex-A72) und unter hvf (`-cpu host`, Apple Silicon).

Nächste Bausteine in dieser Reihenfolge: HMAC und HKDF (RFC 2104, RFC 5869) auf SHA-256, AES-128 (`aese`/`aesmc`) mit GCM (`pmull` für GHASH), X25519 (RFC 7748), dann der TLS-1.3-Handshake (RFC 8446).

**Fehlersuche (14.09.2026):** Differentialtest mit 201 Längen (0 bis 200) über Muster `(i·7+3) mod 256`, eingespeist in Stücken von `(Länge mod 17)+1` Byte, alle Ergebnisse gegen `hashlib.sha256` gleich. Durchgesehen: Registererhalt über alle `bl` (`x19`–`x22` in `update`/`final`, `sha256_block` rahmenlos ohne Aufruf), Füllpfad bei Füllstand 56 und 64 (`sha256_final_pad`), Zähler 64 Bit, `SCTLR_EL1.A` nie gesetzt (unausgerichtete `ld1`/`ldp` zulässig, ARM DDI 0487, SCTLR_EL1.A), keine NEON-Nutzung in `timer_tick`, `uart_rx_isr`, `virtio_input_poll`. Keine Fehler gefunden.

## TLS, Bausteine 2 und 3: HMAC und HKDF (14.09.2026)

| Symbol | Wert | Beleg |
|---|---|---|
| `HMAC_IPAD` `0x36`, `HMAC_OPAD` `0x5c` | innere und äußere Füllbytes, Blocklänge 64 | RFC 2104, Abschnitt 2 |
| Schlüssel länger als 64 Byte | wird mit SHA-256 auf 32 Byte gekürzt, dann wie ein kurzer Schlüssel mit Nullen aufgefüllt | RFC 2104, Abschnitt 2 ("keys longer than B bytes are first hashed") |
| `HMAC_CTX` | innerer SHA-Kontext bei 0 (112 Byte), äußerer Schlüsselblock (Schlüssel ⊕ opad) bei 112 (64 Byte), Größe 176 | Festlegung |
| `hkdf_extract(salt, ikm)` | `HMAC(salt, ikm)`; leeres Salz entspricht 32 Nullbytes, weil HMAC jeden Schlüssel mit Nullen auf 64 Byte auffüllt, deshalb keine Sonderbehandlung nötig | RFC 5869, Abschnitt 2.2 ("if not provided, it is set to a string of HashLen zeros") |
| `hkdf_expand(prk, info, L)` | `T(i) = HMAC(prk, T(i−1) ‖ info ‖ i)`, `i` als ein Byte ab 1, `L ≤ 255 · 32` | RFC 5869, Abschnitt 2.3 |
| Testvektoren HMAC | RFC 4231, Test Case 1, 2, 6, 7 | RFC 4231, Abschnitt 4 |
| Testvektoren HKDF | RFC 5869, Test Case 1 (Basis), 2 (80 Byte Salz, 82 Byte Ausgabe), 3 (ohne Salz, ohne Info) | RFC 5869, Anhang A |

Alle Erwartungswerte wurden im Erzeugungsskript mit `hmac`/`hashlib` neu berechnet und gegen die Anfangsbytes der RFC-Werte geprüft (`b0344c61`, `5bdcc146`, `60e43159`, `9b09ffa7`, PRK `07770936`, OKM `3cb25f25`, `b11e398d`, `8da4e775`), bevor sie in `kernel.S` kamen.

Speicherhygiene: `hmac_init` baut den inneren Füllblock auf dem Stack und überschreibt ihn danach (`mem_wipe`); `hmac_final` nullt den äußeren Schlüsselblock und den inneren Zwischenwert; `hkdf_expand` nullt `T` am Ende. `hmac_compute` und `hkdf_expand` halten ihren Kontext ausschließlich im eigenen Stackrahmen (224 beziehungsweise 288 Byte).

Gemessen: `HMAC OK, 4 Testvektoren`, `HKDF OK, 3 Testvektoren` unter TCG und hvf; Start weiterhin 476,8 Mio. Befehle. Der Startblock `.text.boot` war nach zwei Selbsttest-Aufrufen bei 8 Byte Füllung; seit `crypto_selftest` sind es wieder 16.

## TLS, Baustein 4: AES-128-GCM (14.09.2026)

| Symbol | Wert | Beleg |
|---|---|---|
| `aes_rcon` | `01 02 04 08 10 20 40 80 1b 36` | FIPS 197, Abschnitt 5.2 (Rcon) |
| Schlüsselaufbereitung | `w[i] = w[i−4] ⊕ SubWord(RotWord(w[i−1])) ⊕ Rcon` für `i ≡ 0 mod 4`, sonst `w[i] = w[i−4] ⊕ w[i−1]`; im Code als Präfix-XOR über die vier Wörter mit `ext` | FIPS 197, Abschnitt 5.2, Abbildung 11 |
| `aese v, 0` als SubWord | `AESE` rechnet AddRoundKey, SubBytes, ShiftRows; mit Nullschlüssel und vier gleichen Wörtern ist ShiftRows wirkungslos, es bleibt SubBytes | ARM DDI 0487, C7.2 AESE; FIPS 197 Abschnitt 5.1.1 und 5.1.2 |
| `ext v, v, v, #1` als RotWord | Bytes um eins nach unten rotieren; bei vier gleichen Wörtern rotiert jedes Wort in sich | FIPS 197, Abschnitt 5.2 (RotWord) |
| Rundenfolge | 9 × (`aese`, `aesmc`) mit Schlüssel 0 bis 8, dann `aese` mit Schlüssel 9 und XOR Schlüssel 10 (letzte Runde ohne MixColumns) | FIPS 197, Abschnitt 5.1, Abbildung 5; ARM DDI 0487 AESE/AESMC |
| `H = E_K(0¹²⁸)`, `J0 = IV ‖ 0³¹ ‖ 1` bei 96-Bit-IV, Zähler `inc32` big-endian im letzten Wort, erster Datenblock mit Zähler 2 | NIST SP 800-38D, Abschnitt 7.1 Schritte 1 bis 3, Abschnitt 6.2 (inc32) |
| GHASH | `Y_i = (Y_{i−1} ⊕ X_i) · H`, Eingabe `A ‖ 0^v ‖ C ‖ 0^u ‖ len64(A) ‖ len64(C)`, Längen in Bit big-endian | NIST SP 800-38D, Abschnitt 6.4 und 7.1 Schritt 5 |
| Tag | `T = GHASH ⊕ E_K(J0)` | NIST SP 800-38D, Abschnitt 7.1 Schritt 6 |
| Bitreihenfolge | GCM zählt Bit 0 als höchstwertiges Bit von Byte 0; ein Prozessorwort zählt Bit `8·Byte + Bit` aufsteigend. `rbit` je Byte bildet GCM-Bit `i` genau auf Grad `i` ab, die Bytefolge bleibt. Danach ist die Multiplikation eine gewöhnliche Polynommultiplikation modulo `x¹²⁸ + x⁷ + x² + x + 1` | NIST SP 800-38D, Abschnitt 6.3 (Blockmultiplikation, Polynom `R = 11100001 ‖ 0¹²⁰`); Herleitung im Text |
| `GCM_POLY_R` `0x87` | die unteren Bits von `x¹²⁸ mod P`, also `x⁷ + x² + x + 1`; Reduktion in zwei Schritten (`h₀·R`, `h₁·R·x⁶⁴`, Überhang von `h₁·R` noch einmal mit `R`) | NIST SP 800-38D, Abschnitt 6.3 |
| `pmull`/`pmull2` | Polynommultiplikation 64 × 64 → 128 Bit ohne Übertrag, untere beziehungsweise obere Lane; vier Produkte je Multiplikation (Schulbuch), drei für die Reduktion | ARM DDI 0487, C7.2 PMULL, PMULL2 |
| `ID_AA64ISAR0_EL1.AES`, Bits [7:4] | `0b0010` = AES und PMULL/PMULL2 vorhanden, `0b0001` nur AES | ARM DDI 0487, D19.2 (ID_AA64ISAR0_EL1, Feld AES) |
| Testvektoren | McGrew, Viega, "The Galois/Counter Mode of Operation (GCM)", Test Case 1 bis 4 (AES-128); dieselben in NIST SP 800-38D beziehungsweise dem GCM-Spezifikationsentwurf | Werte im Erzeugungsskript mit `cryptography` (`AESGCM`) nachgerechnet und gegen die Anfangsbytes `58e2fcce`, `0388dace`/`ab6e47d4`, `42831ec2`/`4d5c2af3`, `5bc94fbc` geprüft |

Schnittstelle: `aes_gcm_setkey(x0 Kontext 192 Byte, x1 Schlüssel 16 Byte)`; `aes_gcm_encrypt(x0 Kontext, x1 IV 12 Byte, x2 AAD, x3 AAD-Länge, x4 Eingabe, x5 Länge, x6 Ausgabe, x7 Tag-Ausgabe)`; `aes_gcm_decrypt` gleich, `x7` ist der zu prüfende Tag, Rückgabe `w0` 0 bei Erfolg, 1 bei falschem Tag, dann ist die Ausgabe genullt. Beide laufen über `aes_gcm_run` mit `w8` als Richtung. Rahmen 144 Byte: Register, `J0`, Blockpuffer, ursprüngliche Länge und Ausgabeadresse. Rundenschlüssel liegen während des Aufrufs in `v16`–`v26`, `H` in `v27`, `R` in `v28`, Null in `v29`, `Y` in `v30`, `E_K(J0)` in `v31`; `aes_wipe_keys` nullt sie am Ende. `v8`–`v15` werden nicht benutzt (untere Hälften wären aufrufergesichert). Der Tagvergleich läuft ohne frühen Ausstieg (zwei `ldp`, `eor`, `orr`).

Nicht enthalten: IV-Längen außer 96 Bit (TLS 1.3 nutzt genau 96), AES-256, Beschleunigung durch Mehrfachblöcke je Runde. Die Multiplikation hat 7 `pmull` je Block; bei Bedarf ließe sich mit vorberechneten Potenzen von `H` auf 4 Blöcke je Reduktion kommen.

**Gefundener Fehler beim Bau:** erste Fassung mit `rbit` + Byteumkehr, Vektor 2 schlug fehl (Vektor 1 hat leere Nachricht, dort ist GHASH konstant null und prüft die Multiplikation nicht). Regel: Ein Selbsttest braucht mindestens einen Vektor, der jede Rechenstufe tatsächlich benutzt.

Gemessen: `AES-GCM OK, 4 Testvektoren, Manipulation erkannt` unter TCG und hvf, Start 476,8 Mio. Befehle, Bild unverändert.

**Fehlersuche AES-GCM (14.09.2026):** Differentialtest mit 64 Fällen (Länge `(i·11) mod 80`, AAD `i mod 37`, Schlüssel, IV, AAD und Klartext aus festen Mustern) gegen `cryptography.AESGCM`: 0 Abweichungen beim Verschlüsseln. Entschlüsseln an Ort und Stelle (`in == out`): vor dem Fix 60 Fehler (alle Längen, die kein Vielfaches von 16 sind), nach dem Fix 0. Ursache in `aes_gcm_run_partial`: GHASH über den Geheimtext wurde nach dem XOR aus `x23` gelesen, also nach dem Überschreiben. Behoben: beim Entschlüsseln wird der Teilblock vor dem XOR gehasht, beim Verschlüsseln danach aus der Ausgabe. Der Selbsttest (`aes_check`) kopiert den Geheimtext jetzt nach `aes_buf` und entschlüsselt dort an Ort und Stelle. Bei ganzen Blöcken war der Weg schon richtig (`ld1` vor `st1`). Zwei Fehler im Testbau selbst (Registerkollision `w3`/`x3`, überlappende Ablage von Schlüssel und IV) wurden erkannt, weil auch Fall 0 mit leerer Nachricht abwich, was die NIST-Vektoren ausschlossen.

Benannt, nicht angefasst: die Grenze von 2³²−2 Blöcken je Nonce wird nicht geprüft (TLS-Records sind höchstens 2¹⁴+256 Byte), `mem_wipe` nimmt die Länge 32-bittig.

## TLS, Baustein 5: X25519 (14.09.2026)

| Symbol | Wert | Beleg |
|---|---|---|
| Primzahl `p = 2²⁵⁵ − 19`, Darstellung vier 64-Bit-Glieder little-endian | `FE_FOLD` `38` = `2 · 19`, weil `2²⁵⁶ ≡ 38 (mod p)`; Überlauf über 256 Bit wird mit 38 multipliziert und unten addiert, zweimal, danach ist kein Übertrag mehr möglich | RFC 7748, Abschnitt 4.1; Rechnung im Text |
| `fe_mul` | Schulbuchprodukt 4 × 4 Glieder (`mul`/`umulh`, 16 Paare), 512-Bit-Zwischenergebnis, obere vier Glieder × 38 in die unteren gefaltet | Standardverfahren, z. B. Bernstein, "Curve25519: new Diffie-Hellman speed records" (2006), Abschnitt 4 |
| `fe_sub` | `a − b` mit Borgen, Borgen × 38 abziehen, zweimal; Maske aus `sbc xzr, xzr` | Rechnung wie oben mit negativem Vorzeichen |
| `X25519_A24` `121665` | `(486662 − 2) / 4` | RFC 7748, Abschnitt 5, Schritt `z_2 = E · (AA + a24 · E)` |
| Skalar-Klemmung | Byte 0 `&= 248`, Byte 31 `&= 127`, Byte 31 `\|= 64`; im Code auf 64-Bit-Glieder umgesetzt (`& −8`, `& 2⁶²−1`, `\| 2⁶²`) | RFC 7748, Abschnitt 5, "decodeScalar25519" |
| u-Koordinate | oberstes Bit maskiert (`& 2⁶³−1` im vierten Glied) | RFC 7748, Abschnitt 5, "decodeUCoordinate" |
| Montgomery-Leiter | Bit 254 bis 0, bedingter Tausch per `swap ^= k_t`, Formeln A, AA, B, BB, E, C, D, DA, CB, x₃, z₃, x₂, z₂ wortgleich aus dem RFC | RFC 7748, Abschnitt 5, Pseudocode |
| `fe_cswap` | Maske `−bit`, `t = (a ⊕ b) ∧ Maske`, `a ⊕= t`, `b ⊕= t`, keine Verzweigung | RFC 7748, Abschnitt 5, "cswap … in constant time" |
| `fe_invert` | `z^(p−2)` über die Kette 2, 9, 11, 2⁵−1, 2¹⁰−1, 2²⁰−1, 2⁴⁰−1, 2⁵⁰−1, 2¹⁰⁰−1, 2²⁰⁰−1, 2²⁵⁰−1, dann 5 Quadrierungen und × z¹¹ = z^(2²⁵⁵−21); 254 Quadrierungen, 11 Multiplikationen | Fermat, `z^(p−2) ≡ z⁻¹`; Kette wie in der Referenzimplementierung `ref10` (public domain), hier neu geschrieben |
| `fe_tobytes` | zweimal bedingt `p` abziehen (`subs`/`sbcs`, Auswahl per `csel` bei fehlendem Borgen), weil der teilreduzierte Wert bis knapp 2²⁵⁶ ≈ 2p reichen kann | RFC 7748, Abschnitt 5 (Ergebnis "encodeUCoordinate" kanonisch) |
| Testvektoren | RFC 7748, Abschnitt 5.2 (zwei Einzelrechnungen, Iterationstest nach 1 Durchlauf) und 6.1 (Alice, Bob, gemeinsames Geheimnis) | Werte im Erzeugungsskript mit `cryptography` (`X25519PrivateKey`) nachgerechnet und gegen die Anfangsbytes `c3da5537`, `95cbde94`, `8520f009`, `de9edb7d`, `4a5d9d5b`, `422c8e7a` geprüft |

Konstante Laufzeit: keine Verzweigung hängt vom Skalar oder von Zwischenwerten ab (Schleifenzähler feste 255 Schritte, Tausch per Maske, Reduktion per `csel`). `mul` und `umulh` gelten auf Cortex-A72 und Apple Silicon als datenunabhängig in der Laufzeit; das ist eine Annahme über die Mikroarchitektur, kein Beleg aus dem ARM ARM, und für den Pi 5 (Cortex-A76) gesondert zu prüfen.

Nicht enthalten: Prüfung auf Ergebnis 0 (RFC 7748, Abschnitt 6.1, "MAY check"), der 1.000er-Iterationstest (rund 400 Mio. Befehle, zu teuer für jeden Start), Beschleunigung über Radix 2⁵¹ oder Karatsuba.

Gemessen: `X25519 OK, 6 Testvektoren` unter TCG und hvf, sechs Vereinbarungen 2,5 Mio. Befehle (`fe_mul` 1,89 Mio.), Start 479,3 Mio., Bild unverändert.

**Fehlersuche X25519 (14.09.2026):** Differentialtest mit 42 Fällen gegen `cryptography` und Python-Ganzzahlen: 32 Paare `(k, u)` aus Mustern, `u = p + 9` und `u = 9 + 2²⁵⁵` (nichtkanonische Kodierungen, RFC 7748 Abschnitt 5 verlangt Maskierung des obersten Bits und akzeptiert `u ≥ p`), acht Feldoperationen mit `a = 2²⁵⁶ − 1`: `a²`, `a + a`, `0 − 1`, `a − a`, `tobytes(a)`, `1 − a`, `121665 · a`, `a⁻¹`. 0 Abweichungen. Schranken nachgerechnet: `fe_add` Summe < 2²⁵⁷, nach Faltung des Übertrags (× 38) höchstens ein weiterer Übertrag, wenn die Summe ≥ 2²⁵⁷ − 38; `fe_sub` Borgen nach erstem Abzug nur, wenn `a − b + 2²⁵⁶ < 38`, dann kein drittes; `fe_mul` Übertrag der ersten Faltung ≤ 39, nach der zweiten ≤ 1, nach der dritten keiner. Durchgesehen: Registererhalt (`x19`–`x23` in `fe_mul`, `x19`–`x24` in `x25519`), Bitextraktion über `lsr`/`and` ohne Verzweigung, Stackbedarf der Kette `x25519` → `fe_invert` → `fe_sqr_n` → `fe_mul` rund 830 Byte von 16 KB. Keine Fehler gefunden.

## TLS 1.3, Handshake (14.09.2026)

| Symbol | Wert | Beleg |
|---|---|---|
| Record-Kopf | Typ (1), Version (2), Länge (2); Typen 20 CCS, 21 Alert, 22 Handshake, 23 Anwendungsdaten; Länge höchstens 2¹⁴ + 256 für verschlüsselte Records | RFC 8446, Abschnitt 5.1 und 5.2 |
| `legacy_record_version` `0x0301` im ClientHello, sonst `0x0303` | | RFC 8446, Abschnitt 5.1 |
| ClientHello | `legacy_version 0x0303`, `random` 32, `legacy_session_id` leer, `cipher_suites` `{0x13, 0x01}`, `legacy_compression_methods` `{0}`, Erweiterungen | RFC 8446, Abschnitt 4.1.2 |
| Erweiterungen | server_name (0) nach RFC 6066 Abschnitt 3; supported_groups (10) `x25519 = 0x001d`; signature_algorithms (13) `0x0403, 0x0804, 0x0401, 0x0807`; supported_versions (43) `0x0304`; key_share (51) `{0x001d, 32 Byte}` | RFC 8446, Abschnitt 4.2 und 4.2.3, 4.2.7, 4.2.8; RFC 8422 (Gruppen) |
| ServerHello | `cipher_suite` muss `0x1301` sein, `supported_versions` muss `0x0304` enthalten, `key_share` genau eine Gruppe; das besondere `random` `CF 21 AD 74 …` kennzeichnet HelloRetryRequest | RFC 8446, Abschnitt 4.1.3 und 4.1.4 |
| Schlüsselplan | `Early = Extract(0, 0)`, `Derived = Derive-Secret(Early, "derived", "")`, `Handshake = Extract(Derived, ECDHE)`, `c/s hs traffic = Derive-Secret(Handshake, "c hs traffic"/"s hs traffic", Transcript(CH..SH))`, `Master = Extract(Derive-Secret(Handshake, "derived", ""), 0)`, `c/s ap traffic = Derive-Secret(Master, "c ap traffic"/"s ap traffic", Transcript(CH..server Finished))` | RFC 8446, Abschnitt 7.1 |
| `HKDF-Expand-Label` | `HkdfLabel = uint16 Länge ‖ uint8 len("tls13 " + Label) ‖ "tls13 " + Label ‖ uint8 len(Context) ‖ Context`; `key` 16 Byte, `iv` 12 Byte, `finished` 32 Byte | RFC 8446, Abschnitt 7.1 und 7.3 |
| Transcript-Hash | SHA-256 über die Handshake-Nachrichten ohne Record-Köpfe; `Derive-Secret(…, "")` benutzt `SHA-256("")` (im Code die Konstante `sha_expect_empty`) | RFC 8446, Abschnitt 4.4.1 und 7.1 |
| Nonce | `IV ⊕ (Sequenznummer als 64 Bit big-endian, rechtsbündig in 12 Byte)`, Sequenz je Richtung ab 0, bei Schlüsselwechsel zurück auf 0 | RFC 8446, Abschnitt 5.3 |
| AEAD | AAD = Record-Kopf (5 Byte), Klartext = Inhalt ‖ Typ ‖ Nullen; beim Lesen Nullen vom Ende entfernen, letztes Byte ist der Typ | RFC 8446, Abschnitt 5.2 |
| Finished | `verify_data = HMAC(finished_key, Transcript-Hash)`; für das Server-Finished der Verlauf bis CertificateVerify, für das Client-Finished bis einschließlich Server-Finished | RFC 8446, Abschnitt 4.4.4 |
| ChangeCipherSpec | wird ignoriert (Middlebox-Kompatibilität) | RFC 8446, Anhang D.4 |
| Alert | Stufe (1 Warnung, 2 fatal), Beschreibung; `close_notify` = 0 | RFC 8446, Abschnitt 6 |
| NewSessionTicket nach dem Handshake | wird angenommen und verworfen, nicht in den Verlauf gerechnet | RFC 8446, Abschnitt 4.6.1 |

Ablauf im Code: `tls_connect` → ClientHello über `tcp_write` (wird beim Verbindungsaufbau gesendet) → `tls_on_data` setzt Records zusammen → `tls_process_record` (Klartext-Handshake nur im Zustand HELLO_SENT, verschlüsselt ab HANDSHAKE) → `tls_handshake_append` setzt Nachrichten zusammen → `tls_handshake_message` (ServerHello → `tls_keys_handshake`; EE, Certificate, CertificateVerify nur in den Verlauf; Finished → prüfen → `tls_keys_finish` sendet Client-Finished, wechselt die Schlüssel, sendet GET). Gesprächsverlauf als laufender SHA-256-Kontext, Zwischenstände über eine Kopie des Kontexts (`tls_transcript_hash`).

Nicht enthalten: Zertifikatsprüfung (nächster Schritt), HelloRetryRequest (wird erkannt und abgelehnt), PSK und Wiederaufnahme, KeyUpdate, mehrere Sitzungen, andere Cipher Suites oder Gruppen, Alerts vom Client außer über TCP-Schluss. Der Zufall für `random` und den Schlüsselanteil stammt aus `net_random` (xorshift mit Zeitgeber), das ist kein kryptografischer Generator, siehe Härtung 4.

Gemessen: zwei Läufe unter TCG durchgängig bis `HTTPS HTTP/1.1 200 OK` und `TLS ALERT 1 0` (close_notify), Zertifikat 3.682 Byte, Handshake rund 1,2 Mio. Befehle. Unter hvf kommt die Netzwerkkette nicht über `NET MAC` hinaus, auch am Stand vor TLS (Kernel 44.568 Byte); als bekannte Grenze in `CLAUDE.md` vermerkt.

## GICv3 und die hvf-Fehlersuche (14.09.2026)

Befund: Unter `-machine virt,accel=hvf` liefert QEMU 11.1.1 ausschließlich einen GICv3 (`hw/arm/virt.c`, Meldung `HVF does not support GICv2 emulation` bei `gic-version=2`), Device Tree `intc@8000000` mit `compatible = "arm,gic-v3"`, `reg = <0x8000000 0x10000 0x80a0000 0xf60000>`. Der bisherige GICv2-Code schrieb in nicht vorhandene Register (`GICC` bei `0x08010000`), es kam kein Interrupt an.

| Symbol | Wert | Beleg |
|---|---|---|
| Erkennung | Device Tree, Knoten `intc`, Eigenschaft `compatible` beginnt mit `arm,gic-v3`; sonst v2 | QEMU `hw/arm/virt.c` (`create_gic`, `fdt_add_gic_node`); Device-Tree-Spezifikation v0.4, Abschnitt 2.3.1 (`compatible`) |
| `GICD_PIDR2` | `0xffe8` beim GICv3 (64-KB-Rahmen), beim GICv2 in QEMU `0xfe8` (4-KB-Rahmen, `gic_id_gicv2[]`, PIDR2 `0x2b`); ein Lesezugriff auf `0x08000000 + 0xffe8` beim v2 löst einen externen Abort aus (`esr 0x96000010`) | QEMU `hw/intc/arm_gic.c` Zeile 55 und 1136 ff.; `hw/intc/gicv3_internal.h` `GICD_IDREGS 0xFFD0` |
| `GICD_CTLR` v3 | Bit 4 ARE, Bit 1 EnableGrp1; in QEMU ohne Sicherheitserweiterung ist ARE RAO/WI und Bit 1 `EN_GRP1NS` | `gicv3_internal.h` Zeilen 31, 63, 67; `arm_gicv3_dist.c` `case GICD_CTLR` (Maske `EN_GRP0 \| EN_GRP1NS`); GIC Architecture Specification IHI 0069, GICD_CTLR |
| `GICD_IGROUPR` `0x080`, `GICD_ISENABLER` `0x100`, `GICD_IPRIORITYR` `0x400`, `GICD_IROUTER` `0x6000` (8 Byte je Interrupt, Affinität 0 = Kern 0) | | `gicv3_internal.h` Zeilen 41, 42, 48, 58 |
| Redistributor `GICR_BASE` `0x080a0000`, SGI-Rahmen bei `+0x10000` | Kern 0 ist der erste Rahmen | `hw/arm/virt.c` `VIRT_GIC_REDIST`; `gicv3_internal.h` `GICR_SGI_OFFSET 0x10000` |
| `GICR_WAKER` `0x014`, Bit 1 ProcessorSleep löschen, warten bis Bit 2 ChildrenAsleep 0 | | `gicv3_internal.h` Zeilen 93, 139, 140; `arm_gicv3_redist.c` `case GICR_WAKER` |
| `GICR_IGROUPR0` `SGI+0x080`, `GICR_ISENABLER0` `SGI+0x100`, `GICR_IPRIORITYR` `SGI+0x400` | für PPI 27 (Zeitgeber) | `gicv3_internal.h` Zeilen 104, 105, 111 |
| Gruppe 1 | Interrupts müssen in Gruppe 1 stehen (Bit in IGROUPR gesetzt), sonst werden sie als FIQ gemeldet, den das System nicht bedient | IHI 0069, Kapitel 4.6 (Interrupt grouping) |
| `ICC_SRE_EL1` Bit 0 SRE, `ICC_PMR_EL1` `0xf0`, `ICC_IGRPEN1_EL1` Bit 0, `ICC_IAR1_EL1` (1023 = spurious), `ICC_EOIR1_EL1` | Systemregister-Schnittstelle | `arm_gicv3_cpuif.c` Registerliste (`ICC_SRE_EL1`, `ICC_PMR_EL1`, `ICC_IGRPEN1_EL1`, `ICC_IAR1_EL1`, `ICC_EOIR1_EL1`); `gicv3_internal.h` `INTID_SPURIOUS 1023` |

Nicht enthalten: EL2-Pfad mit `ICC_SRE_EL2` (das System startet unter `virt` und `hvf` in EL1; für `virtualization=on` mit GICv3 fehlt `ICC_SRE_EL2.Enable`), mehrere Kerne (nur Redistributor 0), LPIs, Prioritäten außer 0.

Nachweis: `make check` (GICv2, TCG), `make check MACHINE_EXTRA=,gic-version=3` (GICv3, TCG) und der hvf-Lauf (`-machine virt,accel=hvf -cpu host`) zeigen jeweils `GIC v2`/`GIC v3`, DHCP, DNS, `HTTP/1.1 200 OK`, `TLS HANDSHAKE FERTIG` und `HTTPS HTTP/1.1 200 OK`. Bild byteweise gleich. Kernel 49.597 Byte, `.text.boot`-Füllung 24 Byte (`fdt_find_prop` liegt im Startblock, GIC-Code in `.text`).

## TLS, Zertifikat Schritt A: ECDSA P-256 und CertificateVerify (14.09.2026)

| Symbol | Wert | Beleg |
|---|---|---|
| P-256: `p = 2²⁵⁶ − 2²²⁴ + 2¹⁹² + 2⁹⁶ − 1`, `a = −3`, `b = 5ac635d8…2604b`, `G`, `n = ffffffff00000000ffffffffffffffffbce6faada7179e84f3b9cac2fc632551` | | FIPS 186-4, Anhang D.1.2.3 (Curve P-256); SEC 2, Abschnitt 2.4.2; im Erzeugungsskript geprüft: `G` liegt auf der Kurve, `n·G = O` |
| Montgomery-Konstanten | `m' = −m⁻¹ mod 2⁶⁴`, `R² mod m`, `R mod m` mit `R = 2²⁵⁶`, je für `p` und `n`, vom Skript berechnet und als Daten abgelegt; `b`, `Gx`, `Gy` in Montgomery-Form | Montgomery, "Modular multiplication without trial division" (1985); CIOS-Variante nach Koç, Acar, Kaliski, "Analyzing and Comparing Montgomery Multiplication Algorithms" (1996), Abschnitt 5 |
| `mp_mont_mul` | CIOS mit `k` Gliedern aus dem Kontext, Zwischenfeld `k + 2` Wörter, Ergebnis `< 2m`, danach eine bedingte Subtraktion; Eingaben dürfen bis `2²⁵⁶` reichen, weil `T < (a·b + m·R)/R < 2m` für `a < R`, `b < m` | Koç et al., Abschnitt 5, Schranke in Abschnitt 2 |
| `mp_inv_mod` | `a^(m−2)` per Quadrieren und Multiplizieren über `64k` Bits; `m − 2` durch Abzug im untersten Glied (kein Borgen, weil `p₀ = 2⁶⁴ − 1` und `n₀ = f3b9cac2fc632551`) | Fermat; nur für öffentliche Werte, deshalb nicht in konstanter Zeit |
| `ec_dbl` | `dbl-2001-b` für `a = −3`: δ = Z², γ = Y², β = Xγ, α = 3(X−δ)(X+δ), X₃ = α² − 8β, Z₃ = (Y+Z)² − γ − δ, Y₃ = α(4β − X₃) − 8γ² | Bernstein, Lange, "Explicit-Formulas Database", Jacobi-Koordinaten, `dbl-2001-b` |
| `ec_add` | `add-2007-bl`: Z1Z1, Z2Z2, U1, U2, S1, S2, H = U2−U1, r = 2(S2−S1), I = (2H)², J = HI, V = U1·I, X₃ = r² − J − 2V, Y₃ = r(V − X₃) − 2·S1·J, Z₃ = ((Z1+Z2)² − Z1Z1 − Z2Z2)·H; Sonderfälle Z1 = 0, Z2 = 0, H = 0 (Verdopplung oder Unendlich) | EFD, `add-2007-bl` |
| `ecdsa_verify` | `1 ≤ r, s < n`, `Q` auf der Kurve (`y² = x³ − 3x + b`), `w = s⁻¹`, `u₁ = h·w`, `u₂ = r·w` (mod `n`), `R = u₁G + u₂Q ≠ O`, `x_R mod n = r`; `h` ist der volle SHA-256-Wert (256 Bit = Bitlänge von `n`) | FIPS 186-4, Abschnitt 6.4.2; RFC 6979, Abschnitt 2.3.2 (bits2int) |
| Testvektor | RFC 6979, Anhang A.2.5, P-256 mit SHA-256, Nachricht `sample`: `r = EFD48B2A…`, `s = F7CB1C94…` | RFC 6979, Anhang A.2.5; im Skript mit der Python-Referenz und `cryptography` nachgeprüft |
| DER | Tag, Länge (kurz `< 128`, lang `0x81`/`0x82` mit 1 oder 2 Längenbytes), Inhalt; `SEQUENCE 0x30`, `INTEGER 0x02`, `BIT STRING 0x03` (erstes Byte = ungenutzte Bits), `OBJECT IDENTIFIER 0x06`, `[0] 0xa0` | ITU-T X.690, Abschnitte 8.1.2, 8.1.3, 8.6, 8.19 |
| X.509 | `Certificate ::= SEQUENCE { tbsCertificate, signatureAlgorithm, signatureValue BIT STRING }`; `TBSCertificate ::= SEQUENCE { [0] version OPTIONAL, serialNumber, signature, issuer, validity, subject, subjectPublicKeyInfo, … }`; signiert wird die DER-Kodierung von `tbsCertificate` einschließlich Kopf | RFC 5280, Abschnitt 4.1 und 4.1.1.3 |
| OIDs | `ecPublicKey 1.2.840.10045.2.1 = 2a 86 48 ce 3d 02 01`, `prime256v1 1.2.840.10045.3.1.7 = 2a 86 48 ce 3d 03 01 07`; Schlüssel als unkomprimierter Punkt `04 ‖ X ‖ Y` (65 Byte) im BIT STRING | RFC 5480, Abschnitt 2.1.1 und 2.2; SEC 1, Abschnitt 2.3.3 |
| `ECDSA-Sig-Value ::= SEQUENCE { r INTEGER, s INTEGER }` | führende Nullbytes werden entfernt, Werte auf 32 Byte links aufgefüllt | RFC 5480, Anhang A; RFC 8446, Abschnitt 4.2.3 |
| CertificateVerify | `SignatureScheme ecdsa_secp256r1_sha256 = 0x0403`, Inhalt = 64 × `0x20` ‖ `"TLS 1.3, server CertificateVerify"` ‖ `0x00` ‖ Transcript-Hash(CH … Certificate), Signatur über SHA-256 davon | RFC 8446, Abschnitt 4.4.3 und 4.2.3 |
| Testdaten | Blattzertifikat von example.com vom 14.09.2026 (DER, 1.002 Byte, Aussteller "Cloudflare TLS Issuing ECC CA 3", Schlüssel P-256, Signatur ecdsa-with-SHA256) samt Schlüssel des Ausstellers; mit `openssl s_client -showcerts` geholt, Erwartungen mit `cryptography` bestätigt | Skript `ec1.py`; Werte in `x509_test_cert`, `x509_test_ca_key`, `x509_test_leaf_key` |

Nicht enthalten: Kette bis zur Wurzel (die beiden Zwischenzertifikate hängen über P-384 und SHA-384 am Wurzelzertifikat "SSL.com TLS ECC Root CA 2022"), Namensabgleich (SAN), Gültigkeitszeitraum, RSA, andere Kurven, Punktkompression. Der ClientHello bietet nur noch `ecdsa_secp256r1_sha256` an; ein Server mit RSA-Zertifikat scheitert damit sichtbar (`Signaturverfahren nicht ECDSA P-256`), statt still ungeprüft zu bleiben.

Gemessen: `ECDSA OK, RFC 6979 und echtes Zertifikat geprueft` unter TCG und hvf; live `TLS SIGNATUR GEPRUEFT, ECDSA P-256`; Testbau mit gekipptem Bit in der Serversignatur: `TLS FEHLER: SIGNATUR DES SERVERS FALSCH`, kein `HTTPS`. Eine Prüfung rund 5,7 Mio. Befehle, `mp_mont_mul` 19,0 Mio. über 8 s (3,7 %). Bild unverändert, `.text.boot`-Füllung 24 Byte.

## Tastatur, Terminal und Netzwerkfenster (14.09.2026)

| Symbol | Wert | Beleg |
|---|---|---|
| `-device virtio-keyboard-device` | zweites virtio-input-Gerät (ID 18) neben dem Tablet | QEMU `hw/input/virtio-input-hid.c`, `virtio_keyboard_config[]` |
| `VIN_CFG_EV_BITS` `0x11` | Konfigurationsabfrage "welche Ereignisarten"; `subsel = EV_ABS`: Größe > 0 nur beim Tablet, 0 bei der Tastatur, daran wird unterschieden | QEMU `include/standard-headers/linux/virtio_input.h` Zeile 38 (`VIRTIO_INPUT_CFG_EV_BITS = 0x11`); VIRTIO 1.2, 5.8.4 |
| Tastenereignisse | `EV_KEY` (1), `code` = Linux-Tastencode, `value` 1 gedrückt, 0 losgelassen, 2 Wiederholung | QEMU `hw/input/virtio-input-hid.c` Zeile 91 ff. (`event.type = EV_KEY`, Code aus `keymap_qcode`); Linux `input-event-codes.h` |
| Tastencodes 1–57 | `KEY_ESC` 1, `KEY_1` 2 … `KEY_0` 11, `KEY_MINUS` 12, `KEY_EQUAL` 13, `KEY_BACKSPACE` 14, `KEY_TAB` 15, `KEY_Q` 16 … `KEY_P` 25, `KEY_LEFTBRACE` 26, `KEY_RIGHTBRACE` 27, `KEY_ENTER` 28, `KEY_A` 30 … `KEY_L` 38, `KEY_SEMICOLON` 39, `KEY_APOSTROPHE` 40, `KEY_GRAVE` 41, `KEY_LEFTSHIFT` 42, `KEY_BACKSLASH` 43, `KEY_Z` 44 … `KEY_M` 50, `KEY_COMMA` 51, `KEY_DOT` 52, `KEY_SLASH` 53, `KEY_RIGHTSHIFT` 54, `KEY_SPACE` 57 | QEMU `include/standard-headers/linux/input-event-codes.h` Zeilen 77–133 |
| Belegung | US-QWERTY, Umschalttaste für Großbuchstaben und Zweitzeichen; QEMU überträgt die physische Position, deshalb auf deutscher Tastatur Y/Z vertauscht | QEMU `ui/input-keymap-*`, Tabellen im Erzeugungsskript `gui1.py` |
| Fenster | 1180 × 1160 bei x = 100, 1330, 2560, y = 200; drei Puffer 3 × 5.475.200 Byte = 16.425.600 ≤ 16 MiB | Festlegung, Budget `WIN_BUF_BUDGET` |
| Mitschreiber | `uart_putc` sammelt Zeichen ab 0x20 bis 95 je Zeile, `BS` löscht, `LF` schließt ab; Zeilen mit Vorsilbe `NET `, `DHCP`, `ARP `, `PING`, `DNS `, `TCP `, `HTTP`, `TLS ` kommen ins Netzwerkfenster (24 Zeilen, Bildlauf) | Festlegung |

Nachweis: QMP `input-send-event` mit `qcode`-Tasten und Tablet-Klick (`typetest.py`): Eingabe nur bei fokussiertem Terminal, Bilder `typed1..3.png`. `VIRTIO KEYBOARD OK` auf der seriellen Leitung, Netzkette unverändert bis `HTTPS HTTP/1.1 200 OK`. Start 565,1 Mio. Befehle (vorher 508,9), Mehrkosten durch die Neuzeichnung des Netzwerkfensters je eintreffender Zeile. Bildvergleich seither mit Maske über dem Inneren des Netzwerkfensters (`maskcmp.py`), außerhalb byteweise gleich.

**Fehlersuche Terminal (14.09.2026):** Stresstest per QMP (`stresstest.py`): Löschen vor dem Prompt, 120 Zeichen je Zeile, 30 Zeilen Bildlauf, Umschalttaste, schnelles Tippen; keine Panik. `virtio_find_from`: Zähler jetzt `subs`/`b.le`, damit eine Startadresse hinter dem Bereich nicht negativ wird. `console_pending` prüft zusätzlich `key_head`/`key_tail`, damit ein Tastendruck zwischen Abarbeitung und `wfi` die Schleife sofort weckt. Keine weiteren Funde.

## TLS, Zertifikat Schritt B1: SHA-384 und P-384 (14.09.2026)

| Symbol | Wert | Beleg |
|---|---|---|
| SHA-512-Rundenkonstanten `sha512_k` | 80 × 64 Bit, erste `0x428a2f98d728ae22`, letzte `0x6c44198c4a475817`, vom Skript aus den Kubikwurzeln der ersten 80 Primzahlen berechnet und gegen die Randwerte des Standards geprüft | FIPS 180-4, Abschnitt 4.2.3 |
| SHA-384-Startwerte `sha384_iv` | `cbbb9d5dc1059ed8 … 47b5481dbefa4fa4` | FIPS 180-4, Abschnitt 5.3.4 |
| Runde | `Σ0 = ROTR28 ⊕ ROTR34 ⊕ ROTR39`, `Σ1 = ROTR14 ⊕ ROTR18 ⊕ ROTR41`, `σ0 = ROTR1 ⊕ ROTR8 ⊕ SHR7`, `σ1 = ROTR19 ⊕ ROTR61 ⊕ SHR6`, Ch, Maj; Block 128 Byte, Länge 128 Bit big-endian, Ausgabe die ersten 48 Byte des Zustands | FIPS 180-4, Abschnitte 4.1.3, 5.1.2, 6.4.2, 6.5 |
| Vektoren | `abc`, leere Nachricht, 896-Bit-Nachricht `abcdefghbcdefghi…nopqrstu` | FIPS 180-2, Anhang D.1 und D.2 (SHA-384); mit `hashlib` nachgerechnet |
| P-384 | `p = 2³⁸⁴ − 2¹²⁸ − 2⁹⁶ + 2³² − 1`, `a = −3`, `b = b3312fa7…ec2aef`, `G`, `n = ffffffff…cc52973`; im Skript geprüft: `G` auf der Kurve, `n·G = O` (Python-Referenz) | FIPS 186-4, Anhang D.1.2.4; SEC 2, Abschnitt 2.5.1 |
| Montgomery-Konstanten P-384 | `R = 2³⁸⁴`, `m'`, `R² mod m`, `R mod m` für `p` und `n`, `b`, `G` in Montgomery-Form, 6 Glieder | wie Schritt A |
| Kurvenkontext `EC_*` | `EC_PCTX`, `EC_NCTX`, `EC_B`, `EC_G`, `EC_BYTES`; Schlitz `EC_SLOT` 48, Punkt 144 | Festlegung |
| Hash-Anpassung in `ecdsa_verify` | die linken `min(hashlen, bytes)` Byte des Hashs, rechtsbündig in `bytes`; für SHA-256 mit P-384 also Nullen vorn, für SHA-384 mit P-256 die ersten 32 Byte | FIPS 186-4, Abschnitt 6.4.2 Schritt 2 (bits2int); RFC 6979, Abschnitt 2.3.2 |
| Vektor P-384 | RFC 6979, Anhang A.2.6, SHA-384, Nachricht `sample`: `r = 94EDBB92…`, `s = 99EF4AEB…` | mit Python-Referenz und `cryptography` nachgeprüft |

Gefundene Fehler beim Bau: `ec_mul` reservierte für den Eingabepunkt 96 Byte, schreibt aber `EC_POINT_SIZE` = 144 (Rahmen jetzt 352); `mp_add_mod`/`mp_sub_mod` mit zwei Zwischenwerten je `MP_BYTES_MAX` = 48 brauchen 144 Byte Rahmen, nicht 112. Beide schrieben in die gesicherten Register des Aufrufers (`elr = 0xfffffffe`). Gemessen: `SHA384 OK, 3 Testvektoren`, `ECDSA OK, P-256 und P-384, RFC 6979 und echtes Zertifikat` unter TCG und hvf; P-384-Prüfung rund 14 Mio. Befehle; Start 575,0 Mio.; Bild unverändert.

## TLS, Zertifikat Schritt B2: Kette, Wurzel, Name (15.09.2026)

| Symbol | Wert | Beleg |
|---|---|---|
| `oid_ecdsa_sha256` | `2a 86 48 ce 3d 04 03 02` (1.2.840.10045.4.3.2) | RFC 5758, Abschnitt 3.2; RFC 5480 |
| `oid_ecdsa_sha384` | `2a 86 48 ce 3d 04 03 03` (1.2.840.10045.4.3.3) | RFC 5758, Abschnitt 3.2 |
| `oid_secp384r1` | `2b 81 04 00 22` (1.3.132.0.34) | RFC 5480, Abschnitt 2.1.1.1; SEC 2, A.2 |
| Certificate-Nachricht | `certificate_request_context<0..2^8-1>`, `certificate_list<0..2^24-1>` aus `cert_data<1..2^24-1>` und `extensions<0..2^16-1>`; die Reihenfolge ist Blatt zuerst, jedes folgende Zertifikat beglaubigt das vorherige | RFC 8446, Abschnitt 4.4.2 |
| TBSCertificate | `[0] version`, `serialNumber`, `signature` (AlgorithmIdentifier), `issuer`, `validity`, `subject`, `subjectPublicKeyInfo`, optional `[1]`, `[2]`, `[3] extensions`; die Signatur des Zertifikats geht über die DER-Bytes des gesamten TBSCertificate | RFC 5280, Abschnitte 4.1 und 4.1.1.3 |
| Namensvergleich | Aussteller des Kindes gegen Inhaber des Elternteils als vollständige DER-Bytes des `Name`; die Normalisierung nach RFC 5280 7.1 ist nicht umgesetzt, was bei CA-Zertifikaten in der Praxis identische Kodierung bedeutet (RFC 5280, 4.1.2.4: "The issuer field MUST match the subject field of the issuing CA, byte for byte" gilt seit RFC 5280 ausdrücklich für die DER-Kodierung) | RFC 5280, Abschnitt 4.1.2.4 |
| SubjectAltName | OID 2.5.29.17 = `55 1d 11`, `GeneralNames ::= SEQUENCE OF GeneralName`, `dNSName [2] IA5String` = Tag `0x82`; Extension = `SEQUENCE { extnID, critical BOOLEAN DEFAULT FALSE, extnValue OCTET STRING }` | RFC 5280, Abschnitt 4.2.1.6 und Anhang A |
| Platzhalter | `*.` nur ganz links, deckt genau eine Ebene; Vergleich ohne Groß/Klein | RFC 6125, Abschnitt 6.4.3; RFC 9525, Abschnitt 6.3 |
| Hash für die Signaturprüfung | SHA-256 bei `ecdsa-with-SHA256`, SHA-384 bei `ecdsa-with-SHA384`, jeweils über den TBS-Teil; die Kurve kommt aus dem Elternschlüssel, nicht aus dem Signaturalgorithmus | RFC 5758, Abschnitt 3.2 |
| Wurzel auf dem Datenträger | `ROOT.DER` als 8.3-Name `ROOT    DER`, Puffer `TLS_ROOT_SIZE` 2048; die Datei ist `roots/sslcom-tls-ecc-root-ca-2022.der` (574 Byte, aus dem macOS-Systemschlüsselbund) | Festlegung; Zertifikat siehe Commit 086cea9 |
| Kette von example.com | Blatt (P-256, `ecdsa-with-SHA256`) ← "Cloudflare TLS Issuing ECC CA 3" (P-256, `ecdsa-with-SHA384`) ← "SSL.com TLS Transit ECC CA R2" (P-384, `ecdsa-with-SHA384`) ← Wurzel (P-384); viertes Zertifikat der Nachricht: Kreuzzertifikat der Wurzel durch "AAA Certificate Services" (RSA, `sha256WithRSAEncryption`), wird nicht geparst | mit `openssl x509 -text` an den mitgeschnittenen Zertifikaten geprüft |

Gegenproben (15.09.2026): ohne `ROOT.DER` → `keine Wurzel geladen`; Wurzel mit gekipptem Bit im Schlüssel → `ZERTIFIKATSKETTE UNGUELTIG`; Blattzertifikat als Wurzel → `AUSSTELLER UNBEKANNT`; Testbau mit `example.org` → `NAME PASST NICHT ZUM ZERTIFIKAT`. Positiv: `TLS KETTE GEPRUEFT: 3 Zertifikate bis zur Wurzel` unter TCG GICv2, GICv3 und hvf. Start 599,1 Mio. Befehle, `mp_mont_mul` 82,2 Mio.

## TLS, Zertifikat Schritt C: Uhr und Gültigkeitszeitraum (15.09.2026)

| Symbol | Wert | Beleg |
|---|---|---|
| PL031 in `virt` | `memmap[VIRT_RTC] = { 0x09010000, 0x1000 }`, Device-Tree-Knoten `/pl031@9010000`, `compatible = "arm,pl031", "arm,primecell"`, `reg` mit je 2 Zellen für Basis und Größe | QEMU `hw/arm/virt.c`, `a15irqmap`/`base_memmap` und `create_rtc()` |
| Suche im Device Tree | Knotenname `pl031` (5 Zeichen, danach `@`), Eigenschaft `reg`, erste 8 Byte big-endian = Basis; der Kernel trägt keine feste Adresse ein | wie `fdt_find_memory` und `gic_init`; Devicetree Specification v0.4, Abschnitt 5.4 |
| `RTC_DR` | Offset `0x000`, 32 Bit, nur lesen, aktueller Zählerstand | ARM PrimeCell RTC (PL031) TRM, DDI 0224, Tabelle 3-1 (RTCDR); QEMU `hw/rtc/pl031.c`, `#define RTC_DR 0x00`, `pl031_read` → `pl031_get_count` |
| Bedeutung des Werts | `tick_offset + rtc_clock/1 s`, wobei `tick_offset` aus `qemu_get_timedate(&tm, 0)` und `mktimegm` gesetzt wird: Sekunden seit 1970-01-01 00:00:00 UTC, verschiebbar mit `-rtc base=<Datum>` | QEMU `hw/rtc/pl031.c`, `pl031_init`/`pl031_get_count`; QEMU-Handbuch, Option `-rtc` |
| Speicherabbildung | 0x09010000 liegt im ersten 1-GB-Block, der in `mmu_init` als `DESC_DEVICE` abgebildet ist | `mmu_init` |
| Datumsrechnung | `days_from_civil` und `civil_from_days` mit 400-Jahre-Ära (146.097 Tage), Monat März als Jahresanfang, Verschiebung 719.468 Tage zwischen 0000-03-01 und 1970-01-01 | Howard Hinnant, "chrono-Compatible Low-Level Date Algorithms"; sechs Vektoren gegen Python `calendar.timegm` (1970-01-01, 2000-02-29, 2026-09-15 04:34:56, 2038-01-19 03:14:08, 2100-03-01, 1999-12-31 23:59:59), jeweils hin und zurück |
| UTCTime | genau `YYMMDDHHMMSSZ`; `YY` ≥ 50 → 19YY, sonst 20YY | RFC 5280, Abschnitt 4.1.2.5.1 |
| GeneralizedTime | genau `YYYYMMDDHHMMSSZ`, keine Sekundenbruchteile | RFC 5280, Abschnitt 4.1.2.5.2 |
| Zeitfelder des Blatts | `260729221008Z` = 1.785.363.008, `261027221721Z` = 1.793.139.441; Wurzel `220825163348Z` bis `460819163347Z` (= 2.418.309.227) | `openssl asn1parse` an den mitgeschnittenen Zertifikaten, Werte mit `calendar.timegm` |
| Prüfregel | `notBefore ≤ jetzt ≤ notAfter` für jedes Glied der Kette und die Wurzel; ohne Uhr wird die Verbindung abgewiesen | RFC 5280, Abschnitt 6.1.3 (a)(2); Entscheidung: keine stille Auslassung |

Gegenproben (15.09.2026): `-rtc base=2030-01-01T00:00:00` → `ZERTIFIKAT ABGELAUFEN`; `-rtc base=2020-01-01T00:00:00` → `ZERTIFIKAT NOCH NICHT GUELTIG`; `-rtc base=2026-10-27T22:17:15` (sechs Sekunden vor Ablauf des Blatts) → Kette geprüft, `HTTPS HTTP/1.1 200 OK`. Positiv unter TCG GICv2, GICv3 und hvf. Start 601,7 Mio. Befehle.

## Systemschrift Fira Code, zusammengesetzte Glyphen und deutsche Tastatur (16.09.2026)

| Symbol | Wert | Beleg |
|---|---|---|
| Herkunft der Schrift | Fira Code, SIL Open Font License 1.1. Das Projektverzeichnis enthält keine gebaute Schriftdatei, nur `FiraCode.glyphs`; der mitgelieferte Bauweg nutzt Docker. Gebaut nativ mit `fontmake 3.12.1` in einer eigenen Umgebung: `fontmake -g FiraCode.glyphs -o ttf -i ".* Regular"` | Quellverzeichnis des Projekts, Datei `LICENSE`; Ergebnis 204.776 Byte, SHA-256 beginnt `7861bf32` |
| Metriken | `unitsPerEm` 2000, `indexToLocFormat` 0 (kurze loca), `numGlyphs` 2060, `cmap` Format 4 unter Plattform 3 / Kodierung 1, feste Vorschubbreite 1200, also 0,6 Geviert, `yMin` −423, `yMax` 1747 | direkt aus den Tabellen `head`, `maxp`, `hmtx` der Datei gelesen |
| Zusammengesetzte Glyphen | Aufbau je Bauteil: 2 Byte Kennzeichen, 2 Byte Glyphennummer, dann die Argumente. Bit 0 `ARG_1_AND_2_ARE_WORDS`, Bit 1 `ARGS_ARE_XY_VALUES`, Bit 3 `WE_HAVE_A_SCALE` (2 Byte), Bit 5 `MORE_COMPONENTS`, Bit 6 `X_AND_Y_SCALE` (4 Byte), Bit 7 `TWO_BY_TWO` (8 Byte) | Microsoft OpenType-Spezifikation, Tabelle `glyf`, Abschnitt "Composite Glyph Description" |
| Beispiel ä | Glyphe 142 aus Bauteil 138 (`a`) mit Kennzeichen 0x0226 und Verschiebung 0,0 sowie Bauteil 1998 (`dieresis`) mit Kennzeichen 0x0006 und Verschiebung −16,−3 | aus der Datei gelesen |
| Bedarf dieser Schrift | 888 von 2.060 Glyphen sind zusammengesetzt, größte Schachtelungstiefe 3, höchster Punktbedarf 515 und höchste Konturzahl 96, beides nur bei Rasterflächen `░ ▒ ▓` und Zeichen des privaten Bereichs. Die Grenzen des Renderers bleiben bei 256 Punkten und 16 Konturen, überschreitende Glyphen melden `TTF GRENZE ERREICHT` | alle 2.060 Glyphen durchgerechnet |
| Grenze der Schachtelung | vier Ebenen, damit eine beschädigte Schrift mit einem Kreis aus Bauteilen den Stack nicht füllt. Jede Ebene kostet 112 Byte Stack | Entscheidung, gemessener Bedarf dieser Schrift ist 3 |
| Linux-Tastencodes | `KEY_MINUS` 12, `KEY_LEFTBRACE` 26, `KEY_RIGHTBRACE` 27, `KEY_SEMICOLON` 39, `KEY_APOSTROPHE` 40, `KEY_BACKSLASH` 43, `KEY_102ND` 86, `KEY_RIGHTALT` 100 | Linux, `include/uapi/linux/input-event-codes.h`; die virtio-Tastatur liefert genau diese Codes |
| Deutsche Belegung | Grundebene mit z und y vertauscht, `ß ´ ü + ö ä ^ #` an den genannten Tasten, Umschaltebene `! " § $ % & / ( ) = ? \` Ü * Ö Ä ° ' ; : _`, dritte Ebene über AltGr `² ³ { [ ] } \ @ € ~ µ \|` | Deutsche Standardbelegung T1, DIN 2137; am laufenden System über eingespeiste Tastendrücke geprüft |
| Zeichensätze | Die Tastentabellen liefern Unicode-Codepunkte, der Tastenring führt 16 Bit je Taste. Damit passt auch U+20AC hindurch, das in Latin-1 fehlt | Entscheidung |
