CROSS   := aarch64-elf-
AS      := $(CROSS)as
LD      := $(CROSS)ld
OBJCOPY := $(CROSS)objcopy
OBJDUMP := $(CROSS)objdump

QEMU    := qemu-system-aarch64
MACHINE := virt
MACHINE_EXTRA :=
CPU     := cortex-a72

DISK          := disk.img
DISK_MB       := 64
DISK_LABEL    := MONOLITH
FONT_NAME     := BabelSans-Oblique.ttf
FONT_STORE    := $(HOME)/.asmos/fonts/$(FONT_NAME)
FONT_ALT      := $(HOME)/Desktop/asmos-assets/$(FONT_NAME)
FONT_SRC      := $(firstword $(wildcard $(FONT_STORE) $(FONT_ALT)))

DEVICES := -m 256M -device ramfb -device virtio-tablet-device -device virtio-keyboard-device -netdev user,id=n0 -device virtio-net-device,netdev=n0 -global virtio-mmio.force-legacy=false -drive file=$(DISK),if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0

DISPLAY_OPT := -display cocoa,zoom-interpolation=on

CHECK_SECONDS := 3
TRACE_SECONDS := 6
CHECK_EXPECT  := BOOT OK
CHECK_FORBID  := PANIC
CHECK_LOG     := serial.log
SHOT          := screen.png

ASFLAGS := -g
.DELETE_ON_ERROR:
LDFLAGS := -T linker.ld -nostdlib --no-warn-rwx-segments

all: kernel.elf kernel.bin

kernel.o: kernel.S
	$(AS) $(ASFLAGS) -o $@ $<

kernel.elf: kernel.o linker.ld
	$(LD) $(LDFLAGS) -o $@ kernel.o -Map kernel.map
	$(OBJDUMP) -d $@ > kernel.lst

kernel.bin: kernel.elf
	$(OBJCOPY) -O binary $< $@

run: kernel.bin disk-required
	$(QEMU) -machine $(MACHINE) -cpu $(CPU) $(DEVICES) $(DISPLAY_OPT) -serial stdio -kernel kernel.bin

fast: kernel.bin disk-required
	$(QEMU) -machine $(MACHINE),accel=hvf -cpu host $(DEVICES) $(DISPLAY_OPT) -serial stdio -kernel kernel.bin

serial: kernel.bin disk-required
	$(QEMU) -machine $(MACHINE) -cpu $(CPU) $(DEVICES) -nographic -kernel kernel.bin

debug: kernel.bin disk-required
	$(QEMU) -machine $(MACHINE) -cpu $(CPU) $(DEVICES) -nographic -kernel kernel.bin -s -S

shot: kernel.bin disk-required
	@rm -f $(SHOT)
	@( sleep 2; echo "screendump $(SHOT) -f png"; sleep 1; echo quit ) | \
	  $(QEMU) -machine $(MACHINE) -cpu $(CPU) $(DEVICES) -display none -serial null -monitor stdio -kernel kernel.bin >/dev/null 2>&1
	@if [ -f $(SHOT) ]; then \
	  echo "OK: $(SHOT) geschrieben"; \
	else \
	  echo "FEHLER: kein $(SHOT) erzeugt"; exit 1; \
	fi

check: kernel.bin disk-required
	@rm -f $(CHECK_LOG)
	@$(QEMU) -machine $(MACHINE)$(MACHINE_EXTRA) -cpu $(CPU) $(DEVICES) -display none -serial file:$(CHECK_LOG) -kernel kernel.bin & \
	  QPID=$$!; sleep $(CHECK_SECONDS); kill $$QPID 2>/dev/null; wait $$QPID 2>/dev/null; true
	@echo "--- $(CHECK_LOG) ---"
	@cat $(CHECK_LOG) 2>/dev/null || echo "(leer)"
	@echo "--------------------"
	@if grep -qa '$(CHECK_FORBID)' $(CHECK_LOG) 2>/dev/null; then \
	  echo "FEHLER: '$(CHECK_FORBID)' im Log"; exit 1; \
	elif grep -qa '$(CHECK_EXPECT)' $(CHECK_LOG) 2>/dev/null; then \
	  echo "OK: '$(CHECK_EXPECT)' erreicht, kein '$(CHECK_FORBID)'"; \
	else \
	  echo "FEHLER: '$(CHECK_EXPECT)' nicht erreicht"; exit 1; \
	fi

disk-required:
	@test -f "$(DISK)" || { echo "FEHLER: $(DISK) fehlt. Zuerst make disk ausfuehren."; exit 1; }

