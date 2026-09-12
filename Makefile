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

DEVICES := -device ramfb -device virtio-mouse-device -global virtio-mmio.force-legacy=false -drive file=$(DISK),if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0

CHECK_SECONDS := 3
CHECK_EXPECT  := asmos
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

run: kernel.elf
	$(QEMU) -machine $(MACHINE) -cpu $(CPU) $(DEVICES) -serial stdio -kernel kernel.bin

serial: kernel.elf
	$(QEMU) -machine $(MACHINE) -cpu $(CPU) $(DEVICES) -nographic -kernel kernel.bin

debug: kernel.elf
	$(QEMU) -machine $(MACHINE) -cpu $(CPU) $(DEVICES) -nographic -kernel kernel.bin -s -S

shot: kernel.elf
	@rm -f $(SHOT)
	@( sleep 2; echo "screendump $(SHOT) -f png"; sleep 1; echo quit ) | \
	  $(QEMU) -machine $(MACHINE) -cpu $(CPU) $(DEVICES) -display none -serial null -monitor stdio -kernel kernel.bin >/dev/null 2>&1
	@if [ -f $(SHOT) ]; then \
	  echo "OK: $(SHOT) geschrieben"; \
	else \
	  echo "FEHLER: kein $(SHOT) erzeugt"; exit 1; \
	fi

check: kernel.elf
	@rm -f $(CHECK_LOG)
	@$(QEMU) -machine $(MACHINE) -cpu $(CPU) $(DEVICES) -display none -serial file:$(CHECK_LOG) -kernel kernel.bin & \
	  QPID=$$!; sleep $(CHECK_SECONDS); kill $$QPID 2>/dev/null; wait $$QPID 2>/dev/null; true
	@echo "--- $(CHECK_LOG) ---"
	@cat $(CHECK_LOG) 2>/dev/null || echo "(leer)"
	@echo "--------------------"
	@if grep -q '$(CHECK_EXPECT)' $(CHECK_LOG) 2>/dev/null; then \
	  echo "OK: '$(CHECK_EXPECT)' gefunden"; \
	else \
	  echo "FEHLER: '$(CHECK_EXPECT)' nicht in $(CHECK_LOG)"; exit 1; \
	fi

disk:
	@rm -f $(DISK)
	@dd if=/dev/zero of=$(DISK) bs=1m count=$(DISK_MB) 2>/dev/null
	@DEV=$$(hdiutil attach -nomount -imagekey diskimage-class=CRawDiskImage ./$(DISK) | head -1 | awk '{print $$1}'); \
	  newfs_msdos -F 32 -v $(DISK_LABEL) $$DEV >/dev/null 2>&1; \
	  hdiutil detach $$DEV >/dev/null 2>&1
	@hdiutil attach ./$(DISK) >/dev/null 2>&1
	@printf 'MONOLITH FAT32 TEST\nZeile zwei\n' > /Volumes/$(DISK_LABEL)/HELLO.TXT
	@printf 'zweite datei\n' > /Volumes/$(DISK_LABEL)/DATA.BIN
	@python3 -c "print(''.join('Zeile %04d ABCDEFGHIJKLMNOPQRSTUVWXYZ\n' % i for i in range(60)), end='')" > /Volumes/$(DISK_LABEL)/BIG.TXT
	@hdiutil detach /Volumes/$(DISK_LABEL) >/dev/null 2>&1
	@echo "OK: $(DISK) mit FAT32 und Testdateien erzeugt"

dtb:
	$(QEMU) -machine $(MACHINE),dumpdtb=virt.dtb -cpu $(CPU) -nographic
	dtc -I dtb -O dts -o virt.dts virt.dtb

clean:
	rm -f kernel.o kernel.elf kernel.bin kernel.lst kernel.map $(CHECK_LOG) $(SHOT)
	rm -f virt.dtb virt.dts

distclean: clean
	rm -f $(DISK)

.PHONY: all run serial debug check shot disk dtb clean distclean
