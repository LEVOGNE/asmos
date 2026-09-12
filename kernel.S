.equ UART_BASE,             0x09000000
.equ UART_DR,               0x00
.equ UART_FR,               0x18
.equ UART_IBRD,             0x24
.equ UART_FBRD,             0x28
.equ UART_LCRH,             0x2c
.equ UART_CR,               0x30
.equ UART_IMSC,             0x38
.equ UART_MIS,              0x40
.equ UART_ICR,              0x44

.equ UART_FR_TXFF,          (1 << 5)
.equ UART_FR_BUSY,          (1 << 3)
.equ UART_FR_RXFE,          (1 << 4)
.equ UART_IMSC_RXIM,        (1 << 4)
.equ UART_IMSC_RTIM,        (1 << 6)
.equ UART_INTID,            33
.equ UART_RX_RING_SIZE,     32
.equ UART_RX_RING_MASK,     31
.equ UART_CR_UARTEN,        (1 << 0)
.equ UART_CR_TXE,           (1 << 8)
.equ UART_CR_RXE,           (1 << 9)
.equ UART_LCRH_FEN,         (1 << 4)
.equ UART_LCRH_WLEN_8,      0x60
.equ UART_IBRD_115200,      13
.equ UART_FBRD_115200,      1

.equ MPIDR_AFF0_MASK,       0xff

.equ SCR_EL3_NS,            (1 << 0)
.equ SCR_EL3_SMD,           (1 << 7)
.equ SCR_EL3_HCE,           (1 << 8)
.equ SCR_EL3_RW,            (1 << 10)

.equ HCR_EL2_RW,            (1 << 31)
.equ CNTHCTL_EL2_EL1PCTEN,  (1 << 0)
.equ CNTHCTL_EL2_EL1PCEN,   (1 << 1)

.equ SCTLR_M,               (1 << 0)

.equ SPSR_EL2H_DAIF,        0x3c9
.equ SPSR_EL1H_DAIF,        0x3c5

.equ ASCII_ZERO,            0x30
.equ ASCII_CR,              0x0d
.equ ASCII_LF,              0x0a
.equ ASCII_BS,              0x08
.equ ASCII_SPACE,           0x20
.equ ASCII_UNDERSCORE,      0x5f
.equ HEX_ALPHA_ADJUST,      0x27
.equ HEX_NIBBLE_MASK,       0xf
.equ HEX_START_SHIFT,       60
.equ HEX_SHIFT_STEP,        4
.equ HEX_DIGIT_LIMIT,       10

.equ VEC_TABLE_ALIGN,       0x800
.equ VEC_ENTRY_ALIGN,       0x80

.equ GICD_BASE,             0x08000000
.equ GICC_BASE,             0x08010000
.equ GICD_CTLR,             0x000
.equ GICD_ISENABLER,        0x100
.equ GICD_IPRIORITYR,       0x400
.equ GICD_ITARGETSR,        0x800
.equ GIC_TARGET_CPU0,       1
.equ GICC_CTLR,             0x00
.equ GICC_PMR,              0x04
.equ GICC_IAR,              0x0c
.equ GICC_EOIR,             0x10

.equ GIC_ENABLE,            1
.equ GIC_PMR_UNMASKED,      0xf0
.equ GIC_INTID_MASK,        0x3ff
.equ GIC_INTID_SPURIOUS,    0x3ff

.equ TIMER_INTID,           30
.equ TIMER_CTL_ENABLE,      1
.equ TIMER_HZ,              2
.equ CLICK_WINDOW_MS,       400
.equ MS_PER_SECOND,         1000
.equ CLICK_MAX,             3

.equ FWCFG_BASE,            0x09020000
.equ FWCFG_DATA,            0x00
.equ FWCFG_SELECTOR,        0x08
.equ FWCFG_DMA,             0x10

.equ FWCFG_DMA_ERROR,       (1 << 0)
.equ FWCFG_DMA_READ,        (1 << 1)
.equ FWCFG_DMA_SKIP,        (1 << 2)
.equ FWCFG_DMA_SELECT,      (1 << 3)
.equ FWCFG_DMA_WRITE,       (1 << 4)

.equ FWCFG_TIMEOUT,         0x10000000
.equ FWCFG_KEY_RAM_SIZE,    0x0003
.equ FWCFG_KEY_FILE_DIR,    0x0019
.equ FWCFG_ENTRY_SIZE,      64
.equ FWCFG_ENTRY_SELECT,    4
.equ FWCFG_ENTRY_NAME,      8
.equ FWCFG_NAME_MAX,        56

.equ VIRTIO_MMIO_BASE,      0x0a000000
.equ VIRTIO_MMIO_STRIDE,    0x200
.equ VIRTIO_MMIO_COUNT,     32
.equ VIRTIO_MMIO_IRQ_BASE,  48

.equ VIRTIO_MAGIC,          0x74726976
.equ VIRTIO_REG_MAGIC,      0x000
.equ VIRTIO_REG_VERSION,    0x004
.equ VIRTIO_REG_DEVICE_ID,  0x008
.equ VIRTIO_REG_VENDOR_ID,  0x00c

.equ VIRTIO_REG_DEV_FEAT,       0x010
.equ VIRTIO_REG_DEV_FEAT_SEL,   0x014
.equ VIRTIO_REG_DRV_FEAT,       0x020
.equ VIRTIO_REG_DRV_FEAT_SEL,   0x024
.equ VIRTIO_REG_QUEUE_SEL,      0x030
.equ VIRTIO_REG_QUEUE_NUM_MAX,  0x034
.equ VIRTIO_REG_QUEUE_NUM,      0x038
.equ VIRTIO_REG_QUEUE_READY,    0x044
.equ VIRTIO_REG_QUEUE_NOTIFY,   0x050
.equ VIRTIO_REG_INT_STATUS,     0x060
.equ VIRTIO_REG_INT_ACK,        0x064
.equ VIRTIO_REG_STATUS,         0x070
.equ VIRTIO_REG_DESC_LOW,       0x080
.equ VIRTIO_REG_DESC_HIGH,      0x084
.equ VIRTIO_REG_AVAIL_LOW,      0x090
.equ VIRTIO_REG_AVAIL_HIGH,     0x094
.equ VIRTIO_REG_USED_LOW,       0x0a0
.equ VIRTIO_REG_USED_HIGH,      0x0a4

.equ VIRTIO_STATUS_ACK,         1
.equ VIRTIO_STATUS_DRIVER,      2
.equ VIRTIO_STATUS_DRIVER_OK,   4
.equ VIRTIO_STATUS_FEATURES_OK, 8
.equ VIRTIO_STATUS_FAILED,      0x80

.equ VIRTIO_FEAT_VERSION_1_BIT, 1

.equ VRING_DESC_F_WRITE,        2
.equ VRING_DESC_SIZE,           16
.equ VRING_DESC_ADDR,           0
.equ VRING_DESC_LEN,            8
.equ VRING_DESC_FLAGS,          12
.equ VRING_DESC_NEXT,           14

.equ VRING_AVAIL_FLAGS,         0
.equ VRING_AVAIL_IDX,           2
.equ VRING_AVAIL_RING,          4

.equ VRING_USED_FLAGS,          0
.equ VRING_USED_IDX,            2
.equ VRING_USED_RING,           4
.equ VRING_USED_ELEM_SIZE,      8
.equ VRING_IDX_MASK,            0xffff

.equ VIRTIO_QUEUE_SIZE,         8
.equ VIRTIO_QUEUE_MASK,         7
.equ VIRTIO_EVENT_SIZE,         8

.equ VIRTIO_ID_INPUT,       18
.equ VIRTIO_ID_BLOCK,       2

.equ BLK_T_IN,              0
.equ BLK_T_OUT,             1
.equ BLK_S_OK,              0
.equ BLK_HDR_TYPE,          0
.equ BLK_HDR_IOPRIO,        4
.equ BLK_HDR_SECTOR,        8
.equ BLK_HDR_SIZE,          16
.equ BLK_SECTOR_SIZE,       512
.equ BLK_QUEUE_SIZE,        8

.equ BPB_BYTES_PER_SEC,     0x0b
.equ BPB_SEC_PER_CLUS,      0x0d
.equ BPB_RESERVED,          0x0e
.equ BPB_NUM_FATS,          0x10
.equ BPB_SEC_PER_FAT32,     0x24
.equ BPB_ROOT_CLUSTER,      0x2c
.equ BPB_SIGNATURE,         0x1fe
.equ BPB_SIG_VALUE,         0xaa55

.equ FAT_SEC_PER_CLUS,      0
.equ FAT_START,             4
.equ FAT_COUNT,             8
.equ FAT_SECTORS,           12
.equ FAT_DATA_START,        16
.equ FAT_ROOT_CLUSTER,      20
.equ FAT_STATE_SIZE,        24

.equ DIR_ENTRY_SIZE,        32
.equ DIR_NAME_LEN,          11
.equ DIR_ATTR,              0x0b
.equ DIR_CLUSTER_HIGH,      0x14
.equ DIR_CLUSTER_LOW,       0x1a
.equ DIR_SIZE,              0x1c
.equ DIR_ATTR_LFN,          0x0f
.equ DIR_ATTR_VOLUME,       0x08
.equ DIR_ATTR_DIR,          0x10
.equ DIR_FREE,              0xe5
.equ DIR_END,               0x00

.equ FAT_ENTRY_MASK,        0x0fffffff
.equ FAT_EOC,               0x0ffffff8
.equ BLK_TIMEOUT,           0x10000000
.equ VRING_DESC_F_NEXT,     1

.equ EV_SYN,                0x00
.equ EV_KEY,                0x01
.equ EV_REL,                0x02
.equ REL_X,                 0x00
.equ REL_Y,                 0x01
.equ BTN_LEFT,              0x110

.equ RAM_BASE_FIXED,        0x40000000
.equ PAGE_SIZE,             4096
.equ PAGE_SHIFT,            12
.equ PMM_MAX_PAGES,         131072
.equ PMM_BITMAP_SIZE,       (PMM_MAX_PAGES / 8)

.equ BLOCK_SHIFT,           21
.equ BLOCK_SIZE,            (1 << BLOCK_SHIFT)
.equ TABLE_ENTRIES,         512

.equ MAIR_DEVICE_NGNRNE,    0x00
.equ MAIR_NORMAL_WB,        0xff
.equ MAIR_NORMAL_NC,        0x44
.equ MAIR_VALUE,            ((MAIR_NORMAL_NC << 16) | (MAIR_NORMAL_WB << 8) | MAIR_DEVICE_NGNRNE)

.equ ATTR_IDX_DEVICE,       0
.equ ATTR_IDX_NORMAL,       1
.equ ATTR_IDX_NC,           2

.equ DESC_BLOCK,            0x01
.equ DESC_TABLE,            0x03
.equ DESC_AF,               (1 << 10)
.equ DESC_SH_INNER,         (3 << 8)
.equ DESC_PXN,              (1 << 53)
.equ DESC_UXN,              (1 << 54)

.equ DESC_DEVICE,           (DESC_UXN | DESC_PXN | DESC_AF | (ATTR_IDX_DEVICE << 2) | DESC_BLOCK)
.equ DESC_NORMAL,           (DESC_AF | DESC_SH_INNER | (ATTR_IDX_NORMAL << 2) | DESC_BLOCK)
.equ DESC_NC,               (DESC_AF | DESC_SH_INNER | (ATTR_IDX_NC << 2) | DESC_BLOCK)

.equ TCR_T0SZ_39BIT,        25
.equ TCR_IRGN0_WBWA,        (1 << 8)
.equ TCR_ORGN0_WBWA,        (1 << 10)
.equ TCR_SH0_INNER,         (3 << 12)
.equ TCR_TG0_4K,            (0 << 14)
.equ TCR_EPD1,              (1 << 23)
.equ TCR_IPS_SHIFT,         32
.equ TCR_VALUE,             (TCR_T0SZ_39BIT | TCR_IRGN0_WBWA | TCR_ORGN0_WBWA | TCR_SH0_INNER | TCR_TG0_4K | TCR_EPD1)

.equ SCTLR_C,               (1 << 2)
.equ SCTLR_I,               (1 << 12)

.equ FDT_MAGIC,             0xd00dfeed
.equ FDT_OFF_DT_STRUCT,     8
.equ FDT_OFF_DT_STRINGS,    12
.equ FDT_TOKEN_BEGIN_NODE,  1
.equ FDT_TOKEN_END_NODE,    2
.equ FDT_TOKEN_PROP,        3
.equ FDT_TOKEN_NOP,         4
.equ FDT_TOKEN_END,         9
.equ FDT_PROP_HEADER_SIZE,  12

.equ FB_WIDTH,              640
.equ FB_HEIGHT,             480
.equ FB_BPP,                4
.equ FB_STRIDE,             (FB_WIDTH * FB_BPP)
.equ FB_SIZE,               (FB_STRIDE * FB_HEIGHT)
.equ FB_FOURCC_XR24,        0x34325258

.equ FB_CFG_ADDR,           0
.equ FB_CFG_FOURCC,         8
.equ FB_CFG_FLAGS,          12
.equ FB_CFG_WIDTH,          16
.equ FB_CFG_HEIGHT,         20
.equ FB_CFG_STRIDE,         24
.equ FB_CFG_SIZE,           28

.equ CURSOR_STATE_X,        0
.equ CURSOR_STATE_Y,        4
.equ CURSOR_STATE_W,        8
.equ CURSOR_STATE_H,        12
.equ CURSOR_STATE_VISIBLE,  16
.equ CURSOR_STATE_SIZE,     20

