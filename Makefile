CROSS   := aarch64-elf-
AS      := $(CROSS)as
LD      := $(CROSS)ld
OBJCOPY := $(CROSS)objcopy
OBJDUMP := $(CROSS)objdump

QEMU    := qemu-system-aarch64
MACHINE := virt
CPU     := cortex-a72

DISK          := disk.img
DISK_MB       := 64
DISK_LABEL    := MONOLITH
FONT_SRC      := /Users/l3v0/Downloads/babel_sans/BabelSans-Oblique.ttf

DEVICES := -m 256M -device ramfb -device virtio-tablet-device -global virtio-mmio.force-legacy=false -drive file=$(DISK),if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0

CHECK_SECONDS := 3
CHECK_EXPECT  := BOOT OK
CHECK_FORBID  := PANIC
CHECK_LOG     := serial.log
SHOT          := screen.png

ASFLAGS := -g
LDFLAGS := -T linker.ld -nostdlib --no-warn-rwx-segments

all: kernel.elf kernel.bin

kernel.o: kernel.S
	$(AS) $(ASFLAGS) -o $@ $<

kernel.elf: kernel.o linker.ld
	$(LD) $(LDFLAGS) -o $@ kernel.o -Map kernel.map
	$(OBJDUMP) -d $@ > kernel.lst

kernel.bin: kernel.elf
	$(OBJCOPY) -O binary $< $@

run: kernel.bin
	$(QEMU) -machine $(MACHINE) -cpu $(CPU) $(DEVICES) -serial stdio -kernel kernel.bin

fast: kernel.bin
	$(QEMU) -machine $(MACHINE),accel=hvf -cpu host $(DEVICES) -serial stdio -kernel kernel.bin

serial: kernel.bin
	$(QEMU) -machine $(MACHINE) -cpu $(CPU) $(DEVICES) -nographic -kernel kernel.bin

debug: kernel.bin
	$(QEMU) -machine $(MACHINE) -cpu $(CPU) $(DEVICES) -nographic -kernel kernel.bin -s -S

shot: kernel.bin
	@rm -f $(SHOT)
	@( sleep 2; echo "screendump $(SHOT) -f png"; sleep 1; echo quit ) | \
	  $(QEMU) -machine $(MACHINE) -cpu $(CPU) $(DEVICES) -display none -serial null -monitor stdio -kernel kernel.bin >/dev/null 2>&1
	@if [ -f $(SHOT) ]; then \
	  echo "OK: $(SHOT) geschrieben"; \
	else \
	  echo "FEHLER: kein $(SHOT) erzeugt"; exit 1; \
	fi

check: kernel.bin
	@rm -f $(CHECK_LOG)
	@$(QEMU) -machine $(MACHINE) -cpu $(CPU) $(DEVICES) -display none -serial file:$(CHECK_LOG) -kernel kernel.bin & \
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

disk:
	@rm -f $(DISK)
	@dd if=/dev/zero of=$(DISK) bs=1m count=$(DISK_MB) 2>/dev/null
	@DEV=$$(hdiutil attach -nomount -imagekey diskimage-class=CRawDiskImage ./$(DISK) | head -1 | awk '{print $$1}'); \
	  if [ -z "$$DEV" ]; then echo "FEHLER: konnte $(DISK) nicht einbinden"; exit 1; fi; \
	  newfs_msdos -F 32 -v $(DISK_LABEL) $$DEV >/dev/null 2>&1 || { hdiutil detach $$DEV >/dev/null 2>&1; echo "FEHLER: newfs_msdos"; exit 1; }; \
	  hdiutil detach $$DEV >/dev/null 2>&1
	@MP=$$(hdiutil attach ./$(DISK) | grep -o '/Volumes/.*$$' | head -1); \
	  if [ -z "$$MP" ] || [ ! -d "$$MP" ]; then echo "FEHLER: kein Einhängepunkt"; exit 1; fi; \
	  printf 'asmos FAT32 TEST\nZeile zwei\n' > "$$MP/HELLO.TXT"; \
	  printf 'zweite datei\n' > "$$MP/DATA.BIN"; \
	  : > "$$MP/EMPTY.TXT"; \
	  python3 -c "print(''.join('Zeile %04d ABCDEFGHIJKLMNOPQRSTUVWXYZ\n' % i for i in range(60)), end='')" > "$$MP/BIG.TXT"; \
	  if [ -f "$(FONT_SRC)" ]; then cp "$(FONT_SRC)" "$$MP/FONT.TTF"; fi; \
	  hdiutil detach "$$MP" >/dev/null 2>&1; \
	  echo "OK: $(DISK) erzeugt, war eingebunden unter $$MP"

dtb:
	$(QEMU) -machine $(MACHINE),dumpdtb=virt.dtb -cpu $(CPU) -nographic
	dtc -I dtb -O dts -o virt.dts virt.dtb

clean:
	rm -f kernel.o kernel.elf kernel.bin kernel.lst kernel.map $(CHECK_LOG) $(SHOT)
	rm -f virt.dtb virt.dts

distclean: clean
	rm -f $(DISK)

.PHONY: all run fast serial debug check shot disk dtb clean distclean
