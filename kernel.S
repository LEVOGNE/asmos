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
.equ DEC_BUFFER_SIZE,       24

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

.equ TIMER_INTID,           27
.equ TIMER_CTL_ENABLE,      1
.equ TIMER_HZ,              60
.equ BLINK_HZ,              2
.equ BLINK_DIVIDER,         (TIMER_HZ / BLINK_HZ)
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
.equ BPB_FAT_SZ16,          0x16
.equ BPB_EXT_FLAGS,         0x28
.equ EXT_FLAGS_NO_MIRROR,   0x80
.equ EXT_FLAGS_ACTIVE,      0x0f
.equ FAT_MIN_CLUSTER,       2
.equ FONT_MAX_SIZE,          (64 * 1024)
.equ TTF_NUM_TABLES,        4
.equ FONT_TABLE_DIR,         12
.equ FONT_TABLE_ENTRY,       16
.equ FONT_TAG_OFF,           0
.equ FONT_TAG_CHECKSUM,      4
.equ FONT_TAG_OFFSET,        8
.equ FONT_TAG_LENGTH,        12

.equ HEAD_UNITS_PER_EM,     18
.equ HEAD_INDEX_TO_LOC,     50
.equ MAXP_NUM_GLYPHS,       4
.equ HHEA_ASCENDER,         4
.equ HHEA_DESCENDER,        6

.equ FONT_HEAD,             0
.equ FONT_MAXP,             8
.equ FONT_LOCA,             16
.equ FONT_GLYF,             24
.equ FONT_CMAP,             32
.equ FONT_HMTX,             40
.equ FONT_HHEA,             48
.equ FONT_UNITS,            56
.equ FONT_NGLYPHS,          60
.equ FONT_LOCFMT,           64
.equ FONT_CMAP4,            72
.equ FONT_FILESIZE,         80
.equ FONT_NUMH,             68
.equ HHEA_NUM_HMETRICS,     34
.equ FONT_STATE_SIZE,       88

.equ CMAP_NTABLES,          2
.equ CMAP_RECORDS,          4
.equ CMAP_RECORD_SIZE,      8
.equ CMAP_REC_OFFSET,       4
.equ CMAP4_SEGX2,           6
.equ CMAP4_ENDCODE,         14

.equ GLYF_NCONTOURS,        0
.equ GLYF_XMIN,             2
.equ GLYF_ENDPTS,           10

.equ GLYPH_MAX_POINTS,      256
.equ GLYPH_MAX_CONTOURS,    16
.equ GLYPH_NCONTOURS,       0
.equ GLYPH_NPOINTS,         4
.equ GLYPH_STATE_SIZE,      8

.equ VG_EDGE_XTOP,             0
.equ VG_EDGE_YTOP,             4
.equ VG_EDGE_XBOT,             8
.equ VG_EDGE_YBOT,             12
.equ VG_EDGE_DIR,              16
.equ VG_EDGE_SIZE,             20
.equ VG_EDGE_MAX,              2048
.equ FIX_SHIFT,             16
.equ FIX_ONE,               0x10000
.equ BEZIER_MIN,            2
.equ BEZIER_MAX,            16
.equ BEZIER_PX_PER_STEP,    3
.equ VG_XS_MAX,                64
.equ VG_XS_SIZE,               8
.equ VG_COV_MAX,               FB_WIDTH
.equ SUBSAMPLES,            4
.equ SUB_STEP,              (FIX_ONE / SUBSAMPLES)
.equ SUB_HALF,              (SUB_STEP / 2)

.equ PT_ON_CURVE,           0x01
.equ PT_X_SHORT,            0x02
.equ PT_Y_SHORT,            0x04
.equ PT_REPEAT,             0x08
.equ PT_X_SAME,             0x10
.equ PT_Y_SAME,             0x20
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

.equ VIRTIO_REG_CONFIG,     0x100
.equ VIN_CFG_SELECT,        0
.equ VIN_CFG_SUBSEL,        1
.equ VIN_CFG_SIZE,          2
.equ VIN_CFG_UNION,         8
.equ VIN_CFG_ABS_INFO,      0x12
.equ VIN_ABS_MIN,           0
.equ VIN_ABS_MAX,           4

.equ EV_SYN,                0x00
.equ EV_KEY,                0x01
.equ EV_REL,                0x02
.equ EV_ABS,                0x03
.equ ABS_X,                 0x00
.equ ABS_Y,                 0x01
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

.equ FB_WIDTH,              3840
.equ FB_HEIGHT,             1600
.equ FB_BPP,                8
.equ FB_STRIDE,             (FB_WIDTH * FB_BPP)
.equ FB_SIZE,               (FB_STRIDE * FB_HEIGHT)
.equ OUT_BPP,               4
.equ OUT_STRIDE,            (FB_WIDTH * OUT_BPP)
.equ OUT_SIZE,              (OUT_STRIDE * FB_HEIGHT)
.equ OUT_BLOCKS,            ((OUT_SIZE + BLOCK_SIZE - 1) / BLOCK_SIZE)
.equ CH_SHIFT_R,            0
.equ CH_SHIFT_G,            16
.equ CH_SHIFT_B,            32
.equ CH_SHIFT_A,            48
.equ FB_FOURCC_XR24,        0x34325258

.equ FB_CFG_ADDR,           0
.equ FB_CFG_FOURCC,         8
.equ FB_CFG_FLAGS,          12
.equ FB_CFG_WIDTH,          16
.equ FB_CFG_HEIGHT,         20
.equ FB_CFG_STRIDE,         24
.equ FB_CFG_SIZE,           28

.equ CLIP_X,                0
.equ CLIP_Y,                4
.equ CLIP_X2,               8
.equ CLIP_Y2,               12
.equ CLIP_SIZE,             16

.equ CURSOR_STATE_X,        0
.equ CURSOR_STATE_Y,        4
.equ CURSOR_STATE_W,        8
.equ CURSOR_STATE_H,        12
.equ CURSOR_STATE_VISIBLE,  16
.equ CURSOR_STATE_SIZE,     20


.equ CURSOR_W,              48
.equ CURSOR_H,              48
.equ CURSOR_WHITE_STRIDE,   (CURSOR_W / 8)
.equ ALPHA_8_TO_16,         257
.equ ALPHA_MAX,             0xffff
.equ ALPHA_ROUND,           0x8000
.equ CURSOR_BACKING_SIZE,   (CURSOR_W * CURSOR_H * FB_BPP)

.equ WIN_X,                 0
.equ WIN_Y,                 4
.equ WIN_W,                 8
.equ WIN_H,                 12
.equ WIN_TITLE,             16
.equ WIN_TX,                24
.equ WIN_TY,                32
.equ WIN_FOCUS,             40
.equ WIN_ALPHA,             48
.equ WIN_SIZE,              56
.equ WIN_FADE_MS,           260
.equ WIN_DRAG_MS,           90
.equ WIN_KEEP_VISIBLE,      120
.equ WIN_FOCUS_MS,          180
.equ ANIM_PROP_TX,          0
.equ ANIM_PROP_TY,          1
.equ ANIM_PROP_FOCUS,       2
.equ ANIM_PROP_SCREEN,      3
.equ ANIM_PROP_ALPHA,       4
.equ FADE_ONE,              0x10000
.equ SCREEN_FADE_MS,        450
.equ ANIM_PROP_COUNT,       5
.equ WIN_NONE,              -1
.equ WIN_MAX,               8
.equ WIN_BORDER,            2
.equ WIN_TITLEBAR_H,        52
.equ WIN_TEXT_PAD,          14
.equ WIN_TITLE_SIZE,        34

.equ DIRTY_X,               0
.equ DIRTY_Y,               4
.equ DIRTY_X2,              8
.equ DIRTY_Y2,              12
.equ DIRTY_SIZE,            16
.equ DIRTY_MAX,             16

.equ WIN_FORCE_FULL,        0
.equ FB_COUNT_PIXELS,       0
.equ WIN_SELFTEST,          0

.equ COLOR_WIN_BORDER,      0xffff303028282020
.equ COLOR_WIN_TITLE,       0xffff585848483838
.equ COLOR_WIN_TITLE_ACT,   0xffff909060602020
.equ COLOR_WIN_BODY,        0xffffd0d0ccccc8c8
.equ COLOR_WIN_TEXT,        0xffffffffffffffff

.equ COLOR_CURSOR,          0xffffffffffffffff
.equ COLOR_CURSOR_DARK,     0xffff000000000000
.equ COLOR_BACKGROUND,      0xffff303020201010
.equ COLOR_RED,             0xffff00000000ffff
.equ COLOR_GREEN,           0xffff0000ffff0000
.equ COLOR_BLUE,            0xffffffff00000000

.equ ANIM_MAX,              64
.equ ANIM_ENTRY_SIZE,       80
.equ ANIM_TARGET,           0
.equ ANIM_START_TIME,       8
.equ ANIM_DURATION,         16
.equ ANIM_FROM,             24
.equ ANIM_TO,               32
.equ ANIM_VALUE,            40
.equ ANIM_GROUP,            48
.equ ANIM_PROP,             56
.equ ANIM_EASING,           60
.equ ANIM_STATE,            62
.equ ANIM_FLAGS,            64
.equ ANIM_TAG,              68
.equ ANIM_GEN,              72
.equ ANIM_FREE,             0
.equ ANIM_RUNNING,          1
.equ ANIM_FINISHED,         2
.equ ANIM_STOP_HOLD,        0
.equ ANIM_STOP_END,         1
.equ ANIM_SLOT_MASK,        0xffff
.equ ANIM_MS_PER_SECOND,    1000

.equ ANIM_SHIFT,            32
.equ ANIM_HALF,             0x80000000
.equ ANIM_EASE_LINEAR,      0
.equ ANIM_EASE_QUAD_OUT,    1
.equ ANIM_EASE_CUBIC_OUT,   2
.equ ANIM_EASE_SMOOTH,      3
.equ ANIM_EASE_COUNT,       4

.equ ICON_SIZE,             32
.equ ICON_UNITS,            24
.equ ICON_SUBDIV,           8
.equ ICON_BIAS,             32
.equ ICON_SCALE,            ((ICON_SIZE << FIX_SHIFT) / (ICON_UNITS * ICON_SUBDIV))
.equ ICON_CMD_MOVE,         1
.equ ICON_CMD_LINE,         2
.equ ICON_CMD_QUAD,         3
.equ VG_DOT_N,              8
.equ VG_QUAD_MIN,           2
.equ VG_QUAD_MAX,           10
.equ VG_QUAD_PX,            4

.equ POWER_R,               32
.equ POWER_MARGIN,          28
.equ POWER_CX,              (FB_WIDTH - POWER_MARGIN - POWER_R)
.equ POWER_CY,              (POWER_MARGIN + POWER_R)
.equ COLOR_POWER,           0xffff20202020d8d8
.equ COLOR_POWER_SYMBOL,    0xffffffffffffffff
.equ PSCI_SYSTEM_OFF,       0x84000008

.equ DAIF_I,                2

.equ IRQ_FRAME_SIZE,        160

.equ BOOT_SELFTEST,         0
.equ PMM_SELFTEST,          0
.equ FS_SELFTEST,          0
.equ FS_SELFTEST_BIG,       0
.equ FONT_SELFTEST,          1
.equ TTF_TEST_SIZE,         90
.equ TTF_TEST_X,            250
.equ TTF_TEST_Y,            420
.equ TTF_TEST_ADVANCE,      52

.macro ladr reg, sym
    adrp    \reg, \sym
    add     \reg, \reg, :lo12:\sym
.endm

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
    .global vec_at_\index
vec_at_\index:
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
    ladr    x0, __stack_top
    mov     sp, x0
    bl      boot_clear_bss
    ladr    x0, fdt_base
    str     x21, [x0]
    bl      uart_init
    bl      vec_init
    ladr    x0, boot_banner
    bl      uart_puts
    bl      anim_init
    bl      win_drag_end
    ladr    x0, fb_fade
    mov     w1, #FADE_ONE
    str     w1, [x0]
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
    bl      fb_clip_full
    bl      mouse_init
    bl      virtio_scan
    bl      virtio_input_init
    bl      blk_init
    bl      fat_init
    bl      font_init
    ladr    x0, fb_fade
    str     wzr, [x0]
    bl      win_demo
.if WIN_SELFTEST
    bl      win_selftest
.endif
    mov     x0, #WIN_MAX
    mov     w1, #ANIM_PROP_SCREEN
    mov     x2, #0
    mov     x3, #1
    lsl     x3, x3, #ANIM_SHIFT
    mov     w4, #SCREEN_FADE_MS
    mov     w5, #ANIM_EASE_QUAD_OUT
    bl      anim_start
    bl      cursor_show
.if FS_SELFTEST
    bl      blk_selftest
    bl      fat_list_root
    ladr    x0, fat_cat_label
    bl      uart_puts
    ladr    x0, fat_hello_name
    bl      fat_cat
    ladr    x0, fat_empty_label
    bl      uart_puts
    ladr    x0, fat_empty_name
    bl      fat_cat
    ladr    x0, fat_missing_label
    bl      uart_puts
    ladr    x0, fat_missing_name
    bl      fat_cat
.endif
.if FS_SELFTEST_BIG
    ladr    x0, fat_big_label
    bl      uart_puts
    ladr    x0, fat_big_name
    bl      fat_cat
    ladr    x0, fat_big_end
    bl      uart_puts
.endif
    bl      timer_init
    msr     daifclr, #DAIF_I

.if BOOT_SELFTEST
    brk     #0
.endif

    ladr    x0, boot_ok_msg
    bl      uart_puts
    b       console_run

boot_clear_bss:
    ladr    x0, __bss_start
    ladr    x1, __bss_end

boot_clear_bss_loop:
    cmp     x0, x1
    b.hs    boot_clear_bss_done
    str     xzr, [x0], #8
    b       boot_clear_bss_loop

boot_clear_bss_done:
    ret

.section .text

vec_init:
    ladr    x0, vec_table
    msr     vbar_el1, x0
    isb
    ret