.equ FONT_WIDTH,            8
.equ FONT_HEIGHT,           8
.equ FONT_FIRST_CHAR,       0x20
.equ FONT_LAST_CHAR,        0x7e
.equ FONT_CHAR_COUNT,       (FONT_LAST_CHAR - FONT_FIRST_CHAR + 1)

.equ CURSOR_W,              8
.equ CURSOR_H,              12
.equ CURSOR_BACKING_SIZE,   (CURSOR_W * CURSOR_H * FB_BPP)

.equ COLOR_CURSOR,          0x00ffffff
.equ COLOR_BACKGROUND,      0x00102030
.equ COLOR_RED,             0x00ff0000
.equ COLOR_GREEN,           0x0000ff00
.equ COLOR_BLUE,            0x000000ff

.equ DAIF_I,                2

.equ IRQ_FRAME_SIZE,        160

.equ BOOT_SELFTEST,         0
.equ PMM_SELFTEST,          0
.equ FS_SELFTEST,           1

.macro irq_save
    stp     x2, x3, [sp, #-IRQ_FRAME_SIZE]!
    stp     x4, x5, [sp, #16]
    stp     x6, x7, [sp, #32]
    stp     x8, x9, [sp, #48]
    stp     x10, x11, [sp, #64]
    stp     x12, x13, [sp, #80]
    stp     x14, x15, [sp, #96]
    stp     x16, x17, [sp, #112]
    stp     x18, x19, [sp, #128]
    str     x30, [sp, #144]
.endm

.macro irq_restore
    ldr     x30, [sp, #144]
    ldp     x18, x19, [sp, #128]
    ldp     x16, x17, [sp, #112]
    ldp     x14, x15, [sp, #96]
    ldp     x12, x13, [sp, #80]
    ldp     x10, x11, [sp, #64]
    ldp     x8, x9, [sp, #48]
    ldp     x6, x7, [sp, #32]
    ldp     x4, x5, [sp, #16]
    ldp     x2, x3, [sp], #IRQ_FRAME_SIZE
.endm

.macro vec_entry index, target
    .balign VEC_ENTRY_ALIGN
    sub     sp, sp, #16
    stp     x0, x1, [sp]
    mov     x0, #\index
    b       \target
.endm

.section .text.boot
.global _start

_start:
    mov     x21, x0
    mrs     x0, mpidr_el1
    and     x0, x0, #MPIDR_AFF0_MASK
    cbz     x0, boot_primary

boot_park:
    wfe
    b       boot_park

boot_primary:
    mrs     x0, CurrentEL
    lsr     x0, x0, #2
    and     x0, x0, #3
    cmp     x0, #3
    b.eq    boot_from_el3
    cmp     x0, #2
    b.eq    boot_from_el2
    b       boot_el1_entry

boot_from_el3:
    mov     x0, #(SCR_EL3_NS | SCR_EL3_SMD | SCR_EL3_HCE | SCR_EL3_RW)
    msr     scr_el3, x0
    mov     x0, #SPSR_EL2H_DAIF
    msr     spsr_el3, x0
    adr     x0, boot_from_el2
    msr     elr_el3, x0
    isb
    eret

boot_from_el2:
    mov     x0, #HCR_EL2_RW
    msr     hcr_el2, x0
    mrs     x0, cnthctl_el2
    orr     x0, x0, #(CNTHCTL_EL2_EL1PCTEN | CNTHCTL_EL2_EL1PCEN)
    msr     cnthctl_el2, x0
    msr     cntvoff_el2, xzr
    mrs     x0, sctlr_el1
    bic     x0, x0, #SCTLR_M
    msr     sctlr_el1, x0
    mov     x0, #SPSR_EL1H_DAIF
    msr     spsr_el2, x0
    adr     x0, boot_el1_entry
    msr     elr_el2, x0
    isb
    eret

boot_el1_entry:
    adrp    x0, __stack_top
    add     x0, x0, :lo12:__stack_top
    mov     sp, x0
    bl      boot_clear_bss
    adrp    x0, fdt_base
    add     x0, x0, :lo12:fdt_base
    str     x21, [x0]
    bl      uart_init
    bl      vec_init
    adrp    x0, boot_banner
    add     x0, x0, :lo12:boot_banner
    bl      uart_puts
    bl      mem_init
    bl      pmm_init
    bl      mmu_init
.if PMM_SELFTEST
    bl      pmm_selftest
.endif
    bl      gic_init
    mov     w0, #UART_INTID
    bl      gic_enable_irq
    bl      fb_init
    bl      fb_testcard
    bl      mouse_init
    bl      cursor_show
    bl      virtio_scan
    bl      virtio_input_init
    bl      blk_init
    bl      fat_init
.if FS_SELFTEST
    bl      blk_selftest
    bl      fat_list_root
    adrp    x0, fat_hello_name
    add     x0, x0, :lo12:fat_hello_name
    bl      fat_cat
.endif
    bl      timer_init
    msr     daifclr, #DAIF_I

.if BOOT_SELFTEST
    brk     #0
.endif

    b       console_run

boot_clear_bss:
    adrp    x0, __bss_start
    add     x0, x0, :lo12:__bss_start
    adrp    x1, __bss_end
    add     x1, x1, :lo12:__bss_end

boot_clear_bss_loop:
    cmp     x0, x1
    b.hs    boot_clear_bss_done
    str     xzr, [x0], #8
    b       boot_clear_bss_loop

boot_clear_bss_done:
    ret

.section .text

vec_init:
    adrp    x0, vec_table
    add     x0, x0, :lo12:vec_table
    msr     vbar_el1, x0
    isb
    ret

fwcfg_dma:
    adrp    x3, fwcfg_access
    add     x3, x3, :lo12:fwcfg_access
    rev     w0, w0
    str     w0, [x3]
    rev     w1, w1
    str     w1, [x3, #4]
    rev     x2, x2
    str     x2, [x3, #8]
    rev     x4, x3
    mov     x5, #FWCFG_BASE
    str     x4, [x5, #FWCFG_DMA]
    dsb     sy
    ldr     x6, =FWCFG_TIMEOUT

fwcfg_dma_wait:
    ldr     w0, [x3]
    rev     w0, w0
    cbz     w0, fwcfg_dma_ok
    tst     w0, #FWCFG_DMA_ERROR
    b.ne    fwcfg_dma_error
    subs    x6, x6, #1
    b.ne    fwcfg_dma_wait

fwcfg_dma_error:
    mov     w0, #1
    ret

fwcfg_dma_ok:
    mov     w0, #0
    ret

fwcfg_select_read:
    lsl     w0, w0, #16
    mov     w3, #(FWCFG_DMA_SELECT | FWCFG_DMA_READ)
    orr     w0, w0, w3
    b       fwcfg_dma

fwcfg_read_next:
    mov     w0, #FWCFG_DMA_READ
    b       fwcfg_dma

fwcfg_list:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     w0, #FWCFG_KEY_FILE_DIR
    mov     w1, #4
    adrp    x2, fwcfg_count
    add     x2, x2, :lo12:fwcfg_count
    bl      fwcfg_select_read
    cbnz    w0, fwcfg_list_done
    adrp    x0, fwcfg_count
    add     x0, x0, :lo12:fwcfg_count
    ldr     w19, [x0]
    rev     w19, w19

fwcfg_list_loop:
    cbz     w19, fwcfg_list_done
    sub     w19, w19, #1
    mov     w1, #FWCFG_ENTRY_SIZE
    adrp    x2, fwcfg_entry
    add     x2, x2, :lo12:fwcfg_entry
    bl      fwcfg_read_next
    cbnz    w0, fwcfg_list_done
    adrp    x0, uart_newline
    add     x0, x0, :lo12:uart_newline
    bl      uart_puts
    adrp    x0, fwcfg_entry
    add     x0, x0, :lo12:fwcfg_entry
    add     x0, x0, #FWCFG_ENTRY_NAME
    bl      uart_puts
    b       fwcfg_list_loop

fwcfg_list_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

fwcfg_find_ramfb:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     w0, #FWCFG_KEY_FILE_DIR
    mov     w1, #4
    adrp    x2, fwcfg_count
    add     x2, x2, :lo12:fwcfg_count
    bl      fwcfg_select_read
    cbnz    w0, fwcfg_find_fail
    adrp    x0, fwcfg_count
    add     x0, x0, :lo12:fwcfg_count
    ldr     w19, [x0]
    rev     w19, w19

fwcfg_find_loop:
    cbz     w19, fwcfg_find_fail
    sub     w19, w19, #1
    mov     w1, #FWCFG_ENTRY_SIZE
    adrp    x2, fwcfg_entry
    add     x2, x2, :lo12:fwcfg_entry
    bl      fwcfg_read_next
    cbnz    w0, fwcfg_find_fail
    adrp    x0, fwcfg_entry
    add     x0, x0, :lo12:fwcfg_entry
    add     x0, x0, #FWCFG_ENTRY_NAME
    adrp    x1, fwcfg_ramfb_name
    add     x1, x1, :lo12:fwcfg_ramfb_name
    bl      string_equal
    cbz     w0, fwcfg_find_loop
    adrp    x0, fwcfg_entry
    add     x0, x0, :lo12:fwcfg_entry
    ldrh    w0, [x0, #FWCFG_ENTRY_SELECT]
    rev16   w0, w0
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

fwcfg_find_fail:
    mov     w0, #-1
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

string_equal:
    ldrb    w2, [x0], #1
    ldrb    w3, [x1], #1
    cmp     w2, w3
    b.ne    string_equal_no
    cbnz    w2, string_equal
    mov     w0, #1
    ret

string_equal_no:
    mov     w0, #0
    ret

fb_init:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    bl      fwcfg_find_ramfb
    cmn     w0, #1
    b.eq    fb_init_missing
    mov     w19, w0
    adrp    x0, fb_config
    add     x0, x0, :lo12:fb_config
    adrp    x1, fb_memory
    add     x1, x1, :lo12:fb_memory
    rev     x1, x1
    str     x1, [x0, #FB_CFG_ADDR]
    ldr     w1, =FB_FOURCC_XR24
    rev     w1, w1
    str     w1, [x0, #FB_CFG_FOURCC]
    str     wzr, [x0, #FB_CFG_FLAGS]
    mov     w1, #FB_WIDTH
    rev     w1, w1
    str     w1, [x0, #FB_CFG_WIDTH]
    mov     w1, #FB_HEIGHT
    rev     w1, w1
    str     w1, [x0, #FB_CFG_HEIGHT]
    mov     w1, #FB_STRIDE
    rev     w1, w1
    str     w1, [x0, #FB_CFG_STRIDE]
    lsl     w0, w19, #16
    orr     w0, w0, #(FWCFG_DMA_SELECT | FWCFG_DMA_WRITE)
    mov     w1, #FB_CFG_SIZE
    adrp    x2, fb_config
    add     x2, x2, :lo12:fb_config
    bl      fwcfg_dma
    cbnz    w0, fb_init_missing
    adrp    x0, fb_ready_msg
    add     x0, x0, :lo12:fb_ready_msg
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

fb_init_missing:
    adrp    x0, fb_missing_msg
    add     x0, x0, :lo12:fb_missing_msg
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

fb_clear:
    adrp    x1, fb_memory
    add     x1, x1, :lo12:fb_memory
    mov     x2, #FB_HEIGHT
    mov     x3, #FB_STRIDE
    mul     x2, x2, x3

fb_clear_loop:
    str     w0, [x1], #4
    subs    x2, x2, #FB_BPP
    b.ne    fb_clear_loop
    ret

fb_pixel_addr:
    mov     x9, #FB_STRIDE
    madd    x9, x1, x9, xzr
    adrp    x10, fb_memory
    add     x10, x10, :lo12:fb_memory
    add     x9, x10, x9
    add     x0, x9, x0, lsl #2
    ret

fb_fill_rect:
    stp     x29, x30, [sp, #-16]!
    bl      fb_pixel_addr
    mov     x5, x0
    ldp     x29, x30, [sp], #16

fb_fill_rect_row:
    cbz     x3, fb_fill_rect_done
    mov     x6, x2
    mov     x7, x5

fb_fill_rect_col:
    cbz     x6, fb_fill_rect_next
    str     w4, [x7], #4
    sub     x6, x6, #1
    b       fb_fill_rect_col

fb_fill_rect_next:
    mov     x6, #FB_STRIDE
    add     x5, x5, x6
    sub     x3, x3, #1
    b       fb_fill_rect_row

fb_fill_rect_done:
    ret

fb_glyph:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    sub     w19, w2, #FONT_FIRST_CHAR
    cmp     w19, #FONT_CHAR_COUNT
    b.hs    fb_glyph_done
    mov     w4, #(FB_WIDTH - FONT_WIDTH)
    cmp     w0, w4
    b.hi    fb_glyph_done
    mov     w4, #(FB_HEIGHT - FONT_HEIGHT)
    cmp     w1, w4
    b.hi    fb_glyph_done
    mov     w20, w3
    adrp    x21, font_data
    add     x21, x21, :lo12:font_data
    add     x21, x21, x19, lsl #3
    bl      fb_pixel_addr
    mov     x22, x0
    mov     w19, #0

fb_glyph_row:
    cmp     w19, #FONT_HEIGHT
    b.hs    fb_glyph_done
    ldrb    w0, [x21, w19, uxtw]
    mov     w1, #0
    mov     x2, x22

fb_glyph_col:
    cmp     w1, #FONT_WIDTH
    b.hs    fb_glyph_next
    mov     w3, #(FONT_WIDTH - 1)
    sub     w3, w3, w1
    lsr     w4, w0, w3
    tst     w4, #1
    b.eq    fb_glyph_skip
    str     w20, [x2]

fb_glyph_skip:
    add     x2, x2, #FB_BPP
    add     w1, w1, #1
    b       fb_glyph_col

fb_glyph_next:
    mov     x3, #FB_STRIDE
    add     x22, x22, x3
    add     w19, w19, #1
    b       fb_glyph_row

fb_glyph_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

fb_text:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     w19, w0
    mov     w20, w1
    mov     x21, x2
    mov     w22, w3

fb_text_loop:
    ldrb    w2, [x21], #1
    cbz     w2, fb_text_done
    mov     w0, w19
    mov     w1, w20
    mov     w3, w22
    bl      fb_glyph
    add     w19, w19, #FONT_WIDTH
    b       fb_text_loop

fb_text_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

cursor_hide:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    adrp    x19, cursor_state
    add     x19, x19, :lo12:cursor_state
    ldrb    w0, [x19, #CURSOR_STATE_VISIBLE]
    cbz     w0, cursor_hide_done
    strb    wzr, [x19, #CURSOR_STATE_VISIBLE]
    ldr     w0, [x19, #CURSOR_STATE_X]
    ldr     w1, [x19, #CURSOR_STATE_Y]
    bl      fb_pixel_addr
    mov     x20, x0
    adrp    x21, cursor_backing
    add     x21, x21, :lo12:cursor_backing
    ldr     w2, [x19, #CURSOR_STATE_W]
    ldr     w3, [x19, #CURSOR_STATE_H]

cursor_hide_row:
    cbz     w3, cursor_hide_done
    mov     w4, w2
    mov     x5, x20
    mov     x6, x21

cursor_hide_col:
    cbz     w4, cursor_hide_next
    ldr     w7, [x6], #4
    str     w7, [x5], #4
    sub     w4, w4, #1
    b       cursor_hide_col

cursor_hide_next:
    mov     x7, #FB_STRIDE
    add     x20, x20, x7
    add     x21, x21, #(CURSOR_W * FB_BPP)
    sub     w3, w3, #1
    b       cursor_hide_row

cursor_hide_done:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

cursor_show:
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    str     x23, [sp, #48]
    adrp    x19, cursor_state
    add     x19, x19, :lo12:cursor_state
    adrp    x0, mouse_x
    add     x0, x0, :lo12:mouse_x
    ldr     w20, [x0]
    ldr     w21, [x0, #4]
    mov     w0, #FB_WIDTH
    sub     w22, w0, w20
    mov     w0, #CURSOR_W
    cmp     w22, w0
    csel    w22, w22, w0, lt
    mov     w0, #FB_HEIGHT
    sub     w23, w0, w21
    mov     w0, #CURSOR_H
    cmp     w23, w0
    csel    w23, w23, w0, lt
    str     w20, [x19, #CURSOR_STATE_X]
    str     w21, [x19, #CURSOR_STATE_Y]
    str     w22, [x19, #CURSOR_STATE_W]
    str     w23, [x19, #CURSOR_STATE_H]
    mov     w0, w20
    mov     w1, w21
    bl      fb_pixel_addr
    mov     x20, x0
    adrp    x21, cursor_backing
    add     x21, x21, :lo12:cursor_backing
    mov     w2, w22
    mov     w3, w23

cursor_show_save_row:
    cbz     w3, cursor_show_draw
    mov     w4, w2
    mov     x5, x20
    mov     x6, x21

cursor_show_save_col:
    cbz     w4, cursor_show_save_next
    ldr     w7, [x5], #4
    str     w7, [x6], #4
    sub     w4, w4, #1
    b       cursor_show_save_col

cursor_show_save_next:
    mov     x7, #FB_STRIDE
    add     x20, x20, x7
    add     x21, x21, #(CURSOR_W * FB_BPP)
    sub     w3, w3, #1
    b       cursor_show_save_row

cursor_show_draw:
    ldr     w0, [x19, #CURSOR_STATE_X]
    ldr     w1, [x19, #CURSOR_STATE_Y]
    bl      fb_pixel_addr
    mov     x20, x0
    adrp    x21, cursor_bitmap
    add     x21, x21, :lo12:cursor_bitmap
    mov     w3, w23
    mov     w6, #0

cursor_show_draw_row:
    cmp     w6, w23
    b.hs    cursor_show_done
    ldrb    w7, [x21, w6, uxtw]
    mov     w4, #0
    mov     x5, x20

cursor_show_draw_col:
    cmp     w4, w22
    b.hs    cursor_show_draw_next
    mov     w8, #(CURSOR_W - 1)
    sub     w8, w8, w4
    lsr     w9, w7, w8
    tst     w9, #1
    b.eq    cursor_show_draw_skip
    ldr     w10, =COLOR_CURSOR
    str     w10, [x5]

cursor_show_draw_skip:
    add     x5, x5, #4
    add     w4, w4, #1
    b       cursor_show_draw_col

cursor_show_draw_next:
    mov     x7, #FB_STRIDE
    add     x20, x20, x7
    add     w6, w6, #1
    b       cursor_show_draw_row

cursor_show_done:
    mov     w0, #1
    strb    w0, [x19, #CURSOR_STATE_VISIBLE]
    ldr     x23, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

cursor_update:
    stp     x29, x30, [sp, #-16]!
    bl      cursor_hide
    bl      cursor_show
    ldp     x29, x30, [sp], #16
    ret

fb_testcard:
    stp     x29, x30, [sp, #-16]!
    ldr     w0, =COLOR_BACKGROUND
    bl      fb_clear
    mov     x0, #40
    mov     x1, #40
    mov     x2, #160
    mov     x3, #120
    ldr     w4, =COLOR_RED
    bl      fb_fill_rect
    mov     x0, #240
    mov     x1, #180
    mov     x2, #160
    mov     x3, #120
    ldr     w4, =COLOR_GREEN
    bl      fb_fill_rect
    mov     x0, #440
    mov     x1, #320
    mov     x2, #160
    mov     x3, #120
    ldr     w4, =COLOR_BLUE
    bl      fb_fill_rect
    mov     w0, #16
    mov     w1, #16
    adrp    x2, fb_title
    add     x2, x2, :lo12:fb_title
    ldr     w3, =COLOR_CURSOR
    bl      fb_text
    mov     w0, #16
    mov     w1, #440
    adrp    x2, fb_charset
    add     x2, x2, :lo12:fb_charset
    ldr     w3, =COLOR_CURSOR
    bl      fb_text
    mov     w0, #16
    mov     w1, #456
    adrp    x2, fb_charset2
    add     x2, x2, :lo12:fb_charset2
    ldr     w3, =COLOR_CURSOR
    bl      fb_text
    ldp     x29, x30, [sp], #16
    ret

virtio_scan:
    stp     x29, x30, [sp, #-48]!
    str     x19, [sp, #16]
    str     x20, [sp, #24]
    mov     x19, #VIRTIO_MMIO_BASE
    mov     w20, #VIRTIO_MMIO_COUNT

virtio_scan_loop:
    ldr     w0, [x19, #VIRTIO_REG_MAGIC]
    ldr     w1, =VIRTIO_MAGIC
    cmp     w0, w1
    b.ne    virtio_scan_next
    ldr     w0, [x19, #VIRTIO_REG_DEVICE_ID]
    cbz     w0, virtio_scan_next
    adrp    x0, virtio_slot_label
    add     x0, x0, :lo12:virtio_slot_label
    mov     x1, x19
    bl      uart_field
    adrp    x0, virtio_id_label
    add     x0, x0, :lo12:virtio_id_label
    ldr     w1, [x19, #VIRTIO_REG_DEVICE_ID]
    bl      uart_field
    adrp    x0, virtio_ver_label
    add     x0, x0, :lo12:virtio_ver_label
    ldr     w1, [x19, #VIRTIO_REG_VERSION]
    bl      uart_field
    adrp    x0, uart_newline
    add     x0, x0, :lo12:uart_newline
    bl      uart_puts

virtio_scan_next:
    add     x19, x19, #VIRTIO_MMIO_STRIDE
    subs    w20, w20, #1
    b.ne    virtio_scan_loop
    ldr     x19, [sp, #16]
    ldr     x20, [sp, #24]
    ldp     x29, x30, [sp], #48
    ret

mem_init:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    bl      fdt_find_memory
    cbz     x1, mem_init_fail
    adrp    x19, ram_base
    add     x19, x19, :lo12:ram_base
    str     x0, [x19]
    str     x1, [x19, #8]
    adrp    x0, mem_base_label
    add     x0, x0, :lo12:mem_base_label
    ldr     x1, [x19]
    bl      uart_field
    adrp    x0, mem_size_label
    add     x0, x0, :lo12:mem_size_label
    ldr     x1, [x19, #8]
    bl      uart_field
    adrp    x0, uart_newline
    add     x0, x0, :lo12:uart_newline
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

mem_init_fail:
    adrp    x0, mem_fail_msg
    add     x0, x0, :lo12:mem_fail_msg
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

pmm_init:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    adrp    x0, __image_end
    add     x0, x0, :lo12:__image_end
    add     x0, x0, #(PAGE_SIZE - 1)
    bic     x0, x0, #(PAGE_SIZE - 1)
    adrp    x19, pmm_base
    add     x19, x19, :lo12:pmm_base
    str     x0, [x19]
    adrp    x1, ram_base
    add     x1, x1, :lo12:ram_base
    ldr     x2, [x1]
    ldr     x3, [x1, #8]
    add     x2, x2, x3
    subs    x2, x2, x0
    b.ls    pmm_init_none
    lsr     x2, x2, #PAGE_SHIFT
    mov     x3, #PMM_MAX_PAGES
    cmp     x2, x3
    csel    x2, x2, x3, lo
    str     x2, [x19, #8]
    adrp    x0, fdt_base
    add     x0, x0, :lo12:fdt_base
    ldr     x0, [x0]
    cbz     x0, pmm_init_report
    ldr     w1, [x0, #4]
    rev     w1, w1
    mov     x20, x0
    mov     x21, x1
    bl      pmm_reserve
    adrp    x0, pmm_fdt_label
    add     x0, x0, :lo12:pmm_fdt_label
    mov     x1, x20
    bl      uart_field
    adrp    x0, pmm_fdtlen_label
    add     x0, x0, :lo12:pmm_fdtlen_label
    mov     x1, x21
    bl      uart_field
    adrp    x0, pmm_fdt_suffix
    add     x0, x0, :lo12:pmm_fdt_suffix
    bl      uart_puts

pmm_init_report:
    adrp    x0, pmm_base_label
    add     x0, x0, :lo12:pmm_base_label
    ldr     x1, [x19]
    bl      uart_field
    adrp    x0, pmm_pages_label
    add     x0, x0, :lo12:pmm_pages_label
    ldr     x1, [x19, #8]
    bl      uart_field
    adrp    x0, uart_newline
    add     x0, x0, :lo12:uart_newline
    bl      uart_puts
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

pmm_init_none:
    str     xzr, [x19, #8]
    adrp    x0, pmm_fail_msg
    add     x0, x0, :lo12:pmm_fail_msg
    bl      uart_puts
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

pmm_count_used:
    adrp    x1, pmm_bitmap
    add     x1, x1, :lo12:pmm_bitmap
    adrp    x2, pmm_base
    add     x2, x2, :lo12:pmm_base
    ldr     x2, [x2, #8]
    mov     x0, #0
    mov     x3, #0

pmm_count_loop:
    cmp     x3, x2
    b.hs    pmm_count_done
    lsr     x4, x3, #3
    ldrb    w5, [x1, x4]
    and     w6, w3, #7
    lsr     w5, w5, w6
    and     w5, w5, #1
    add     x0, x0, x5
    add     x3, x3, #1
    b       pmm_count_loop

pmm_count_done:
    ret

pmm_selftest:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    bl      pmm_count_used
    mov     x1, x0
    adrp    x0, pmm_used_label
    add     x0, x0, :lo12:pmm_used_label
    bl      uart_field
    bl      pmm_alloc
    mov     x19, x0
    bl      pmm_alloc
    mov     x20, x0
    bl      pmm_alloc
    mov     x21, x0
    mov     x1, x19
    adrp    x0, pmm_test_label
    add     x0, x0, :lo12:pmm_test_label
    bl      uart_field
    mov     x1, x20
    adrp    x0, pmm_test_label
    add     x0, x0, :lo12:pmm_test_label
    bl      uart_field
    mov     x1, x21
    adrp    x0, pmm_test_label
    add     x0, x0, :lo12:pmm_test_label
    bl      uart_field
    mov     x0, x20
    bl      pmm_free
    bl      pmm_alloc
    mov     x1, x0
    adrp    x0, pmm_reuse_label
    add     x0, x0, :lo12:pmm_reuse_label
    bl      uart_field
    adrp    x0, uart_newline
    add     x0, x0, :lo12:uart_newline
    bl      uart_puts
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

pmm_reserve:
    adrp    x2, pmm_base
    add     x2, x2, :lo12:pmm_base
    ldr     x3, [x2]
    ldr     x4, [x2, #8]
    add     x1, x0, x1
    add     x1, x1, #(PAGE_SIZE - 1)
    bic     x1, x1, #(PAGE_SIZE - 1)
    bic     x0, x0, #(PAGE_SIZE - 1)
    subs    x1, x1, x3
    b.ls    pmm_reserve_done
    subs    x0, x0, x3
    b.lo    pmm_reserve_done
    lsr     x0, x0, #PAGE_SHIFT
    lsr     x1, x1, #PAGE_SHIFT
    adrp    x5, pmm_bitmap
    add     x5, x5, :lo12:pmm_bitmap

pmm_reserve_loop:
    cmp     x0, x1
    b.hs    pmm_reserve_done
    cmp     x0, x4
    b.hs    pmm_reserve_done
    lsr     x6, x0, #3
    ldrb    w7, [x5, x6]
    and     w8, w0, #7
    mov     w9, #1
    lsl     w9, w9, w8
    orr     w7, w7, w9
    strb    w7, [x5, x6]
    add     x0, x0, #1
    b       pmm_reserve_loop

pmm_reserve_done:
    ret

pmm_alloc:
    adrp    x1, pmm_bitmap
    add     x1, x1, :lo12:pmm_bitmap
    adrp    x2, pmm_base
    add     x2, x2, :lo12:pmm_base
    ldr     x3, [x2, #8]
    mov     x4, #0

pmm_alloc_loop:
    cmp     x4, x3
    b.hs    pmm_alloc_none
    lsr     x5, x4, #3
    ldrb    w6, [x1, x5]
    and     w7, w4, #7
    lsr     w8, w6, w7
    tst     w8, #1
    b.eq    pmm_alloc_found
    add     x4, x4, #1
    b       pmm_alloc_loop

pmm_alloc_found:
    mov     w8, #1
    lsl     w8, w8, w7
    orr     w6, w6, w8
    strb    w6, [x1, x5]
    ldr     x0, [x2]
    add     x0, x0, x4, lsl #PAGE_SHIFT
    ret

pmm_alloc_none:
    mov     x0, #0
    ret

pmm_free:
    adrp    x1, pmm_base
    add     x1, x1, :lo12:pmm_base
    ldr     x2, [x1]
    subs    x0, x0, x2
    b.lo    pmm_free_done
    lsr     x0, x0, #PAGE_SHIFT
    ldr     x3, [x1, #8]
    cmp     x0, x3
    b.hs    pmm_free_done
    adrp    x1, pmm_bitmap
    add     x1, x1, :lo12:pmm_bitmap
    lsr     x5, x0, #3
    ldrb    w6, [x1, x5]
    and     w7, w0, #7
    mov     w8, #1
    lsl     w8, w8, w7
    bic     w6, w6, w8
    strb    w6, [x1, x5]

pmm_free_done:
    ret

mmu_init:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    adrp    x19, mmu_l1_table
    add     x19, x19, :lo12:mmu_l1_table
    adrp    x20, mmu_l2_table
    add     x20, x20, :lo12:mmu_l2_table

    ldr     x0, =DESC_DEVICE
    str     x0, [x19]
    orr     x0, x20, #DESC_TABLE
    str     x0, [x19, #8]

    adrp    x21, fb_memory
    add     x21, x21, :lo12:fb_memory
    mov     x0, #RAM_BASE_FIXED
    sub     x21, x21, x0
    lsr     x21, x21, #BLOCK_SHIFT

    adrp    x0, ram_base
    add     x0, x0, :lo12:ram_base
    ldr     x1, [x0, #8]
    lsr     x1, x1, #BLOCK_SHIFT
    mov     x2, #TABLE_ENTRIES
    cmp     x1, x2
    csel    x1, x1, x2, lo
    mov     x2, #0

mmu_init_loop:
    cmp     x2, x1
    b.hs    mmu_init_tables_done
    mov     x3, #RAM_BASE_FIXED
    add     x3, x3, x2, lsl #BLOCK_SHIFT
    cmp     x2, x21
    b.eq    mmu_init_nc
    ldr     x4, =DESC_NORMAL
    b       mmu_init_store

mmu_init_nc:
    ldr     x4, =DESC_NC

mmu_init_store:
    orr     x3, x3, x4
    str     x3, [x20, x2, lsl #3]
    add     x2, x2, #1
    b       mmu_init_loop

mmu_init_tables_done:
    ldr     x0, =MAIR_VALUE
    msr     mair_el1, x0
    mrs     x0, id_aa64mmfr0_el1
    and     x0, x0, #0xf
    ldr     x1, =TCR_VALUE
    orr     x0, x1, x0, lsl #TCR_IPS_SHIFT
    msr     tcr_el1, x0
    msr     ttbr0_el1, x19
    dsb     sy
    isb
    tlbi    vmalle1
    dsb     sy
    isb
    mrs     x0, sctlr_el1
    mov     x1, #(SCTLR_M | SCTLR_C | SCTLR_I)
    orr     x0, x0, x1
    msr     sctlr_el1, x0
    isb
    adrp    x0, mmu_ready_msg
    add     x0, x0, :lo12:mmu_ready_msg
    bl      uart_puts
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

string_starts_with:
    ldrb    w2, [x1], #1
    cbz     w2, string_starts_with_yes
    ldrb    w3, [x0], #1
    cmp     w2, w3
    b.eq    string_starts_with
    mov     w0, #0
    ret

string_starts_with_yes:
    mov     w0, #1
    ret

fdt_align4:
    add     x0, x0, #3
    bic     x0, x0, #3
    ret

fdt_find_memory:
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    adrp    x0, fdt_base
    add     x0, x0, :lo12:fdt_base
    ldr     x22, [x0]
    cbz     x22, fdt_find_memory_fail
    ldr     w0, [x22]
    rev     w0, w0
    ldr     w1, =FDT_MAGIC
    cmp     w0, w1
    b.ne    fdt_find_memory_fail
    ldr     w0, [x22, #FDT_OFF_DT_STRUCT]
    rev     w0, w0
    add     x19, x22, x0
    ldr     w0, [x22, #FDT_OFF_DT_STRINGS]
    rev     w0, w0
    add     x20, x22, x0
    mov     w21, #0

fdt_find_memory_loop:
    ldr     w0, [x19]
    rev     w0, w0
    cmp     w0, #FDT_TOKEN_BEGIN_NODE
    b.eq    fdt_find_memory_node
    cmp     w0, #FDT_TOKEN_PROP
    b.eq    fdt_find_memory_prop
    cmp     w0, #FDT_TOKEN_END_NODE
    b.eq    fdt_find_memory_endnode
    cmp     w0, #FDT_TOKEN_NOP
    b.eq    fdt_find_memory_nop
    b       fdt_find_memory_fail

fdt_find_memory_nop:
    add     x19, x19, #4
    b       fdt_find_memory_loop

fdt_find_memory_endnode:
    add     x19, x19, #4
    mov     w21, #0
    b       fdt_find_memory_loop

fdt_find_memory_node:
    add     x0, x19, #4
    adrp    x1, fdt_memory_name
    add     x1, x1, :lo12:fdt_memory_name
    bl      string_starts_with
    mov     w21, w0
    add     x0, x19, #4
    bl      string_length
    add     x0, x0, #1
    bl      fdt_align4
    add     x19, x19, #4
    add     x19, x19, x0
    b       fdt_find_memory_loop

fdt_find_memory_prop:
    ldr     w0, [x19, #4]
    rev     w0, w0
    mov     w22, w0
    cbz     w21, fdt_find_memory_prop_skip
    ldr     w0, [x19, #8]
    rev     w0, w0
    add     x0, x20, x0
    adrp    x1, fdt_reg_name
    add     x1, x1, :lo12:fdt_reg_name
    bl      string_equal
    cbz     w0, fdt_find_memory_prop_skip
    ldr     w0, [x19, #FDT_PROP_HEADER_SIZE]
    rev     w0, w0
    ldr     w2, [x19, #(FDT_PROP_HEADER_SIZE + 4)]
    rev     w2, w2
    orr     x0, x2, x0, lsl #32
    ldr     w1, [x19, #(FDT_PROP_HEADER_SIZE + 8)]
    rev     w1, w1
    ldr     w2, [x19, #(FDT_PROP_HEADER_SIZE + 12)]
    rev     w2, w2
    orr     x1, x2, x1, lsl #32
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

fdt_find_memory_prop_skip:
    mov     x0, x22
    bl      fdt_align4
    add     x19, x19, #FDT_PROP_HEADER_SIZE
    add     x19, x19, x0
    b       fdt_find_memory_loop

fdt_find_memory_fail:
    mov     x0, #0
    mov     x1, #0
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

string_length:
    mov     x1, x0

string_length_loop:
    ldrb    w2, [x0], #1
    cbnz    w2, string_length_loop
    sub     x0, x0, x1
    sub     x0, x0, #1
    ret

virtio_find:
    mov     x4, x0
    mov     x2, #VIRTIO_MMIO_BASE
    mov     w3, #VIRTIO_MMIO_COUNT

virtio_find_loop:
    ldr     w0, [x2, #VIRTIO_REG_MAGIC]
    ldr     w1, =VIRTIO_MAGIC
    cmp     w0, w1
    b.ne    virtio_find_next
    ldr     w0, [x2, #VIRTIO_REG_DEVICE_ID]
    cmp     w0, w4
    b.ne    virtio_find_next
    mov     x0, x2
    ret

virtio_find_next:
    add     x2, x2, #VIRTIO_MMIO_STRIDE
    subs    w3, w3, #1
    b.ne    virtio_find_loop
    mov     x0, #0
    ret

virtio_setup:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     x19, x0
    mov     x20, x4
    str     wzr, [x19, #VIRTIO_REG_STATUS]
    mov     w0, #VIRTIO_STATUS_ACK
    str     w0, [x19, #VIRTIO_REG_STATUS]
    mov     w0, #(VIRTIO_STATUS_ACK | VIRTIO_STATUS_DRIVER)
    str     w0, [x19, #VIRTIO_REG_STATUS]
    mov     w0, #1
    str     w0, [x19, #VIRTIO_REG_DEV_FEAT_SEL]
    ldr     w0, [x19, #VIRTIO_REG_DEV_FEAT]
    tst     w0, #VIRTIO_FEAT_VERSION_1_BIT
    b.eq    virtio_setup_fail
    mov     w0, #1
    str     w0, [x19, #VIRTIO_REG_DRV_FEAT_SEL]
    mov     w0, #VIRTIO_FEAT_VERSION_1_BIT
    str     w0, [x19, #VIRTIO_REG_DRV_FEAT]
    str     wzr, [x19, #VIRTIO_REG_DRV_FEAT_SEL]
    str     wzr, [x19, #VIRTIO_REG_DRV_FEAT]
    mov     w0, #(VIRTIO_STATUS_ACK | VIRTIO_STATUS_DRIVER | VIRTIO_STATUS_FEATURES_OK)
    str     w0, [x19, #VIRTIO_REG_STATUS]
    ldr     w0, [x19, #VIRTIO_REG_STATUS]
    tst     w0, #VIRTIO_STATUS_FEATURES_OK
    b.eq    virtio_setup_fail
    str     wzr, [x19, #VIRTIO_REG_QUEUE_SEL]
    ldr     w0, [x19, #VIRTIO_REG_QUEUE_NUM_MAX]
    cmp     w0, w20
    b.lo    virtio_setup_fail
    str     w20, [x19, #VIRTIO_REG_QUEUE_NUM]
    str     w1, [x19, #VIRTIO_REG_DESC_LOW]
    lsr     x21, x1, #32
    str     w21, [x19, #VIRTIO_REG_DESC_HIGH]
    str     w2, [x19, #VIRTIO_REG_AVAIL_LOW]
    lsr     x21, x2, #32
    str     w21, [x19, #VIRTIO_REG_AVAIL_HIGH]
    str     w3, [x19, #VIRTIO_REG_USED_LOW]
    lsr     x21, x3, #32
    str     w21, [x19, #VIRTIO_REG_USED_HIGH]
    mov     w0, #1
    str     w0, [x19, #VIRTIO_REG_QUEUE_READY]
    mov     w0, #0
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

virtio_setup_fail:
    mov     w0, #1
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

virtio_driver_ok:
    ldr     w1, [x0, #VIRTIO_REG_STATUS]
    orr     w1, w1, #VIRTIO_STATUS_DRIVER_OK
    str     w1, [x0, #VIRTIO_REG_STATUS]
    dsb     sy
    ret

virtio_input_init:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x0, #VIRTIO_ID_INPUT
    bl      virtio_find
    cbz     x0, virtio_input_fail
    mov     x19, x0
    adrp    x1, virtio_input_base
    add     x1, x1, :lo12:virtio_input_base
    str     x19, [x1]
    mov     x0, x19
    adrp    x1, virtio_desc
    add     x1, x1, :lo12:virtio_desc
    adrp    x2, virtio_avail
    add     x2, x2, :lo12:virtio_avail
    adrp    x3, virtio_used
    add     x3, x3, :lo12:virtio_used
    mov     x4, #VIRTIO_QUEUE_SIZE
    bl      virtio_setup
    cbnz    w0, virtio_input_fail
    bl      virtio_input_fill
    mov     x0, x19
    bl      virtio_driver_ok
    str     wzr, [x19, #VIRTIO_REG_QUEUE_NOTIFY]
    mov     x0, x19
    mov     x1, #VIRTIO_MMIO_BASE
    sub     x0, x0, x1
    lsr     x0, x0, #9
    add     w0, w0, #VIRTIO_MMIO_IRQ_BASE
    adrp    x1, virtio_input_intid
    add     x1, x1, :lo12:virtio_input_intid
    str     w0, [x1]
    bl      gic_enable_irq
    adrp    x0, virtio_ready_msg
    add     x0, x0, :lo12:virtio_ready_msg
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

virtio_input_fail:
    adrp    x0, virtio_fail_msg
    add     x0, x0, :lo12:virtio_fail_msg
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

blk_init:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x0, #VIRTIO_ID_BLOCK
    bl      virtio_find
    cbz     x0, blk_init_fail
    mov     x19, x0
    adrp    x1, blk_base
    add     x1, x1, :lo12:blk_base
    str     x19, [x1]
    mov     x0, x19
    adrp    x1, blk_desc
    add     x1, x1, :lo12:blk_desc
    adrp    x2, blk_avail
    add     x2, x2, :lo12:blk_avail
    adrp    x3, blk_used
    add     x3, x3, :lo12:blk_used
    mov     x4, #BLK_QUEUE_SIZE
    bl      virtio_setup
    cbnz    w0, blk_init_fail
    mov     x0, x19
    bl      virtio_driver_ok
    adrp    x0, blk_ready_msg
    add     x0, x0, :lo12:blk_ready_msg
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

mem_read16:
    ldrb    w2, [x0, x1]
    add     x3, x1, #1
    ldrb    w3, [x0, x3]
    orr     w0, w2, w3, lsl #8
    ret

mem_read32:
    ldrb    w2, [x0, x1]
    add     x3, x1, #1
    ldrb    w4, [x0, x3]
    orr     w2, w2, w4, lsl #8
    add     x3, x1, #2
    ldrb    w4, [x0, x3]
    orr     w2, w2, w4, lsl #16
    add     x3, x1, #3
    ldrb    w4, [x0, x3]
    orr     w0, w2, w4, lsl #24
    ret

fat_init:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    mov     x0, #0
    adrp    x1, blk_buffer
    add     x1, x1, :lo12:blk_buffer
    bl      blk_read
    cbnz    w0, fat_init_fail
    adrp    x19, blk_buffer
    add     x19, x19, :lo12:blk_buffer
    mov     x0, x19
    mov     x1, #BPB_SIGNATURE
    bl      mem_read16
    ldr     w1, =BPB_SIG_VALUE
    cmp     w0, w1
    b.ne    fat_init_fail
    adrp    x20, fat_state
    add     x20, x20, :lo12:fat_state
    mov     x0, x19
    mov     x1, #BPB_BYTES_PER_SEC
    bl      mem_read16
    cmp     w0, #BLK_SECTOR_SIZE
    b.ne    fat_init_fail
    ldrb    w0, [x19, #BPB_SEC_PER_CLUS]
    cbz     w0, fat_init_fail
    str     w0, [x20, #FAT_SEC_PER_CLUS]
    mov     x0, x19
    mov     x1, #BPB_RESERVED
    bl      mem_read16
    str     w0, [x20, #FAT_START]
    ldrb    w1, [x19, #BPB_NUM_FATS]
    mov     x0, x19
    str     w1, [x20, #FAT_COUNT]
    mov     x1, #BPB_SEC_PER_FAT32
    bl      mem_read32
    str     w0, [x20, #FAT_SECTORS]
    ldr     w1, [x20, #FAT_COUNT]
    mul     w0, w0, w1
    ldr     w1, [x20, #FAT_START]
    add     w0, w0, w1
    str     w0, [x20, #FAT_DATA_START]
    mov     x0, x19
    mov     x1, #BPB_ROOT_CLUSTER
    bl      mem_read32
    str     w0, [x20, #FAT_ROOT_CLUSTER]
    adrp    x0, fat_label_res
    add     x0, x0, :lo12:fat_label_res
    ldr     w1, [x20, #FAT_START]
    bl      uart_field
    adrp    x0, fat_label_spf
    add     x0, x0, :lo12:fat_label_spf
    ldr     w1, [x20, #FAT_SECTORS]
    bl      uart_field
    adrp    x0, fat_label_data
    add     x0, x0, :lo12:fat_label_data
    ldr     w1, [x20, #FAT_DATA_START]
    bl      uart_field
    adrp    x0, fat_label_root
    add     x0, x0, :lo12:fat_label_root
    ldr     w1, [x20, #FAT_ROOT_CLUSTER]
    bl      uart_field
    adrp    x0, uart_newline
    add     x0, x0, :lo12:uart_newline
    bl      uart_puts
    mov     w0, #0
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

fat_init_fail:
    adrp    x0, fat_fail_msg
    add     x0, x0, :lo12:fat_fail_msg
    bl      uart_puts
    mov     w0, #1
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

fat_cluster_to_sector:
    adrp    x1, fat_state
    add     x1, x1, :lo12:fat_state
    ldr     w2, [x1, #FAT_SEC_PER_CLUS]
    sub     w0, w0, #2
    mul     w0, w0, w2
    ldr     w2, [x1, #FAT_DATA_START]
    add     w0, w0, w2
    ret

fat_list_root:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    adrp    x0, fat_state
    add     x0, x0, :lo12:fat_state
    ldr     w0, [x0, #FAT_ROOT_CLUSTER]
    bl      fat_cluster_to_sector
    adrp    x1, blk_buffer
    add     x1, x1, :lo12:blk_buffer
    bl      blk_read
    cbnz    w0, fat_list_done
    adrp    x19, blk_buffer
    add     x19, x19, :lo12:blk_buffer
    mov     w20, #(BLK_SECTOR_SIZE / DIR_ENTRY_SIZE)

fat_list_loop:
    cbz     w20, fat_list_done
    ldrb    w0, [x19]
    cbz     w0, fat_list_done
    cmp     w0, #DIR_FREE
    b.eq    fat_list_next
    ldrb    w0, [x19, #DIR_ATTR]
    cmp     w0, #DIR_ATTR_LFN
    b.eq    fat_list_next
    tst     w0, #DIR_ATTR_VOLUME
    b.ne    fat_list_next
    adrp    x0, fat_entry_prefix
    add     x0, x0, :lo12:fat_entry_prefix
    bl      uart_puts
    mov     x0, x19
    mov     w1, #DIR_NAME_LEN
    bl      uart_putn
    adrp    x0, fat_size_label
    add     x0, x0, :lo12:fat_size_label
    mov     x0, x19
    mov     x1, #DIR_SIZE
    bl      mem_read32
    mov     x1, x0
    adrp    x0, fat_size_label
    add     x0, x0, :lo12:fat_size_label
    bl      uart_field

fat_list_next:
    add     x19, x19, #DIR_ENTRY_SIZE
    sub     w20, w20, #1
    b       fat_list_loop

fat_list_done:
    adrp    x0, uart_newline
    add     x0, x0, :lo12:uart_newline
    bl      uart_puts
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

fat_next_cluster:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     w19, w0
    lsl     w0, w0, #2
    adrp    x1, fat_state
    add     x1, x1, :lo12:fat_state
    ldr     w2, [x1, #FAT_START]
    lsr     w3, w0, #9
    add     w3, w3, w2
    and     w19, w0, #(BLK_SECTOR_SIZE - 1)
    mov     w0, w3
    adrp    x1, fat_buffer
    add     x1, x1, :lo12:fat_buffer
    bl      blk_read
    cbnz    w0, fat_next_cluster_end
    adrp    x0, fat_buffer
    add     x0, x0, :lo12:fat_buffer
    mov     x1, x19
    bl      mem_read32
    ldr     w1, =FAT_ENTRY_MASK
    and     w0, w0, w1
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

fat_next_cluster_end:
    ldr     w0, =FAT_EOC
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

fat_find:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     x21, x0
    adrp    x0, fat_state
    add     x0, x0, :lo12:fat_state
    ldr     w0, [x0, #FAT_ROOT_CLUSTER]
    bl      fat_cluster_to_sector
    adrp    x1, blk_buffer
    add     x1, x1, :lo12:blk_buffer
    bl      blk_read
    cbnz    w0, fat_find_none
    adrp    x19, blk_buffer
    add     x19, x19, :lo12:blk_buffer
    mov     w20, #(BLK_SECTOR_SIZE / DIR_ENTRY_SIZE)

fat_find_loop:
    cbz     w20, fat_find_none
    ldrb    w0, [x19]
    cbz     w0, fat_find_none
    cmp     w0, #DIR_FREE
    b.eq    fat_find_next
    ldrb    w0, [x19, #DIR_ATTR]
    cmp     w0, #DIR_ATTR_LFN
    b.eq    fat_find_next
    mov     x0, x19
    mov     x1, x21
    mov     w2, #DIR_NAME_LEN
    bl      mem_equal
    cbz     w0, fat_find_next
    mov     x0, x19
    mov     x1, #DIR_CLUSTER_HIGH
    bl      mem_read16
    mov     w21, w0
    mov     x0, x19
    mov     x1, #DIR_CLUSTER_LOW
    bl      mem_read16
    orr     w21, w0, w21, lsl #16
    mov     x0, x19
    mov     x1, #DIR_SIZE
    bl      mem_read32
    mov     w1, w0
    mov     w0, w21
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

fat_find_next:
    add     x19, x19, #DIR_ENTRY_SIZE
    sub     w20, w20, #1
    b       fat_find_loop

fat_find_none:
    mov     w0, #0
    mov     w1, #0
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

mem_equal:
    cbz     w2, mem_equal_yes

mem_equal_loop:
    ldrb    w3, [x0], #1
    ldrb    w4, [x1], #1
    cmp     w3, w4
    b.ne    mem_equal_no
    sub     w2, w2, #1
    cbnz    w2, mem_equal_loop

mem_equal_yes:
    mov     w0, #1
    ret

mem_equal_no:
    mov     w0, #0
    ret

fat_cat:
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    str     x23, [sp, #48]
    mov     x23, x0
    bl      fat_find
    cbz     w0, fat_cat_missing
    mov     w19, w0
    mov     w20, w1
    adrp    x0, fat_cat_label
    add     x0, x0, :lo12:fat_cat_label
    bl      uart_puts

fat_cat_cluster:
    ldr     w0, =FAT_EOC
    cmp     w19, w0
    b.hs    fat_cat_done
    cbz     w20, fat_cat_done
    mov     w0, w19
    bl      fat_cluster_to_sector
    mov     w21, w0
    adrp    x0, fat_state
    add     x0, x0, :lo12:fat_state
    ldr     w22, [x0, #FAT_SEC_PER_CLUS]

fat_cat_sector:
    cbz     w22, fat_cat_advance
    cbz     w20, fat_cat_done
    mov     w0, w21
    adrp    x1, blk_buffer
    add     x1, x1, :lo12:blk_buffer
    bl      blk_read
    cbnz    w0, fat_cat_done
    mov     w1, #BLK_SECTOR_SIZE
    cmp     w20, w1
    csel    w1, w20, w1, lo
    adrp    x0, blk_buffer
    add     x0, x0, :lo12:blk_buffer
    sub     w20, w20, w1
    bl      uart_putn
    add     w21, w21, #1
    sub     w22, w22, #1
    b       fat_cat_sector

fat_cat_advance:
    mov     w0, w19
    bl      fat_next_cluster
    mov     w19, w0
    b       fat_cat_cluster

fat_cat_done:
    adrp    x0, uart_newline
    add     x0, x0, :lo12:uart_newline
    bl      uart_puts
    ldr     x23, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

fat_cat_missing:
    adrp    x0, fat_missing_msg
    add     x0, x0, :lo12:fat_missing_msg
    bl      uart_puts
    ldr     x23, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

blk_selftest:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x0, #0
    adrp    x1, blk_buffer
    add     x1, x1, :lo12:blk_buffer
    mov     x19, x1
    bl      blk_read
    cbnz    w0, blk_selftest_fail
    adrp    x0, blk_sig_label
    add     x0, x0, :lo12:blk_sig_label
    ldrb    w1, [x19, #510]
    ldrb    w2, [x19, #511]
    orr     w1, w1, w2, lsl #8
    bl      uart_field
    adrp    x0, blk_oem_label
    add     x0, x0, :lo12:blk_oem_label
    bl      uart_puts
    add     x0, x19, #3
    mov     w1, #8
    bl      uart_putn
    adrp    x0, uart_newline
    add     x0, x0, :lo12:uart_newline
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

blk_selftest_fail:
    adrp    x0, blk_read_fail_msg
    add     x0, x0, :lo12:blk_read_fail_msg
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

blk_init_fail:
    adrp    x1, blk_base
    add     x1, x1, :lo12:blk_base
    str     xzr, [x1]
    adrp    x0, blk_fail_msg
    add     x0, x0, :lo12:blk_fail_msg
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

blk_read:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    adrp    x19, blk_base
    add     x19, x19, :lo12:blk_base
    ldr     x19, [x19]
    cbz     x19, blk_read_fail
    mov     x20, x1
    adrp    x1, blk_hdr
    add     x1, x1, :lo12:blk_hdr
    mov     w2, #BLK_T_IN
    str     w2, [x1, #BLK_HDR_TYPE]
    str     wzr, [x1, #BLK_HDR_IOPRIO]
    str     x0, [x1, #BLK_HDR_SECTOR]
    adrp    x2, blk_desc
    add     x2, x2, :lo12:blk_desc
    str     x1, [x2, #VRING_DESC_ADDR]
    mov     w3, #BLK_HDR_SIZE
    str     w3, [x2, #VRING_DESC_LEN]
    mov     w3, #VRING_DESC_F_NEXT
    strh    w3, [x2, #VRING_DESC_FLAGS]
    mov     w3, #1
    strh    w3, [x2, #VRING_DESC_NEXT]
    add     x3, x2, #VRING_DESC_SIZE
    str     x20, [x3, #VRING_DESC_ADDR]
    mov     w4, #BLK_SECTOR_SIZE
    str     w4, [x3, #VRING_DESC_LEN]
    mov     w4, #(VRING_DESC_F_NEXT | VRING_DESC_F_WRITE)
    strh    w4, [x3, #VRING_DESC_FLAGS]
    mov     w4, #2
    strh    w4, [x3, #VRING_DESC_NEXT]
    add     x3, x2, #(VRING_DESC_SIZE * 2)
    adrp    x4, blk_status
    add     x4, x4, :lo12:blk_status
    mov     w5, #0xff
    strb    w5, [x4]
    str     x4, [x3, #VRING_DESC_ADDR]
    mov     w5, #1
    str     w5, [x3, #VRING_DESC_LEN]
    mov     w5, #VRING_DESC_F_WRITE
    strh    w5, [x3, #VRING_DESC_FLAGS]
    strh    wzr, [x3, #VRING_DESC_NEXT]
    adrp    x4, blk_used
    add     x4, x4, :lo12:blk_used
    ldrh    w21, [x4, #VRING_USED_IDX]
    adrp    x4, blk_avail
    add     x4, x4, :lo12:blk_avail
    ldrh    w5, [x4, #VRING_AVAIL_IDX]
    and     w6, w5, #(BLK_QUEUE_SIZE - 1)
    add     x7, x4, x6, lsl #1
    strh    wzr, [x7, #VRING_AVAIL_RING]
    add     w5, w5, #1
    strh    w5, [x4, #VRING_AVAIL_IDX]
    dsb     sy
    str     wzr, [x19, #VIRTIO_REG_QUEUE_NOTIFY]
    ldr     x20, =BLK_TIMEOUT

blk_read_wait:
    adrp    x4, blk_used
    add     x4, x4, :lo12:blk_used
    ldrh    w5, [x4, #VRING_USED_IDX]
    cmp     w5, w21
    b.ne    blk_read_check
    subs    x20, x20, #1
    b.ne    blk_read_wait
    b       blk_read_fail

blk_read_check:
    ldr     w0, [x19, #VIRTIO_REG_INT_STATUS]
    str     w0, [x19, #VIRTIO_REG_INT_ACK]
    adrp    x4, blk_status
    add     x4, x4, :lo12:blk_status
    ldrb    w0, [x4]
    cmp     w0, #BLK_S_OK
    b.ne    blk_read_fail
    mov     w0, #0
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

blk_read_fail:
    mov     w0, #1
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

virtio_input_poll:
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    adrp    x0, virtio_input_base
    add     x0, x0, :lo12:virtio_input_base
    ldr     x19, [x0]
    cbz     x19, virtio_input_poll_end
    ldr     w0, [x19, #VIRTIO_REG_INT_STATUS]
    str     w0, [x19, #VIRTIO_REG_INT_ACK]
    adrp    x0, virtio_used
    add     x0, x0, :lo12:virtio_used
    ldrh    w20, [x0, #VRING_USED_IDX]
    adrp    x0, virtio_last_used
    add     x0, x0, :lo12:virtio_last_used
    ldrh    w21, [x0]

virtio_input_poll_loop:
    cmp     w21, w20
    b.eq    virtio_input_poll_kick
    and     w0, w21, #VIRTIO_QUEUE_MASK
    adrp    x1, virtio_used
    add     x1, x1, :lo12:virtio_used
    add     x1, x1, #VRING_USED_RING
    add     x1, x1, x0, lsl #3
    ldr     w0, [x1]
    adrp    x1, virtio_events
    add     x1, x1, :lo12:virtio_events
    add     x1, x1, x0, lsl #3
    ldrh    w6, [x1]
    ldrh    w7, [x1, #2]
    ldr     w8, [x1, #4]
    adrp    x1, virtio_avail
    add     x1, x1, :lo12:virtio_avail
    ldrh    w2, [x1, #VRING_AVAIL_IDX]
    and     w3, w2, #VIRTIO_QUEUE_MASK
    add     x4, x1, x3, lsl #1
    strh    w0, [x4, #VRING_AVAIL_RING]
    add     w2, w2, #1
    strh    w2, [x1, #VRING_AVAIL_IDX]
    mov     w0, w6
    mov     w1, w7
    mov     w2, w8
    bl      mouse_apply
    add     w21, w21, #1
    and     w21, w21, #VRING_IDX_MASK
    b       virtio_input_poll_loop

virtio_input_poll_kick:
    adrp    x0, virtio_last_used
    add     x0, x0, :lo12:virtio_last_used
    strh    w21, [x0]
    dsb     sy
    str     wzr, [x19, #VIRTIO_REG_QUEUE_NOTIFY]

virtio_input_poll_end:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

mouse_init:
    adrp    x0, mouse_x
    add     x0, x0, :lo12:mouse_x
    mov     w1, #(FB_WIDTH / 2)
    str     w1, [x0]
    mov     w1, #(FB_HEIGHT / 2)
    str     w1, [x0, #4]
    ret

mouse_clamp:
    cmp     w0, #0
    csel    w0, wzr, w0, lt
    cmp     w0, w1
    csel    w0, w1, w0, gt
    ret

mouse_apply:
    stp     x29, x30, [sp, #-16]!
    cmp     w0, #EV_REL
    b.eq    mouse_apply_rel
    cmp     w0, #EV_KEY
    b.eq    mouse_apply_key
    cmp     w0, #EV_SYN
    b.eq    mouse_apply_syn
    ldp     x29, x30, [sp], #16
    ret

mouse_apply_rel:
    adrp    x3, mouse_x
    add     x3, x3, :lo12:mouse_x
    cmp     w1, #REL_X
    b.eq    mouse_apply_rel_x
    cmp     w1, #REL_Y
    b.ne    mouse_apply_done
    ldr     w0, [x3, #4]
    add     w0, w0, w2
    mov     w1, #(FB_HEIGHT - 1)
    bl      mouse_clamp
    adrp    x3, mouse_x
    add     x3, x3, :lo12:mouse_x
    str     w0, [x3, #4]
    b       mouse_apply_done

mouse_apply_rel_x:
    ldr     w0, [x3]
    add     w0, w0, w2
    mov     w1, #(FB_WIDTH - 1)
    bl      mouse_clamp
    adrp    x3, mouse_x
    add     x3, x3, :lo12:mouse_x
    str     w0, [x3]
    b       mouse_apply_done

mouse_apply_key:
    ldr     w3, =BTN_LEFT
    cmp     w1, w3
    b.ne    mouse_apply_done
    adrp    x3, mouse_buttons
    add     x3, x3, :lo12:mouse_buttons
    strb    w2, [x3]
    adrp    x3, mouse_dirty
    add     x3, x3, :lo12:mouse_dirty
    mov     w0, #1
    strb    w0, [x3]
    cbz     w2, mouse_apply_done
    b       mouse_click

mouse_click:
    mrs     x0, cntpct_el0
    adrp    x3, click_last
    add     x3, x3, :lo12:click_last
    ldr     x1, [x3]
    sub     x2, x0, x1
    str     x0, [x3]
    adrp    x3, click_window
    add     x3, x3, :lo12:click_window
    ldr     x4, [x3]
    adrp    x3, click_count
    add     x3, x3, :lo12:click_count
    ldr     w5, [x3]
    cmp     x2, x4
    b.hs    mouse_click_first
    add     w5, w5, #1
    cmp     w5, #CLICK_MAX
    b.ls    mouse_click_store
    mov     w5, #1
    b       mouse_click_store

mouse_click_first:
    mov     w5, #1

mouse_click_store:
    str     w5, [x3]
    adrp    x3, click_pending
    add     x3, x3, :lo12:click_pending
    mov     w0, #1
    strb    w0, [x3]
    b       mouse_apply_done

mouse_apply_syn:
    adrp    x3, mouse_dirty
    add     x3, x3, :lo12:mouse_dirty
    mov     w0, #1
    strb    w0, [x3]

mouse_apply_done:
    ldp     x29, x30, [sp], #16
    ret

virtio_input_fill:
    adrp    x0, virtio_desc
    add     x0, x0, :lo12:virtio_desc
    adrp    x1, virtio_events
    add     x1, x1, :lo12:virtio_events
    adrp    x2, virtio_avail
    add     x2, x2, :lo12:virtio_avail
    mov     w3, #0

virtio_input_fill_loop:
    add     x4, x0, x3, lsl #4
    add     x5, x1, x3, lsl #3
    str     x5, [x4, #VRING_DESC_ADDR]
    mov     w6, #VIRTIO_EVENT_SIZE
    str     w6, [x4, #VRING_DESC_LEN]
    mov     w6, #VRING_DESC_F_WRITE
    strh    w6, [x4, #VRING_DESC_FLAGS]
    strh    wzr, [x4, #VRING_DESC_NEXT]
    add     x6, x2, x3, lsl #1
    strh    w3, [x6, #VRING_AVAIL_RING]
    add     w3, w3, #1
    cmp     w3, #VIRTIO_QUEUE_SIZE
    b.lo    virtio_input_fill_loop
    strh    w3, [x2, #VRING_AVAIL_IDX]
    dsb     sy
    ret

gic_init:
    mov     x0, #GICD_BASE
    mov     w1, #GIC_ENABLE
    str     w1, [x0, #GICD_CTLR]
    mov     x0, #GICC_BASE
    mov     w1, #GIC_PMR_UNMASKED
    str     w1, [x0, #GICC_PMR]
    mov     w1, #GIC_ENABLE
    str     w1, [x0, #GICC_CTLR]
    ret

gic_enable_irq:
    mov     x1, #GICD_BASE
    add     x2, x1, #GICD_IPRIORITYR
    strb    wzr, [x2, w0, uxtw]
    add     x2, x1, #GICD_ITARGETSR
    mov     w3, #GIC_TARGET_CPU0
    strb    w3, [x2, w0, uxtw]
    lsr     w2, w0, #5
    and     w3, w0, #31
    mov     w4, #1
    lsl     w4, w4, w3
    add     x2, x1, x2, lsl #2
    str     w4, [x2, #GICD_ISENABLER]
    dsb     sy
    ret

timer_init:
    mrs     x0, cntfrq_el0
    cbz     x0, timer_unavailable
    adrp    x1, timer_freq
    add     x1, x1, :lo12:timer_freq
    str     x0, [x1]
    mov     x2, #CLICK_WINDOW_MS
    mul     x2, x0, x2
    mov     x3, #MS_PER_SECOND
    udiv    x2, x2, x3
    adrp    x1, click_window
    add     x1, x1, :lo12:click_window
    str     x2, [x1]
    mov     x2, #TIMER_HZ
    udiv    x0, x0, x2
    adrp    x1, timer_interval
    add     x1, x1, :lo12:timer_interval
    str     x0, [x1]
    msr     cntp_tval_el0, x0
    mov     x0, #TIMER_CTL_ENABLE
    msr     cntp_ctl_el0, x0
    isb
    mov     w0, #TIMER_INTID
    b       gic_enable_irq

timer_unavailable:
    adrp    x0, timer_error
    add     x0, x0, :lo12:timer_error
    b       uart_puts

timer_tick:
    adrp    x0, timer_interval
    add     x0, x0, :lo12:timer_interval
    ldr     x1, [x0]
    msr     cntp_tval_el0, x1
    adrp    x0, console_cursor_phase
    add     x0, x0, :lo12:console_cursor_phase
    ldrb    w1, [x0]
    eor     w1, w1, #1
    strb    w1, [x0]
    adrp    x0, console_blink_pending
    add     x0, x0, :lo12:console_blink_pending
    mov     w1, #1
    strb    w1, [x0]
    ret

uart_rx_isr:
    mov     x1, #UART_BASE
    ldr     w2, [x1, #UART_MIS]
    str     w2, [x1, #UART_ICR]
    adrp    x8, uart_rx_ring
    add     x8, x8, :lo12:uart_rx_ring
    adrp    x9, uart_rx_head
    add     x9, x9, :lo12:uart_rx_head
    adrp    x10, uart_rx_tail
    add     x10, x10, :lo12:uart_rx_tail

uart_rx_isr_loop:
    ldr     w2, [x1, #UART_FR]
    tst     w2, #UART_FR_RXFE
    b.ne    uart_rx_isr_done
    ldr     w2, [x1, #UART_DR]
    ldr     w3, [x9]
    add     w4, w3, #1
    and     w4, w4, #UART_RX_RING_MASK
    ldr     w5, [x10]
    cmp     w4, w5
    b.eq    uart_rx_isr_overflow
    strb    w2, [x8, w3, uxtw]
    str     w4, [x9]
    b       uart_rx_isr_loop

uart_rx_isr_overflow:
    adrp    x3, uart_rx_overflow
    add     x3, x3, :lo12:uart_rx_overflow
    mov     w4, #1
    strb    w4, [x3]
    b       uart_rx_isr_loop

uart_rx_isr_done:
    ret

uart_rx_get:
    adrp    x1, uart_rx_tail
    add     x1, x1, :lo12:uart_rx_tail
    ldr     w2, [x1]
    adrp    x3, uart_rx_head
    add     x3, x3, :lo12:uart_rx_head
    ldr     w3, [x3]
    cmp     w2, w3
    b.eq    uart_rx_get_empty
    adrp    x4, uart_rx_ring
    add     x4, x4, :lo12:uart_rx_ring
    ldrb    w0, [x4, w2, uxtw]
    add     w2, w2, #1
    and     w2, w2, #UART_RX_RING_MASK
    str     w2, [x1]
    ret

uart_rx_get_empty:
    mov     w0, #-1
    ret

console_run:
    bl      console_draw_cursor

console_run_loop:
    msr     daifset, #DAIF_I
    bl      console_drain
    wfi
    msr     daifclr, #DAIF_I
    b       console_run_loop

console_drain:
    stp     x29, x30, [sp, #-16]!

console_drain_rx:
    bl      uart_rx_get
    cmn     w0, #1
    b.eq    console_drain_overflow
    bl      console_echo
    b       console_drain_rx

console_drain_overflow:
    adrp    x0, uart_rx_overflow
    add     x0, x0, :lo12:uart_rx_overflow
    ldrb    w1, [x0]
    cbz     w1, console_drain_click
    strb    wzr, [x0]
    adrp    x0, console_overflow_msg
    add     x0, x0, :lo12:console_overflow_msg
    bl      uart_puts

console_drain_click:
    adrp    x0, click_pending
    add     x0, x0, :lo12:click_pending
    ldrb    w1, [x0]
    cbz     w1, console_drain_mouse
    strb    wzr, [x0]
    adrp    x0, click_label
    add     x0, x0, :lo12:click_label
    adrp    x1, click_count
    add     x1, x1, :lo12:click_count
    ldr     w1, [x1]
    bl      uart_field

console_drain_mouse:
    adrp    x0, mouse_dirty
    add     x0, x0, :lo12:mouse_dirty
    ldrb    w1, [x0]
    cbz     w1, console_drain_blink
    strb    wzr, [x0]
    bl      cursor_update

console_drain_blink:
    adrp    x0, console_blink_pending
    add     x0, x0, :lo12:console_blink_pending
    ldrb    w1, [x0]
    cbz     w1, console_drain_done
    strb    wzr, [x0]
    bl      console_draw_cursor

console_drain_done:
    ldp     x29, x30, [sp], #16
    ret

console_echo:
    cmp     w0, #ASCII_CR
    b.ne    uart_putc
    stp     x29, x30, [sp, #-16]!
    mov     w0, #ASCII_CR
    bl      uart_putc
    mov     w0, #ASCII_LF
    bl      uart_putc
    ldp     x29, x30, [sp], #16
    ret

console_draw_cursor:
    stp     x29, x30, [sp, #-16]!
    adrp    x0, console_cursor_phase
    add     x0, x0, :lo12:console_cursor_phase
    ldrb    w0, [x0]
    cbz     w0, console_draw_cursor_off
    mov     w0, #ASCII_UNDERSCORE
    b       console_draw_cursor_emit

console_draw_cursor_off:
    mov     w0, #ASCII_SPACE

console_draw_cursor_emit:
    bl      uart_putc
    mov     w0, #ASCII_BS
    bl      uart_putc
    ldp     x29, x30, [sp], #16
    ret

irq_entry:
    irq_save
    mov     x1, #GICC_BASE
    ldr     w19, [x1, #GICC_IAR]
    and     w0, w19, #GIC_INTID_MASK
    cmp     w0, #GIC_INTID_SPURIOUS
    b.eq    irq_return
    cmp     w0, #TIMER_INTID
    b.eq    irq_timer
    cmp     w0, #UART_INTID
    b.eq    irq_uart
    adrp    x1, virtio_input_intid
    add     x1, x1, :lo12:virtio_input_intid
    ldr     w1, [x1]
    cmp     w0, w1
    b.eq    irq_virtio
    adrp    x0, irq_label
    add     x0, x0, :lo12:irq_label
    mov     x1, x19
    bl      uart_field
    b       irq_eoi

irq_timer:
    bl      timer_tick
    b       irq_eoi

irq_uart:
    bl      uart_rx_isr
    b       irq_eoi

irq_virtio:
    bl      virtio_input_poll

irq_eoi:
    mov     x1, #GICC_BASE
    str     w19, [x1, #GICC_EOIR]

irq_return:
    irq_restore
    ldp     x0, x1, [sp], #16
    eret

panic_entry:
    mov     x19, x0
    adrp    x0, panic_banner
    add     x0, x0, :lo12:panic_banner
    bl      uart_puts
    adrp    x0, panic_names
    add     x0, x0, :lo12:panic_names
    ldr     x0, [x0, x19, lsl #3]
    bl      uart_puts

    adrp    x0, panic_label_esr
    add     x0, x0, :lo12:panic_label_esr
    mrs     x1, esr_el1
    bl      uart_field

    adrp    x0, panic_label_elr
    add     x0, x0, :lo12:panic_label_elr
    mrs     x1, elr_el1
    bl      uart_field

    adrp    x0, panic_label_far
    add     x0, x0, :lo12:panic_label_far
    mrs     x1, far_el1
    bl      uart_field

    adrp    x0, panic_label_spsr
    add     x0, x0, :lo12:panic_label_spsr
    mrs     x1, spsr_el1
    bl      uart_field

    adrp    x0, uart_newline
    add     x0, x0, :lo12:uart_newline
    bl      uart_puts

panic_halt:
    wfi
    b       panic_halt

uart_field:
    stp     x29, x30, [sp, #-32]!
    str     x20, [sp, #16]
    mov     x20, x1
    bl      uart_puts
    mov     x0, x20
    bl      uart_puthex
    ldr     x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

uart_init:
    mov     x0, #UART_BASE
    str     wzr, [x0, #UART_CR]
    mov     w1, #UART_IBRD_115200
    str     w1, [x0, #UART_IBRD]
    mov     w1, #UART_FBRD_115200
    str     w1, [x0, #UART_FBRD]
    mov     w1, #(UART_LCRH_WLEN_8 | UART_LCRH_FEN)
    str     w1, [x0, #UART_LCRH]
    mov     w1, #(UART_IMSC_RXIM | UART_IMSC_RTIM)
    str     w1, [x0, #UART_IMSC]
    mov     w1, #(UART_CR_UARTEN | UART_CR_TXE | UART_CR_RXE)
    str     w1, [x0, #UART_CR]
    ret

uart_putc:
    mov     x1, #UART_BASE

uart_putc_wait:
    ldr     w2, [x1, #UART_FR]
    tst     w2, #UART_FR_TXFF
    b.ne    uart_putc_wait
    str     w0, [x1, #UART_DR]
    ret

uart_puts:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x19, x0

uart_puts_loop:
    ldrb    w0, [x19], #1
    cbz     w0, uart_puts_done
    bl      uart_putc
    b       uart_puts_loop

uart_puts_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

uart_putn:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     w20, w1

uart_putn_loop:
    cbz     w20, uart_putn_done
    ldrb    w0, [x19], #1
    bl      uart_putc
    sub     w20, w20, #1
    b       uart_putn_loop

uart_putn_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

uart_puthex:
    stp     x29, x30, [sp, #-48]!
    str     x19, [sp, #16]
    str     x20, [sp, #24]
    mov     x19, x0
    mov     w20, #HEX_START_SHIFT

uart_puthex_loop:
    lsr     x0, x19, x20
    and     x0, x0, #HEX_NIBBLE_MASK
    cmp     x0, #HEX_DIGIT_LIMIT
    b.lo    uart_puthex_digit
    add     x0, x0, #HEX_ALPHA_ADJUST

uart_puthex_digit:
    add     x0, x0, #ASCII_ZERO
    bl      uart_putc
    subs    w20, w20, #HEX_SHIFT_STEP
    b.ge    uart_puthex_loop
    ldr     x19, [sp, #16]
    ldr     x20, [sp, #24]
    ldp     x29, x30, [sp], #48
    ret

.ltorg

.balign VEC_TABLE_ALIGN
vec_table:
    vec_entry 0, panic_entry
    vec_entry 1, panic_entry
    vec_entry 2, panic_entry
    vec_entry 3, panic_entry
    vec_entry 4, panic_entry
    vec_entry 5, irq_entry
    vec_entry 6, panic_entry
    vec_entry 7, panic_entry
    vec_entry 8, panic_entry
    vec_entry 9, panic_entry
    vec_entry 10, panic_entry
    vec_entry 11, panic_entry
    vec_entry 12, panic_entry
    vec_entry 13, panic_entry
    vec_entry 14, panic_entry
    vec_entry 15, panic_entry

.section .rodata

boot_banner:
    .asciz  "MONOLITH\r\n"

panic_banner:
    .asciz  "\r\nPANIC "

uart_newline:
    .asciz  "\r\n"

panic_label_esr:
    .asciz  " esr="

panic_label_elr:
    .asciz  " elr="

panic_label_far:
    .asciz  " far="

panic_label_spsr:
    .asciz  " spsr="

timer_error:
    .asciz  "TIMER UNAVAILABLE\r\n"

irq_label:
    .asciz  "\r\nIRQ UNEXPECTED iar="

console_overflow_msg:
    .asciz  "\r\nRX OVERFLOW\r\n"

fwcfg_ramfb_name:
    .asciz  "etc/ramfb"

fb_ready_msg:
    .asciz  "FB 640x480\r\n"

fb_missing_msg:
    .asciz  "FB UNAVAILABLE\r\n"

virtio_slot_label:
    .asciz  "VIRTIO at="

virtio_id_label:
    .asciz  " id="

virtio_ver_label:
    .asciz  " ver="

fat_label_res:
    .asciz  "FAT res="

fat_label_spf:
    .asciz  " spf="

fat_label_data:
    .asciz  " data="

fat_label_root:
    .asciz  " root="

fat_hello_name:
    .ascii  "HELLO   TXT"
    .byte   0

fat_cat_label:
    .asciz  "\r\n--- HELLO.TXT ---\r\n"

fat_missing_msg:
    .asciz  "\r\nFILE NOT FOUND\r\n"

fat_entry_prefix:
    .asciz  "\r\nFILE "

fat_size_label:
    .asciz  " size="

fat_fail_msg:
    .asciz  "FAT INVALID\r\n"

blk_sig_label:
    .asciz  "BLK sig="

blk_oem_label:
    .asciz  " oem="

blk_read_fail_msg:
    .asciz  "BLK READ FAILED\r\n"

blk_ready_msg:
    .asciz  "BLK READY\r\n"

blk_fail_msg:
    .asciz  "BLK UNAVAILABLE\r\n"

virtio_ready_msg:
    .asciz  "INPUT READY\r\n"

virtio_fail_msg:
    .asciz  "INPUT UNAVAILABLE\r\n"

fb_title:
    .asciz  "MONOLITH 0.1 - AArch64 Assembler"

fb_charset:
    .asciz  "ABCDEFGHIJKLMNOPQRSTUVWXYZ 0123456789"

fb_charset2:
    .asciz  "abcdefghijklmnopqrstuvwxyz !\"#$%&'()*+,-./"

font_data:
    .byte   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte   0x18, 0x3c, 0x3c, 0x18, 0x18, 0x00, 0x18, 0x00
    .byte   0x6c, 0x6c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte   0x6c, 0x6c, 0xfe, 0x6c, 0xfe, 0x6c, 0x6c, 0x00
    .byte   0x30, 0x7c, 0xc0, 0x78, 0x0c, 0xf8, 0x30, 0x00
    .byte   0x00, 0xc6, 0xcc, 0x18, 0x30, 0x66, 0xc6, 0x00
    .byte   0x38, 0x6c, 0x38, 0x76, 0xdc, 0xcc, 0x76, 0x00
    .byte   0x60, 0x60, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte   0x18, 0x30, 0x60, 0x60, 0x60, 0x30, 0x18, 0x00
    .byte   0x60, 0x30, 0x18, 0x18, 0x18, 0x30, 0x60, 0x00
    .byte   0x00, 0x66, 0x3c, 0xff, 0x3c, 0x66, 0x00, 0x00
    .byte   0x00, 0x30, 0x30, 0xfc, 0x30, 0x30, 0x00, 0x00
    .byte   0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x30, 0x60
    .byte   0x00, 0x00, 0x00, 0xfc, 0x00, 0x00, 0x00, 0x00
    .byte   0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x30, 0x00
    .byte   0x06, 0x0c, 0x18, 0x30, 0x60, 0xc0, 0x80, 0x00
    .byte   0x7c, 0xc6, 0xce, 0xde, 0xf6, 0xe6, 0x7c, 0x00
    .byte   0x30, 0x70, 0x30, 0x30, 0x30, 0x30, 0xfc, 0x00
    .byte   0x78, 0xcc, 0x0c, 0x38, 0x60, 0xcc, 0xfc, 0x00
    .byte   0x78, 0xcc, 0x0c, 0x38, 0x0c, 0xcc, 0x78, 0x00
    .byte   0x1c, 0x3c, 0x6c, 0xcc, 0xfe, 0x0c, 0x1e, 0x00
    .byte   0xfc, 0xc0, 0xf8, 0x0c, 0x0c, 0xcc, 0x78, 0x00
    .byte   0x38, 0x60, 0xc0, 0xf8, 0xcc, 0xcc, 0x78, 0x00
    .byte   0xfc, 0xcc, 0x0c, 0x18, 0x30, 0x30, 0x30, 0x00
    .byte   0x78, 0xcc, 0xcc, 0x78, 0xcc, 0xcc, 0x78, 0x00
    .byte   0x78, 0xcc, 0xcc, 0x7c, 0x0c, 0x18, 0x70, 0x00
    .byte   0x00, 0x30, 0x30, 0x00, 0x00, 0x30, 0x30, 0x00
    .byte   0x00, 0x30, 0x30, 0x00, 0x00, 0x30, 0x30, 0x60
    .byte   0x18, 0x30, 0x60, 0xc0, 0x60, 0x30, 0x18, 0x00
    .byte   0x00, 0x00, 0xfc, 0x00, 0x00, 0xfc, 0x00, 0x00
    .byte   0x60, 0x30, 0x18, 0x0c, 0x18, 0x30, 0x60, 0x00
    .byte   0x78, 0xcc, 0x0c, 0x18, 0x30, 0x00, 0x30, 0x00
    .byte   0x7c, 0xc6, 0xde, 0xde, 0xde, 0xc0, 0x78, 0x00
    .byte   0x30, 0x78, 0xcc, 0xcc, 0xfc, 0xcc, 0xcc, 0x00
    .byte   0xfc, 0x66, 0x66, 0x7c, 0x66, 0x66, 0xfc, 0x00
    .byte   0x3c, 0x66, 0xc0, 0xc0, 0xc0, 0x66, 0x3c, 0x00
    .byte   0xf8, 0x6c, 0x66, 0x66, 0x66, 0x6c, 0xf8, 0x00
    .byte   0xfe, 0x62, 0x68, 0x78, 0x68, 0x62, 0xfe, 0x00
    .byte   0xfe, 0x62, 0x68, 0x78, 0x68, 0x60, 0xf0, 0x00
    .byte   0x3c, 0x66, 0xc0, 0xc0, 0xce, 0x66, 0x3e, 0x00
    .byte   0xcc, 0xcc, 0xcc, 0xfc, 0xcc, 0xcc, 0xcc, 0x00
    .byte   0x78, 0x30, 0x30, 0x30, 0x30, 0x30, 0x78, 0x00
    .byte   0x1e, 0x0c, 0x0c, 0x0c, 0xcc, 0xcc, 0x78, 0x00
    .byte   0xe6, 0x66, 0x6c, 0x78, 0x6c, 0x66, 0xe6, 0x00
    .byte   0xf0, 0x60, 0x60, 0x60, 0x62, 0x66, 0xfe, 0x00
    .byte   0xc6, 0xee, 0xfe, 0xfe, 0xd6, 0xc6, 0xc6, 0x00
    .byte   0xc6, 0xe6, 0xf6, 0xde, 0xce, 0xc6, 0xc6, 0x00
    .byte   0x38, 0x6c, 0xc6, 0xc6, 0xc6, 0x6c, 0x38, 0x00
    .byte   0xfc, 0x66, 0x66, 0x7c, 0x60, 0x60, 0xf0, 0x00
    .byte   0x78, 0xcc, 0xcc, 0xcc, 0xdc, 0x78, 0x1c, 0x00
    .byte   0xfc, 0x66, 0x66, 0x7c, 0x6c, 0x66, 0xe6, 0x00
    .byte   0x78, 0xcc, 0xe0, 0x70, 0x1c, 0xcc, 0x78, 0x00
    .byte   0xfc, 0xb4, 0x30, 0x30, 0x30, 0x30, 0x78, 0x00
    .byte   0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xfc, 0x00
    .byte   0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0x78, 0x30, 0x00
    .byte   0xc6, 0xc6, 0xc6, 0xd6, 0xfe, 0xee, 0xc6, 0x00
    .byte   0xc6, 0xc6, 0x6c, 0x38, 0x38, 0x6c, 0xc6, 0x00
    .byte   0xcc, 0xcc, 0xcc, 0x78, 0x30, 0x30, 0x78, 0x00
    .byte   0xfe, 0xc6, 0x8c, 0x18, 0x32, 0x66, 0xfe, 0x00
    .byte   0x78, 0x60, 0x60, 0x60, 0x60, 0x60, 0x78, 0x00
    .byte   0xc0, 0x60, 0x30, 0x18, 0x0c, 0x06, 0x02, 0x00
    .byte   0x78, 0x18, 0x18, 0x18, 0x18, 0x18, 0x78, 0x00
    .byte   0x10, 0x38, 0x6c, 0xc6, 0x00, 0x00, 0x00, 0x00
    .byte   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff
    .byte   0x30, 0x30, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte   0x00, 0x00, 0x78, 0x0c, 0x7c, 0xcc, 0x76, 0x00
    .byte   0xe0, 0x60, 0x60, 0x7c, 0x66, 0x66, 0xdc, 0x00
    .byte   0x00, 0x00, 0x78, 0xcc, 0xc0, 0xcc, 0x78, 0x00
    .byte   0x1c, 0x0c, 0x0c, 0x7c, 0xcc, 0xcc, 0x76, 0x00
    .byte   0x00, 0x00, 0x78, 0xcc, 0xfc, 0xc0, 0x78, 0x00
    .byte   0x38, 0x6c, 0x60, 0xf0, 0x60, 0x60, 0xf0, 0x00
    .byte   0x00, 0x00, 0x76, 0xcc, 0xcc, 0x7c, 0x0c, 0xf8
    .byte   0xe0, 0x60, 0x6c, 0x76, 0x66, 0x66, 0xe6, 0x00
    .byte   0x30, 0x00, 0x70, 0x30, 0x30, 0x30, 0x78, 0x00
    .byte   0x0c, 0x00, 0x0c, 0x0c, 0x0c, 0xcc, 0xcc, 0x78
    .byte   0xe0, 0x60, 0x66, 0x6c, 0x78, 0x6c, 0xe6, 0x00
    .byte   0x70, 0x30, 0x30, 0x30, 0x30, 0x30, 0x78, 0x00
    .byte   0x00, 0x00, 0xcc, 0xfe, 0xfe, 0xd6, 0xc6, 0x00
    .byte   0x00, 0x00, 0xf8, 0xcc, 0xcc, 0xcc, 0xcc, 0x00
    .byte   0x00, 0x00, 0x78, 0xcc, 0xcc, 0xcc, 0x78, 0x00
    .byte   0x00, 0x00, 0xdc, 0x66, 0x66, 0x7c, 0x60, 0xf0
    .byte   0x00, 0x00, 0x76, 0xcc, 0xcc, 0x7c, 0x0c, 0x1e
    .byte   0x00, 0x00, 0xdc, 0x76, 0x66, 0x60, 0xf0, 0x00
    .byte   0x00, 0x00, 0x7c, 0xc0, 0x78, 0x0c, 0xf8, 0x00
    .byte   0x10, 0x30, 0x7c, 0x30, 0x30, 0x34, 0x18, 0x00
    .byte   0x00, 0x00, 0xcc, 0xcc, 0xcc, 0xcc, 0x76, 0x00
    .byte   0x00, 0x00, 0xcc, 0xcc, 0xcc, 0x78, 0x30, 0x00
    .byte   0x00, 0x00, 0xc6, 0xd6, 0xfe, 0xfe, 0x6c, 0x00
    .byte   0x00, 0x00, 0xc6, 0x6c, 0x38, 0x6c, 0xc6, 0x00
    .byte   0x00, 0x00, 0xcc, 0xcc, 0xcc, 0x7c, 0x0c, 0xf8
    .byte   0x00, 0x00, 0xfc, 0x98, 0x30, 0x64, 0xfc, 0x00
    .byte   0x1c, 0x30, 0x30, 0xe0, 0x30, 0x30, 0x1c, 0x00
    .byte   0x18, 0x18, 0x18, 0x00, 0x18, 0x18, 0x18, 0x00
    .byte   0xe0, 0x30, 0x30, 0x1c, 0x30, 0x30, 0xe0, 0x00
    .byte   0x76, 0xdc, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

cursor_bitmap:
    .byte   0b10000000
    .byte   0b11000000
    .byte   0b11100000
    .byte   0b11110000
    .byte   0b11111000
    .byte   0b11111100
    .byte   0b11111110
    .byte   0b11111111
    .byte   0b11111000
    .byte   0b10011000
    .byte   0b00011100
    .byte   0b00001100

fdt_memory_name:
    .asciz  "memory"

fdt_reg_name:
    .asciz  "reg"

mem_fdt_label:
    .asciz  "\r\nFDT at="

mem_fdt_label2:
    .asciz  " magic="

mmu_ready_msg:
    .asciz  "MMU ON\r\n"

pmm_used_label:
    .asciz  "\r\nPMM used="

pmm_test_label:
    .asciz  " p="

pmm_reuse_label:
    .asciz  " reuse="

pmm_fdt_label:
    .asciz  "FDT at="

pmm_fdtlen_label:
    .asciz  " len="

pmm_fdt_suffix:
    .asciz  "\r\n"

pmm_base_label:
    .asciz  "PMM base="

pmm_pages_label:
    .asciz  " pages="

pmm_fail_msg:
    .asciz  "PMM NO MEMORY\r\n"

mem_base_label:
    .asciz  "RAM base="

mem_size_label:
    .asciz  " size="

mem_fail_msg:
    .asciz  "RAM UNKNOWN\r\n"

virtio_irq_label:
    .asciz  "INPUT irq="

click_label:
    .asciz  "\r\nCLICK n="

mouse_label_x:
    .asciz  "\r\nM x="

mouse_label_y:
    .asciz  " y="

mouse_label_b:
    .asciz  " b="

panic_name_00:
    .asciz  "EL1t_SYNC"
panic_name_01:
    .asciz  "EL1t_IRQ"
panic_name_02:
    .asciz  "EL1t_FIQ"
panic_name_03:
    .asciz  "EL1t_ERR"
panic_name_04:
    .asciz  "EL1h_SYNC"
panic_name_05:
    .asciz  "EL1h_IRQ"
panic_name_06:
    .asciz  "EL1h_FIQ"
panic_name_07:
    .asciz  "EL1h_ERR"
panic_name_08:
    .asciz  "EL0_64_SYNC"
panic_name_09:
    .asciz  "EL0_64_IRQ"
panic_name_10:
    .asciz  "EL0_64_FIQ"
panic_name_11:
    .asciz  "EL0_64_ERR"
panic_name_12:
    .asciz  "EL0_32_SYNC"
panic_name_13:
    .asciz  "EL0_32_IRQ"
panic_name_14:
    .asciz  "EL0_32_FIQ"
panic_name_15:
    .asciz  "EL0_32_ERR"

.balign 8
panic_names:
    .quad   panic_name_00
    .quad   panic_name_01
    .quad   panic_name_02
    .quad   panic_name_03
    .quad   panic_name_04
    .quad   panic_name_05
    .quad   panic_name_06
    .quad   panic_name_07
    .quad   panic_name_08
    .quad   panic_name_09
    .quad   panic_name_10
    .quad   panic_name_11
    .quad   panic_name_12
    .quad   panic_name_13
    .quad   panic_name_14
    .quad   panic_name_15

.section .bss

.balign 8
timer_interval:
    .space  8

.balign 4
uart_rx_head:
    .space  4
uart_rx_tail:
    .space  4

uart_rx_ring:
    .space  UART_RX_RING_SIZE

uart_rx_overflow:
    .space  1
console_cursor_phase:
    .space  1
console_blink_pending:
    .space  1

.balign 16
fwcfg_access:
    .space  16
fwcfg_count:
    .space  4
fwcfg_entry:
    .space  FWCFG_ENTRY_SIZE

.balign 16
fb_config:
    .space  FB_CFG_SIZE

.balign 16
virtio_input_base:
    .space  8

.balign 8
fdt_base:
    .space  8
ram_base:
    .space  8
ram_size:
    .space  8

.balign 8
pmm_base:
    .space  8
pmm_pages:
    .space  8

.balign 8
pmm_bitmap:
    .space  PMM_BITMAP_SIZE

.balign 4096
mmu_l1_table:
    .space  4096

.balign 4096
mmu_l2_table:
    .space  4096

.balign 16
virtio_desc:
    .space  (VRING_DESC_SIZE * VIRTIO_QUEUE_SIZE)

.balign 16
virtio_avail:
    .space  (VRING_AVAIL_RING + VIRTIO_QUEUE_SIZE * 2 + 2)

.balign 16
virtio_used:
    .space  (VRING_USED_RING + VIRTIO_QUEUE_SIZE * VRING_USED_ELEM_SIZE + 2)

.balign 16
virtio_events:
    .space  (VIRTIO_EVENT_SIZE * VIRTIO_QUEUE_SIZE)

.balign 16
blk_base:
    .space  8
blk_desc:
    .space  (VRING_DESC_SIZE * BLK_QUEUE_SIZE)

.balign 16
blk_avail:
    .space  (VRING_AVAIL_RING + BLK_QUEUE_SIZE * 2 + 2)

.balign 16
blk_used:
    .space  (VRING_USED_RING + BLK_QUEUE_SIZE * VRING_USED_ELEM_SIZE + 2)

.balign 16
blk_hdr:
    .space  BLK_HDR_SIZE
blk_status:
    .space  1

.balign 512
blk_buffer:
    .space  BLK_SECTOR_SIZE

.balign 4
fat_state:
    .space  FAT_STATE_SIZE

.balign 512
fat_buffer:
    .space  BLK_SECTOR_SIZE

.balign 4
virtio_input_intid:
    .space  4
virtio_last_used:
    .space  2

.balign 4
mouse_x:
    .space  4
mouse_y:
    .space  4
mouse_buttons:
    .space  1
mouse_dirty:
    .space  1
click_pending:
    .space  1

.balign 8
timer_freq:
    .space  8
click_window:
    .space  8
click_last:
    .space  8

.balign 4
click_count:
    .space  4

.balign 4
cursor_state:
    .space  CURSOR_STATE_SIZE

.balign 4
cursor_backing:
    .space  CURSOR_BACKING_SIZE

.balign BLOCK_SIZE
fb_memory:
    .space  FB_SIZE