font-store:
	@test -n "$(FONT_SRC)" || { \
	  echo "FEHLER: Systemschrift $(FONT_NAME) nicht gefunden."; \
	  echo "  gesucht in $(FONT_STORE)"; \
	  echo "  und in     $(FONT_ALT)"; \
	  echo "Sie liegt aus Lizenzgruenden nicht im Repository."; \
	  echo "Liegt sie noch in einem $(DISK), holt 'make font-rescue' sie zurueck."; \
	  exit 1; }
	@test -f "$(FONT_STORE)" || { \
	  mkdir -p "$(dir $(FONT_STORE))"; \
	  cp "$(FONT_SRC)" "$(FONT_STORE)"; \
	  chmod 444 "$(FONT_STORE)"; \
	  echo "HINWEIS: Sicherung der Systemschrift angelegt unter $(FONT_STORE)"; }

font-rescue:
	@set -eu; \
	  test -f "$(DISK)" || { echo "FEHLER: $(DISK) fehlt, daraus laesst sich nichts holen."; exit 1; }; \
	  MP=; \
	  trap 'if [ -n "$$MP" ]; then hdiutil detach "$$MP" >/dev/null 2>&1 || true; fi' EXIT HUP INT TERM; \
	  MP=$$(hdiutil attach -imagekey diskimage-class=CRawDiskImage "$(DISK)" | sed -n 's|.*\(/Volumes/.*\)|\1|p'); \
	  test -n "$$MP" && test -f "$$MP/FONT.TTF" || { echo "FEHLER: keine FONT.TTF in $(DISK)."; exit 1; }; \
	  mkdir -p "$(dir $(FONT_STORE))"; \
	  rm -f "$(FONT_STORE)"; \
	  cp "$$MP/FONT.TTF" "$(FONT_STORE)"; \
	  chmod 444 "$(FONT_STORE)"; \
	  echo "OK: Systemschrift zurueckgeholt nach $(FONT_STORE)"; \
	  shasum -a 256 "$(FONT_STORE)"

disk: font-store
	@set -eu; \
	  TMP=$$(mktemp "$(DISK).XXXXXX"); DEV=; MP=; \
	  trap 'if [ -n "$$MP" ]; then hdiutil detach "$$MP" >/dev/null 2>&1 || true; fi; if [ -n "$$DEV" ]; then hdiutil detach "$$DEV" >/dev/null 2>&1 || true; fi; rm -f "$$TMP"' EXIT HUP INT TERM; \
	  dd if=/dev/zero of="$$TMP" bs=1m count=$(DISK_MB) 2>/dev/null; \
	  DEV=$$(hdiutil attach -nomount -imagekey diskimage-class=CRawDiskImage "$$TMP" | awk 'NR == 1 {print $$1}'); \
	  test -n "$$DEV"; \
	  newfs_msdos -F 32 -v $(DISK_LABEL) "$$DEV" >/dev/null; \
	  hdiutil detach "$$DEV" >/dev/null; DEV=; \
	  MP=$$(hdiutil attach -imagekey diskimage-class=CRawDiskImage "$$TMP" | sed -n 's|.*\(/Volumes/.*\)|\1|p'); \
	  test -n "$$MP" && test -d "$$MP"; \
	  printf 'asmos FAT32 TEST\nZeile zwei\n' > "$$MP/HELLO.TXT"; \
	  printf 'zweite datei\n' > "$$MP/DATA.BIN"; \
	  : > "$$MP/EMPTY.TXT"; \
	  python3 -c "print(''.join('Zeile %04d ABCDEFGHIJKLMNOPQRSTUVWXYZ\n' % i for i in range(60)), end='')" > "$$MP/BIG.TXT"; \
	  cp "$(FONT_SRC)" "$$MP/FONT.TTF"; \
	  cp roots/sslcom-tls-ecc-root-ca-2022.der "$$MP/ROOT.DER"; \
	  dot_clean -m "$$MP" 2>/dev/null || true; \
	  rm -rf "$$MP"/._* "$$MP"/.DS_Store "$$MP"/.fseventsd "$$MP"/.Spotlight-V100 "$$MP"/.Trashes; \
	  hdiutil detach "$$MP" >/dev/null; MP=; \
	  mv -f "$$TMP" "$(DISK)"; \
	  echo "OK: $(DISK) erzeugt"

dtb:
	$(QEMU) -machine $(MACHINE),dumpdtb=virt.dtb -cpu $(CPU) -nographic
	dtc -I dtb -O dts -o virt.dts virt.dtb

trace: kernel.bin disk-required
	python3 tools/trace.py all $(TRACE_SECONDS)

clean:
	rm -f kernel.o kernel.elf kernel.bin kernel.lst kernel.map $(CHECK_LOG) $(SHOT)
	rm -f virt.dtb virt.dts

distclean: clean
	rm -f $(DISK)
	rm -rf build

.PHONY: all run fast serial debug check shot disk disk-required font-store font-rescue dtb trace clean distclean