fwcfg_dma:
    ladr    x3, fwcfg_access
    rev     w0, w0
    str     w0, [x3]
    rev     w1, w1
    str     w1, [x3, #4]
    rev     x2, x2
    str     x2, [x3, #8]
    rev     x4, x3
    mov     x5, #FWCFG_BASE
    dsb     sy
    str     x4, [x5, #FWCFG_DMA]
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

fwcfg_find_ramfb:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     w0, #FWCFG_KEY_FILE_DIR
    mov     w1, #4
    ladr    x2, fwcfg_count
    bl      fwcfg_select_read
    cbnz    w0, fwcfg_find_fail
    ladr    x0, fwcfg_count
    ldr     w19, [x0]
    rev     w19, w19

fwcfg_find_loop:
    cbz     w19, fwcfg_find_fail
    sub     w19, w19, #1
    mov     w1, #FWCFG_ENTRY_SIZE
    ladr    x2, fwcfg_entry
    bl      fwcfg_read_next
    cbnz    w0, fwcfg_find_fail
    ladr    x0, fwcfg_entry
    add     x0, x0, #FWCFG_ENTRY_NAME
    ladr    x1, fwcfg_ramfb_name
    bl      string_equal
    cbz     w0, fwcfg_find_loop
    ladr    x0, fwcfg_entry
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
    ladr    x0, fb_config
    ladr    x1, fb_output
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
    mov     w1, #OUT_STRIDE
    rev     w1, w1
    str     w1, [x0, #FB_CFG_STRIDE]
    lsl     w0, w19, #16
    orr     w0, w0, #(FWCFG_DMA_SELECT | FWCFG_DMA_WRITE)
    mov     w1, #FB_CFG_SIZE
    ladr    x2, fb_config
    bl      fwcfg_dma
    cbnz    w0, fb_init_missing
    ladr    x0, fb_ready_msg
    bl      uart_puts
    mov     x0, #FB_WIDTH
    bl      uart_putdec
    ladr    x0, fb_times_msg
    bl      uart_puts
    mov     x0, #FB_HEIGHT
    bl      uart_putdec
    ladr    x0, fb_bpp_msg
    bl      uart_puts
    mov     x0, #(FB_BPP * 8)
    bl      uart_putdec
    ladr    x0, fb_bpp_msg2
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

fb_init_missing:
    ladr    x0, fb_missing_msg
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

fb_present_all:
    mov     w0, #0
    mov     w1, #0
    mov     w2, #FB_WIDTH
    mov     w3, #FB_HEIGHT
    b       fb_present

fb_present:
    stp     x29, x30, [sp, #-80]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    mov     w19, w0
    mov     w20, w1
    add     w21, w0, w2
    add     w22, w1, w3
    cmp     w19, wzr
    csel    w19, wzr, w19, lt
    cmp     w20, wzr
    csel    w20, wzr, w20, lt
    mov     w0, #FB_WIDTH
    cmp     w21, w0
    csel    w21, w0, w21, gt
    mov     w0, #FB_HEIGHT
    cmp     w22, w0
    csel    w22, w0, w22, gt
    subs    w21, w21, w19
    b.le    fb_present_done
    subs    w22, w22, w20
    b.le    fb_present_done

fb_present_row:
    cbz     w22, fb_present_done
    mov     w0, w19
    mov     w1, w20
    bl      fb_pixel_addr
    mov     x23, x0
    mov     w0, w19
    mov     w1, w20
    bl      out_pixel_addr
    mov     x1, x0
    mov     w2, w21
    ladr    x0, fb_fade
    ldr     w24, [x0]
    mov     w0, #FADE_ONE
    cmp     w24, w0
    b.ne    fb_present_col_fade

fb_present_col:
    cbz     w2, fb_present_next
    ldr     x3, [x23], #FB_BPP
    lsr     x4, x3, #(CH_SHIFT_B + 8)
    and     x4, x4, #0xff
    lsr     x5, x3, #(CH_SHIFT_G + 8)
    and     x5, x5, #0xff
    orr     x4, x4, x5, lsl #8
    lsr     x5, x3, #(CH_SHIFT_R + 8)
    and     x5, x5, #0xff
    orr     x4, x4, x5, lsl #16
    str     w4, [x1], #OUT_BPP
    sub     w2, w2, #1
    b       fb_present_col

fb_present_col_fade:
    cbz     w2, fb_present_next
    ldr     x3, [x23], #FB_BPP
    lsr     x4, x3, #(CH_SHIFT_B + 8)
    and     x4, x4, #0xff
    mul     x4, x4, x24
    lsr     x4, x4, #16
    lsr     x5, x3, #(CH_SHIFT_G + 8)
    and     x5, x5, #0xff
    mul     x5, x5, x24
    lsr     x5, x5, #16
    orr     x4, x4, x5, lsl #8
    lsr     x5, x3, #(CH_SHIFT_R + 8)
    and     x5, x5, #0xff
    mul     x5, x5, x24
    lsr     x5, x5, #16
    orr     x4, x4, x5, lsl #16
    str     w4, [x1], #OUT_BPP
    sub     w2, w2, #1
    b       fb_present_col_fade

fb_present_next:
    add     w20, w20, #1
    sub     w22, w22, #1
    b       fb_present_row

fb_present_done:
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #80
    ret

fb_clip_full:
    ladr    x0, fb_clip
    str     wzr, [x0, #CLIP_X]
    str     wzr, [x0, #CLIP_Y]
    mov     w1, #FB_WIDTH
    str     w1, [x0, #CLIP_X2]
    mov     w1, #FB_HEIGHT
    str     w1, [x0, #CLIP_Y2]
    ret

fb_clip_set:
    ladr    x4, fb_clip
    add     w2, w0, w2
    add     w3, w1, w3
    cmp     w0, wzr
    csel    w0, wzr, w0, lt
    cmp     w1, wzr
    csel    w1, wzr, w1, lt
    mov     w5, #FB_WIDTH
    cmp     w2, w5
    csel    w2, w5, w2, gt
    mov     w5, #FB_HEIGHT
    cmp     w3, w5
    csel    w3, w5, w3, gt
    str     w0, [x4, #CLIP_X]
    str     w1, [x4, #CLIP_Y]
    str     w2, [x4, #CLIP_X2]
    str     w3, [x4, #CLIP_Y2]
    ret

fb_pixel_addr:
    mov     x9, #FB_STRIDE
    madd    x9, x1, x9, xzr
    ladr    x10, fb_render
    add     x9, x10, x9
    add     x0, x9, x0, lsl #3
    ret

out_pixel_addr:
    mov     x9, #OUT_STRIDE
    madd    x9, x1, x9, xzr
    ladr    x10, fb_output
    add     x9, x10, x9
    add     x0, x9, x0, lsl #2
    ret

fb_fill_rect:
    stp     x29, x30, [sp, #-16]!
    ladr    x9, fb_clip
    add     w2, w0, w2
    add     w3, w1, w3
    ldr     w10, [x9, #CLIP_X]
    cmp     w0, w10
    csel    w0, w10, w0, lt
    ldr     w10, [x9, #CLIP_Y]
    cmp     w1, w10
    csel    w1, w10, w1, lt
    ldr     w10, [x9, #CLIP_X2]
    cmp     w2, w10
    csel    w2, w10, w2, gt
    ldr     w10, [x9, #CLIP_Y2]
    cmp     w3, w10
    csel    w3, w10, w3, gt
    subs    w2, w2, w0
    b.le    fb_fill_rect_done
    subs    w3, w3, w1
    b.le    fb_fill_rect_done
.if FB_COUNT_PIXELS
    ladr    x9, fb_pixel_count
    ldr     x10, [x9]
    umull   x11, w2, w3
    add     x10, x10, x11
    str     x10, [x9]
.endif
    bl      fb_pixel_addr
    mov     x5, x0

fb_fill_rect_row:
    cbz     w3, fb_fill_rect_done
    mov     w6, w2
    mov     x7, x5

fb_fill_rect_col:
    cbz     w6, fb_fill_rect_next
    str     x4, [x7], #FB_BPP
    sub     w6, w6, #1
    b       fb_fill_rect_col

fb_fill_rect_next:
    mov     x6, #FB_STRIDE
    add     x5, x5, x6
    sub     w3, w3, #1
    b       fb_fill_rect_row

fb_fill_rect_done:
    ldp     x29, x30, [sp], #16
    ret

cursor_copy:
cursor_copy_row:
    cbz     w3, cursor_copy_done
    mov     w6, w2
    mov     x7, x0
    mov     x8, x1

cursor_copy_col:
    cbz     w6, cursor_copy_next
    ldr     x9, [x8], #FB_BPP
    str     x9, [x7], #FB_BPP
    sub     w6, w6, #1
    b       cursor_copy_col

cursor_copy_next:
    add     x0, x0, x4
    add     x1, x1, x5
    sub     w3, w3, #1
    b       cursor_copy_row

cursor_copy_done:
    ret

cursor_hide:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    ladr    x19, cursor_state
    ldrb    w0, [x19, #CURSOR_STATE_VISIBLE]
    cbz     w0, cursor_hide_done
    strb    wzr, [x19, #CURSOR_STATE_VISIBLE]
    ldr     w0, [x19, #CURSOR_STATE_X]
    ldr     w1, [x19, #CURSOR_STATE_Y]
    bl      fb_pixel_addr
    ladr    x1, cursor_backing
    ldr     w2, [x19, #CURSOR_STATE_W]
    ldr     w3, [x19, #CURSOR_STATE_H]
    mov     x4, #FB_STRIDE
    mov     x5, #(CURSOR_W * FB_BPP)
    bl      cursor_copy
    ldr     w0, [x19, #CURSOR_STATE_X]
    ldr     w1, [x19, #CURSOR_STATE_Y]
    ldr     w2, [x19, #CURSOR_STATE_W]
    ldr     w3, [x19, #CURSOR_STATE_H]
    bl      fb_present

cursor_hide_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

cursor_show:
    stp     x29, x30, [sp, #-80]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    ladr    x19, cursor_state
    bl      mouse_get_pos
    mov     w20, w0
    mov     w21, w1
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
    mov     x1, x0
    ladr    x0, cursor_backing
    mov     w2, w22
    mov     w3, w23
    mov     x4, #(CURSOR_W * FB_BPP)
    mov     x5, #FB_STRIDE
    bl      cursor_copy

cursor_show_draw:
    ldr     w0, [x19, #CURSOR_STATE_X]
    ldr     w1, [x19, #CURSOR_STATE_Y]
    bl      fb_pixel_addr
    mov     x20, x0
    mov     w6, #0

cursor_show_draw_row:
    cmp     w6, w23
    b.hs    cursor_show_done
    ladr    x21, cursor_alpha_rows
    ldrh    w9, [x21, x6, lsl #1]
    ladr    x21, cursor_alpha_rle
    add     x21, x21, x9, lsl #1
    mov     w7, #0
    ladr    x24, cursor_white
    mov     x9, #CURSOR_WHITE_STRIDE
    madd    x24, x6, x9, x24
    mov     w4, #0
    mov     x5, x20

cursor_show_draw_col:
    cmp     w4, w22
    b.hs    cursor_show_draw_next
    cbnz    w7, cursor_show_draw_run
    ldrb    w7, [x21], #1
    ldrb    w8, [x21], #1

cursor_show_draw_run:
    sub     w7, w7, #1
    mov     w12, w8
    cbz     w12, cursor_show_draw_skip
    mov     w13, #ALPHA_8_TO_16
    mul     w12, w12, w13
    lsr     w13, w4, #3
    ldrb    w13, [x24, w13, uxtw]
    and     w14, w4, #7
    mov     w15, #7
    sub     w15, w15, w14
    lsr     w13, w13, w15
    tst     w13, #1
    b.eq    cursor_show_draw_dark
    mov     x10, x12
    orr     x10, x10, x12, lsl #CH_SHIFT_G
    orr     x10, x10, x12, lsl #CH_SHIFT_B
    orr     x10, x10, x12, lsl #CH_SHIFT_A
    b       cursor_show_draw_blend

cursor_show_draw_dark:
    lsl     x10, x12, #CH_SHIFT_A

cursor_show_draw_blend:
    mov     x13, #ALPHA_MAX
    cmp     x12, x13
    b.eq    cursor_show_draw_put
    sub     x12, x13, x12
    ldr     x11, [x5]
    and     x14, x11, #0xffff
    mul     x14, x14, x12
    add     x14, x14, #ALPHA_ROUND
    lsr     x15, x14, #16
    add     x14, x14, x15
    lsr     x14, x14, #16
    and     x15, x10, #0xffff
    add     x14, x14, x15
    lsr     x16, x11, #CH_SHIFT_G
    and     x16, x16, #0xffff
    mul     x16, x16, x12
    add     x16, x16, #ALPHA_ROUND
    lsr     x17, x16, #16
    add     x16, x16, x17
    lsr     x16, x16, #16
    lsr     x17, x10, #CH_SHIFT_G
    and     x17, x17, #0xffff
    add     x16, x16, x17
    orr     x14, x14, x16, lsl #CH_SHIFT_G
    lsr     x16, x11, #CH_SHIFT_B
    and     x16, x16, #0xffff
    mul     x16, x16, x12
    add     x16, x16, #ALPHA_ROUND
    lsr     x17, x16, #16
    add     x16, x16, x17
    lsr     x16, x16, #16
    lsr     x17, x10, #CH_SHIFT_B
    and     x17, x17, #0xffff
    add     x16, x16, x17
    orr     x14, x14, x16, lsl #CH_SHIFT_B
    mov     x16, #ALPHA_MAX
    orr     x10, x14, x16, lsl #CH_SHIFT_A

cursor_show_draw_put:
    str     x10, [x5]

cursor_show_draw_skip:
    add     x5, x5, #FB_BPP
    add     w4, w4, #1
    b       cursor_show_draw_col

cursor_show_draw_next:
    mov     x9, #FB_STRIDE
    add     x20, x20, x9
    add     w6, w6, #1
    b       cursor_show_draw_row

cursor_show_done:
    mov     w0, #1
    strb    w0, [x19, #CURSOR_STATE_VISIBLE]
    ldr     w0, [x19, #CURSOR_STATE_X]
    ldr     w1, [x19, #CURSOR_STATE_Y]
    ldr     w2, [x19, #CURSOR_STATE_W]
    ldr     w3, [x19, #CURSOR_STATE_H]
    bl      fb_present
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #80
    ret

cursor_update:
    stp     x29, x30, [sp, #-16]!
    bl      cursor_hide
    bl      cursor_show
    ldp     x29, x30, [sp], #16
    ret

dirty_reset:
    ladr    x9, dirty_count
    str     wzr, [x9]
    strb    wzr, [x9, #4]
    ret

dirty_all:
    ladr    x9, dirty_count
    str     wzr, [x9]
    mov     w10, #1
    strb    w10, [x9, #4]
    ret

dirty_add:
    ladr    x9, dirty_count
    ldrb    w10, [x9, #4]
    cbnz    w10, dirty_add_done
    add     w2, w0, w2
    add     w3, w1, w3
    ldr     w10, [x9]
    ladr    x11, dirty_list
    mov     w12, #0

dirty_add_merge:
    cmp     w12, w10
    b.hs    dirty_add_new
    mov     x13, #DIRTY_SIZE
    madd    x13, x12, x13, x11
    ldr     w14, [x13, #DIRTY_X]
    cmp     w2, w14
    b.le    dirty_add_next
    ldr     w15, [x13, #DIRTY_X2]
    cmp     w0, w15
    b.ge    dirty_add_next
    ldr     w14, [x13, #DIRTY_Y]
    cmp     w3, w14
    b.le    dirty_add_next
    ldr     w15, [x13, #DIRTY_Y2]
    cmp     w1, w15
    b.ge    dirty_add_next
    ldr     w14, [x13, #DIRTY_X]
    cmp     w0, w14
    csel    w0, w0, w14, lt
    str     w0, [x13, #DIRTY_X]
    ldr     w14, [x13, #DIRTY_Y]
    cmp     w1, w14
    csel    w1, w1, w14, lt
    str     w1, [x13, #DIRTY_Y]
    ldr     w14, [x13, #DIRTY_X2]
    cmp     w2, w14
    csel    w2, w2, w14, gt
    str     w2, [x13, #DIRTY_X2]
    ldr     w14, [x13, #DIRTY_Y2]
    cmp     w3, w14
    csel    w3, w3, w14, gt
    str     w3, [x13, #DIRTY_Y2]
    ret

dirty_add_next:
    add     w12, w12, #1
    b       dirty_add_merge

dirty_add_new:
    cmp     w10, #DIRTY_MAX
    b.hs    dirty_add_overflow
    mov     x13, #DIRTY_SIZE
    madd    x13, x10, x13, x11
    str     w0, [x13, #DIRTY_X]
    str     w1, [x13, #DIRTY_Y]
    str     w2, [x13, #DIRTY_X2]
    str     w3, [x13, #DIRTY_Y2]
    add     w10, w10, #1
    str     w10, [x9]

dirty_add_done:
    ret

dirty_add_overflow:
    str     wzr, [x9]
    mov     w10, #1
    strb    w10, [x9, #4]
    ret

win_dirty_rect:
    ladr    x9, win_list
    mov     x10, #WIN_SIZE
    madd    x9, x0, x10, x9
    ldr     w0, [x9, #WIN_X]
    ldr     x11, [x9, #WIN_TX]
    asr     x11, x11, #ANIM_SHIFT
    add     w0, w0, w11
    ldr     w1, [x9, #WIN_Y]
    ldr     x11, [x9, #WIN_TY]
    asr     x11, x11, #ANIM_SHIFT
    add     w1, w1, w11
    ldr     w2, [x9, #WIN_W]
    ldr     w3, [x9, #WIN_H]
    b       dirty_add

win_repaint:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
.if WIN_FORCE_FULL
    bl      dirty_all
.endif
    ladr    x19, dirty_count
    ldrb    w0, [x19, #4]
    cbnz    w0, win_repaint_full
    ldr     w20, [x19]
    cbz     w20, win_repaint_end
    mov     w19, #0

win_repaint_loop:
    cmp     w19, w20
    b.hs    win_repaint_end
    ladr    x9, dirty_list
    mov     x10, #DIRTY_SIZE
    madd    x9, x19, x10, x9
    ldr     w0, [x9, #DIRTY_X]
    ldr     w1, [x9, #DIRTY_Y]
    ldr     w2, [x9, #DIRTY_X2]
    ldr     w3, [x9, #DIRTY_Y2]
    sub     w2, w2, w0
    sub     w3, w3, w1
    bl      fb_clip_set
    bl      win_draw_all
    ladr    x9, dirty_list
    mov     x10, #DIRTY_SIZE
    madd    x9, x19, x10, x9
    ldr     w0, [x9, #DIRTY_X]
    ldr     w1, [x9, #DIRTY_Y]
    ldr     w2, [x9, #DIRTY_X2]
    ldr     w3, [x9, #DIRTY_Y2]
    sub     w2, w2, w0
    sub     w3, w3, w1
    bl      fb_present
    add     w19, w19, #1
    b       win_repaint_loop

win_repaint_full:
    bl      fb_clip_full
    bl      win_draw_all
    bl      fb_present_all

win_repaint_end:
    bl      fb_clip_full
    bl      dirty_reset
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

win_move:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     w19, w0
    mov     w20, w1
    mov     w21, w2
    bl      win_dirty_rect
    ladr    x9, win_list
    mov     x10, #WIN_SIZE
    madd    x9, x19, x10, x9
    ldr     w0, [x9, #WIN_X]
    add     w0, w0, w20
    str     w0, [x9, #WIN_X]
    ldr     w0, [x9, #WIN_Y]
    add     w0, w0, w21
    str     w0, [x9, #WIN_Y]
    mov     w0, w19
    bl      win_dirty_rect
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

vg_sqrt:
    cbz     x0, vg_sqrt_done
    mov     x2, x0
    clz     x1, x0
    mov     x3, #64
    sub     x1, x3, x1
    add     x1, x1, #1
    lsr     x1, x1, #1
    mov     x3, #1
    lsl     x1, x3, x1

vg_sqrt_loop:
    udiv    x3, x2, x1
    add     x3, x3, x1
    lsr     x3, x3, #1
    cmp     x3, x1
    b.hs    vg_sqrt_ready
    mov     x1, x3
    b       vg_sqrt_loop

vg_sqrt_ready:
    mov     x0, x1

vg_sqrt_done:
    ret

vg_seg:
    stp     x29, x30, [sp, #-96]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    stp     x27, x28, [sp, #80]
    mov     w19, w0
    mov     w20, w1
    mov     w21, w2
    mov     w22, w3
    sub     w23, w21, w19
    sub     w24, w22, w20
    sxtw    x0, w23
    mul     x0, x0, x0
    sxtw    x1, w24
    madd    x0, x1, x1, x0
    bl      vg_sqrt
    cbz     x0, vg_seg_done
    mov     x25, x0
    ladr    x0, vg_half
    ldr     w26, [x0]
    sxtw    x0, w24
    neg     x0, x0
    mov     x1, x26
    mul     x0, x0, x1
    sdiv    x27, x0, x25
    sxtw    x0, w23
    mul     x0, x0, x1
    sdiv    x28, x0, x25
    add     w0, w19, w27
    add     w1, w20, w28
    add     w2, w21, w27
    add     w3, w22, w28
    bl      vg_edge_add
    sub     w0, w21, w27
    sub     w1, w22, w28
    sub     w2, w19, w27
    sub     w3, w20, w28
    bl      vg_edge_add
    add     w0, w21, w27
    add     w1, w22, w28
    sub     w2, w21, w27
    sub     w3, w22, w28
    bl      vg_edge_add
    sub     w0, w19, w27
    sub     w1, w20, w28
    add     w2, w19, w27
    add     w3, w20, w28
    bl      vg_edge_add

vg_seg_done:
    ldp     x27, x28, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #96
    ret

vg_dot:
    stp     x29, x30, [sp, #-96]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    str     x27, [sp, #80]
    mov     w19, w0
    mov     w20, w1
    ladr    x0, vg_half
    ldr     w21, [x0]
    ladr    x22, vg_dot_tab
    ldr     w9, [x22]
    ldr     w10, [x22, #4]
    smull   x9, w9, w21
    asr     x9, x9, #FIX_SHIFT
    smull   x10, w10, w21
    asr     x10, x10, #FIX_SHIFT
    add     w23, w19, w9
    add     w24, w20, w10
    mov     w25, w23
    mov     w26, w24
    mov     w27, #1

vg_dot_loop:
    cmp     w27, #VG_DOT_N
    b.hs    vg_dot_close
    add     x9, x22, x27, lsl #3
    ldr     w10, [x9]
    ldr     w11, [x9, #4]
    smull   x10, w10, w21
    asr     x10, x10, #FIX_SHIFT
    smull   x11, w11, w21
    asr     x11, x11, #FIX_SHIFT
    add     w10, w19, w10
    add     w11, w20, w11
    stp     x10, x11, [sp, #-16]!
    mov     w0, w25
    mov     w1, w26
    mov     w2, w10
    mov     w3, w11
    bl      vg_edge_add
    ldp     x10, x11, [sp], #16
    mov     w25, w10
    mov     w26, w11
    add     w27, w27, #1
    b       vg_dot_loop

vg_dot_close:
    mov     w0, w25
    mov     w1, w26
    mov     w2, w23
    mov     w3, w24
    bl      vg_edge_add
    ldr     x27, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #96
    ret

icon_draw:
    stp     x29, x30, [sp, #-112]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    stp     x27, x28, [sp, #80]
    str     x3, [sp, #96]
    mov     x19, x0
    mov     w25, w1
    mov     w26, w2
    mov     x20, #ICON_SCALE
    bl      vg_edge_reset
    ladr    x0, vg_emit
    ladr    x1, vg_seg
    str     x1, [x0]
    ldrb    w21, [x19], #1
    ldrb    w0, [x19], #1
    mul     x0, x0, x20
    lsr     x0, x0, #1
    ladr    x1, vg_half
    str     w0, [x1]
    lsl     x25, x25, #FIX_SHIFT
    lsl     x26, x26, #FIX_SHIFT
    mov     w22, #0

icon_contour:
    cmp     w22, w21
    b.hs    icon_fill
    ldrb    w23, [x19], #1
    and     w23, w23, #0x7f
    mov     w24, #0

icon_cmd:
    cmp     w24, w23
    b.hs    icon_contour_next
    ldrb    w27, [x19], #1
    cmp     w27, #ICON_CMD_QUAD
    b.eq    icon_cmd_quad
    ldrb    w0, [x19], #1
    ldrb    w1, [x19], #1
    bl      icon_point
    cmp     w27, #ICON_CMD_MOVE
    b.eq    icon_cmd_move
    stp     x0, x1, [sp, #-16]!
    mov     w2, w0
    mov     w3, w1
    ladr    x4, vg_cur_x
    ldr     w0, [x4]
    ladr    x4, vg_cur_y
    ldr     w1, [x4]
    bl      vg_seg
    ldp     x0, x1, [sp], #16

icon_cmd_move:
    bl      icon_set_cur
    bl      vg_dot
    add     w24, w24, #1
    b       icon_cmd

icon_cmd_quad:
    ldrb    w0, [x19], #1
    ldrb    w1, [x19], #1
    bl      icon_point
    stp     x0, x1, [sp, #-16]!
    ldrb    w0, [x19], #1
    ldrb    w1, [x19], #1
    bl      icon_point
    ldp     x2, x3, [sp], #16
    stp     x0, x1, [sp, #-16]!
    ladr    x4, vg_cur_x
    ldr     w4, [x4]
    ladr    x5, vg_cur_y
    ldr     w5, [x5]
    mov     w6, w0
    mov     w7, w1
    mov     w0, w4
    mov     w1, w5
    mov     w4, w6
    mov     w5, w7
    bl      vg_quad
    ldp     x0, x1, [sp], #16
    bl      icon_set_cur
    bl      vg_dot
    add     w24, w24, #1
    b       icon_cmd

icon_contour_next:
    add     w22, w22, #1
    b       icon_contour

icon_fill:
    ldr     x0, [sp, #96]
    bl      vg_fill
    ldp     x27, x28, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #112
    ret

icon_point:
    sub     w0, w0, #ICON_BIAS
    sxtw    x0, w0
    mul     x0, x0, x20
    add     x0, x0, x25
    sub     w1, w1, #ICON_BIAS
    sxtw    x1, w1
    mul     x1, x1, x20
    add     x1, x1, x26
    ret

icon_set_cur:
    ladr    x2, vg_cur_x
    str     w0, [x2]
    ladr    x2, vg_cur_y
    str     w1, [x2]
    ret



anim_init:
    ladr    x0, anim_list
    mov     x1, #(ANIM_ENTRY_SIZE * ANIM_MAX)
    add     x1, x0, x1

anim_init_loop:
    cmp     x0, x1
    b.hs    anim_init_state
    stp     xzr, xzr, [x0], #16
    b       anim_init_loop

anim_init_state:
    ladr    x0, anim_active
    str     wzr, [x0]
    ladr    x0, anim_pending
    strb    wzr, [x0]
    ladr    x0, anim_gen_next
    mov     w1, #1
    str     w1, [x0]
    ret

anim_now:
    mrs     x0, cntvct_el0
    ret

anim_ms_to_ticks:
    mrs     x1, cntfrq_el0
    cbz     x1, anim_ms_no_clock
    mul     x0, x0, x1
    mov     x1, #ANIM_MS_PER_SECOND
    udiv    x0, x0, x1
    ret

anim_ms_no_clock:
    stp     x29, x30, [sp, #-16]!
    ladr    x0, anim_noclock_msg
    bl      uart_puts
    ldp     x29, x30, [sp], #16
    mov     x0, #0
    ret

anim_slot_addr:
    and     x1, x0, #ANIM_SLOT_MASK
    cmp     x1, #ANIM_MAX
    b.hs    anim_slot_none
    ladr    x2, anim_list
    mov     x3, #ANIM_ENTRY_SIZE
    madd    x2, x1, x3, x2
    ldr     w3, [x2, #ANIM_GEN]
    lsr     x4, x0, #16
    cmp     w3, w4
    b.ne    anim_slot_none
    mov     x0, x2
    ret

anim_slot_none:
    mov     x0, #0
    ret

anim_start:
    stp     x29, x30, [sp, #-96]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    str     x27, [sp, #80]
    mov     x19, x0
    mov     w20, w1
    mov     x21, x2
    mov     x22, x3
    mov     w23, w4
    mov     w24, w5
    mov     x0, x19
    mov     w1, w20
    bl      anim_find_running
    cbz     x0, anim_start_slot
    mov     x25, x0
    bl      anim_now
    ldr     x1, [x25, #ANIM_START_TIME]
    ldr     x2, [x25, #ANIM_DURATION]
    bl      anim_progress
    mov     x26, x0
    ldrh    w1, [x25, #ANIM_EASING]
    mov     x0, x26
    bl      anim_ease
    mov     x2, x0
    ldr     x0, [x25, #ANIM_FROM]
    ldr     x1, [x25, #ANIM_TO]
    bl      anim_lerp
    mov     x21, x0
    mov     w0, #ANIM_FREE
    strh    w0, [x25, #ANIM_STATE]
    ladr    x0, anim_active
    ldr     w1, [x0]
    sub     w1, w1, #1
    str     w1, [x0]

anim_start_slot:
    bl      anim_alloc
    cbz     x0, anim_start_fail
    mov     x25, x0
    str     x19, [x25, #ANIM_TARGET]
    str     w20, [x25, #ANIM_PROP]
    str     x21, [x25, #ANIM_FROM]
    str     x22, [x25, #ANIM_TO]
    str     x21, [x25, #ANIM_VALUE]
    strh    w24, [x25, #ANIM_EASING]
    mov     w0, w23
    bl      anim_ms_to_ticks
    str     x0, [x25, #ANIM_DURATION]
    bl      anim_now
    str     x0, [x25, #ANIM_START_TIME]
    mov     w0, #ANIM_RUNNING
    strh    w0, [x25, #ANIM_STATE]
    ladr    x0, anim_active
    ldr     w1, [x0]
    add     w1, w1, #1
    str     w1, [x0]
    ldr     w0, [x25, #ANIM_GEN]
    lsl     x0, x0, #16
    ladr    x1, anim_list
    sub     x1, x25, x1
    mov     x2, #ANIM_ENTRY_SIZE
    udiv    x1, x1, x2
    orr     x0, x0, x1
    b       anim_start_done

anim_start_fail:
    ladr    x0, anim_full_msg
    bl      uart_puts
    mov     x0, #0

anim_start_done:
    ldr     x27, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #96
    ret

anim_alloc:
    ladr    x1, anim_list
    mov     w2, #0

anim_alloc_loop:
    cmp     w2, #ANIM_MAX
    b.hs    anim_alloc_none
    mov     x3, #ANIM_ENTRY_SIZE
    madd    x3, x2, x3, x1
    ldrh    w4, [x3, #ANIM_STATE]
    cbz     w4, anim_alloc_found
    add     w2, w2, #1
    b       anim_alloc_loop

anim_alloc_found:
    ladr    x4, anim_gen_next
    ldr     w5, [x4]
    str     w5, [x3, #ANIM_GEN]
    add     w5, w5, #1
    mov     w6, #ANIM_SLOT_MASK
    cmp     w5, w6
    b.lo    anim_alloc_gen_ok
    mov     w5, #1

anim_alloc_gen_ok:
    str     w5, [x4]
    mov     x0, x3
    ret

anim_alloc_none:
    mov     x0, #0
    ret

anim_find_running:
    ladr    x2, anim_list
    mov     w3, #0

anim_find_loop:
    cmp     w3, #ANIM_MAX
    b.hs    anim_find_none
    mov     x4, #ANIM_ENTRY_SIZE
    madd    x4, x3, x4, x2
    ldrh    w5, [x4, #ANIM_STATE]
    cmp     w5, #ANIM_RUNNING
    b.ne    anim_find_next
    ldr     x5, [x4, #ANIM_TARGET]
    cmp     x5, x0
    b.ne    anim_find_next
    ldr     w5, [x4, #ANIM_PROP]
    cmp     w5, w1
    b.ne    anim_find_next
    mov     x0, x4
    ret

anim_find_next:
    add     w3, w3, #1
    b       anim_find_loop

anim_find_none:
    mov     x0, #0
    ret

anim_apply:
    cmp     x0, #WIN_MAX
    b.eq    anim_apply_screen
    b.hs    anim_apply_none
    cmp     w1, #ANIM_PROP_COUNT
    b.hs    anim_apply_none
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     x19, x0
    mov     w20, w1
    mov     x21, x2
    bl      win_dirty_rect
    ladr    x3, win_list
    mov     x4, #WIN_SIZE
    madd    x3, x19, x4, x3
    cmp     w20, #ANIM_PROP_TY
    b.eq    anim_apply_ty
    cmp     w20, #ANIM_PROP_FOCUS
    b.eq    anim_apply_focus
    cmp     w20, #ANIM_PROP_ALPHA
    b.eq    anim_apply_alpha
    str     x21, [x3, #WIN_TX]
    b       anim_apply_mark

anim_apply_focus:
    str     x21, [x3, #WIN_FOCUS]
    b       anim_apply_mark

anim_apply_alpha:
    str     x21, [x3, #WIN_ALPHA]
    b       anim_apply_mark

anim_apply_ty:
    str     x21, [x3, #WIN_TY]

anim_apply_mark:
    mov     x0, x19
    bl      win_dirty_rect
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

anim_apply_screen:
    cmp     w1, #ANIM_PROP_SCREEN
    b.ne    anim_apply_none
    asr     x2, x2, #16
    cmp     x2, #0
    csel    x2, xzr, x2, lt
    mov     x3, #FADE_ONE
    cmp     x2, x3
    csel    x2, x3, x2, gt
    ladr    x3, fb_fade
    str     w2, [x3]
    ladr    x3, fb_fade_dirty
    mov     w4, #1
    strb    w4, [x3]

anim_apply_none:
    ret


anim_tick:
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    bl      anim_now
    mov     x19, x0
    ladr    x20, anim_list
    mov     w21, #0

anim_tick_loop:
    cmp     w21, #ANIM_MAX
    b.hs    anim_tick_done
    mov     x0, #ANIM_ENTRY_SIZE
    madd    x22, x21, x0, x20
    ldrh    w0, [x22, #ANIM_STATE]
    cmp     w0, #ANIM_RUNNING
    b.ne    anim_tick_next
    mov     x0, x19
    ldr     x1, [x22, #ANIM_START_TIME]
    ldr     x2, [x22, #ANIM_DURATION]
    bl      anim_progress
    mov     x23, x0
    ldrh    w1, [x22, #ANIM_EASING]
    mov     x0, x23
    bl      anim_ease
    mov     x2, x0
    ldr     x0, [x22, #ANIM_FROM]
    ldr     x1, [x22, #ANIM_TO]
    bl      anim_lerp
    str     x0, [x22, #ANIM_VALUE]
    mov     x2, x0
    ldr     x0, [x22, #ANIM_TARGET]
    ldr     w1, [x22, #ANIM_PROP]
    bl      anim_apply
    mov     x0, #1
    lsl     x0, x0, #ANIM_SHIFT
    cmp     x23, x0
    b.lo    anim_tick_next
    ldr     x2, [x22, #ANIM_TO]
    str     x2, [x22, #ANIM_VALUE]
    ldr     x0, [x22, #ANIM_TARGET]
    ldr     w1, [x22, #ANIM_PROP]
    bl      anim_apply
    mov     w0, #ANIM_FINISHED
    strh    w0, [x22, #ANIM_STATE]
    ladr    x0, anim_active
    ldr     w1, [x0]
    subs    w1, w1, #1
    csel    w1, wzr, w1, mi
    str     w1, [x0]

anim_tick_next:
    add     w21, w21, #1
    b       anim_tick_loop

anim_tick_done:
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

anim_value:
    stp     x29, x30, [sp, #-16]!
    bl      anim_slot_addr
    cbz     x0, anim_value_none
    ldr     x0, [x0, #ANIM_VALUE]
    ldp     x29, x30, [sp], #16
    ret

anim_value_none:
    mov     x0, #0
    ldp     x29, x30, [sp], #16
    ret

anim_state:
    stp     x29, x30, [sp, #-16]!
    bl      anim_slot_addr
    cbz     x0, anim_state_none
    ldrh    w0, [x0, #ANIM_STATE]
    ldp     x29, x30, [sp], #16
    ret

anim_state_none:
    mov     w0, #ANIM_FREE
    ldp     x29, x30, [sp], #16
    ret

anim_cancel:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     w19, w1
    bl      anim_slot_addr
    cbz     x0, anim_cancel_done
    ldrh    w1, [x0, #ANIM_STATE]
    cmp     w1, #ANIM_RUNNING
    b.ne    anim_cancel_free
    cmp     w19, #ANIM_STOP_END
    b.ne    anim_cancel_active
    ldr     x1, [x0, #ANIM_TO]
    str     x1, [x0, #ANIM_VALUE]

anim_cancel_active:
    ladr    x1, anim_active
    ldr     w2, [x1]
    subs    w2, w2, #1
    csel    w2, wzr, w2, mi
    str     w2, [x1]

anim_cancel_free:
    mov     w1, #ANIM_FREE
    strh    w1, [x0, #ANIM_STATE]

anim_cancel_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

anim_cancel_target:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     x19, x0
    ladr    x20, anim_list
    mov     w21, #0

anim_cancel_target_loop:
    cmp     w21, #ANIM_MAX
    b.hs    anim_cancel_target_done
    mov     x0, #ANIM_ENTRY_SIZE
    madd    x0, x21, x0, x20
    ldrh    w1, [x0, #ANIM_STATE]
    cbz     w1, anim_cancel_target_next
    ldr     x1, [x0, #ANIM_TARGET]
    cmp     x1, x19
    b.ne    anim_cancel_target_next
    ldrh    w1, [x0, #ANIM_STATE]
    cmp     w1, #ANIM_RUNNING
    b.ne    anim_cancel_target_free
    ladr    x1, anim_active
    ldr     w2, [x1]
    subs    w2, w2, #1
    csel    w2, wzr, w2, mi
    str     w2, [x1]

anim_cancel_target_free:
    mov     w1, #ANIM_FREE
    strh    w1, [x0, #ANIM_STATE]

anim_cancel_target_next:
    add     w21, w21, #1
    b       anim_cancel_target_loop

anim_cancel_target_done:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

anim_count_active:
    ladr    x0, anim_active
    ldr     w0, [x0]
    ret


anim_one:
    mov     x0, #1
    lsl     x0, x0, #ANIM_SHIFT
    ret

anim_qmul:
    mul     x2, x0, x1
    smulh   x3, x0, x1
    mov     x4, #ANIM_HALF
    adds    x2, x2, x4
    adc     x3, x3, xzr
    lsr     x2, x2, #ANIM_SHIFT
    orr     x0, x2, x3, lsl #ANIM_SHIFT
    ret

anim_lerp:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x19, x0
    sub     x0, x1, x0
    mov     x1, x2
    bl      anim_qmul
    add     x0, x19, x0
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

anim_progress:
    subs    x0, x0, x1
    b.mi    anim_progress_null
    cbz     x2, anim_progress_full
    cmp     x0, x2
    b.hs    anim_progress_full

anim_progress_fit:
    lsr     x3, x0, #31
    cbz     x3, anim_progress_div
    lsr     x0, x0, #1
    lsr     x2, x2, #1
    b       anim_progress_fit

anim_progress_div:
    cbz     x2, anim_progress_full
    lsl     x0, x0, #ANIM_SHIFT
    udiv    x0, x0, x2
    ret

anim_progress_full:
    mov     x0, #1
    lsl     x0, x0, #ANIM_SHIFT
    ret

anim_progress_null:
    mov     x0, #0
    ret

anim_ease:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     x19, x0
    mov     w20, w1
    cmp     w20, #ANIM_EASE_QUAD_OUT
    b.eq    anim_ease_quad
    cmp     w20, #ANIM_EASE_CUBIC_OUT
    b.eq    anim_ease_cubic
    cmp     w20, #ANIM_EASE_SMOOTH
    b.eq    anim_ease_smooth
    mov     x0, x19
    b       anim_ease_done

anim_ease_quad:
    bl      anim_one
    sub     x21, x0, x19
    mov     x0, x21
    mov     x1, x21
    bl      anim_qmul
    mov     x1, x0
    bl      anim_one
    sub     x0, x0, x1
    b       anim_ease_done

anim_ease_cubic:
    bl      anim_one
    sub     x21, x0, x19
    mov     x0, x21
    mov     x1, x21
    bl      anim_qmul
    mov     x1, x21
    bl      anim_qmul
    mov     x1, x0
    bl      anim_one
    sub     x0, x0, x1
    b       anim_ease_done

anim_ease_smooth:
    bl      anim_one
    mov     x21, x0
    add     x21, x21, x0
    add     x21, x21, x0
    lsl     x0, x19, #1
    sub     x21, x21, x0
    mov     x0, x19
    mov     x1, x19
    bl      anim_qmul
    mov     x1, x21
    bl      anim_qmul

anim_ease_done:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

anim_to_raster:
    asr     x1, x0, #63
    eor     x2, x0, x1
    sub     x2, x2, x1
    lsr     x3, x2, #47
    cbnz    x3, anim_to_raster_clamp
    asr     x0, x0, #16
    ret

anim_to_raster_clamp:
    mov     x0, #0x7fffffff
    cmp     x1, #0
    csinv   x0, x0, xzr, eq
    ret


power_wipe:
    cbz     x1, power_wipe_done
    add     x1, x0, x1

power_wipe_loop:
    cmp     x0, x1
    b.hs    power_wipe_done
    stp     xzr, xzr, [x0], #16
    b       power_wipe_loop

power_wipe_done:
    ret

power_device_off:
    ladr    x0, virtio_input_base
    ldr     x1, [x0]
    cbz     x1, power_device_blk
    str     wzr, [x1, #VIRTIO_REG_STATUS]
    dsb     sy

power_device_blk:
    ladr    x0, blk_base
    ldr     x1, [x0]
    cbz     x1, power_device_done
    str     wzr, [x1, #VIRTIO_REG_STATUS]
    dsb     sy

power_device_done:
    ret

power_off:
    msr     daifset, #DAIF_I
    msr     cntv_ctl_el0, xzr
    isb
    ladr    x0, power_msg
    bl      uart_puts
    bl      power_device_off
    ladr    x0, power_wipe_msg
    bl      uart_puts
    ladr    x0, fb_render
    ldr     x1, =FB_SIZE
    bl      power_wipe
    ladr    x0, fb_output
    ldr     x1, =OUT_SIZE
    bl      power_wipe
    ladr    x0, font_buffer
    mov     x1, #FONT_MAX_SIZE
    bl      power_wipe
    ladr    x0, blk_buffer
    mov     x1, #BLK_SECTOR_SIZE
    bl      power_wipe
    ladr    x0, fat_buffer
    mov     x1, #BLK_SECTOR_SIZE
    bl      power_wipe
    ladr    x0, uart_rx_ring
    mov     x1, #UART_RX_RING_SIZE
    bl      power_wipe
    ladr    x0, cursor_backing
    mov     x1, #CURSOR_BACKING_SIZE
    bl      power_wipe
    dsb     sy
    ladr    x0, power_bye_msg
    bl      uart_puts
    ldr     x0, =PSCI_SYSTEM_OFF
    mov     x1, #0
    mov     x2, #0
    mov     x3, #0
    hvc     #0
    ladr    x0, power_fail_msg
    bl      uart_puts

power_off_halt:
    wfi
    b       power_off_halt


power_disc:
    stp     x29, x30, [sp, #-96]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    stp     x27, x28, [sp, #80]
    mov     w19, w0
    mov     w20, w1
    mov     w21, w2
    mov     x22, x3
    add     w23, w21, #1
    mul     w23, w23, w23
    sub     w24, w21, #1
    mul     w24, w24, w24
    lsl     w25, w21, #2
    ladr    x4, fb_clip
    sub     w26, w19, w21
    sub     w26, w26, #1
    ldr     w5, [x4, #CLIP_X]
    cmp     w26, w5
    csel    w26, w5, w26, lt
    add     w27, w19, w21
    add     w27, w27, #2
    ldr     w5, [x4, #CLIP_X2]
    cmp     w27, w5
    csel    w27, w5, w27, gt
    add     w28, w20, w21
    add     w28, w28, #2
    ldr     w5, [x4, #CLIP_Y2]
    cmp     w28, w5
    csel    w28, w5, w28, gt
    sub     w1, w20, w21
    sub     w1, w1, #1
    ldr     w5, [x4, #CLIP_Y]
    cmp     w1, w5
    csel    w1, w5, w1, lt

power_disc_row:
    cmp     w1, w28
    b.ge    power_disc_done
    mov     w0, w26

power_disc_col:
    cmp     w0, w27
    b.ge    power_disc_next
    sub     w2, w0, w19
    mul     w2, w2, w2
    sub     w3, w1, w20
    mul     w3, w3, w3
    add     w3, w3, w2
    cmp     w3, w24
    b.ls    power_disc_solid
    cmp     w3, w23
    b.hs    power_disc_skip
    sub     w4, w23, w3
    mov     w5, #ALPHA_MAX
    mul     w4, w4, w5
    udiv    w4, w4, w25
    b       power_disc_put

power_disc_solid:
    mov     w4, #ALPHA_MAX

power_disc_put:
    stp     x0, x1, [sp, #-32]!
    str     x4, [sp, #16]
    bl      fb_pixel_addr
    ldr     x1, [sp, #16]
    mov     x2, x22
    bl      fb_blend_pixel
    ldp     x0, x1, [sp], #32

power_disc_skip:
    add     w0, w0, #1
    b       power_disc_col

power_disc_next:
    add     w1, w1, #1
    b       power_disc_row

power_disc_done:
    ldp     x27, x28, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #96
    ret

power_draw:
    stp     x29, x30, [sp, #-16]!
    mov     w0, #POWER_CX
    mov     w1, #POWER_CY
    mov     w2, #POWER_R
    ldr     x3, =COLOR_POWER
    bl      power_disc
    ladr    x0, icon_power
    mov     w1, #(POWER_CX - ICON_SIZE / 2)
    mov     w2, #(POWER_CY - ICON_SIZE / 2)
    ldr     x3, =COLOR_POWER_SYMBOL
    bl      icon_draw
    ldp     x29, x30, [sp], #16
    ret

power_hit:
    sub     w0, w0, #POWER_CX
    mul     w0, w0, w0
    sub     w1, w1, #POWER_CY
    mul     w1, w1, w1
    add     w0, w0, w1
    mov     w1, #POWER_R
    mul     w1, w1, w1
    cmp     w0, w1
    cset    w0, ls
    ret


win_add:
    ladr    x9, win_count
    ldr     w10, [x9]
    cmp     w10, #WIN_MAX
    b.hs    win_add_full
    ladr    x11, win_list
    mov     x12, #WIN_SIZE
    madd    x11, x10, x12, x11
    str     w0, [x11, #WIN_X]
    str     w1, [x11, #WIN_Y]
    str     w2, [x11, #WIN_W]
    str     w3, [x11, #WIN_H]
    str     x4, [x11, #WIN_TITLE]
    str     xzr, [x11, #WIN_TX]
    str     xzr, [x11, #WIN_TY]
    mov     x12, #1
    lsl     x12, x12, #ANIM_SHIFT
    str     x12, [x11, #WIN_FOCUS]
    str     xzr, [x11, #WIN_ALPHA]
    ladr    x12, win_list
    mov     x13, #WIN_SIZE
    mov     w14, #0

win_add_clear_loop:
    cmp     w14, w10
    b.hs    win_add_clear_done
    madd    x15, x14, x13, x12
    str     xzr, [x15, #WIN_FOCUS]
    add     w14, w14, #1
    b       win_add_clear_loop

win_add_clear_done:
    add     w10, w10, #1
    str     w10, [x9]

win_add_done:
    ret

win_add_full:
    stp     x29, x30, [sp, #-16]!
    ladr    x0, win_full_msg
    bl      uart_puts
    ldp     x29, x30, [sp], #16
    ret

win_mix_color:
    mov     x3, #0
    mov     w4, #0
    mov     x7, #0xffff

win_mix_loop:
    cmp     w4, #64
    b.hs    win_mix_done
    lsr     x5, x0, x4
    and     x5, x5, #0xffff
    lsr     x6, x1, x4
    and     x6, x6, #0xffff
    sub     x6, x6, x5
    mul     x6, x6, x2
    asr     x6, x6, #16
    add     x5, x5, x6
    cmp     x5, #0
    csel    x5, xzr, x5, lt
    cmp     x5, x7
    csel    x5, x7, x5, gt
    lsl     x5, x5, x4
    orr     x3, x3, x5
    add     w4, w4, #16
    b       win_mix_loop

win_mix_done:
    mov     x0, x3
    ret


win_fade_all:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    ladr    x0, win_count
    ldr     w20, [x0]
    mov     w19, #0

win_fade_all_loop:
    cmp     w19, w20
    b.hs    win_fade_all_done
    mov     x0, x19
    mov     w1, #ANIM_PROP_ALPHA
    mov     x2, #0
    mov     x3, #1
    lsl     x3, x3, #ANIM_SHIFT
    mov     w4, #WIN_FADE_MS
    mov     w5, #ANIM_EASE_QUAD_OUT
    bl      anim_start
    add     w19, w19, #1
    b       win_fade_all_loop

win_fade_all_done:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret


win_fade_color:
    stp     x29, x30, [sp, #-16]!
    mov     x1, x0
    ldr     x2, [x19, #WIN_ALPHA]
    asr     x2, x2, #16
    ldr     x0, =COLOR_BACKGROUND
    bl      win_mix_color
    ldp     x29, x30, [sp], #16
    ret


win_eff_x:
    ldr     w1, [x0, #WIN_X]
    ldr     x2, [x0, #WIN_TX]
    asr     x2, x2, #ANIM_SHIFT
    add     w1, w1, w2
    mov     w0, w1
    ret

win_eff_y:
    ldr     w1, [x0, #WIN_Y]
    ldr     x2, [x0, #WIN_TY]
    asr     x2, x2, #ANIM_SHIFT
    add     w1, w1, w2
    mov     w0, w1
    ret

win_hit:
    ladr    x9, win_count
    ldr     w2, [x9]
    cbz     w2, win_hit_none
    ladr    x9, win_list

win_hit_loop:
    sub     w2, w2, #1
    mov     x10, #WIN_SIZE
    madd    x10, x2, x10, x9
    ldr     w3, [x10, #WIN_X]
    ldr     x11, [x10, #WIN_TX]
    asr     x11, x11, #ANIM_SHIFT
    add     w3, w3, w11
    ldr     w4, [x10, #WIN_Y]
    ldr     x11, [x10, #WIN_TY]
    asr     x11, x11, #ANIM_SHIFT
    add     w4, w4, w11
    subs    w5, w0, w3
    b.lt    win_hit_next
    ldr     w6, [x10, #WIN_W]
    cmp     w5, w6
    b.ge    win_hit_next
    subs    w5, w1, w4
    b.lt    win_hit_next
    ldr     w6, [x10, #WIN_H]
    cmp     w5, w6
    b.ge    win_hit_next
    mov     w0, w2
    ret

win_hit_next:
    cbnz    w2, win_hit_loop

win_hit_none:
    mov     w0, #WIN_NONE
    ret

win_on_titlebar:
    ladr    x9, win_list
    mov     x10, #WIN_SIZE
    madd    x9, x0, x10, x9
    ldr     w2, [x9, #WIN_Y]
    ldr     x3, [x9, #WIN_TY]
    asr     x3, x3, #ANIM_SHIFT
    add     w2, w2, w3
    subs    w1, w1, w2
    b.lt    win_on_titlebar_no
    cmp     w1, #(WIN_BORDER + WIN_TITLEBAR_H)
    b.ge    win_on_titlebar_no
    mov     w0, #1
    ret

win_on_titlebar_no:
    mov     w0, #0
    ret

win_raise:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    ladr    x9, win_count
    ldr     w1, [x9]
    sub     w1, w1, #1
    cmp     w0, w1
    b.hs    win_raise_done
    ladr    x19, win_list
    mov     x20, #WIN_SIZE
    madd    x21, x0, x20, x19
    ladr    x2, win_swap
    mov     x3, #0

win_raise_save:
    cmp     x3, #WIN_SIZE
    b.hs    win_raise_shift
    ldr     x4, [x21, x3]
    str     x4, [x2, x3]
    add     x3, x3, #8
    b       win_raise_save

win_raise_shift:
    mov     w2, w0

win_raise_shift_loop:
    cmp     w2, w1
    b.hs    win_raise_place
    madd    x3, x2, x20, x19
    add     x4, x3, x20
    mov     x5, #0

win_raise_copy:
    cmp     x5, #WIN_SIZE
    b.hs    win_raise_copy_done
    ldr     x6, [x4, x5]
    str     x6, [x3, x5]
    add     x5, x5, #8
    b       win_raise_copy

win_raise_copy_done:
    add     w2, w2, #1
    b       win_raise_shift_loop

win_raise_place:
    madd    x3, x1, x20, x19
    ladr    x2, win_swap
    mov     x5, #0

win_raise_place_loop:
    cmp     x5, #WIN_SIZE
    b.hs    win_raise_done
    ldr     x6, [x2, x5]
    str     x6, [x3, x5]
    add     x5, x5, #8
    b       win_raise_place_loop

win_raise_done:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

win_drag_begin:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     w19, w0
    mov     w20, w1
    mov     w21, w2
    mov     w0, w19
    mov     w1, w20
    bl      win_on_titlebar
    cbz     w0, win_drag_begin_done
    ladr    x9, win_list
    mov     x10, #WIN_SIZE
    madd    x9, x19, x10, x9
    mov     x0, x9
    bl      win_eff_x
    sub     w0, w21, w0
    ladr    x9, win_drag_dx
    str     w0, [x9]
    ladr    x9, win_list
    mov     x10, #WIN_SIZE
    madd    x9, x19, x10, x9
    mov     x0, x9
    bl      win_eff_y
    sub     w0, w20, w0
    ladr    x9, win_drag_dy
    str     w0, [x9]
    ladr    x9, win_drag_index
    str     w19, [x9]

win_drag_begin_done:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

win_drag_end:
    ladr    x9, win_drag_index
    mov     w0, #WIN_NONE
    str     w0, [x9]
    ret

win_drag_move:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    ladr    x9, win_drag_index
    ldr     w19, [x9]
    cmp     w19, #0
    b.lt    win_drag_move_done
    ladr    x9, mouse_buttons
    ldrb    w0, [x9]
    cbz     w0, win_drag_move_stop
    bl      mouse_get_pos
    mov     w20, w0
    mov     w21, w1
    mov     w0, w19
    bl      win_dirty_rect
    ladr    x9, win_drag_dx
    ldr     w0, [x9]
    sub     w20, w20, w0
    ladr    x9, win_drag_dy
    ldr     w0, [x9]
    sub     w21, w21, w0
    ladr    x9, win_list
    mov     x10, #WIN_SIZE
    madd    x9, x19, x10, x9
    ldr     w0, [x9, #WIN_W]
    sub     w0, w0, #WIN_KEEP_VISIBLE
    neg     w0, w0
    cmp     w20, w0
    csel    w20, w0, w20, lt
    mov     w0, #(FB_WIDTH - WIN_KEEP_VISIBLE)
    cmp     w20, w0
    csel    w20, w0, w20, gt
    cmp     w21, wzr
    csel    w21, wzr, w21, lt
    mov     w0, #(FB_HEIGHT - WIN_KEEP_VISIBLE)
    cmp     w21, w0
    csel    w21, w0, w21, gt
    ladr    x9, win_list
    mov     x10, #WIN_SIZE
    madd    x9, x19, x10, x9
    ldr     w0, [x9, #WIN_X]
    ldr     x1, [x9, #WIN_TX]
    asr     x1, x1, #ANIM_SHIFT
    add     w0, w0, w1
    sub     w0, w0, w20
    sxtw    x0, w0
    lsl     x0, x0, #ANIM_SHIFT
    str     x0, [x9, #WIN_TX]
    str     w20, [x9, #WIN_X]
    ldr     w1, [x9, #WIN_Y]
    ldr     x2, [x9, #WIN_TY]
    asr     x2, x2, #ANIM_SHIFT
    add     w1, w1, w2
    sub     w1, w1, w21
    sxtw    x1, w1
    lsl     x1, x1, #ANIM_SHIFT
    str     x1, [x9, #WIN_TY]
    str     w21, [x9, #WIN_Y]
    stp     x0, x1, [sp, #-16]!
    mov     x0, x19
    mov     w1, #ANIM_PROP_TX
    ldr     x2, [sp]
    mov     x3, #0
    mov     w4, #WIN_DRAG_MS
    mov     w5, #ANIM_EASE_QUAD_OUT
    bl      anim_start
    ldp     x2, x1, [sp], #16
    mov     x0, x19
    mov     x2, x1
    mov     w1, #ANIM_PROP_TY
    mov     x3, #0
    mov     w4, #WIN_DRAG_MS
    mov     w5, #ANIM_EASE_QUAD_OUT
    bl      anim_start
    mov     w0, w19
    bl      win_dirty_rect
    b       win_drag_move_done

win_drag_move_stop:
    bl      win_drag_end

win_drag_move_done:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

win_focus_cancel:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     w19, #0

win_focus_cancel_loop:
    ladr    x0, win_count
    ldr     w1, [x0]
    cmp     w19, w1
    b.hs    win_focus_cancel_done
    mov     x0, x19
    bl      anim_cancel_target
    add     w19, w19, #1
    b       win_focus_cancel_loop

win_focus_cancel_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

win_focus_start:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    ladr    x0, win_count
    ldr     w19, [x0]
    cbz     w19, win_focus_start_done
    sub     w19, w19, #1
    ladr    x20, win_list
    mov     x21, #WIN_SIZE
    madd    x0, x19, x21, x20
    ldr     x2, [x0, #WIN_FOCUS]
    mov     x0, x19
    mov     w1, #ANIM_PROP_FOCUS
    mov     x3, #1
    lsl     x3, x3, #ANIM_SHIFT
    mov     w4, #WIN_FOCUS_MS
    mov     w5, #ANIM_EASE_QUAD_OUT
    bl      anim_start
    cbz     w19, win_focus_start_done
    mov     w0, #0

win_focus_start_loop:
    cmp     w0, w19
    b.hs    win_focus_start_done
    mov     x1, x0
    madd    x2, x0, x21, x20
    ldr     x2, [x2, #WIN_FOCUS]
    cbz     x2, win_focus_start_next
    stp     x0, x1, [sp, #-16]!
    mov     x0, x1
    mov     w1, #ANIM_PROP_FOCUS
    mov     x3, #0
    mov     w4, #WIN_FOCUS_MS
    mov     w5, #ANIM_EASE_QUAD_OUT
    bl      anim_start
    ldp     x0, x1, [sp], #16

win_focus_start_next:
    add     w0, w0, #1
    b       win_focus_start_loop

win_focus_start_done:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret


win_click:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     w19, w0
    mov     w20, w1
    bl      win_hit
    cmp     w0, #0
    b.lt    win_click_done
    mov     w21, w0
    ladr    x9, win_count
    ldr     w0, [x9]
    sub     w0, w0, #1
    cmp     w21, w0
    b.eq    win_click_drag
    mov     w0, w21
    bl      win_focus_cancel
    mov     w0, w21
    bl      win_raise
    ladr    x9, win_count
    ldr     w21, [x9]
    sub     w21, w21, #1
    bl      win_focus_start
    bl      dirty_all

win_click_drag:
    mov     w0, w21
    mov     w1, w20
    mov     w2, w19
    bl      win_drag_begin

win_click_done:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret


win_draw_one:
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    str     x23, [sp, #48]
    ladr    x19, win_list
    mov     x9, #WIN_SIZE
    madd    x19, x0, x9, x19
    mov     w20, w1
    ldr     w21, [x19, #WIN_X]
    ldr     x9, [x19, #WIN_TX]
    asr     x9, x9, #ANIM_SHIFT
    add     w21, w21, w9
    ldr     w22, [x19, #WIN_Y]
    ldr     x9, [x19, #WIN_TY]
    asr     x9, x9, #ANIM_SHIFT
    add     w22, w22, w9
    mov     w0, w21
    mov     w1, w22
    ldr     w2, [x19, #WIN_W]
    ldr     w3, [x19, #WIN_H]
    stp     x0, x1, [sp, #-32]!
    stp     x2, x3, [sp, #16]
    ldr     x0, =COLOR_WIN_BORDER
    bl      win_fade_color
    mov     x4, x0
    ldp     x2, x3, [sp, #16]
    ldp     x0, x1, [sp], #32
    bl      fb_fill_rect
    add     w0, w21, #WIN_BORDER
    add     w1, w22, #WIN_BORDER
    ldr     w2, [x19, #WIN_W]
    sub     w2, w2, #(WIN_BORDER * 2)
    mov     w3, #WIN_TITLEBAR_H
    mov     w23, w3
    stp     x0, x1, [sp, #-16]!
    str     x2, [sp, #-16]!
    ldr     x0, =COLOR_WIN_TITLE
    ldr     x1, =COLOR_WIN_TITLE_ACT
    ldr     x2, [x19, #WIN_FOCUS]
    asr     x2, x2, #16
    bl      win_mix_color
    bl      win_fade_color
    mov     x4, x0
    ldr     x2, [sp], #16
    ldp     x0, x1, [sp], #16
    mov     w3, w23
    bl      fb_fill_rect
    add     w0, w21, #WIN_BORDER
    add     w1, w22, #(WIN_BORDER + WIN_TITLEBAR_H)
    ldr     w2, [x19, #WIN_W]
    sub     w2, w2, #(WIN_BORDER * 2)
    ldr     w3, [x19, #WIN_H]
    sub     w3, w3, #(WIN_BORDER * 2 + WIN_TITLEBAR_H)
    stp     x0, x1, [sp, #-32]!
    stp     x2, x3, [sp, #16]
    ldr     x0, =COLOR_WIN_BODY
    bl      win_fade_color
    mov     x4, x0
    ldp     x2, x3, [sp, #16]
    ldp     x0, x1, [sp], #32
    bl      fb_fill_rect
    add     w0, w21, #(WIN_BORDER + WIN_TEXT_PAD)
    add     w1, w22, #(WIN_BORDER + WIN_TITLEBAR_H - WIN_TEXT_PAD)
    ldr     x2, [x19, #WIN_TITLE]
    mov     w3, #WIN_TITLE_SIZE
    stp     x0, x1, [sp, #-32]!
    stp     x2, x3, [sp, #16]
    ldr     x0, =COLOR_WIN_TEXT
    bl      win_fade_color
    mov     x4, x0
    ldp     x2, x3, [sp, #16]
    ldp     x0, x1, [sp], #32
    bl      font_text
    ldr     x23, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

win_draw_all:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    mov     w0, #0
    mov     w1, #0
    mov     w2, #FB_WIDTH
    mov     w3, #FB_HEIGHT
    ldr     x4, =COLOR_BACKGROUND
    bl      fb_fill_rect
    ladr    x9, win_count
    ldr     w20, [x9]
    mov     w19, #0

win_draw_all_loop:
    cmp     w19, w20
    b.hs    win_draw_all_done
    mov     w0, w19
    sub     w1, w20, #1
    cmp     w19, w1
    cset    w1, eq
    bl      win_draw_one
    add     w19, w19, #1
    b       win_draw_all_loop

win_draw_all_done:
    bl      power_draw
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

win_selftest:
    stp     x29, x30, [sp, #-16]!
    mov     w0, #0
    mov     w1, #3
    mov     w2, #2
    bl      win_move
    ladr    x9, fb_pixel_count
    str     xzr, [x9]
    bl      win_repaint
.if FB_COUNT_PIXELS
    ladr    x0, win_pixels_label
    ladr    x1, fb_pixel_count
    ldr     x1, [x1]
    bl      uart_field
    ladr    x0, uart_newline
    bl      uart_puts
.endif
    ldp     x29, x30, [sp], #16
    ret

win_demo:
    stp     x29, x30, [sp, #-16]!
    mov     w0, #160
    mov     w1, #160
    mov     w2, #1240
    mov     w3, #840
    ladr    x4, win_title_1
    bl      win_add
    mov     w0, #960
    mov     w1, #640
    mov     w2, #1400
    mov     w3, #800
    ladr    x4, win_title_2
    bl      win_add
    mov     w0, #2040
    mov     w1, #240
    mov     w2, #1600
    mov     w3, #1040
    ladr    x4, win_title_3
    bl      win_add
    bl      win_fade_all
    bl      win_draw_all
    bl      fb_present_all
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
    ladr    x0, virtio_slot_label
    mov     x1, x19
    bl      uart_field
    ladr    x0, virtio_id_label
    ldr     w1, [x19, #VIRTIO_REG_DEVICE_ID]
    bl      uart_field
    ladr    x0, virtio_ver_label
    ldr     w1, [x19, #VIRTIO_REG_VERSION]
    bl      uart_field
    ladr    x0, uart_newline
    bl      uart_puts

virtio_scan_next:
    add     x19, x19, #VIRTIO_MMIO_STRIDE
    subs    w20, w20, #1
    b.ne    virtio_scan_loop
    ldr     x19, [sp, #16]
    ldr     x20, [sp, #24]
    ldp     x29, x30, [sp], #48
    ret

pmm_init:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    ladr    x0, __image_end
    add     x0, x0, #(PAGE_SIZE - 1)
    bic     x0, x0, #(PAGE_SIZE - 1)
    ladr    x19, pmm_base
    str     x0, [x19]
    ladr    x1, ram_base
    ldr     x2, [x1]
    ldr     x3, [x1, #8]
    and     x3, x3, #~(BLOCK_SIZE - 1)
    add     x2, x2, x3
    subs    x2, x2, x0
    b.ls    pmm_init_none
    lsr     x2, x2, #PAGE_SHIFT
    mov     x3, #PMM_MAX_PAGES
    cmp     x2, x3
    csel    x2, x2, x3, lo
    str     x2, [x19, #8]
    ladr    x0, fdt_base
    ldr     x0, [x0]
    cbz     x0, pmm_init_report
    ldr     w1, [x0, #4]
    rev     w1, w1
    mov     x20, x0
    mov     x21, x1
    bl      pmm_reserve
    ladr    x0, pmm_fdt_label
    mov     x1, x20
    bl      uart_field
    ladr    x0, pmm_fdtlen_label
    mov     x1, x21
    bl      uart_field
    ladr    x0, pmm_fdt_suffix
    bl      uart_puts

pmm_init_report:
    ladr    x0, pmm_base_label
    ldr     x1, [x19]
    bl      uart_field
    ladr    x0, pmm_pages_label
    ldr     x1, [x19, #8]
    bl      uart_field
    ladr    x0, uart_newline
    bl      uart_puts
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

pmm_init_none:
    str     xzr, [x19, #8]
    ladr    x0, pmm_fail_msg
    bl      uart_puts
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

pmm_count_used:
    ladr    x1, pmm_bitmap
    ladr    x2, pmm_base
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
    ladr    x0, pmm_used_label
    bl      uart_field
    bl      pmm_alloc
    mov     x19, x0
    bl      pmm_alloc
    mov     x20, x0
    bl      pmm_alloc
    mov     x21, x0
    mov     x1, x19
    ladr    x0, pmm_test_label
    bl      uart_field
    mov     x1, x20
    ladr    x0, pmm_test_label
    bl      uart_field
    mov     x1, x21
    ladr    x0, pmm_test_label
    bl      uart_field
    mov     x0, x20
    bl      pmm_free
    bl      pmm_alloc
    mov     x1, x0
    ladr    x0, pmm_reuse_label
    bl      uart_field
    ladr    x0, uart_newline
    bl      uart_puts
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

pmm_reserve:
    ladr    x2, pmm_base
    ldr     x3, [x2]
    ldr     x4, [x2, #8]
    add     x1, x0, x1
    add     x1, x1, #(PAGE_SIZE - 1)
    bic     x1, x1, #(PAGE_SIZE - 1)
    bic     x0, x0, #(PAGE_SIZE - 1)
    subs    x1, x1, x3
    b.ls    pmm_reserve_done
    subs    x0, x0, x3
    csel    x0, xzr, x0, lo
    lsr     x0, x0, #PAGE_SHIFT
    lsr     x1, x1, #PAGE_SHIFT
    ladr    x5, pmm_bitmap

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
    ladr    x1, pmm_bitmap
    ladr    x2, pmm_base
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
    ladr    x1, pmm_base
    ldr     x2, [x1]
    subs    x0, x0, x2
    b.lo    pmm_free_done
    lsr     x0, x0, #PAGE_SHIFT
    ldr     x3, [x1, #8]
    cmp     x0, x3
    b.hs    pmm_free_done
    ladr    x1, pmm_bitmap
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
    ladr    x0, ram_base
    ldr     x0, [x0, #8]
    cbz     x0, mmu_init_no_ram
    ladr    x19, mmu_l1_table
    ladr    x20, mmu_l2_table

    ldr     x0, =DESC_DEVICE
    str     x0, [x19]
    orr     x0, x20, #DESC_TABLE
    str     x0, [x19, #8]

    ladr    x21, fb_output
    mov     x0, #RAM_BASE_FIXED
    sub     x21, x21, x0
    lsr     x21, x21, #BLOCK_SHIFT
    mov     x0, #OUT_BLOCKS
    add     x0, x21, x0
    ladr    x1, mmu_nc_end
    str     x0, [x1]

    ladr    x0, ram_base
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
    b.lo    mmu_init_normal
    ladr    x4, mmu_nc_end
    ldr     x4, [x4]
    cmp     x2, x4
    b.lo    mmu_init_nc

mmu_init_normal:
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
    ladr    x0, mmu_ready_msg
    bl      uart_puts
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

mmu_init_no_ram:
    ladr    x0, mmu_skip_msg
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
    ladr    x0, fdt_base
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
    ladr    x1, fdt_memory_name
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
    ladr    x1, fdt_reg_name
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
    mov     w0, #VIRTIO_STATUS_FAILED
    str     w0, [x19, #VIRTIO_REG_STATUS]
    dsb     sy
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
    ladr    x1, virtio_input_base
    str     x19, [x1]
    mov     x0, x19
    ladr    x1, virtio_desc
    ladr    x2, virtio_avail
    ladr    x3, virtio_used
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
    ladr    x1, virtio_input_intid
    str     w0, [x1]
    bl      gic_enable_irq
    bl      virtio_input_init_abs
    ladr    x0, virtio_ready_msg
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

virtio_input_fail:
    ladr    x0, virtio_input_base
    str     xzr, [x0]
    ladr    x0, virtio_input_intid
    str     wzr, [x0]
    ladr    x0, virtio_fail_msg
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
    ladr    x1, blk_buffer
    bl      blk_read
    cbnz    w0, fat_init_fail
    ladr    x19, blk_buffer
    mov     x0, x19
    mov     x1, #BPB_SIGNATURE
    bl      mem_read16
    ldr     w1, =BPB_SIG_VALUE
    cmp     w0, w1
    b.ne    fat_init_fail
    ladr    x20, fat_state
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
    cbz     w0, fat_init_fail
    str     w0, [x20, #FAT_SECTORS]
    ldr     w1, [x20, #FAT_COUNT]
    cbz     w1, fat_init_fail
    mul     w0, w0, w1
    ldr     w1, [x20, #FAT_START]
    add     w0, w0, w1
    str     w0, [x20, #FAT_DATA_START]
    mov     x0, x19
    mov     x1, #BPB_FAT_SZ16
    bl      mem_read16
    cbnz    w0, fat_init_fail
    mov     x0, x19
    mov     x1, #BPB_EXT_FLAGS
    bl      mem_read16
    tst     w0, #EXT_FLAGS_NO_MIRROR
    b.eq    fat_init_root
    and     w0, w0, #EXT_FLAGS_ACTIVE
    ldr     w1, [x20, #FAT_COUNT]
    cmp     w0, w1
    b.hs    fat_init_fail
    ldr     w1, [x20, #FAT_SECTORS]
    mul     w0, w0, w1
    ldr     w1, [x20, #FAT_START]
    add     w0, w0, w1
    str     w0, [x20, #FAT_START]

fat_init_root:
    mov     x0, x19
    mov     x1, #BPB_ROOT_CLUSTER
    bl      mem_read32
    cmp     w0, #FAT_MIN_CLUSTER
    b.lo    fat_init_fail
    str     w0, [x20, #FAT_ROOT_CLUSTER]
    ladr    x0, fat_label_res
    ldr     w1, [x20, #FAT_START]
    bl      uart_field
    ladr    x0, fat_label_spf
    ldr     w1, [x20, #FAT_SECTORS]
    bl      uart_field
    ladr    x0, fat_label_data
    ldr     w1, [x20, #FAT_DATA_START]
    bl      uart_field
    ladr    x0, fat_label_root
    ldr     w1, [x20, #FAT_ROOT_CLUSTER]
    bl      uart_field
    ladr    x0, uart_newline
    bl      uart_puts
    mov     w0, #0
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

fat_init_fail:
    ladr    x0, fat_fail_msg
    bl      uart_puts
    mov     w0, #1
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

fat_cluster_to_sector:
    cmp     w0, #FAT_MIN_CLUSTER
    b.lo    fat_cluster_invalid
    ladr    x1, fat_state
    ldr     w2, [x1, #FAT_SEC_PER_CLUS]
    sub     w0, w0, #2
    mul     w0, w0, w2
    ldr     w2, [x1, #FAT_DATA_START]
    add     w0, w0, w2
    ret

fat_cluster_invalid:
    mov     w0, #0
    ret

fat_list_root:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    ladr    x0, fat_state
    ldr     w0, [x0, #FAT_ROOT_CLUSTER]
    bl      fat_cluster_to_sector
    ladr    x1, blk_buffer
    bl      blk_read
    cbnz    w0, fat_list_done
    ladr    x19, blk_buffer
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
    ladr    x0, fat_entry_prefix
    bl      uart_puts
    mov     x0, x19
    mov     w1, #DIR_NAME_LEN
    bl      uart_putn
    ladr    x0, fat_size_label
    mov     x0, x19
    mov     x1, #DIR_SIZE
    bl      mem_read32
    mov     x1, x0
    ladr    x0, fat_size_label
    bl      uart_field

fat_list_next:
    add     x19, x19, #DIR_ENTRY_SIZE
    sub     w20, w20, #1
    b       fat_list_loop

fat_list_done:
    ladr    x0, uart_newline
    bl      uart_puts
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

fat_find:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     x21, x0
    ladr    x0, fat_state
    ldr     w0, [x0, #FAT_ROOT_CLUSTER]
    bl      fat_cluster_to_sector
    ladr    x1, blk_buffer
    bl      blk_read
    cbnz    w0, fat_find_none
    ladr    x19, blk_buffer
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
    mov     w2, w0
    mov     w1, w21
    mov     w0, #1
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
    mov     w2, #0
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

mem_copy:
    cbz     w2, mem_copy_done

mem_copy_loop:
    ldrb    w3, [x0], #1
    strb    w3, [x1], #1
    subs    w2, w2, #1
    b.ne    mem_copy_loop

mem_copy_done:
    ret

fat_load:
    stp     x29, x30, [sp, #-96]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    mov     x24, x1
    mov     w25, w2
    bl      fat_find
    cbz     w0, fat_load_fail
    mov     w19, w1
    mov     w20, w2
    cmp     w20, w25
    b.hi    fat_load_fail
    mov     w23, w20

fat_load_cluster:
    cbz     w20, fat_load_done
    ldr     w0, =FAT_EOC
    cmp     w19, w0
    b.hs    fat_load_fail
    cmp     w19, #FAT_MIN_CLUSTER
    b.lo    fat_load_fail
    mov     w0, w19
    bl      fat_cluster_to_sector
    cbz     w0, fat_load_fail
    mov     w21, w0
    ladr    x0, fat_state
    ldr     w22, [x0, #FAT_SEC_PER_CLUS]

fat_load_sector:
    cbz     w22, fat_load_advance
    cbz     w20, fat_load_done
    mov     w0, w21
    ladr    x1, blk_buffer
    bl      blk_read
    cbnz    w0, fat_load_fail
    mov     w2, #BLK_SECTOR_SIZE
    cmp     w20, w2
    csel    w2, w20, w2, lo
    mov     w26, w2
    ladr    x0, blk_buffer
    mov     x1, x24
    bl      mem_copy
    add     x24, x24, x26
    sub     w20, w20, w26
    add     w21, w21, #1
    sub     w22, w22, #1
    b       fat_load_sector

fat_load_advance:
    mov     w0, w19
    bl      fat_next_cluster
    mov     w19, w0
    b       fat_load_cluster

fat_load_done:
    mov     w0, w23
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #96
    ret

fat_load_fail:
    mov     w0, #0
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #96
    ret

fat_cat:
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    str     x23, [sp, #48]
    bl      fat_find
    cbz     w0, fat_cat_missing
    mov     w19, w1
    mov     w20, w2

fat_cat_cluster:
    cbz     w20, fat_cat_done
    ldr     w0, =FAT_EOC
    cmp     w19, w0
    b.hs    fat_cat_short
    cmp     w19, #FAT_MIN_CLUSTER
    b.lo    fat_cat_error
    mov     w0, w19
    bl      fat_cluster_to_sector
    cbz     w0, fat_cat_error
    mov     w21, w0
    ladr    x0, fat_state
    ldr     w22, [x0, #FAT_SEC_PER_CLUS]

fat_cat_sector:
    cbz     w22, fat_cat_advance
    cbz     w20, fat_cat_done
    mov     w0, w21
    ladr    x1, blk_buffer
    bl      blk_read
    cbnz    w0, fat_cat_error
    mov     w1, #BLK_SECTOR_SIZE
    cmp     w20, w1
    csel    w1, w20, w1, lo
    ladr    x0, blk_buffer
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

fat_cat_short:
    ladr    x0, fat_short_msg
    bl      uart_puts
    b       fat_cat_done

fat_cat_error:
    ladr    x0, fat_error_msg
    bl      uart_puts

fat_cat_done:
    ladr    x0, uart_newline
    bl      uart_puts
    ldr     x23, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

fat_cat_missing:
    ladr    x0, fat_missing_msg
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
    ladr    x1, blk_buffer
    mov     x19, x1
    bl      blk_read
    cbnz    w0, blk_selftest_fail
    ladr    x0, blk_sig_label
    ldrb    w1, [x19, #510]
    ldrb    w2, [x19, #511]
    orr     w1, w1, w2, lsl #8
    bl      uart_field
    ladr    x0, blk_oem_label
    bl      uart_puts
    add     x0, x19, #3
    mov     w1, #8
    bl      uart_putn
    ladr    x0, uart_newline
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

blk_selftest_fail:
    ladr    x0, blk_read_fail_msg
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

blk_init_fail:
    ladr    x1, blk_base
    str     xzr, [x1]
    ladr    x0, blk_fail_msg
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

blk_read:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    ladr    x19, blk_base
    ldr     x19, [x19]
    cbz     x19, blk_read_fail
    mov     x20, x1
    ladr    x1, blk_hdr
    mov     w2, #BLK_T_IN
    str     w2, [x1, #BLK_HDR_TYPE]
    str     wzr, [x1, #BLK_HDR_IOPRIO]
    str     x0, [x1, #BLK_HDR_SECTOR]
    ladr    x2, blk_desc
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
    ladr    x4, blk_status
    mov     w5, #0xff
    strb    w5, [x4]
    str     x4, [x3, #VRING_DESC_ADDR]
    mov     w5, #1
    str     w5, [x3, #VRING_DESC_LEN]
    mov     w5, #VRING_DESC_F_WRITE
    strh    w5, [x3, #VRING_DESC_FLAGS]
    strh    wzr, [x3, #VRING_DESC_NEXT]
    ladr    x4, blk_used
    ldrh    w21, [x4, #VRING_USED_IDX]
    ladr    x4, blk_avail
    ldrh    w5, [x4, #VRING_AVAIL_IDX]
    and     w6, w5, #(BLK_QUEUE_SIZE - 1)
    add     x7, x4, x6, lsl #1
    strh    wzr, [x7, #VRING_AVAIL_RING]
    add     w5, w5, #1
    dmb     ishst
    strh    w5, [x4, #VRING_AVAIL_IDX]
    dsb     sy
    str     wzr, [x19, #VIRTIO_REG_QUEUE_NOTIFY]
    ldr     x20, =BLK_TIMEOUT

blk_read_wait:
    ladr    x4, blk_used
    ldrh    w5, [x4, #VRING_USED_IDX]
    cmp     w5, w21
    b.ne    blk_read_ready
    subs    x20, x20, #1
    b.ne    blk_read_wait
    ladr    x0, blk_base
    str     xzr, [x0]
    ladr    x0, blk_timeout_msg
    bl      uart_puts
    b       blk_read_fail

blk_read_ready:
    dmb     ishld

blk_read_check:
    ldr     w0, [x19, #VIRTIO_REG_INT_STATUS]
    str     w0, [x19, #VIRTIO_REG_INT_ACK]
    ladr    x4, blk_status
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

virtio_input_read_abs:
    ladr    x9, virtio_input_base
    ldr     x9, [x9]
    cbz     x9, virtio_input_read_abs_none
    add     x9, x9, #VIRTIO_REG_CONFIG
    mov     w10, #VIN_CFG_ABS_INFO
    strb    w10, [x9, #VIN_CFG_SELECT]
    strb    w0, [x9, #VIN_CFG_SUBSEL]
    dsb     sy
    ldrb    w10, [x9, #VIN_CFG_SIZE]
    cbz     w10, virtio_input_read_abs_none
    ldr     w0, [x9, #(VIN_CFG_UNION + VIN_ABS_MAX)]
    cbz     w0, virtio_input_read_abs_none
    ret

virtio_input_read_abs_none:
    mov     w0, #0
    ret

virtio_input_init_abs:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    ladr    x19, mouse_abs_max_x
    mov     w0, #ABS_X
    bl      virtio_input_read_abs
    str     w0, [x19]
    mov     w0, #ABS_Y
    bl      virtio_input_read_abs
    str     w0, [x19, #4]
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

virtio_input_poll:
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    ladr    x0, virtio_input_base
    ldr     x19, [x0]
    cbz     x19, virtio_input_poll_end
    ldr     w0, [x19, #VIRTIO_REG_INT_STATUS]
    str     w0, [x19, #VIRTIO_REG_INT_ACK]
    ladr    x0, virtio_used
    ldrh    w20, [x0, #VRING_USED_IDX]
    dmb     ishld
    ladr    x0, virtio_last_used
    ldrh    w21, [x0]

virtio_input_poll_loop:
    cmp     w21, w20
    b.eq    virtio_input_poll_kick
    and     w0, w21, #VIRTIO_QUEUE_MASK
    ladr    x1, virtio_used
    add     x1, x1, #VRING_USED_RING
    add     x1, x1, x0, lsl #3
    ldr     w0, [x1]
    ladr    x1, virtio_events
    add     x1, x1, x0, lsl #3
    ldrh    w6, [x1]
    ldrh    w7, [x1, #2]
    ldr     w8, [x1, #4]
    ladr    x1, virtio_avail
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
    ladr    x0, virtio_last_used
    strh    w21, [x0]
    dsb     sy
    str     wzr, [x19, #VIRTIO_REG_QUEUE_NOTIFY]

virtio_input_poll_end:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

mouse_init:
    ladr    x0, mouse_x
    mov     w1, #(FB_WIDTH / 2)
    str     w1, [x0]
    mov     w1, #(FB_HEIGHT / 2)
    str     w1, [x0, #4]
    ret

click_init:
    mov     x2, #CLICK_WINDOW_MS
    mul     x2, x0, x2
    mov     x3, #MS_PER_SECOND
    udiv    x2, x2, x3
    ladr    x1, click_window
    str     x2, [x1]
    ret

mouse_get_pos:
    ladr    x2, mouse_x
    ldr     w0, [x2]
    ldr     w1, [x2, #4]
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
    cmp     w0, #EV_ABS
    b.eq    mouse_apply_abs
    cmp     w0, #EV_KEY
    b.eq    mouse_apply_key
    cmp     w0, #EV_SYN
    b.eq    mouse_apply_syn
    ldp     x29, x30, [sp], #16
    ret

mouse_apply_rel:
    ladr    x3, mouse_x
    cmp     w1, #REL_X
    b.eq    mouse_apply_rel_x
    cmp     w1, #REL_Y
    b.ne    mouse_apply_done
    ldr     w0, [x3, #4]
    add     w0, w0, w2
    mov     w1, #(FB_HEIGHT - 1)
    bl      mouse_clamp
    ladr    x3, mouse_x
    str     w0, [x3, #4]
    b       mouse_apply_done

mouse_apply_rel_x:
    ldr     w0, [x3]
    add     w0, w0, w2
    mov     w1, #(FB_WIDTH - 1)
    bl      mouse_clamp
    ladr    x3, mouse_x
    str     w0, [x3]
    b       mouse_apply_done

mouse_apply_abs:
    ladr    x3, mouse_abs_max_x
    cmp     w1, #ABS_X
    b.eq    mouse_apply_abs_x
    cmp     w1, #ABS_Y
    b.ne    mouse_apply_done
    ldr     w3, [x3, #4]
    cbz     w3, mouse_apply_done
    mov     w0, #FB_HEIGHT
    umull   x0, w2, w0
    udiv    x0, x0, x3
    mov     w1, #(FB_HEIGHT - 1)
    bl      mouse_clamp
    ladr    x3, mouse_x
    str     w0, [x3, #4]
    ladr    x3, mouse_dirty
    mov     w0, #1
    strb    w0, [x3]
    b       mouse_apply_done

mouse_apply_abs_x:
    ldr     w3, [x3]
    cbz     w3, mouse_apply_done
    mov     w0, #FB_WIDTH
    umull   x0, w2, w0
    udiv    x0, x0, x3
    mov     w1, #(FB_WIDTH - 1)
    bl      mouse_clamp
    ladr    x3, mouse_x
    str     w0, [x3]
    ladr    x3, mouse_dirty
    mov     w0, #1
    strb    w0, [x3]
    b       mouse_apply_done

mouse_apply_key:
    ldr     w3, =BTN_LEFT
    cmp     w1, w3
    b.ne    mouse_apply_done
    ladr    x3, mouse_buttons
    strb    w2, [x3]
    ladr    x3, mouse_dirty
    mov     w0, #1
    strb    w0, [x3]
    cbz     w2, mouse_apply_done
    b       mouse_click

mouse_click:
    mrs     x0, cntvct_el0
    ladr    x3, click_last
    ldr     x1, [x3]
    sub     x2, x0, x1
    str     x0, [x3]
    ladr    x3, click_window
    ldr     x4, [x3]
    ladr    x3, click_count
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
    ladr    x3, mouse_x
    ldr     w0, [x3]
    ldr     w1, [x3, #4]
    ladr    x3, click_x
    str     w0, [x3]
    str     w1, [x3, #4]
    ladr    x3, click_pending
    mov     w0, #1
    strb    w0, [x3]
    b       mouse_apply_done

mouse_apply_syn:
    ladr    x3, mouse_dirty
    mov     w0, #1
    strb    w0, [x3]

mouse_apply_done:
    ldp     x29, x30, [sp], #16
    ret

virtio_input_fill:
    ladr    x0, virtio_desc
    ladr    x1, virtio_events
    ladr    x2, virtio_avail
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
    dmb     ishst
    strh    w3, [x2, #VRING_AVAIL_IDX]
    dsb     sy
    ret

font_be16:
    ldrb    w1, [x0]
    ldrb    w2, [x0, #1]
    orr     w0, w2, w1, lsl #8
    ret

font_be32:
    ldrb    w1, [x0]
    ldrb    w2, [x0, #1]
    orr     w1, w2, w1, lsl #8
    ldrb    w2, [x0, #2]
    orr     w1, w2, w1, lsl #8
    ldrb    w2, [x0, #3]
    orr     w0, w2, w1, lsl #8
    ret

font_be16s:
    stp     x29, x30, [sp, #-16]!
    bl      font_be16
    sxth    w0, w0
    ldp     x29, x30, [sp], #16
    ret

font_find_table:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x19, x0
    ladr    x20, font_buffer
    add     x0, x20, #4
    bl      font_be16
    mov     w21, w0
    ladr    x0, font_state
    ldr     w1, [x0, #FONT_FILESIZE]
    mov     w2, #FONT_TABLE_ENTRY
    madd    w2, w21, w2, wzr
    add     w2, w2, #FONT_TABLE_DIR
    cmp     w2, w1
    b.hi    font_find_none
    mov     w22, #0

font_find_loop:
    cmp     w22, w21
    b.hs    font_find_none
    mov     x0, #FONT_TABLE_ENTRY
    madd    x0, x22, x0, x20
    add     x0, x0, #FONT_TABLE_DIR
    mov     x1, x19
    mov     w2, #4
    bl      mem_equal
    cbnz    w0, font_find_hit
    add     w22, w22, #1
    b       font_find_loop

font_find_hit:
    mov     x0, #FONT_TABLE_ENTRY
    madd    x0, x22, x0, x20
    add     x0, x0, #FONT_TABLE_DIR
    add     x0, x0, #FONT_TAG_OFFSET
    bl      font_be32
    ladr    x1, font_state
    ldr     w2, [x1, #FONT_FILESIZE]
    cmp     w0, w2
    b.hs    font_find_none
    add     x0, x20, x0
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

font_find_none:
    mov     x0, #0
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

font_find_cmap4:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x19, x0
    add     x0, x19, #CMAP_NTABLES
    bl      font_be16
    mov     w20, w0
    mov     w21, #0

font_find_cmap4_loop:
    cmp     w21, w20
    b.hs    font_find_cmap4_none
    mov     x0, #CMAP_RECORD_SIZE
    madd    x0, x21, x0, x19
    add     x0, x0, #(CMAP_RECORDS + CMAP_REC_OFFSET)
    bl      font_be32
    add     x22, x19, x0
    mov     x0, x22
    bl      font_be16
    cmp     w0, #4
    b.eq    font_find_cmap4_hit
    add     w21, w21, #1
    b       font_find_cmap4_loop

font_find_cmap4_hit:
    mov     x0, x22
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

font_find_cmap4_none:
    mov     x0, #0
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

font_glyph_index:
    stp     x29, x30, [sp, #-96]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    str     x27, [sp, #80]
    mov     w19, w0
    ladr    x0, font_state
    ldr     x20, [x0, #FONT_CMAP4]
    cbz     x20, font_glyph_index_none
    add     x0, x20, #CMAP4_SEGX2
    bl      font_be16
    mov     w21, w0
    add     x22, x20, #CMAP4_ENDCODE
    add     x23, x22, x21
    add     x23, x23, #2
    mov     w24, #0

font_glyph_loop:
    lsr     w0, w21, #1
    cmp     w24, w0
    b.hs    font_glyph_index_none
    add     x0, x22, x24, lsl #1
    bl      font_be16
    cmp     w19, w0
    b.ls    font_glyph_found
    add     w24, w24, #1
    b       font_glyph_loop

font_glyph_found:
    add     x0, x23, x24, lsl #1
    bl      font_be16
    cmp     w19, w0
    b.lo    font_glyph_index_none
    mov     w25, w0
    add     x0, x23, x21
    add     x0, x0, x24, lsl #1
    bl      font_be16
    mov     w26, w0
    add     x0, x23, x21, lsl #1
    add     x0, x0, x24, lsl #1
    mov     x27, x0
    bl      font_be16
    cbz     w0, font_glyph_direct
    add     x1, x27, x0
    sub     w2, w19, w25
    add     x0, x1, x2, lsl #1
    bl      font_be16
    cbz     w0, font_glyph_index_none
    add     w0, w0, w26
    and     w0, w0, #0xffff
    b       font_glyph_index_end

font_glyph_direct:
    add     w0, w19, w26
    and     w0, w0, #0xffff

font_glyph_index_end:
    ldr     x27, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #96
    ret

font_glyph_index_none:
    mov     w0, #0
    ldr     x27, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #96
    ret

font_advance:
    stp     x29, x30, [sp, #-16]!
    ladr    x1, font_state
    ldr     w2, [x1, #FONT_NUMH]
    cbz     w2, font_advance_none
    sub     w3, w2, #1
    cmp     w0, w3
    csel    w0, w3, w0, hi
    ldr     x1, [x1, #FONT_HMTX]
    cbz     x1, font_advance_none
    add     x0, x1, x0, lsl #2
    bl      font_be16
    ldp     x29, x30, [sp], #16
    ret

font_advance_none:
    mov     w0, #0
    ldp     x29, x30, [sp], #16
    ret

font_glyph_offset:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     w19, w0
    ladr    x0, font_state
    ldr     w3, [x0, #FONT_NGLYPHS]
    cmp     w19, w3
    b.hi    font_glyph_offset_bad
    ldr     w1, [x0, #FONT_LOCFMT]
    ldr     x2, [x0, #FONT_LOCA]
    cbnz    w1, font_glyph_offset_long
    add     x0, x2, x19, lsl #1
    bl      font_be16
    lsl     w0, w0, #1
    b       font_glyph_offset_done

font_glyph_offset_long:
    add     x0, x2, x19, lsl #2
    bl      font_be32
    b       font_glyph_offset_done

font_glyph_offset_bad:
    mov     w0, #0

font_glyph_offset_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

font_load_glyph:
    stp     x29, x30, [sp, #-112]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    stp     x27, x28, [sp, #80]
    mov     w19, w0
    bl      font_glyph_offset
    mov     w20, w0
    add     w0, w19, #1
    bl      font_glyph_offset
    subs    w21, w0, w20
    b.ls    font_load_glyph_empty
    ladr    x0, font_state
    ldr     x22, [x0, #FONT_GLYF]
    add     x22, x22, x20
    ldr     w1, [x0, #FONT_FILESIZE]
    ladr    x0, font_buffer
    add     x0, x0, x1
    add     x1, x22, x21
    cmp     x1, x0
    b.hi    font_load_glyph_outside
    mov     x0, x22
    bl      font_be16s
    tbnz    w0, #31, font_load_glyph_composite
    cbz     w0, font_load_glyph_empty
    mov     w23, w0
    cmp     w23, #GLYPH_MAX_CONTOURS
    b.hi    font_load_glyph_composite
    ladr    x24, glyph_state
    str     w23, [x24, #GLYPH_NCONTOURS]
    add     x25, x22, #GLYF_ENDPTS
    mov     w26, #0

font_load_ends:
    cmp     w26, w23
    b.hs    font_load_ends_done
    add     x0, x25, x26, lsl #1
    bl      font_be16
    ladr    x1, glyph_ends
    strh    w0, [x1, x26, lsl #1]
    add     w26, w26, #1
    b       font_load_ends

font_load_ends_done:
    sub     w0, w23, #1
    ladr    x1, glyph_ends
    ldrh    w27, [x1, w0, uxtw #1]
    add     w27, w27, #1
    cmp     w27, #GLYPH_MAX_POINTS
    b.hi    font_load_glyph_composite
    str     w27, [x24, #GLYPH_NPOINTS]
    add     x25, x25, x23, lsl #1
    mov     x0, x25
    bl      font_be16
    add     x25, x25, #2
    add     x25, x25, x0
    ladr    x28, glyph_flags
    mov     w26, #0

font_load_flags:
    cmp     w26, w27
    b.hs    font_load_flags_done
    ldrb    w0, [x25], #1
    strb    w0, [x28, w26, uxtw]
    add     w26, w26, #1
    tst     w0, #PT_REPEAT
    b.eq    font_load_flags
    ldrb    w1, [x25], #1

font_load_flags_repeat:
    cbz     w1, font_load_flags
    cmp     w26, w27
    b.hs    font_load_flags_done
    strb    w0, [x28, w26, uxtw]
    add     w26, w26, #1
    sub     w1, w1, #1
    b       font_load_flags_repeat

font_load_flags_done:
    mov     w26, #0
    mov     w20, #0

font_load_x:
    cmp     w26, w27
    b.hs    font_load_x_done
    ldrb    w0, [x28, w26, uxtw]
    tst     w0, #PT_X_SHORT
    b.eq    font_load_x_long
    ldrb    w2, [x25], #1
    tst     w0, #PT_X_SAME
    b.ne    font_load_x_add
    neg     w2, w2

font_load_x_add:
    add     w20, w20, w2
    b       font_load_x_store

font_load_x_long:
    tst     w0, #PT_X_SAME
    b.ne    font_load_x_store
    mov     x0, x25
    bl      font_be16s
    add     x25, x25, #2
    add     w20, w20, w0

font_load_x_store:
    ladr    x1, glyph_x
    strh    w20, [x1, w26, uxtw #1]
    add     w26, w26, #1
    b       font_load_x

font_load_x_done:
    mov     w26, #0
    mov     w20, #0

font_load_y:
    cmp     w26, w27
    b.hs    font_load_y_done
    ldrb    w0, [x28, w26, uxtw]
    tst     w0, #PT_Y_SHORT
    b.eq    font_load_y_long
    ldrb    w2, [x25], #1
    tst     w0, #PT_Y_SAME
    b.ne    font_load_y_add
    neg     w2, w2

font_load_y_add:
    add     w20, w20, w2
    b       font_load_y_store

font_load_y_long:
    tst     w0, #PT_Y_SAME
    b.ne    font_load_y_store
    mov     x0, x25
    bl      font_be16s
    add     x25, x25, #2
    add     w20, w20, w0

font_load_y_store:
    ladr    x1, glyph_y
    strh    w20, [x1, w26, uxtw #1]
    add     w26, w26, #1
    b       font_load_y

font_load_y_done:
    mov     w0, #1
    b       font_load_glyph_end

font_load_glyph_composite:
    bl      font_limit_report

font_load_glyph_outside:
    bl      font_limit_report

font_load_glyph_empty:
    ladr    x0, glyph_state
    str     wzr, [x0, #GLYPH_NCONTOURS]
    str     wzr, [x0, #GLYPH_NPOINTS]
    mov     w0, #0

font_load_glyph_end:
    ldp     x27, x28, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #112
    ret

vg_edge_reset:
    ladr    x0, vg_edge_count
    str     wzr, [x0]
    ladr    x0, vg_emit
    ladr    x1, vg_edge_add
    str     x1, [x0]
    ret

vg_edge_add:
    ladr    x4, vg_edge_count
    ldr     w5, [x4]
    cmp     w5, #VG_EDGE_MAX
    b.hs    edge_add_overflow
    cmp     w1, w3
    b.eq    edge_add_done
    ladr    x6, vg_edge_list
    mov     x7, #VG_EDGE_SIZE
    madd    x6, x5, x7, x6
    b.lt    edge_add_down
    str     w2, [x6, #VG_EDGE_XTOP]
    str     w3, [x6, #VG_EDGE_YTOP]
    str     w0, [x6, #VG_EDGE_XBOT]
    str     w1, [x6, #VG_EDGE_YBOT]
    mov     w7, #-1
    str     w7, [x6, #VG_EDGE_DIR]
    b       edge_add_store

edge_add_down:
    str     w0, [x6, #VG_EDGE_XTOP]
    str     w1, [x6, #VG_EDGE_YTOP]
    str     w2, [x6, #VG_EDGE_XBOT]
    str     w3, [x6, #VG_EDGE_YBOT]
    mov     w7, #1
    str     w7, [x6, #VG_EDGE_DIR]

edge_add_store:
    add     w5, w5, #1
    str     w5, [x4]

edge_add_done:
    ret

edge_add_overflow:
    stp     x29, x30, [sp, #-16]!
    bl      font_limit_report
    ldp     x29, x30, [sp], #16
    ret

font_limit_report:
    ladr    x4, font_limit_flag
    ldrb    w5, [x4]
    cbnz    w5, font_limit_report_done
    mov     w5, #1
    strb    w5, [x4]
    stp     x29, x30, [sp, #-16]!
    ladr    x0, font_limit_msg
    bl      uart_puts
    ldp     x29, x30, [sp], #16

font_limit_report_done:
    ret

font_point:
    ladr    x1, glyph_x
    ldrsh   w1, [x1, w0, uxtw #1]
    ladr    x2, glyph_y
    ldrsh   w2, [x2, w0, uxtw #1]
    ladr    x3, vg_scale
    ldr     w4, [x3]
    ldr     w5, [x3, #4]
    ldr     w6, [x3, #8]
    mul     w1, w1, w4
    add     w1, w1, w5
    mul     w2, w2, w4
    sub     w2, w6, w2
    mov     w0, w1
    mov     w1, w2
    ret

font_point_flag:
    ladr    x1, glyph_flags
    ldrb    w0, [x1, w0, uxtw]
    and     w0, w0, #PT_ON_CURVE
    ret

vg_quad:
    stp     x29, x30, [sp, #-112]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    stp     x27, x28, [sp, #80]
    mov     w19, w0
    mov     w20, w1
    mov     w21, w2
    mov     w22, w3
    mov     w23, w4
    mov     w24, w5
    subs    w0, w21, w19
    cneg    w0, w0, mi
    subs    w1, w22, w20
    cneg    w1, w1, mi
    add     w0, w0, w1
    subs    w1, w23, w21
    cneg    w1, w1, mi
    add     w0, w0, w1
    subs    w1, w24, w22
    cneg    w1, w1, mi
    add     w0, w0, w1
    lsr     w0, w0, #FIX_SHIFT
    mov     w1, #BEZIER_PX_PER_STEP
    udiv    w28, w0, w1
    cmp     w28, #BEZIER_MIN
    mov     w1, #BEZIER_MIN
    csel    w28, w1, w28, lo
    cmp     w28, #BEZIER_MAX
    mov     w1, #BEZIER_MAX
    csel    w28, w1, w28, hi
    mov     w25, #1
    mov     w26, w19
    mov     w27, w20

vg_quad_loop:
    cmp     w25, w28
    b.hi    vg_quad_done
    mov     w0, w28
    sub     w1, w0, w25
    mul     w2, w1, w1
    mul     w3, w1, w25
    lsl     w3, w3, #1
    mul     w4, w25, w25
    mul     w6, w28, w28
    smull   x5, w19, w2
    smull   x6, w21, w3
    add     x5, x5, x6
    smull   x6, w23, w4
    add     x5, x5, x6
    mul     w6, w28, w28
    sdiv    x5, x5, x6
    smull   x7, w20, w2
    smull   x8, w22, w3
    add     x7, x7, x8
    smull   x8, w24, w4
    add     x7, x7, x8
    sdiv    x7, x7, x6
    mov     w0, w26
    mov     w1, w27
    mov     w2, w5
    mov     w3, w7
    stp     x5, x7, [sp, #96]
    ladr    x9, vg_emit
    ldr     x9, [x9]
    blr     x9
    ldp     x5, x7, [sp, #96]
    mov     w26, w5
    mov     w27, w7
    add     w25, w25, #1
    b       vg_quad_loop

vg_quad_done:
    ldp     x27, x28, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #112
    ret

font_build_edges:
    stp     x29, x30, [sp, #-128]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    stp     x27, x28, [sp, #80]
    bl      vg_edge_reset
    ladr    x0, glyph_state
    ldr     w19, [x0, #GLYPH_NCONTOURS]
    cbz     w19, font_build_end
    mov     w20, #0
    mov     w21, #0

font_build_contour:
    cmp     w20, w19
    b.hs    font_build_end
    ladr    x0, glyph_ends
    ldrh    w22, [x0, w20, uxtw #1]
    mov     w0, w21
    bl      font_point
    mov     w23, w0
    mov     w24, w1
    mov     w25, w23
    mov     w26, w24
    add     w27, w21, #1

font_build_point:
    cmp     w27, w22
    b.hi    font_build_close
    mov     w0, w27
    bl      font_point_flag
    cbz     w0, font_build_curve
    mov     w0, w27
    bl      font_point
    mov     w2, w0
    mov     w3, w1
    mov     w0, w23
    mov     w1, w24
    bl      vg_edge_add
    mov     w0, w27
    bl      font_point
    mov     w23, w0
    mov     w24, w1
    add     w27, w27, #1
    b       font_build_point

font_build_curve:
    mov     w0, w27
    bl      font_point
    mov     w28, w0
    str     w1, [sp, #96]
    add     w0, w27, #1
    cmp     w0, w22
    b.hi    font_build_curve_wrap
    bl      font_point_flag
    cbnz    w0, font_build_curve_next
    add     w0, w27, #1
    bl      font_point
    ldr     w9, [sp, #96]
    add     w0, w0, w28
    asr     w0, w0, #1
    add     w1, w1, w9
    asr     w1, w1, #1
    mov     w2, w0
    mov     w3, w1
    add     w27, w27, #1
    b       font_build_curve_emit

font_build_curve_next:
    add     w0, w27, #1
    bl      font_point
    mov     w2, w0
    mov     w3, w1
    add     w27, w27, #2
    b       font_build_curve_emit

font_build_curve_wrap:
    mov     w2, w25
    mov     w3, w26
    add     w27, w27, #1

font_build_curve_emit:
    ldr     w9, [sp, #96]
    mov     w4, w2
    mov     w5, w3
    mov     w0, w23
    mov     w1, w24
    mov     w2, w28
    mov     w3, w9
    stp     x4, x5, [sp, #104]
    bl      vg_quad
    ldp     x4, x5, [sp, #104]
    mov     w23, w4
    mov     w24, w5
    b       font_build_point

font_build_close:
    mov     w0, w23
    mov     w1, w24
    mov     w2, w25
    mov     w3, w26
    bl      vg_edge_add
    add     w21, w22, #1
    add     w20, w20, #1
    b       font_build_contour

font_build_end:
    ldp     x27, x28, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #128
    ret

fb_blend_pixel:
    ldr     x3, [x0]
    mov     x4, #ALPHA_MAX
    sub     x5, x4, x1
    and     x6, x2, #0xffff
    mul     x6, x6, x1
    add     x6, x6, #ALPHA_ROUND
    lsr     x7, x6, #16
    add     x6, x6, x7
    lsr     x6, x6, #16
    and     x7, x3, #0xffff
    mul     x7, x7, x5
    add     x7, x7, #ALPHA_ROUND
    lsr     x8, x7, #16
    add     x7, x7, x8
    lsr     x7, x7, #16
    add     x6, x6, x7
    lsr     x9, x2, #CH_SHIFT_G
    and     x9, x9, #0xffff
    mul     x9, x9, x1
    add     x9, x9, #ALPHA_ROUND
    lsr     x10, x9, #16
    add     x9, x9, x10
    lsr     x9, x9, #16
    lsr     x10, x3, #CH_SHIFT_G
    and     x10, x10, #0xffff
    mul     x10, x10, x5
    add     x10, x10, #ALPHA_ROUND
    lsr     x11, x10, #16
    add     x10, x10, x11
    lsr     x10, x10, #16
    add     x9, x9, x10
    orr     x6, x6, x9, lsl #CH_SHIFT_G
    lsr     x9, x2, #CH_SHIFT_B
    and     x9, x9, #0xffff
    mul     x9, x9, x1
    add     x9, x9, #ALPHA_ROUND
    lsr     x10, x9, #16
    add     x9, x9, x10
    lsr     x9, x9, #16
    lsr     x10, x3, #CH_SHIFT_B
    and     x10, x10, #0xffff
    mul     x10, x10, x5
    add     x10, x10, #ALPHA_ROUND
    lsr     x11, x10, #16
    add     x10, x10, x11
    lsr     x10, x10, #16
    add     x9, x9, x10
    orr     x6, x6, x9, lsl #CH_SHIFT_B
    orr     x6, x6, x4, lsl #CH_SHIFT_A
    str     x6, [x0]
    ret

vg_cov_span:
    ladr    x9, vg_cov_buffer
    ladr    x10, vg_cov_xmin
    ldr     w10, [x10]
    asr     w2, w0, #FIX_SHIFT
    asr     w3, w1, #FIX_SHIFT
    sub     w4, w2, w10
    tbnz    w4, #31, cov_span_done
    cmp     w2, w3
    b.ne    cov_span_multi
    sub     w5, w1, w0
    cmp     w4, #VG_COV_MAX
    b.hs    cov_span_done
    ldr     w6, [x9, w4, uxtw #2]
    add     w6, w6, w5
    str     w6, [x9, w4, uxtw #2]
    ret

cov_span_multi:
    sub     w6, w3, w10
    cmp     w6, #VG_COV_MAX
    b.lo    cov_span_multi_ok
    stp     x29, x30, [sp, #-16]!
    bl      font_limit_report
    ldp     x29, x30, [sp], #16
    ladr    x9, vg_cov_buffer
    ladr    x10, vg_cov_xmin
    ldr     w10, [x10]

cov_span_multi_ok:
    and     w5, w0, #0xffff
    mov     w6, #FIX_ONE
    sub     w5, w6, w5
    cmp     w4, #VG_COV_MAX
    b.hs    cov_span_tail
    ldr     w7, [x9, w4, uxtw #2]
    add     w7, w7, w5
    str     w7, [x9, w4, uxtw #2]

cov_span_mid:
    add     w2, w2, #1
    cmp     w2, w3
    b.hs    cov_span_tail
    sub     w4, w2, w10
    tbnz    w4, #31, cov_span_mid
    cmp     w4, #VG_COV_MAX
    b.hs    cov_span_tail
    ldr     w7, [x9, w4, uxtw #2]
    mov     w8, #FIX_ONE
    add     w7, w7, w8
    str     w7, [x9, w4, uxtw #2]
    b       cov_span_mid

cov_span_tail:
    sub     w4, w3, w10
    tbnz    w4, #31, cov_span_done
    cmp     w4, #VG_COV_MAX
    b.hs    cov_span_done
    and     w5, w1, #0xffff
    ldr     w7, [x9, w4, uxtw #2]
    add     w7, w7, w5
    str     w7, [x9, w4, uxtw #2]

cov_span_done:
    ret

vg_fill:
    stp     x29, x30, [sp, #-144]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    stp     x27, x28, [sp, #80]
    mov     x19, x0
    ladr    x0, vg_edge_count
    ldr     w20, [x0]
    cbz     w20, font_fill_end
    mov     w21, #0x7fffffff
    mov     w22, #0x80000000
    mov     w9, #0x7fffffff
    ladr    x23, vg_edge_list
    mov     w24, #0

font_fill_bounds:
    cmp     w24, w20
    b.hs    font_fill_rows
    mov     x0, #VG_EDGE_SIZE
    madd    x0, x24, x0, x23
    ldr     w1, [x0, #VG_EDGE_YTOP]
    cmp     w1, w21
    csel    w21, w1, w21, lt
    ldr     w1, [x0, #VG_EDGE_YBOT]
    cmp     w1, w22
    csel    w22, w1, w22, gt
    ldr     w1, [x0, #VG_EDGE_XTOP]
    cmp     w1, w9
    csel    w9, w1, w9, lt
    ldr     w1, [x0, #VG_EDGE_XBOT]
    cmp     w1, w9
    csel    w9, w1, w9, lt
    add     w24, w24, #1
    b       font_fill_bounds

font_fill_rows:
    asr     w9, w9, #FIX_SHIFT
    sub     w9, w9, #1
    ladr    x0, vg_cov_xmin
    str     w9, [x0]
    asr     w25, w21, #FIX_SHIFT
    asr     w26, w22, #FIX_SHIFT
    add     w26, w26, #1
    ladr    x0, fb_clip
    ldr     w1, [x0, #CLIP_Y]
    cmp     w25, w1
    csel    w25, w1, w25, lt
    cmp     w26, w1
    csel    w26, w1, w26, lt
    ldr     w1, [x0, #CLIP_Y2]
    cmp     w25, w1
    csel    w25, w1, w25, gt
    cmp     w26, w1
    csel    w26, w1, w26, gt

font_fill_row:
    cmp     w25, w26
    b.ge    font_fill_end
    ladr    x0, vg_cov_buffer
    mov     w1, #0

font_fill_clear:
    cmp     w1, #VG_COV_MAX
    b.hs    font_fill_subs
    str     wzr, [x0, w1, uxtw #2]
    add     w1, w1, #1
    b       font_fill_clear

font_fill_subs:
    mov     w10, #0

font_fill_sub:
    cmp     w10, #SUBSAMPLES
    b.hs    font_fill_emit
    lsl     w27, w25, #FIX_SHIFT
    mov     w0, #SUB_STEP
    madd    w27, w10, w0, w27
    add     w27, w27, #SUB_HALF
    mov     w28, #0
    mov     w24, #0

font_fill_scan:
    cmp     w24, w20
    b.hs    font_fill_sort
    mov     x0, #VG_EDGE_SIZE
    madd    x0, x24, x0, x23
    ldr     w1, [x0, #VG_EDGE_YTOP]
    cmp     w27, w1
    b.lt    font_fill_scan_next
    ldr     w2, [x0, #VG_EDGE_YBOT]
    cmp     w27, w2
    b.ge    font_fill_scan_next
    ldr     w3, [x0, #VG_EDGE_XTOP]
    ldr     w4, [x0, #VG_EDGE_XBOT]
    sub     w5, w27, w1
    sub     w6, w2, w1
    sub     w7, w4, w3
    smull   x5, w5, w7
    sdiv    x5, x5, x6
    add     w5, w3, w5
    ldr     w6, [x0, #VG_EDGE_DIR]
    cmp     w28, #VG_XS_MAX
    b.lo    font_fill_scan_store
    stp     x0, x1, [sp, #128]
    bl      font_limit_report
    ldp     x0, x1, [sp, #128]
    b       font_fill_scan_next

font_fill_scan_store:
    ladr    x7, vg_xs_list
    mov     x8, #VG_XS_SIZE
    madd    x7, x28, x8, x7
    str     w5, [x7]
    str     w6, [x7, #4]
    add     w28, w28, #1

font_fill_scan_next:
    add     w24, w24, #1
    b       font_fill_scan

font_fill_sort:
    cmp     w28, #2
    b.lo    font_fill_span
    mov     w24, #1

font_fill_sort_outer:
    cmp     w24, w28
    b.hs    font_fill_span
    ladr    x7, vg_xs_list
    mov     x8, #VG_XS_SIZE
    madd    x0, x24, x8, x7
    ldr     w1, [x0]
    ldr     w2, [x0, #4]
    sub     w3, w24, #1

font_fill_sort_inner:
    tbnz    w3, #31, font_fill_sort_place
    madd    x0, x3, x8, x7
    ldr     w4, [x0]
    cmp     w4, w1
    b.le    font_fill_sort_place
    ldr     w5, [x0, #4]
    add     x6, x0, #VG_XS_SIZE
    str     w4, [x6]
    str     w5, [x6, #4]
    sub     w3, w3, #1
    b       font_fill_sort_inner

font_fill_sort_place:
    add     w3, w3, #1
    madd    x0, x3, x8, x7
    str     w1, [x0]
    str     w2, [x0, #4]
    add     w24, w24, #1
    b       font_fill_sort_outer

font_fill_span:
    mov     w24, #0
    mov     w3, #0
    mov     w4, #0

font_fill_span_loop:
    cmp     w24, w28
    b.hs    font_fill_sub_next
    ladr    x7, vg_xs_list
    mov     x8, #VG_XS_SIZE
    madd    x0, x24, x8, x7
    ldr     w1, [x0]
    ldr     w2, [x0, #4]
    mov     w5, w3
    add     w3, w3, w2
    cbnz    w5, font_fill_span_maybe_end
    mov     w4, w1
    b       font_fill_span_next

font_fill_span_maybe_end:
    cbnz    w3, font_fill_span_next
    mov     w0, w4
    stp     x3, x24, [sp, #96]
    stp     x10, x28, [sp, #112]
    bl      vg_cov_span
    ldp     x3, x24, [sp, #96]
    ldp     x10, x28, [sp, #112]
    mov     w3, #0

font_fill_span_next:
    add     w24, w24, #1
    b       font_fill_span_loop

font_fill_sub_next:
    add     w10, w10, #1
    b       font_fill_sub

font_fill_emit:
    ladr    x0, vg_cov_xmin
    ldr     w11, [x0]
    mov     w12, #0

font_fill_emit_loop:
    cmp     w12, #VG_COV_MAX
    b.hs    font_fill_next
    ladr    x0, vg_cov_buffer
    ldr     w13, [x0, w12, uxtw #2]
    cbz     w13, font_fill_emit_next
    lsr     w13, w13, #2
    mov     w0, #ALPHA_MAX
    cmp     w13, w0
    csel    w13, w0, w13, hi
    add     w14, w11, w12
    tbnz    w14, #31, font_fill_emit_next
    mov     w0, #FB_WIDTH
    cmp     w14, w0
    b.hs    font_fill_emit_next
    mov     w0, w14
    mov     w1, w25
    stp     x11, x12, [sp, #96]
    stp     x13, x25, [sp, #112]
    bl      fb_pixel_addr
    ldp     x13, x25, [sp, #112]
    mov     x1, x13
    mov     x2, x19
    bl      fb_blend_pixel
    ldp     x11, x12, [sp, #96]
    ldp     x13, x25, [sp, #112]

font_fill_emit_next:
    add     w12, w12, #1
    b       font_fill_emit_loop

font_fill_next:
    add     w25, w25, #1
    b       font_fill_row

font_fill_end:
    ldp     x27, x28, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #144
    ret

font_set_size:
    stp     x29, x30, [sp, #-16]!
    ladr    x1, font_state
    ldr     w1, [x1, #FONT_UNITS]
    cbz     w1, font_set_size_done
    lsl     w0, w0, #FIX_SHIFT
    udiv    w0, w0, w1
    ladr    x1, vg_scale
    str     w0, [x1]

font_set_size_done:
    ldp     x29, x30, [sp], #16
    ret

font_text:
    stp     x29, x30, [sp, #-80]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    str     x25, [sp, #64]
    mov     w19, w0
    mov     w20, w1
    mov     x21, x2
    mov     w22, w3
    mov     x23, x4
    mov     w0, w22
    bl      font_set_size
    ladr    x0, vg_scale
    ldr     w24, [x0]
    cbz     w24, font_text_done
    lsl     w19, w19, #FIX_SHIFT
    lsl     w20, w20, #FIX_SHIFT

font_text_loop:
    ldrb    w0, [x21], #1
    cbz     w0, font_text_done
    bl      font_glyph_index
    mov     w25, w0
    ladr    x0, vg_scale
    str     w19, [x0, #4]
    str     w20, [x0, #8]
    mov     w0, w25
    bl      font_load_glyph
    cbz     w0, font_text_advance
    bl      font_build_edges
    mov     x0, x23
    bl      vg_fill

font_text_advance:
    mov     w0, w25
    bl      font_advance
    mul     w0, w0, w24
    add     w19, w19, w0
    b       font_text_loop

font_text_done:
    ldr     x25, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #80
    ret

font_init:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    ladr    x0, font_name
    ladr    x1, font_buffer
    mov     w2, #FONT_MAX_SIZE
    bl      fat_load
    cbz     w0, font_init_fail
    ladr    x19, font_state
    str     w0, [x19, #FONT_FILESIZE]
    ladr    x0, font_tag_head
    bl      font_find_table
    cbz     x0, font_init_fail
    str     x0, [x19, #FONT_HEAD]
    ladr    x0, font_tag_maxp
    bl      font_find_table
    cbz     x0, font_init_fail
    str     x0, [x19, #FONT_MAXP]
    ladr    x0, font_tag_loca
    bl      font_find_table
    cbz     x0, font_init_fail
    str     x0, [x19, #FONT_LOCA]
    ladr    x0, font_tag_glyf
    bl      font_find_table
    cbz     x0, font_init_fail
    str     x0, [x19, #FONT_GLYF]
    ladr    x0, font_tag_cmap
    bl      font_find_table
    cbz     x0, font_init_fail
    str     x0, [x19, #FONT_CMAP]
    ladr    x0, font_tag_hmtx
    bl      font_find_table
    str     x0, [x19, #FONT_HMTX]
    ladr    x0, font_tag_hhea
    bl      font_find_table
    str     x0, [x19, #FONT_HHEA]
    ldr     x0, [x19, #FONT_HEAD]
    add     x0, x0, #HEAD_UNITS_PER_EM
    bl      font_be16
    cbz     w0, font_init_fail
    str     w0, [x19, #FONT_UNITS]
    ldr     x0, [x19, #FONT_HEAD]
    add     x0, x0, #HEAD_INDEX_TO_LOC
    bl      font_be16
    str     w0, [x19, #FONT_LOCFMT]
    ldr     x0, [x19, #FONT_MAXP]
    add     x0, x0, #MAXP_NUM_GLYPHS
    bl      font_be16
    str     w0, [x19, #FONT_NGLYPHS]
    ldr     x0, [x19, #FONT_HHEA]
    cbz     x0, font_init_nohhea
    add     x0, x0, #HHEA_NUM_HMETRICS
    bl      font_be16
    str     w0, [x19, #FONT_NUMH]
    b       font_init_cmap

font_init_nohhea:
    str     wzr, [x19, #FONT_NUMH]

font_init_cmap:
    ldr     x0, [x19, #FONT_CMAP]
    bl      font_find_cmap4
    cbz     x0, font_init_fail
    str     x0, [x19, #FONT_CMAP4]
    ladr    x0, font_ok_msg
    bl      uart_puts
    ldr     w0, [x19, #FONT_UNITS]
    bl      uart_putdec
    ladr    x0, font_glyphs_msg
    bl      uart_puts
    ldr     w0, [x19, #FONT_NGLYPHS]
    bl      uart_putdec
    ladr    x0, uart_newline
    bl      uart_puts
    mov     w0, #1
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

font_init_fail:
    ladr    x0, font_fail_msg
    bl      uart_puts
    mov     w0, #0
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
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
    stp     x29, x30, [sp, #-16]!
    mrs     x0, cntfrq_el0
    cbz     x0, timer_unavailable
    ladr    x1, timer_freq
    str     x0, [x1]
    bl      click_init
    mrs     x0, cntfrq_el0
    mov     x2, #TIMER_HZ
    udiv    x0, x0, x2
    ladr    x1, timer_interval
    str     x0, [x1]
    msr     cntv_tval_el0, x0
    mov     x0, #TIMER_CTL_ENABLE
    msr     cntv_ctl_el0, x0
    isb
    mov     w0, #TIMER_INTID
    ldp     x29, x30, [sp], #16
    b       gic_enable_irq

timer_unavailable:
    ladr    x0, timer_error
    ldp     x29, x30, [sp], #16
    b       uart_puts

timer_tick:
    ladr    x0, timer_interval
    ldr     x1, [x0]
    msr     cntv_tval_el0, x1
    ladr    x0, anim_active
    ldr     w1, [x0]
    cbz     w1, timer_tick_blink
    ladr    x0, anim_pending
    mov     w1, #1
    strb    w1, [x0]

timer_tick_blink:
    ladr    x0, timer_blink_count
    ldr     w1, [x0]
    add     w1, w1, #1
    cmp     w1, #BLINK_DIVIDER
    b.lo    timer_tick_store
    mov     w1, #0
    ladr    x2, console_cursor_phase
    ldrb    w3, [x2]
    eor     w3, w3, #1
    strb    w3, [x2]
    ladr    x2, console_blink_pending
    mov     w3, #1
    strb    w3, [x2]

timer_tick_store:
    str     w1, [x0]
    ret

uart_rx_get:
    ladr    x1, uart_rx_tail
    ldr     w2, [x1]
    ladr    x3, uart_rx_head
    ldr     w3, [x3]
    cmp     w2, w3
    b.eq    uart_rx_get_empty
    ladr    x4, uart_rx_ring
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
    bl      console_drain
    msr     daifset, #DAIF_I
    bl      console_pending
    cbnz    w0, console_run_awake
    wfi

console_run_awake:
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
    ladr    x0, uart_rx_overflow
    ldrb    w1, [x0]
    cbz     w1, console_drain_click
    strb    wzr, [x0]
    ladr    x0, console_overflow_msg
    bl      uart_puts

console_drain_click:
    ladr    x0, click_pending
    ldrb    w1, [x0]
    cbz     w1, console_drain_mouse
    strb    wzr, [x0]
    ladr    x0, click_x
    ldr     w1, [x0, #4]
    ldr     w0, [x0]
    bl      power_hit
    cbnz    w0, console_drain_power
    ladr    x0, click_x
    ldr     w1, [x0, #4]
    ldr     w0, [x0]
    bl      win_click
    bl      cursor_hide
    bl      win_repaint
    bl      cursor_show
    b       console_drain_mouse

console_drain_power:
    bl      power_off

console_drain_mouse:
    ladr    x0, mouse_dirty
    ldrb    w1, [x0]
    cbz     w1, console_drain_anim
    strb    wzr, [x0]
    bl      win_drag_move
    bl      cursor_hide
    bl      win_repaint
    bl      cursor_show

console_drain_anim:
    ladr    x0, anim_pending
    ldrb    w1, [x0]
    cbz     w1, console_drain_blink
    strb    wzr, [x0]
    bl      anim_tick
    bl      cursor_hide
    bl      win_repaint
    bl      cursor_show
    ladr    x0, fb_fade_dirty
    ldrb    w1, [x0]
    cbz     w1, console_drain_blink
    strb    wzr, [x0]
    bl      fb_present_all

console_drain_blink:
    ladr    x0, console_blink_pending
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
    ladr    x0, console_cursor_phase
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
    ladr    x1, virtio_input_intid
    ldr     w1, [x1]
    cmp     w0, w1
    b.eq    irq_virtio
    ladr    x0, irq_label
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
    ladr    x0, panic_banner
    bl      uart_puts
    ladr    x0, panic_names
    ldr     x0, [x0, x19, lsl #3]
    bl      uart_puts

    ladr    x0, panic_label_esr
    mrs     x1, esr_el1
    bl      uart_field

    ladr    x0, panic_label_elr
    mrs     x1, elr_el1
    bl      uart_field

    ladr    x0, panic_label_far
    mrs     x1, far_el1
    bl      uart_field

    ladr    x0, panic_label_spsr
    mrs     x1, spsr_el1
    bl      uart_field

    ladr    x0, uart_newline
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

uart_putdec:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    ladr    x19, dec_buffer
    add     x19, x19, #DEC_BUFFER_SIZE
    mov     x20, #10
    mov     x21, x0
    cbnz    x21, uart_putdec_loop
    sub     x19, x19, #1
    mov     w0, #ASCII_ZERO
    strb    w0, [x19]
    b       uart_putdec_out

uart_putdec_loop:
    cbz     x21, uart_putdec_out
    udiv    x0, x21, x20
    msub    x1, x0, x20, x21
    add     w1, w1, #ASCII_ZERO
    sub     x19, x19, #1
    strb    w1, [x19]
    mov     x21, x0
    b       uart_putdec_loop

uart_putdec_out:
    ladr    x1, dec_buffer
    add     x1, x1, #DEC_BUFFER_SIZE
    sub     x1, x1, x19
    mov     x0, x19
    bl      uart_putn
    ldr     x21, [sp, #32]
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

.section .text.vectors
.balign VEC_TABLE_ALIGN
.global vec_table
.global vec_table
vec_table:
    vec_entry 0, panic_entry
uart_rx_isr:
    mov     x1, #UART_BASE
    ldr     w2, [x1, #UART_MIS]
    str     w2, [x1, #UART_ICR]
    ladr    x8, uart_rx_ring
    ladr    x9, uart_rx_head
    ladr    x10, uart_rx_tail

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
    ladr    x3, uart_rx_overflow
    mov     w4, #1
    strb    w4, [x3]
    b       uart_rx_isr_loop

uart_rx_isr_done:
    ret

    vec_entry 1, panic_entry
mem_init:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    bl      fdt_find_memory
    cbz     x1, mem_init_fail
    ladr    x19, ram_base
    str     x0, [x19]
    str     x1, [x19, #8]
    ladr    x0, mem_base_label
    ldr     x1, [x19]
    bl      uart_field
    ladr    x0, mem_size_label
    ldr     x1, [x19, #8]
    bl      uart_field
    ladr    x0, uart_newline
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

mem_init_fail:
    ladr    x0, mem_fail_msg
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

    vec_entry 2, panic_entry
fat_next_cluster:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     w19, w0
    lsl     w0, w0, #2
    ladr    x1, fat_state
    ldr     w2, [x1, #FAT_START]
    lsr     w3, w0, #9
    add     w3, w3, w2
    and     w19, w0, #(BLK_SECTOR_SIZE - 1)
    mov     w0, w3
    ladr    x1, fat_buffer
    bl      blk_read
    cbnz    w0, fat_next_cluster_end
    ladr    x0, fat_buffer
    mov     x1, x19
    bl      mem_read32
    ldr     w1, =FAT_ENTRY_MASK
    and     w0, w0, w1
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

fat_next_cluster_end:
    mov     w0, #0
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

    vec_entry 3, panic_entry
console_pending:
    ladr    x1, uart_rx_head
    ldr     w2, [x1]
    ladr    x1, uart_rx_tail
    ldr     w3, [x1]
    cmp     w2, w3
    b.ne    console_pending_yes
    ladr    x1, uart_rx_overflow
    ldrb    w2, [x1]
    cbnz    w2, console_pending_yes
    ladr    x1, click_pending
    ldrb    w2, [x1]
    cbnz    w2, console_pending_yes
    ladr    x1, mouse_dirty
    ldrb    w2, [x1]
    cbnz    w2, console_pending_yes
    ladr    x1, console_blink_pending
    ldrb    w2, [x1]
    cbnz    w2, console_pending_yes
    mov     w0, #0
    ret

console_pending_yes:
    mov     w0, #1
    ret

    vec_entry 4, panic_entry
blk_init:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x0, #VIRTIO_ID_BLOCK
    bl      virtio_find
    cbz     x0, blk_init_fail
    mov     x19, x0
    ladr    x1, blk_base
    str     x19, [x1]
    mov     x0, x19
    ladr    x1, blk_desc
    ladr    x2, blk_avail
    ladr    x3, blk_used
    mov     x4, #BLK_QUEUE_SIZE
    bl      virtio_setup
    cbnz    w0, blk_init_fail
    mov     x0, x19
    bl      virtio_driver_ok
    ladr    x0, blk_ready_msg
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

    vec_entry 5, irq_entry
blk_fail_msg:
    .asciz  "BLK UNAVAILABLE\r\n"
blk_oem_label:
    .asciz  " oem="
blk_read_fail_msg:
    .asciz  "BLK READ FAILED\r\n"
blk_ready_msg:
    .asciz  "BLK READY\r\n"
blk_sig_label:
    .asciz  "BLK sig="
blk_timeout_msg:
    .asciz  "BLK TIMEOUT, GERAET GESPERRT\r\n"
boot_banner:
    .asciz  "asmOS\r\n"
boot_ok_msg:
    .asciz  "BOOT OK\r\n"

    vec_entry 6, panic_entry
console_overflow_msg:
    .asciz  "\r\nRX OVERFLOW\r\n"
fat_big_end:
    .asciz  "--- ENDE ---\r\n"
fat_big_label:
    .asciz  "\r\n--- BIG.TXT ---\r\n"
fat_cat_label:
    .asciz  "\r\n--- HELLO.TXT ---\r\n"
fat_empty_label:
    .asciz  "\r\n--- EMPTY.TXT ---\r\n"

    vec_entry 7, panic_entry
fat_entry_prefix:
    .asciz  "\r\nFILE "
fat_error_msg:
    .asciz  "\r\nFAT READ ERROR\r\n"
fat_fail_msg:
    .asciz  "FAT INVALID\r\n"
fat_label_data:
    .asciz  " data="
fat_label_res:
    .asciz  "FAT res="
fat_label_root:
    .asciz  " root="
fat_label_spf:
    .asciz  " spf="
fat_missing_label:
    .asciz  "--- NOSUCH.TXT ---\r\n"
fat_missing_msg:
    .asciz  "\r\nFILE NOT FOUND\r\n"

    vec_entry 8, panic_entry
fat_short_msg:
    .asciz  "\r\nFAT CHAIN SHORT\r\n"
fat_size_label:
    .asciz  " size="
fb_bpp_msg:
    .asciz  ", intern "
fb_bpp_msg2:
    .asciz  " Bit je Punkt\r\n"
fb_missing_msg:
    .asciz  "FB UNAVAILABLE\r\n"
fb_ready_msg:
    .asciz  "FB "
fb_times_msg:
    .asciz  "x"
fdt_memory_name:
    .asciz  "memory"
fdt_reg_name:
    .asciz  "reg"
fwcfg_ramfb_name:
    .asciz  "etc/ramfb"

    vec_entry 9, panic_entry
irq_label:
    .asciz  "\r\nIRQ UNEXPECTED iar="
mem_base_label:
    .asciz  "RAM base="
mem_fail_msg:
    .asciz  "RAM UNKNOWN\r\n"
mem_size_label:
    .asciz  " size="
mmu_ready_msg:
    .asciz  "MMU ON\r\n"
mmu_skip_msg:
    .asciz  "MMU SKIPPED, RAM UNKNOWN\r\n"
panic_banner:
    .asciz  "\r\nPANIC "
panic_label_elr:
    .asciz  " elr="
panic_label_esr:
    .asciz  " esr="

    vec_entry 10, panic_entry
panic_label_far:
    .asciz  " far="
panic_label_spsr:
    .asciz  " spsr="
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

    vec_entry 11, panic_entry
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
pmm_base_label:
    .asciz  "PMM base="
pmm_fail_msg:
    .asciz  "PMM NO MEMORY\r\n"
pmm_fdt_label:
    .asciz  "FDT at="
pmm_fdt_suffix:
    .asciz  "\r\n"
pmm_fdtlen_label:
    .asciz  " len="

    vec_entry 12, panic_entry
pmm_pages_label:
    .asciz  " pages="
pmm_reuse_label:
    .asciz  " reuse="
pmm_test_label:
    .asciz  " p="
pmm_used_label:
    .asciz  "\r\nPMM used="
timer_error:
    .asciz  "TIMER UNAVAILABLE\r\n"
font_fail_msg:
    .asciz  "TTF UNAVAILABLE\r\n"
font_glyphs_msg:
    .asciz  " glyphs="

    vec_entry 13, panic_entry
font_limit_msg:
    .asciz  "TTF GRENZE ERREICHT, Glyph unvollstaendig\r\n"
font_ok_msg:
    .asciz  "TTF units="
font_tag_cmap:
    .asciz  "cmap"
font_tag_glyf:
    .asciz  "glyf"
font_tag_head:
    .asciz  "head"
font_tag_hhea:
    .asciz  "hhea"
font_tag_hmtx:
    .asciz  "hmtx"
font_tag_loca:
    .asciz  "loca"
font_tag_maxp:
    .asciz  "maxp"
uart_newline:
    .asciz  "\r\n"

    vec_entry 14, panic_entry
virtio_fail_msg:
    .asciz  "INPUT UNAVAILABLE\r\n"
virtio_id_label:
    .asciz  " id="
virtio_ready_msg:
    .asciz  "INPUT READY\r\n"
virtio_slot_label:
    .asciz  "VIRTIO at="
virtio_ver_label:
    .asciz  " ver="
win_pixels_label:
    .asciz  "\r\nREPAINT pixel="
win_title_1:
    .asciz  "Fenster A"
win_title_2:
    .asciz  "Fenster B"
win_title_3:
    .asciz  "asmOS"

    vec_entry 15, panic_entry

.section .rodata

anim_noclock_msg:
    .asciz  "ANIM OHNE ZEITQUELLE, Endzustand direkt\r\n"

anim_full_msg:
    .asciz  "ANIM LISTE VOLL, Endzustand direkt setzen\r\n"

power_msg:
    .asciz  "\r\nSHUTDOWN angefordert\r\n"

power_wipe_msg:
    .asciz  "SHUTDOWN Speicher wird geleert\r\n"

power_bye_msg:
    .asciz  "SHUTDOWN PSCI SYSTEM_OFF\r\n"

power_fail_msg:
    .asciz  "SHUTDOWN FEHLGESCHLAGEN, System angehalten\r\n"

win_full_msg:
    .asciz  "WIN LISTE VOLL, Fenster verworfen\r\n"

























font_name:
    .ascii  "FONT    TTF"
    .byte   0




fat_hello_name:
    .ascii  "HELLO   TXT"
    .byte   0

fat_empty_name:
    .ascii  "EMPTY   TXT"
    .byte   0


fat_missing_name:
    .ascii  "NOSUCH  TXT"
    .byte   0


fat_big_name:
    .ascii  "BIG     TXT"
    .byte   0






















.balign 2
cursor_alpha_rows:
    .2byte  0, 1, 2, 8, 18, 28, 37, 48
    .2byte  61, 74, 87, 100, 114, 128, 141, 154
    .2byte  167, 180, 192, 203, 216, 227, 238, 249
    .2byte  260, 272, 284, 298, 312, 326, 340, 351
    .2byte  363, 374, 385, 396, 407, 417, 428, 439
    .2byte  450, 461, 470, 478, 486, 493, 499, 500

cursor_alpha_rle:
    .byte   48, 0x00
    .byte   48, 0x00
    .byte   6, 0x00, 1, 0x0e, 1, 0x3c, 1, 0x3e, 1, 0x12, 38, 0x00
    .byte   4, 0x00, 1, 0x09, 1, 0x93, 1, 0xf9, 2, 0xff, 1, 0xfc, 1, 0xb4, 1, 0x48
    .byte   1, 0x01, 35, 0x00
    .byte   3, 0x00, 1, 0x09, 1, 0xcb, 1, 0xff, 4, 0xe5, 2, 0xff, 1, 0xdb, 1, 0x71
    .byte   1, 0x10, 33, 0x00
    .byte   3, 0x00, 1, 0x94, 1, 0xff, 7, 0xe5, 2, 0xff, 1, 0xf5, 1, 0x9a, 1, 0x2f
    .byte   31, 0x00
    .byte   2, 0x00, 1, 0x0e, 1, 0xf9, 3, 0xe5, 3, 0xff, 5, 0xe5, 2, 0xff, 1, 0xc3
    .byte   1, 0x58, 1, 0x05, 28, 0x00
    .byte   2, 0x00, 1, 0x3c, 1, 0xff, 2, 0xe5, 1, 0xff, 2, 0xe5, 4, 0xff, 4, 0xe5
    .byte   2, 0xff, 1, 0xe7, 1, 0x81, 1, 0x1a, 26, 0x00
    .byte   2, 0x00, 1, 0x3e, 1, 0xff, 2, 0xe5, 1, 0xff, 5, 0xe5, 3, 0xff, 4, 0xe5
    .byte   2, 0xff, 1, 0xfb, 1, 0xaa, 1, 0x3e, 24, 0x00
    .byte   2, 0x00, 1, 0x13, 1, 0xfc, 2, 0xe5, 2, 0xff, 6, 0xe5, 3, 0xff, 5, 0xe5
    .byte   2, 0xff, 1, 0xd2, 1, 0x67, 1, 0x0b, 21, 0x00
    .byte   3, 0x00, 1, 0xb3, 1, 0xff, 2, 0xe5, 1, 0xff, 8, 0xe5, 4, 0xff, 4, 0xe5
    .byte   2, 0xff, 1, 0xf0, 1, 0x90, 1, 0x26, 19, 0x00
    .byte   3, 0x00, 1, 0x47, 1, 0xff, 2, 0xe5, 1, 0xff, 11, 0xe5, 3, 0xff, 5, 0xe5
    .byte   1, 0xff, 1, 0xfe, 1, 0xb9, 1, 0x4e, 1, 0x02, 16, 0x00
    .byte   3, 0x00, 1, 0x01, 1, 0xdb, 1, 0xff, 1, 0xe5, 2, 0xff, 12, 0xe5, 3, 0xff
    .byte   5, 0xe5, 2, 0xff, 1, 0xdf, 1, 0x77, 1, 0x13, 14, 0x00
    .byte   4, 0x00, 1, 0x70, 1, 0xff, 2, 0xe5, 1, 0xff, 14, 0xe5, 4, 0xff, 4, 0xe5
    .byte   2, 0xff, 1, 0xf7, 1, 0xa0, 1, 0x34, 12, 0x00
    .byte   4, 0x00, 1, 0x10, 1, 0xf5, 2, 0xe5, 2, 0xff, 16, 0xe5, 3, 0xff, 5, 0xe5
    .byte   2, 0xff, 1, 0xc9, 1, 0x5d, 1, 0x07, 9, 0x00
    .byte   5, 0x00, 1, 0x99, 1, 0xff, 2, 0xe5, 1, 0xff, 18, 0xe5, 4, 0xff, 4, 0xe5
    .byte   2, 0xff, 1, 0xea, 1, 0x86, 1, 0x1e, 7, 0x00
    .byte   5, 0x00, 1, 0x2e, 1, 0xff, 2, 0xe5, 2, 0xff, 20, 0xe5, 3, 0xff, 5, 0xe5
    .byte   1, 0xff, 1, 0xfc, 1, 0xaf, 1, 0x37, 5, 0x00
    .byte   6, 0x00, 1, 0xc3, 1, 0xff, 2, 0xe5, 1, 0xff, 22, 0xe5, 3, 0xff, 5, 0xe5
    .byte   1, 0xff, 1, 0xfe, 1, 0x80, 4, 0x00
    .byte   6, 0x00, 1, 0x57, 1, 0xff, 2, 0xe5, 1, 0xff, 24, 0xe5, 4, 0xff, 4, 0xe5
    .byte   1, 0xff, 1, 0x5f, 3, 0x00
    .byte   6, 0x00, 1, 0x05, 1, 0xe6, 1, 0xff, 1, 0xe5, 2, 0xff, 26, 0xe5, 3, 0xff
    .byte   2, 0xe5, 1, 0xff, 1, 0xe1, 1, 0x01, 2, 0x00
    .byte   7, 0x00, 1, 0x80, 1, 0xff, 2, 0xe5, 1, 0xff, 28, 0xe5, 2, 0xff, 2, 0xe5
    .byte   1, 0xff, 1, 0x29, 2, 0x00
    .byte   7, 0x00, 1, 0x1a, 1, 0xfb, 2, 0xe5, 2, 0xff, 28, 0xe5, 1, 0xff, 2, 0xe5
    .byte   1, 0xff, 1, 0x3d, 2, 0x00
    .byte   8, 0x00, 1, 0xa9, 1, 0xff, 2, 0xe5, 1, 0xff, 27, 0xe5, 2, 0xff, 2, 0xe5
    .byte   1, 0xff, 1, 0x22, 2, 0x00
    .byte   8, 0x00, 1, 0x3e, 1, 0xff, 2, 0xe5, 2, 0xff, 22, 0xe5, 5, 0xff, 2, 0xe5
    .byte   1, 0xff, 1, 0xd5, 3, 0x00
    .byte   9, 0x00, 1, 0xd2, 1, 0xff, 2, 0xe5, 1, 0xff, 18, 0xe5, 5, 0xff, 5, 0xe5
    .byte   1, 0xff, 1, 0xfe, 1, 0x4c, 3, 0x00
    .byte   9, 0x00, 1, 0x67, 1, 0xff, 2, 0xe5, 1, 0xff, 15, 0xe5, 4, 0xff, 7, 0xe5
    .byte   2, 0xff, 1, 0xf9, 1, 0x67, 4, 0x00
    .byte   9, 0x00, 1, 0x0b, 1, 0xf0, 2, 0xe5, 2, 0xff, 12, 0xe5, 3, 0xff, 7, 0xe5
    .byte   2, 0xff, 1, 0xfe, 1, 0xd1, 1, 0x88, 1, 0x22, 5, 0x00
    .byte   10, 0x00, 1, 0x90, 1, 0xff, 2, 0xe5, 1, 0xff, 11, 0xe5, 2, 0xff, 5, 0xe5
    .byte   3, 0xff, 1, 0xe1, 1, 0x9d, 1, 0x59, 1, 0x16, 8, 0x00
    .byte   10, 0x00, 1, 0x26, 1, 0xfe, 2, 0xe5, 2, 0xff, 10, 0xe5, 1, 0xff, 2, 0xe5
    .byte   3, 0xff, 1, 0xee, 1, 0xac, 1, 0x69, 1, 0x25, 12, 0x00
    .byte   11, 0x00, 1, 0xb9, 1, 0xff, 2, 0xe5, 1, 0xff, 9, 0xe5, 2, 0xff, 1, 0xe5
    .byte   1, 0xff, 1, 0xee, 1, 0x7a, 1, 0x34, 1, 0x02, 15, 0x00
    .byte   11, 0x00, 1, 0x4e, 1, 0xff, 2, 0xe5, 1, 0xff, 9, 0xe5, 1, 0xff, 2, 0xe5
    .byte   1, 0xff, 1, 0x79, 18, 0x00
    .byte   11, 0x00, 1, 0x02, 1, 0xe0, 1, 0xff, 1, 0xe5, 2, 0xff, 8, 0xe5, 1, 0xff
    .byte   2, 0xe5, 1, 0xff, 1, 0x34, 18, 0x00
    .byte   12, 0x00, 1, 0x77, 1, 0xff, 2, 0xe5, 1, 0xff, 7, 0xe5, 2, 0xff, 2, 0xe5
    .byte   1, 0xed, 1, 0x02, 18, 0x00
    .byte   12, 0x00, 1, 0x14, 1, 0xf7, 2, 0xe5, 2, 0xff, 6, 0xe5, 1, 0xff, 2, 0xe5
    .byte   1, 0xff, 1, 0xac, 19, 0x00
    .byte   13, 0x00, 1, 0xa0, 1, 0xff, 2, 0xe5, 1, 0xff, 6, 0xe5, 1, 0xff, 2, 0xe5
    .byte   1, 0xff, 1, 0x68, 19, 0x00
    .byte   13, 0x00, 1, 0x35, 1, 0xff, 2, 0xe5, 2, 0xff, 5, 0xe5, 1, 0xff, 2, 0xe5
    .byte   1, 0xff, 1, 0x24, 19, 0x00
    .byte   14, 0x00, 1, 0xc9, 1, 0xff, 2, 0xe5, 1, 0xff, 4, 0xe5, 2, 0xff, 2, 0xe5
    .byte   1, 0xe0, 20, 0x00
    .byte   14, 0x00, 1, 0x5e, 1, 0xff, 2, 0xe5, 1, 0xff, 4, 0xe5, 1, 0xff, 2, 0xe5
    .byte   1, 0xff, 1, 0x9d, 20, 0x00
    .byte   14, 0x00, 1, 0x07, 1, 0xeb, 2, 0xe5, 2, 0xff, 3, 0xe5, 1, 0xff, 2, 0xe5
    .byte   1, 0xff, 1, 0x59, 20, 0x00
    .byte   15, 0x00, 1, 0x87, 1, 0xff, 2, 0xe5, 1, 0xff, 3, 0xe5, 1, 0xff, 2, 0xe5
    .byte   1, 0xfe, 1, 0x16, 20, 0x00
    .byte   15, 0x00, 1, 0x1f, 1, 0xfc, 2, 0xe5, 2, 0xff, 1, 0xe5, 2, 0xff, 1, 0xe5
    .byte   1, 0xff, 1, 0xd1, 21, 0x00
    .byte   16, 0x00, 1, 0xb0, 1, 0xff, 2, 0xe5, 3, 0xff, 2, 0xe5, 1, 0xff, 1, 0x87
    .byte   21, 0x00
    .byte   16, 0x00, 1, 0x38, 1, 0xfe, 6, 0xe5, 1, 0xff, 1, 0xf9, 1, 0x22, 21, 0x00
    .byte   17, 0x00, 1, 0x81, 2, 0xff, 3, 0xe5, 1, 0xff, 1, 0xfe, 1, 0x67, 22, 0x00
    .byte   18, 0x00, 1, 0x60, 1, 0xe2, 3, 0xff, 1, 0xd6, 1, 0x4c, 23, 0x00
    .byte   19, 0x00, 1, 0x01, 1, 0x2a, 1, 0x3e, 1, 0x22, 25, 0x00
    .byte   48, 0x00
    .byte   48, 0x00

cursor_white:
    .byte   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte   0x03, 0xc0, 0x00, 0x00, 0x00, 0x00
    .byte   0x0f, 0xf8, 0x00, 0x00, 0x00, 0x00
    .byte   0x1c, 0x3e, 0x00, 0x00, 0x00, 0x00
    .byte   0x18, 0x0f, 0x80, 0x00, 0x00, 0x00
    .byte   0x31, 0xc1, 0xf0, 0x00, 0x00, 0x00
    .byte   0x32, 0x78, 0x7c, 0x00, 0x00, 0x00
    .byte   0x32, 0x0e, 0x1f, 0x00, 0x00, 0x00
    .byte   0x33, 0x03, 0x83, 0xe0, 0x00, 0x00
    .byte   0x19, 0x00, 0xf0, 0xf8, 0x00, 0x00
    .byte   0x19, 0x00, 0x1c, 0x1f, 0x00, 0x00
    .byte   0x1d, 0x80, 0x07, 0x07, 0xc0, 0x00
    .byte   0x0c, 0x80, 0x01, 0xe1, 0xf0, 0x00
    .byte   0x0c, 0xc0, 0x00, 0x38, 0x3e, 0x00
    .byte   0x06, 0x40, 0x00, 0x0f, 0x0f, 0x80
    .byte   0x06, 0x60, 0x00, 0x01, 0xc1, 0xe0
    .byte   0x03, 0x20, 0x00, 0x00, 0x70, 0x70
    .byte   0x03, 0x20, 0x00, 0x00, 0x1e, 0x18
    .byte   0x03, 0xb0, 0x00, 0x00, 0x03, 0x9c
    .byte   0x01, 0x90, 0x00, 0x00, 0x00, 0xcc
    .byte   0x01, 0x98, 0x00, 0x00, 0x00, 0x4c
    .byte   0x00, 0xc8, 0x00, 0x00, 0x00, 0xcc
    .byte   0x00, 0xcc, 0x00, 0x00, 0x0f, 0x98
    .byte   0x00, 0x64, 0x00, 0x00, 0xf8, 0x38
    .byte   0x00, 0x64, 0x00, 0x07, 0x80, 0xf0
    .byte   0x00, 0x66, 0x00, 0x1c, 0x07, 0xe0
    .byte   0x00, 0x32, 0x00, 0x30, 0x7f, 0x00
    .byte   0x00, 0x33, 0x00, 0x27, 0xf0, 0x00
    .byte   0x00, 0x19, 0x00, 0x6f, 0x80, 0x00
    .byte   0x00, 0x19, 0x00, 0x4c, 0x00, 0x00
    .byte   0x00, 0x1d, 0x80, 0x4c, 0x00, 0x00
    .byte   0x00, 0x0c, 0x80, 0xcc, 0x00, 0x00
    .byte   0x00, 0x0c, 0xc0, 0x98, 0x00, 0x00
    .byte   0x00, 0x06, 0x40, 0x98, 0x00, 0x00
    .byte   0x00, 0x06, 0x60, 0x98, 0x00, 0x00
    .byte   0x00, 0x03, 0x21, 0x90, 0x00, 0x00
    .byte   0x00, 0x03, 0x21, 0x30, 0x00, 0x00
    .byte   0x00, 0x03, 0x31, 0x30, 0x00, 0x00
    .byte   0x00, 0x01, 0x91, 0x30, 0x00, 0x00
    .byte   0x00, 0x01, 0x9b, 0x60, 0x00, 0x00
    .byte   0x00, 0x00, 0xce, 0x60, 0x00, 0x00
    .byte   0x00, 0x00, 0xc0, 0xe0, 0x00, 0x00
    .byte   0x00, 0x00, 0x71, 0xc0, 0x00, 0x00
    .byte   0x00, 0x00, 0x3f, 0x80, 0x00, 0x00
    .byte   0x00, 0x00, 0x1e, 0x00, 0x00, 0x00
    .byte   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte   0x00, 0x00, 0x00, 0x00, 0x00, 0x00



















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

.balign 4
icon_power:
    .byte   2, 16, 5, 1, 88, 80, 3, 57, 109, 70, 149, 3
    .byte   86, 187, 128, 189, 3, 170, 187, 186, 149, 3, 199, 109
    .byte   168, 80, 2, 1, 128, 64, 2, 128, 128
icon_home:
    .byte   3, 16, 5, 1, 72, 128, 2, 56, 128, 2, 128, 56
    .byte   2, 200, 128, 2, 184, 128, 6, 1, 72, 128, 2, 72
    .byte   184, 3, 73, 199, 88, 200, 2, 168, 200, 3, 183, 199
    .byte   184, 184, 2, 184, 128, 6, 1, 104, 200, 2, 104, 152
    .byte   3, 105, 137, 120, 136, 2, 136, 136, 3, 151, 137, 152
    .byte   152, 2, 152, 200

icon_folder:
    .byte   1, 16, 11, 1, 72, 64, 2, 104, 64, 2, 128, 88
    .byte   2, 184, 88, 3, 199, 89, 200, 104, 2, 200, 168, 3
    .byte   199, 183, 184, 184, 2, 72, 184, 3, 57, 183, 56, 168
    .byte   2, 56, 80, 3, 57, 65, 72, 64

icon_settings:
    .byte   2, 16, 33, 1, 115, 67, 3, 118, 56, 128, 56, 3
    .byte   138, 56, 141, 67, 3, 143, 73, 150, 76, 3, 156, 79
    .byte   162, 75, 3, 172, 70, 179, 77, 3, 186, 84, 181, 94
    .byte   3, 177, 100, 180, 106, 3, 183, 113, 189, 115, 3, 200
    .byte   118, 200, 128, 3, 200, 138, 189, 141, 3, 183, 143, 180
    .byte   150, 3, 177, 156, 181, 162, 3, 186, 172, 179, 179, 3
    .byte   172, 186, 162, 181, 3, 156, 177, 150, 180, 3, 143, 183
    .byte   141, 189, 3, 138, 200, 128, 200, 3, 118, 200, 115, 189
    .byte   3, 113, 183, 106, 180, 3, 100, 177, 94, 181, 3, 84
    .byte   186, 77, 179, 3, 70, 172, 75, 162, 3, 79, 156, 76
    .byte   150, 3, 73, 143, 67, 141, 3, 56, 138, 56, 128, 3
    .byte   56, 118, 67, 115, 3, 73, 113, 76, 106, 3, 79, 100
    .byte   75, 94, 3, 70, 84, 77, 77, 3, 84, 70, 94, 75
    .byte   3, 100, 79, 106, 76, 3, 113, 73, 115, 67, 5, 1
    .byte   104, 128, 3, 106, 150, 128, 152, 3, 150, 150, 152, 128
    .byte   3, 150, 106, 128, 104, 3, 106, 106, 104, 128

icon_trash:
    .byte   5, 16, 2, 1, 64, 88, 2, 192, 88, 2, 1, 112
    .byte   120, 2, 112, 168, 2, 1, 144, 120, 2, 144, 168, 6
    .byte   1, 72, 88, 2, 80, 184, 3, 81, 199, 96, 200, 2
    .byte   160, 200, 3, 175, 199, 176, 184, 2, 184, 88, 6, 1
    .byte   104, 88, 2, 104, 64, 3, 105, 57, 112, 56, 2, 144
    .byte   56, 3, 151, 57, 152, 64, 2, 152, 88

.balign 8
vg_dot_tab:
    .word   65536, 0
    .word   46341, -46341
    .word   0, -65536
    .word   -46341, -46341
    .word   -65536, 0
    .word   -46341, 46341
    .word   0, 65536
    .word   46341, 46341


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

.balign 4
fb_fade:
    .space  4

.balign 4
fb_fade_dirty:
    .space  4

.balign 4
fb_clip:
    .space  CLIP_SIZE

.balign 8
dec_buffer:
    .space  DEC_BUFFER_SIZE

.balign 8
fb_pixel_count:
    .space  8

.balign 8
win_swap:
    .space  WIN_SIZE

.balign 4
win_drag_index:
    .space  4

.balign 4
win_drag_dx:
    .space  4

.balign 4
win_drag_dy:
    .space  4

.balign 8
win_count:
    .space  4

.balign 8
win_list:
    .space  (WIN_SIZE * WIN_MAX)

.balign 8
dirty_count:
    .space  4
dirty_flag_all:
    .space  1

.balign 8
dirty_list:
    .space  (DIRTY_SIZE * DIRTY_MAX)

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
vg_emit:
    .space  8

.balign 16
anim_list:
    .space  (ANIM_ENTRY_SIZE * ANIM_MAX)

.balign 4
anim_active:
    .space  4

.balign 4
anim_gen_next:
    .space  4

.balign 4
anim_pending:
    .space  4

.balign 4
vg_half:
    .space  4

.balign 4
vg_cur_x:
    .space  4

.balign 4
vg_cur_y:
    .space  4




.balign 8
pmm_bitmap:
    .space  PMM_BITMAP_SIZE

.balign 4096
mmu_nc_end:
    .space  8

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

.balign 16
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

.balign 8
font_state:
    .space  FONT_STATE_SIZE

.balign 8
font_buffer:
    .space  FONT_MAX_SIZE

.balign 8
glyph_state:
    .space  GLYPH_STATE_SIZE
glyph_ends:
    .space  (GLYPH_MAX_CONTOURS * 2)
glyph_flags:
    .space  GLYPH_MAX_POINTS
glyph_x:
    .space  (GLYPH_MAX_POINTS * 2)
glyph_y:
    .space  (GLYPH_MAX_POINTS * 2)

.balign 8
vg_scale:
    .space  4
vg_org_x:
    .space  4
vg_org_y:
    .space  4

.balign 8
vg_edge_count:
    .space  4
font_limit_flag:
    .space  1

.balign 8
vg_edge_list:
    .space  (VG_EDGE_SIZE * VG_EDGE_MAX)

.balign 8
vg_xs_list:
    .space  (VG_XS_SIZE * VG_XS_MAX)

.balign 8
vg_cov_xmin:
    .space  4

.balign 8
vg_cov_buffer:
    .space  (VG_COV_MAX * 4)

.balign 512
fat_buffer:
    .space  BLK_SECTOR_SIZE

.balign 4
virtio_input_intid:
    .space  4
virtio_last_used:
    .space  2

.balign 4
mouse_abs_max_x:
    .space  4
mouse_abs_max_y:
    .space  4
mouse_x:
    .space  4
mouse_y:
    .space  4
mouse_buttons:
    .space  1
mouse_dirty:
    .space  1
click_x:
    .space  4

click_y:
    .space  4

click_pending:
    .space  1

.balign 4
timer_blink_count:
    .space  4

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

.balign 64
fb_render:
    .space  FB_SIZE

.balign BLOCK_SIZE
fb_output:
    .space  OUT_SIZE
