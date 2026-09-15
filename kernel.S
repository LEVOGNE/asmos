.arch armv8-a+crypto

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
.equ CPTR_EL2_TFP,          (1 << 10)
.equ CPACR_EL1_FPEN,        (3 << 20)

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
.equ GICD_PIDR2,            0xffe8
.equ GICD_IGROUPR,          0x080
.equ GICD_IROUTER,          0x6000
.equ GICD_CTLR_ARE,         (1 << 4)
.equ GICD_CTLR_EN_GRP1,     (1 << 1)
.equ GICR_BASE,             0x080a0000
.equ GICR_SGI_BASE,         (GICR_BASE + 0x10000)
.equ GICR_WAKER,            0x014
.equ GICR_WAKER_SLEEP,      (1 << 1)
.equ GICR_WAKER_ASLEEP,     (1 << 2)
.equ GICR_IGROUPR0,         0x080
.equ GICR_ISENABLER0,       0x100
.equ GICR_IPRIORITYR,       0x400
.equ GIC_VERSION_3,         3

.equ TIMER_INTID,           27
.equ TIMER_CTL_ENABLE,      1
.equ TIMER_HZ,              30
.equ BLINK_HZ,              2
.equ BLINK_DIVIDER,         (TIMER_HZ / BLINK_HZ)
.equ CLICK_WINDOW_MS,       400
.equ MS_PER_SECOND,         1000
.equ CLICK_MAX,             3
.equ CLICK_X,               0
.equ CLICK_Y,               4
.equ CLICK_PENDING,         8
.equ CLICK_RECORD_SIZE,     12

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
.equ VIRTIO_REG_CONFIG_GEN,     0x0fc
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

.equ VIRTIO_VERSION_MODERN,     2
.equ VIRTIO_QUEUE_SIZE,         8
.equ VIRTIO_QUEUE_MASK,         7
.equ VIRTIO_EVENT_SIZE,         8

.equ VIRTIO_ID_INPUT,       18
.equ VIRTIO_ID_BLOCK,       2
.equ VIRTIO_ID_NET,         1
.equ VIRTIO_NET_F_MAC,      (1 << 5)
.equ NET_HDR_SIZE,          12
.equ NET_QUEUE_SIZE,        8
.equ NET_QUEUE_MASK,        7
.equ NET_BUF_SIZE,          2048
.equ NET_QUEUE_RX,          0
.equ NET_QUEUE_TX,          1
.equ NET_TIMEOUT,           0x1000000
.equ STACK_GUARD,           0x4b43415453534f4d
.equ ETH_DST,               0
.equ ETH_SRC,               6
.equ ETH_TYPE,              12
.equ ETH_HDR_SIZE,          14
.equ ETH_TYPE_IP,           0x0800
.equ ETH_TYPE_ARP,          0x0806
.equ ARP_HTYPE,             0
.equ ARP_PTYPE,             2
.equ ARP_HLEN,              4
.equ ARP_PLEN,              5
.equ ARP_OPER,              6
.equ ARP_SHA,               8
.equ ARP_SPA,               14
.equ ARP_THA,               18
.equ ARP_TPA,               24
.equ ARP_SIZE,              28
.equ ARP_OP_REQUEST,        1
.equ ARP_OP_REPLY,          2
.equ IP_VER_IHL,            0
.equ IP_TOTAL_LEN,          2
.equ IP_ID,                 4
.equ IP_FLAGS,              6
.equ IP_TTL,                8
.equ IP_PROTO,              9
.equ IP_CHECKSUM,           10
.equ IP_FRAGMENT_MASK,      0x3fff
.equ IP_SRC,                12
.equ IP_DST,                16
.equ IP_HDR_SIZE,           20
.equ IP_VERSION_4,          0x45
.equ IP_TTL_DEFAULT,        64
.equ IP_PROTO_ICMP,         1
.equ ICMP_TYPE,             0
.equ ICMP_CODE,             1
.equ ICMP_CHECKSUM,         2
.equ ICMP_ID,               4
.equ ICMP_SEQ,              6
.equ ICMP_HDR_SIZE,         8
.equ ICMP_ECHO_REPLY,       0
.equ ICMP_ECHO_REQUEST,     8
.equ ICMP_PAYLOAD,          32
.equ ICMP_ECHO_ID,          0x0a5b
.equ NET_IP_BROADCAST,      0xffffffff
.equ IP_PROTO_UDP,          17
.equ IP_IHL_MASK,           0x0f
.equ UDP_SRC,               0
.equ UDP_DST,               2
.equ UDP_LEN,               4
.equ UDP_CHECKSUM,          6
.equ UDP_HDR_SIZE,          8
.equ UDP_PORT_DHCP_SERVER,  67
.equ UDP_PORT_DHCP_CLIENT,  68
.equ DHCP_OP,               0
.equ DHCP_HTYPE,            1
.equ DHCP_HLEN,             2
.equ DHCP_XID,              4
.equ DHCP_FLAGS,            10
.equ DHCP_YIADDR,           16
.equ DHCP_CHADDR,           28
.equ DHCP_COOKIE,           236
.equ DHCP_OPTIONS,          240
.equ DHCP_MIN_SIZE,         300
.equ DHCP_BOOTREQUEST,      1
.equ DHCP_BOOTREPLY,        2
.equ DHCP_FLAG_BROADCAST,   0x8000
.equ DHCP_MAGIC,            0x63825363
.equ DHCP_OPT_SUBNET,       1
.equ DHCP_OPT_ROUTER,       3
.equ DHCP_OPT_DNS,          6
.equ DHCP_OPT_REQ_IP,       50
.equ DHCP_OPT_LEASE,        51
.equ DHCP_CIADDR,           12
.equ DHCP_NAK,              6
.equ DHCP_OPT_MSG_TYPE,     53
.equ DHCP_OPT_SERVER_ID,    54
.equ DHCP_OPT_PARAM_LIST,   55
.equ DHCP_OPT_END,          255
.equ DHCP_DISCOVER,         1
.equ DHCP_OFFER,            2
.equ DHCP_REQUEST,          3
.equ DHCP_ACK,              5
.equ DHCP_STATE_NONE,       0
.equ DHCP_STATE_DISCOVER,   1
.equ DHCP_STATE_REQUEST,    2
.equ DHCP_STATE_BOUND,      3
.equ DHCP_RETRY_TICKS,      60
.equ DHCP_RETRY_MAX,        5
.equ UDP_PORT_DNS,          53
.equ UDP_PORT_DNS_LOCAL,    4321
.equ DNS_ID,                0
.equ DNS_FLAGS,             2
.equ DNS_QDCOUNT,           4
.equ DNS_ANCOUNT,           6
.equ DNS_HDR_SIZE,          12
.equ DNS_FLAG_RD,           0x0100
.equ DNS_FLAG_QR,           0x8000
.equ DNS_RCODE_MASK,        0x000f
.equ DNS_TYPE_A,            1
.equ DNS_TYPE_CNAME,        5
.equ DNS_CLASS_IN,          1
.equ DNS_NAME_HOPS,         16
.equ DNS_NAME_MAX,          64
.equ DNS_RETRY_TICKS,       90
.equ DNS_RETRY_MAX,         3
.equ DNS_STATE_NONE,        0
.equ DNS_STATE_SENT,        1
.equ DNS_STATE_DONE,        2
.equ IP_PROTO_TCP,          6
.equ TCP_SRC,               0
.equ TCP_DST,               2
.equ TCP_SEQ,               4
.equ TCP_ACK,               8
.equ TCP_OFFSET_FLAGS,      12
.equ TCP_WINDOW,            14
.equ TCP_CHECKSUM,          16
.equ TCP_URGENT,            18
.equ TCP_HDR_SIZE,          20
.equ TCP_HDR_SYN_SIZE,      24
.equ TCP_FLAG_FIN,          1
.equ TCP_FLAG_SYN,          2
.equ TCP_FLAG_RST,          4
.equ TCP_FLAG_PSH,          8
.equ TCP_FLAG_ACK,          16
.equ TCP_FLAG_MASK,         0x3f
.equ TCP_OPT_MSS,           2
.equ TCP_MSS,               1460
.equ TCP_WINDOW_SIZE,       4096
.equ TCP_LOCAL_PORT_BASE,   49152
.equ TCP_PORT_MASK,         0x3fff
.equ NET_RAND_SEED,         0x9e3779b97f4a7c15
.equ TCP_STATE_CLOSED,      0
.equ TCP_STATE_SYN_SENT,    1
.equ TCP_STATE_ESTABLISHED, 2
.equ TCP_STATE_LAST_ACK,    3
.equ TCP_STATE_FIN_WAIT_1,  4
.equ TCP_STATE_FIN_WAIT_2,  5
.equ TCP_STATE_CLOSE_WAIT,  6
.equ TCP_MAX,               4
.equ TCP_TX_BUF_SIZE,       1024
.equ TCB_STATE,             0
.equ TCB_TRIES,             1
.equ TCB_SEEN,              2
.equ TCB_CLOSING,           3
.equ TCB_LOCAL_PORT,        4
.equ TCB_REMOTE_IP,         8
.equ TCB_REMOTE_PORT,       12
.equ TCB_ISS,               16
.equ TCB_SND_NXT,           20
.equ TCB_SND_UNA,           24
.equ TCB_RCV_NXT,           28
.equ TCB_TIMER,             32
.equ TCB_TX_LEN,            36
.equ TCB_HANDLER,           40
.equ TCB_TX_BUF,            48
.equ TCB_SIZE,              (TCB_TX_BUF + TCP_TX_BUF_SIZE)
.equ TCP_RETRY_TICKS,       45
.equ TCP_RETRY_MAX,         4
.equ TCP_LINE_MAX,          96
.equ HTTP_PORT,             80
.equ HTTPS_PORT,            443
.equ TLS_REC_HANDSHAKE,     22
.equ TLS_REC_CCS,           20
.equ TLS_REC_ALERT,         21
.equ TLS_REC_APPDATA,       23
.equ TLS_ALERT_USER_CANCELED, 90
.equ TLS_HS_CLIENT_HELLO,   1
.equ TLS_HS_SERVER_HELLO,   2
.equ TLS_HS_TICKET,         4
.equ TLS_HS_ENCRYPTED_EXT,  8
.equ TLS_HS_CERTIFICATE,    11
.equ TLS_HS_CERT_VERIFY,    15
.equ TLS_HS_FINISHED,       20
.equ TLS_EXT_SERVER_NAME,   0x0000
.equ TLS_EXT_GROUPS,        0x000a
.equ TLS_EXT_SIG_ALGS,      0x000d
.equ TLS_EXT_VERSIONS,      0x002b
.equ TLS_EXT_KEY_SHARE,     0x0033
.equ TLS_GROUP_X25519,      0x001d
.equ TLS_SUITE_AES128_SHA256, 0x1301
.equ TLS_VERSION_12,        0x0303
.equ TLS_VERSION_13,        0x0304
.equ TLS_REC_MAX,           (16384 + 256)
.equ TLS_RX_SIZE,           (TLS_REC_MAX + 5)
.equ TLS_HS_SIZE,           16384
.equ TLS_OUT_SIZE,          512
.equ TLSP_HOST,             0
.equ TLSP_REQ,              16
.equ TLSP_APP,              32
.equ TLSP_SIZE,             40
.equ TLS_SNI_HDR,           9
.equ TERM_WRAP,             (TERM_COLS - 1)
.equ CURL_HOST_MAX,         63
.equ CURL_PATH_MAX,         200
.equ CURL_REQ_MAX,          384
.equ CURL_MAX_LINES,        200
.equ TLS_STATE_IDLE,        0
.equ TLS_STATE_HELLO_SENT,  1
.equ TLS_STATE_HANDSHAKE,   2
.equ TLS_STATE_CONNECTED,   3
.equ TLS_STATE_CLOSED,      4
.equ TLS_TCB,               0
.equ TLS_STATE,             8
.equ TLS_SEEN,              9
.equ TLS_HS_SEEN,           11
.equ DNS_QUESTION_MAX,      72
.equ TLS_PRIV,              16
.equ TLS_PUB,               48
.equ TLS_RANDOM,            80
.equ TLS_SERVER_PUB,        112
.equ TLS_SHARED,            144
.equ TLS_HS_SECRET,         176
.equ TLS_C_HS,              208
.equ TLS_S_HS,              240
.equ TLS_MASTER,            272
.equ TLS_C_AP,              304
.equ TLS_S_AP,              336
.equ TLS_WKEY,              368
.equ TLS_WIV,               384
.equ TLS_RKEY,              400
.equ TLS_RIV,               416
.equ TLS_WSEQ,              432
.equ TLS_RSEQ,              440
.equ TLS_TRANSCRIPT,        448
.equ TLS_HASH,              560
.equ TLS_TMP,               592
.equ TLS_NONCE,             656
.equ TLS_RX_LEN,            672
.equ TLS_HS_LEN,            676
.equ TLS_AES_R,             688
.equ TLS_AES_W,             880
.equ TLS_FINKEY,            1072
.equ TLS_SERVER_Q,          1104
.equ TLS_CTX_SIZE,          1168
.equ TLS_CERT_SIZE,         8192
.equ TLS_SIG_ECDSA_P256,    0x0403
.equ MP_K,                  0
.equ MP_M,                  8
.equ MP_MINV,               16
.equ MP_R2,                 24
.equ MP_ONE,                32
.equ MP_CTX_SIZE,           40
.equ MP_WORD_MAX,           6
.equ MP_BYTES_MAX,          48
.equ EC_SLOT,               48
.equ EC_X,                  0
.equ EC_Y,                  48
.equ EC_Z,                  96
.equ EC_POINT_SIZE,         144
.equ EC_PCTX,               0
.equ EC_NCTX,               8
.equ EC_B,                  16
.equ EC_G,                  24
.equ EC_BYTES,              32
.equ EC_SIZE,               40
.equ SHA512_CTX_STATE,      0
.equ SHA512_CTX_BUF,        64
.equ SHA512_CTX_COUNT,      192
.equ SHA512_CTX_FILL,       200
.equ SHA512_CTX_SIZE,       208
.equ SHA512_BLOCK_SIZE,     128
.equ SHA384_DIGEST_SIZE,    48
.equ ASN1_SEQUENCE,         0x30
.equ ASN1_INTEGER,          0x02
.equ ASN1_BIT_STRING,       0x03
.equ ASN1_OID,              0x06
.equ ASN1_CONTEXT_0,        0xa0
.equ X509_TBS,              0
.equ X509_TBS_LEN,          8
.equ X509_KEY,              16
.equ X509_SIG,              24
.equ X509_SIG_LEN,          32
.equ X509_KEY_CURVE,        40
.equ X509_SIG_HASH,         48
.equ X509_ISSUER,           56
.equ X509_ISSUER_LEN,       64
.equ X509_SUBJECT,          72
.equ X509_SUBJECT_LEN,      80
.equ X509_EXT,              88
.equ X509_EXT_LEN,          96
.equ X509_NOT_BEFORE,       104
.equ X509_NOT_AFTER,        112
.equ X509_FLAGS,            120
.equ X509_PATHLEN,          124
.equ X509_SIGALG,           128
.equ X509_SIGALG_LEN,       136
.equ X509_INFO_SIZE,        144
.equ X509_F_CA,             1
.equ X509_F_PATHLEN,        2
.equ X509_F_KU,             4
.equ X509_F_CERTSIGN,       8
.equ X509_F_EKU,            16
.equ X509_F_SERVERAUTH,     32
.equ X509_F_DIGSIG,         64
.equ VIRTIO_ID_RNG,         4
.equ RNG_QUEUE_SIZE,        8
.equ RNG_BUF_SIZE,          64
.equ ASN1_UTC_TIME,         0x17
.equ ASN1_GENERAL_TIME,     0x18
.equ RTC_DR,                0x00
.equ TIME_VECTOR_SIZE,      56
.equ TIME_VECTORS,          6
.equ X509_CURVE_P256,       0
.equ X509_CURVE_P384,       1
.equ X509_HASH_SHA256,      0
.equ X509_HASH_SHA384,      1
.equ ASN1_BOOLEAN,          0x01
.equ ASN1_OCTET_STRING,     0x04
.equ ASN1_CONTEXT_3,        0xa3
.equ ASN1_DNS_NAME,         0x82
.equ TLS_CHAIN_MAX,         4
.equ TLS_ROOT_SIZE,         2048
.equ NET_STATE_IDLE,        0
.equ NET_STATE_ARP_SENT,    1
.equ NET_STATE_ARP_OK,      2
.equ NET_STATE_PING_SENT,   3
.equ NET_STATE_PING_OK,     4

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
.equ BPB_TOTAL16,           0x13
.equ BPB_TOTAL32,           0x20
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
.equ FONT_LENGTHS,          88
.equ FONT_CMAP4_END,        120
.equ FONT_STATE_SIZE,       128

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
.equ FAT_CLUSTER_END,       24
.equ FAT_TOTAL_SECTORS,      28
.equ FAT_STATE_SIZE,        32

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
.equ FB_BPP,                4
.equ FB_STRIDE,             (FB_WIDTH * FB_BPP)
.equ FB_SIZE,               (FB_STRIDE * FB_HEIGHT)
.equ OUT_BPP,               4
.equ OUT_STRIDE,            (FB_WIDTH * OUT_BPP)
.equ OUT_SIZE,              (OUT_STRIDE * FB_HEIGHT)
.equ OUT_BLOCKS,            ((OUT_SIZE + BLOCK_SIZE - 1) / BLOCK_SIZE)
.equ CH_SHIFT_B,            0
.equ CH_SHIFT_G,            8
.equ CH_SHIFT_R,            16
.equ CH_SHIFT_A,            24
.equ CH_MAX,                0xff
.equ CH_ROUND,              0x80
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
.equ CURSOR_STATE_PENDING,  17
.equ CURSOR_STATE_PREV_X,   20
.equ CURSOR_STATE_PREV_Y,   24
.equ CURSOR_STATE_PREV_W,   28
.equ CURSOR_STATE_PREV_H,   32
.equ CURSOR_STATE_SIZE,     36


.equ CURSOR_W,              48
.equ CURSOR_H,              48
.equ CURSOR_ALPHA_PRESSED,  59638
.equ CURSOR_PRESSED_PCT,    96
.equ CURSOR_PRESSED_OFFSET, ((CURSOR_W - (CURSOR_W * CURSOR_PRESSED_PCT) / 100) / 2)
.equ ALPHA_MAX,             0xffff
.equ CURSOR_STRIDE,         (CURSOR_W * FB_BPP)
.equ CURSOR_BACKING_SIZE,   (CURSOR_W * CURSOR_H * FB_BPP)
.equ CURSOR_SPRITE_SIZE,    CURSOR_BACKING_SIZE

.equ FB_TARGET_BASE,        0
.equ FB_TARGET_STRIDE,      8
.equ FB_TARGET_SIZE,        16

.equ WIN_X,                 0
.equ WIN_Y,                 4
.equ WIN_W,                 8
.equ WIN_H,                 12
.equ WIN_TITLE,             16
.equ WIN_TX,                24
.equ WIN_TY,                32
.equ WIN_FOCUS,             40
.equ WIN_ALPHA,             48
.equ WIN_CLASS,             56
.equ WIN_BUF,               64
.equ WIN_BUF_DIRTY,         72
.equ WIN_BUF_TITLE,         73
.equ WIN_ID,                76
.equ WIN_H_FULL,            80
.equ WIN_FLAGS,             84
.equ WIN_SIZE,              96
.equ WIN_BUF_BUDGET,        (16 * 1024 * 1024)
.equ WIN_FLAG_SHADED,       1
.equ WIN_BTN_NONE,          0
.equ WIN_BTN_CLOSE,         1
.equ WIN_BTN_SHADE,         2
.equ WIN_BTN_PAD,           8

.equ CLS_PARENT,            0
.equ CLS_DRAW,              8
.equ CLS_KEY,               16
.equ CLS_FOCUS,             24
.equ CLS_DIRTY,             32
.equ CLS_CLOSE,             40
.equ CLS_SIZE,              48
.equ TERM_ROWS,             24
.equ TERM_COLS,             96
.equ TERM_STRIDE,           100
.equ TERM_PROMPT_LEN,       7
.equ NETLOG_ROWS,           24
.equ NETLOG_ASCENT,         30
.equ NETLOG_BAND_Y,         (WIN_BORDER + WIN_TITLEBAR_H + FILES_PAD_Y - NETLOG_ASCENT)
.equ GUI_LINE_MAX,          96
.equ KEY_RING_SIZE,         32
.equ KEY_RING_MASK,         31
.equ KEY_CODE_MAX,          58
.equ KEY_LEFTSHIFT,         42
.equ KEY_RIGHTSHIFT,        54
.equ ASCII_DEL,             0x7f
.equ VIN_CFG_EV_BITS,       0x11
.equ VIN_BASE,              0
.equ VIN_INTID,             8
.equ VIN_LAST,              12
.equ VIN_KIND,              14
.equ VIN_DESC,              16
.equ VIN_AVAIL,             144
.equ VIN_USED,              168
.equ VIN_EVENTS,            240
.equ VIN_SIZE,              304
.equ VIN_KIND_NONE,         0
.equ VIN_KIND_TABLET,       1
.equ VIN_KIND_KEYBOARD,     2

.equ FILES_MAX,             24
.equ FILES_NAME,            0
.equ FILES_SIZE,            16
.equ FILES_ATTR,            20
.equ FILES_ENTRY,           24
.equ FILES_PAD_X,           20
.equ FILES_PAD_Y,           42
.equ FILES_LINE_H,          38
.equ FILES_TEXT_SIZE,       26
.equ WIN_FADE_MS,           260
.equ WIN_DRAG_MS,           90
.equ WIN_KEEP_VISIBLE,      120
.equ WIN_FOCUS_MS,          180
.equ ANIM_PROP_TX,          0
.equ ANIM_PROP_TY,          1
.equ ANIM_PROP_FOCUS,       2
.equ ANIM_PROP_SCREEN,      3
.equ ANIM_PROP_ALPHA,       4
.equ ANIM_PROP_H,           5
.equ FADE_ONE,              0x10000
.equ SCREEN_FADE_MS,        450
.equ ANIM_PROP_COUNT,       6
.equ WIN_SHADE_MS,          160
.equ WIN_CLOSE_MS,          180
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

.equ COLOR_WIN_BORDER,      0xff202830
.equ COLOR_WIN_TITLE,       0xff384858
.equ COLOR_WIN_TITLE_ACT,   0xff206090
.equ COLOR_WIN_BODY,        0xffc8ccd0
.equ COLOR_WIN_TEXT,        0xffffffff
.equ COLOR_FILES_TEXT,      0xff1c2428

.equ COLOR_CURSOR,          0xffffffff
.equ COLOR_CURSOR_DARK,     0xff000000
.equ COLOR_BACKGROUND,      0xff102030
.equ COLOR_RED,             0xffff0000
.equ COLOR_GREEN,           0xff00ff00
.equ COLOR_BLUE,            0xff0000ff

.equ ANIM_MAX,              64
.equ ANIM_ENTRY_SIZE,       88
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
.equ ANIM_DONE,             80
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
.equ CURSOR_SCALE,          ((CURSOR_W << FIX_SHIFT) / (ICON_UNITS * ICON_SUBDIV))
.equ CURSOR_SCALE_PRESSED,  ((CURSOR_SCALE * CURSOR_PRESSED_PCT) / 100)
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
.equ COLOR_POWER,           0xffd82020
.equ COLOR_POWER_SYMBOL,    0xffffffff
.equ PSCI_SYSTEM_OFF,       0x84000008

.equ DAIF_I,                2

.equ IRQ_FRAME_SIZE,        160

.equ BOOT_SELFTEST,         0
.equ SHA_CTX_STATE,         0
.equ SHA_CTX_BUF,           32
.equ SHA_CTX_COUNT,         96
.equ SHA_CTX_FILL,          104
.equ SHA_CTX_SIZE,          112
.equ SHA_BLOCK_SIZE,        64
.equ SHA_DIGEST_SIZE,       32
.equ SHA_TEST_CHUNK,        1000
.equ HMAC_CTX_OPAD,         112
.equ HMAC_CTX_SIZE,         176
.equ HMAC_IPAD,             0x36
.equ HMAC_OPAD,             0x5c
.equ HKDF_MAX_OKM,          (255 * SHA_DIGEST_SIZE)
.equ HKDF_FRAME_CTX,        64
.equ HKDF_FRAME_T,          240
.equ HKDF_FRAME_COUNT,      272
.equ HKDF_FRAME_SIZE,       288
.equ AES_BLOCK_SIZE,        16
.equ AES_KEY_SIZE,          16
.equ AES_ROUND_KEYS,        176
.equ AES_CTX_H,             176
.equ AES_CTX_SIZE,          192
.equ GCM_IV_SIZE,           12
.equ GCM_TAG_SIZE,          16
.equ GCM_POLY_R,            0x87
.equ GCM_FRAME_J0,          96
.equ GCM_FRAME_TMP,         112
.equ GCM_FRAME_LEN,         128
.equ GCM_FRAME_OUT,         136
.equ GCM_FRAME_SIZE,        144
.equ AES_TEST_MAX,          64
.equ FE_SIZE,               32
.equ FE_FOLD,               38
.equ X25519_A24,            121665
.equ X25519_FRAME_K,        64
.equ X25519_FRAME_X1,       96
.equ X25519_FRAME_X2,       128
.equ X25519_FRAME_Z2,       160
.equ X25519_FRAME_X3,       192
.equ X25519_FRAME_Z3,       224
.equ X25519_FRAME_A,        256
.equ X25519_FRAME_AA,       288
.equ X25519_FRAME_B,        320
.equ X25519_FRAME_BB,       352
.equ X25519_FRAME_E,        384
.equ X25519_FRAME_C,        416
.equ X25519_FRAME_D,        448
.equ X25519_FRAME_DA,       480
.equ X25519_FRAME_CB,       512
.equ X25519_FRAME_T,        544
.equ X25519_FRAME_SIZE,     576
.equ FE_INV_T0,             32
.equ FE_INV_T1,             64
.equ FE_INV_T2,             96
.equ FE_INV_T3,             128
.equ FE_INV_FRAME,          160
.equ PMM_SELFTEST,          0
.equ FS_SELFTEST,          0
.equ FS_SELFTEST_BIG,       0
.equ FONT_SELFTEST,          1
.equ TTF_TEST_SIZE,         90
.equ TTF_TEST_X,            250
.equ TTF_TEST_Y,            420
.equ TTF_TEST_ADVANCE,      52

.macro ladr_far reg, sym
    adrp    \reg, \sym
    add     \reg, \reg, :lo12:\sym
.endm

.macro ladr reg, sym
.ifc \sym,fb_output
    ladr_far \reg, \sym
.else
.ifc \sym,__bss_end
    ladr_far \reg, \sym
.else
.ifc \sym,__image_end
    ladr_far \reg, \sym
.else
.ifc \sym,win_buf_arena
    ladr_far \reg, \sym
.else
    adr     \reg, \sym
.endif
.endif
.endif
.endif
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
    mrs     x0, cptr_el2
    bic     x0, x0, #CPTR_EL2_TFP
    msr     cptr_el2, x0
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
    mrs     x0, cpacr_el1
    orr     x0, x0, #CPACR_EL1_FPEN
    msr     cpacr_el1, x0
    isb
    bl      uart_init
    bl      vec_init
    mov     x0, x21
    bl      fdt_find_memory
    mov     x2, #RAM_BASE_FIXED
    cmp     x0, x2
    b.ne    boot_memory_fail
    adds    x22, x0, x1
    b.cs    boot_memory_fail
    ladr    x2, __image_end
    cmp     x22, x2
    b.lo    boot_memory_fail
    ladr    x3, __bss_start
    ldr     w4, [x21, #4]
    rev     w4, w4
    add     x5, x21, x4
    cmp     x5, x3
    b.ls    boot_memory_ready
    cmp     x21, x2
    b.hs    boot_memory_ready
    sub     x22, x22, x4
    bic     x22, x22, #7
    cmp     x22, x2
    b.lo    boot_memory_fail
    mov     x0, x21
    mov     x1, x22
    mov     w2, w4
    bl      mem_copy
    mov     x21, x22
boot_memory_ready:
    bl      boot_clear_bss
    ladr    x0, fdt_base
    str     x21, [x0]
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
    bl      rtc_init
    bl      tls_root_init
    bl      files_scan
    ladr    x0, fb_fade
    str     wzr, [x0]
    bl      win_demo
.if WIN_SELFTEST
    bl      win_selftest
.endif
    bl      cursor_render
    bl      cursor_show
    bl      cursor_present
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
    bl      gic_put_version
    msr     daifclr, #DAIF_I
    bl      net_init
    bl      crypto_selftest
    bl      desktop_start

.if BOOT_SELFTEST
    brk     #0
.endif

    ladr    x0, boot_ok_msg
    bl      uart_puts
    b       console_run

boot_memory_fail:
    ladr    x0, mem_fail_msg
    bl      uart_puts
    b       boot_park

boot_clear_bss:
    ladr    x0, __bss_start
    ladr    x1, __bss_end

boot_clear_bss_loop:
    cmp     x0, x1
    b.hs    boot_clear_bss_done
    stp     xzr, xzr, [x0], #16
    b       boot_clear_bss_loop

boot_clear_bss_done:
    ladr_far x0, __fb_out_start
    ladr_far x1, __fb_out_end

boot_clear_out_loop:
    cmp     x0, x1
    b.hs    boot_clear_out_done
    stp     xzr, xzr, [x0], #16
    b       boot_clear_out_loop

boot_clear_out_done:
    ret

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
    dmb     sy
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

.section .text

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

fb_target_screen:
    ladr    x0, fb_render
    mov     x1, #FB_STRIDE

fb_target_set:
    ladr    x9, fb_target
    str     x0, [x9, #FB_TARGET_BASE]
    str     x1, [x9, #FB_TARGET_STRIDE]
    ret

fb_init:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    bl      fb_target_screen
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
    stp     x29, x30, [sp, #-16]!
    bl      fb_rect_screen
    cbz     w2, fb_present_done
    mov     x8, #FB_STRIDE
    mov     x9, #OUT_STRIDE
    ladr    x6, fb_render
    madd    x6, x1, x8, x6
    add     x6, x6, x0, lsl #2
    ladr    x7, fb_output
    madd    x7, x1, x9, x7
    add     x7, x7, x0, lsl #2
    ladr    x10, fb_fade
    ldr     w10, [x10]
    dup     v6.8h, w10
fb_present_row:
    mov     x11, x6
    mov     x12, x7
    mov     w13, w2
    mov     w4, #FADE_ONE
    cmp     w10, w4
    b.ne    fb_present_fade4
fb_present_col16:
    cmp     w13, #16
    b.lo    fb_present_col
    ld1     {v0.2d, v1.2d, v2.2d, v3.2d}, [x11], #64
    st1     {v0.2d, v1.2d, v2.2d, v3.2d}, [x12], #64
    sub     w13, w13, #16
    b       fb_present_col16
fb_present_col:
    cbz     w13, fb_present_next
    ldr     w4, [x11], #FB_BPP
    str     w4, [x12], #OUT_BPP
    subs    w13, w13, #1
    b.ne    fb_present_col
    b       fb_present_next
fb_present_fade4:
    cmp     w13, #4
    b.lo    fb_present_col_fade
    ld1     {v0.16b}, [x11], #16
    ushll   v1.8h, v0.8b, #0
    ushll2  v2.8h, v0.16b, #0
    umull   v3.4s, v1.4h, v6.4h
    umull2  v1.4s, v1.8h, v6.8h
    umull   v4.4s, v2.4h, v6.4h
    umull2  v2.4s, v2.8h, v6.8h
    shrn    v3.4h, v3.4s, #16
    shrn2   v3.8h, v1.4s, #16
    shrn    v4.4h, v4.4s, #16
    shrn2   v4.8h, v2.4s, #16
    xtn     v3.8b, v3.8h
    xtn2    v3.16b, v4.8h
    st1     {v3.16b}, [x12], #16
    sub     w13, w13, #4
    b       fb_present_fade4
fb_present_col_fade:
    cbz     w13, fb_present_next
    ldr     w14, [x11], #FB_BPP
    ubfx    w4, w14, #0, #8
    mul     w4, w4, w10
    lsr     w4, w4, #16
    ubfx    w5, w14, #8, #8
    mul     w5, w5, w10
    lsr     w5, w5, #16
    orr     w4, w4, w5, lsl #8
    ubfx    w5, w14, #16, #8
    mul     w5, w5, w10
    lsr     w5, w5, #16
    orr     w4, w4, w5, lsl #16
    ubfx    w5, w14, #24, #8
    mul     w5, w5, w10
    lsr     w5, w5, #16
    orr     w4, w4, w5, lsl #24
    str     w4, [x12], #OUT_BPP
    subs    w13, w13, #1
    b.ne    fb_present_col_fade
fb_present_next:
    add     x6, x6, x8
    add     x7, x7, x9
    subs    w3, w3, #1
    b.ne    fb_present_row
fb_present_done:
    ldp     x29, x30, [sp], #16
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
    stp     x29, x30, [sp, #-16]!
    bl      fb_rect_screen
    ladr    x4, fb_clip
    add     w2, w0, w2
    add     w3, w1, w3
    stp     w0, w1, [x4]
    stp     w2, w3, [x4, #8]
    ldp     x29, x30, [sp], #16
    ret

fb_clip_intersect:
    ladr    x4, fb_clip
    ldr     x9, [x4]
    ldr     x10, [x4, #8]
    add     w2, w0, w2
    add     w3, w1, w3
    ldp     w5, w6, [x4]
    cmp     w0, w5
    csel    w0, w5, w0, lt
    cmp     w1, w6
    csel    w1, w6, w1, lt
    ldp     w5, w6, [x4, #8]
    cmp     w2, w5
    csel    w2, w5, w2, gt
    cmp     w3, w6
    csel    w3, w6, w3, gt
    cmp     w2, w0
    csel    w2, w0, w2, lt
    cmp     w3, w1
    csel    w3, w1, w3, lt
    stp     w0, w1, [x4]
    stp     w2, w3, [x4, #8]
    cmp     w2, w0
    cset    w5, gt
    cmp     w3, w1
    cset    w6, gt
    and     w5, w5, w6
    mov     x0, x9
    mov     x1, x10
    mov     w2, w5
    ret

fb_clip_restore:
    ladr    x4, fb_clip
    str     x0, [x4]
    str     x1, [x4, #8]
    ret

fb_rect_screen:
    mov     x10, #0
    mov     x11, #0
    mov     x12, #FB_WIDTH
    mov     x13, #FB_HEIGHT
fb_rect_clip:
    cmp     w2, #0
    b.le    fb_rect_empty
    cmp     w3, #0
    b.le    fb_rect_empty
    sxtw    x0, w0
    sxtw    x1, w1
    add     x2, x0, w2, sxtw
    add     x3, x1, w3, sxtw
    cmp     x0, x10
    csel    x0, x10, x0, lt
    cmp     x1, x11
    csel    x1, x11, x1, lt
    cmp     x2, x12
    csel    x2, x12, x2, gt
    cmp     x3, x13
    csel    x3, x13, x3, gt
    subs    x2, x2, x0
    b.le    fb_rect_empty
    subs    x3, x3, x1
    b.le    fb_rect_empty
    ret
fb_rect_empty:
    mov     x0, #0
    mov     x1, #0
    mov     x2, #0
    mov     x3, #0
    ret

fb_pixel_addr:
    ladr    x10, fb_target
    ldp     x10, x9, [x10]
    madd    x9, x1, x9, x10
    add     x0, x9, x0, lsl #2
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
    ldp     w10, w11, [x9]
    ldp     w12, w13, [x9, #8]
    bl      fb_rect_clip
    cbz     w2, fb_fill_rect_done
.if FB_COUNT_PIXELS
    ladr    x9, fb_pixel_count
    ldr     x10, [x9]
    umull   x11, w2, w3
    add     x10, x10, x11
    str     x10, [x9]
.endif
    bl      fb_pixel_addr
    mov     x5, x0
    dup     v0.4s, w4
    mov     v1.16b, v0.16b
    mov     v2.16b, v0.16b
    mov     v3.16b, v0.16b

fb_fill_rect_row:
    cbz     w3, fb_fill_rect_done
    mov     w6, w2
    mov     x7, x5
fb_fill_rect_col16:
    cmp     w6, #16
    b.lo    fb_fill_rect_rest
    st1     {v0.2d, v1.2d, v2.2d, v3.2d}, [x7], #64
    sub     w6, w6, #16
    b       fb_fill_rect_col16
fb_fill_rect_rest:
    cbz     w6, fb_fill_rect_next
    str     w4, [x7], #FB_BPP
    sub     w6, w6, #1
    b       fb_fill_rect_rest

fb_fill_rect_next:
    ladr    x6, fb_target
    ldr     x6, [x6, #FB_TARGET_STRIDE]
    add     x5, x5, x6
    sub     w3, w3, #1
    b       fb_fill_rect_row

fb_fill_rect_done:
    ldp     x29, x30, [sp], #16
    ret

fb_fill_around:
    stp     x29, x30, [sp, #-80]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    mov     x24, x4
    mov     w19, w0
    mov     w20, w1
    add     w21, w0, w2
    add     w22, w1, w3
    ldp     w0, w1, [x5]
    ldp     w2, w3, [x5, #8]
    add     w2, w0, w2
    add     w3, w1, w3
    cmp     w0, w19
    csel    w0, w19, w0, lt
    cmp     w1, w20
    csel    w1, w20, w1, lt
    cmp     w2, w21
    csel    w2, w21, w2, gt
    cmp     w3, w22
    csel    w3, w22, w3, gt
    cmp     w0, w2
    b.ge    fb_fill_around_all
    cmp     w1, w3
    b.ge    fb_fill_around_all
    stp     w0, w1, [sp, #64]
    stp     w2, w3, [sp, #72]
    mov     w0, w19
    mov     w1, w20
    sub     w2, w21, w19
    ldr     w3, [sp, #68]
    sub     w3, w3, w20
    mov     x4, x24
    bl      fb_fill_rect
    mov     w0, w19
    ldr     w1, [sp, #76]
    sub     w2, w21, w19
    sub     w3, w22, w1
    mov     x4, x24
    bl      fb_fill_rect
    mov     w0, w19
    ldr     w1, [sp, #68]
    ldr     w2, [sp, #64]
    sub     w2, w2, w19
    ldr     w3, [sp, #76]
    sub     w3, w3, w1
    mov     x4, x24
    bl      fb_fill_rect
    ldr     w0, [sp, #72]
    ldr     w1, [sp, #68]
    sub     w2, w21, w0
    ldr     w3, [sp, #76]
    sub     w3, w3, w1
    mov     x4, x24
    bl      fb_fill_rect
    b       fb_fill_around_done

fb_fill_around_all:
    mov     w0, w19
    mov     w1, w20
    sub     w2, w21, w19
    sub     w3, w22, w20
    mov     x4, x24
    bl      fb_fill_rect

fb_fill_around_done:
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #80
    ret

fb_copy:
fb_copy_row:
    cbz     w3, fb_copy_done
    mov     w6, w2
    mov     x7, x0
    mov     x8, x1

fb_copy_col16:
    cmp     w6, #16
    b.lo    fb_copy_col
    ld1     {v0.2d, v1.2d, v2.2d, v3.2d}, [x8], #64
    st1     {v0.2d, v1.2d, v2.2d, v3.2d}, [x7], #64
    sub     w6, w6, #16
    b       fb_copy_col16

fb_copy_col:
    cbz     w6, fb_copy_next
    ldr     w9, [x8], #FB_BPP
    str     w9, [x7], #FB_BPP
    sub     w6, w6, #1
    b       fb_copy_col

fb_copy_next:
    add     x0, x0, x4
    add     x1, x1, x5
    sub     w3, w3, #1
    b       fb_copy_row

fb_copy_done:
    ret

fb_rect_to_clip:
    ladr    x9, fb_clip
    ldp     w10, w11, [x9]
    ldp     w12, w13, [x9, #8]
    b       fb_rect_clip

fb_copy_rect:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x19, x2
    mov     x20, x3
    mov     w21, w0
    mov     w22, w1
    mov     w2, w4
    mov     w3, w5
    bl      fb_rect_to_clip
    cbz     w2, fb_copy_rect_done
    sub     w4, w0, w21
    sub     w5, w1, w22
    madd    x19, x5, x20, x19
    add     x19, x19, x4, lsl #2
    stp     x2, x3, [sp, #-16]!
    bl      fb_pixel_addr
    ldp     x2, x3, [sp], #16
    mov     x1, x19
    mov     x4, #FB_STRIDE
    mov     x5, x20
    bl      fb_copy

fb_copy_rect_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

fb_blend_rect:
    stp     x29, x30, [sp, #-96]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    stp     x27, x28, [sp, #80]
    mov     x19, x2
    mov     x20, x3
    mov     w21, w0
    mov     w22, w1
    mov     x25, x6
    mov     w2, w4
    mov     w3, w5
    bl      fb_rect_to_clip
    cbz     w2, fb_blend_rect_done
    sub     w4, w0, w21
    sub     w5, w1, w22
    madd    x19, x5, x20, x19
    add     x19, x19, x4, lsl #2
    mov     w21, w0
    mov     w22, w1
    mov     w23, w2
    mov     w24, w3

fb_blend_rect_row:
    cbz     w24, fb_blend_rect_done
    mov     w0, w21
    mov     w1, w22
    bl      fb_pixel_addr
    mov     x26, x0
    mov     x27, x19
    mov     w28, w23
    add     w0, w25, #CH_ROUND
    lsr     w0, w0, #8
    mov     w1, #CH_MAX
    cmp     w0, w1
    csel    w0, w1, w0, hi
    sub     w1, w1, w0
    dup     v6.16b, w0
    dup     v7.16b, w1

fb_blend_rect_col4:
    cmp     w28, #4
    b.lo    fb_blend_rect_col
    ld1     {v0.16b}, [x27], #16
    ld1     {v1.16b}, [x26]
    umull   v2.8h, v0.8b, v6.8b
    umull2  v3.8h, v0.16b, v6.16b
    umlal   v2.8h, v1.8b, v7.8b
    umlal2  v3.8h, v1.16b, v7.16b
    movi    v4.8h, #CH_ROUND
    add     v2.8h, v2.8h, v4.8h
    add     v3.8h, v3.8h, v4.8h
    usra    v2.8h, v2.8h, #8
    usra    v3.8h, v3.8h, #8
    shrn    v5.8b, v2.8h, #8
    shrn2   v5.16b, v3.8h, #8
    st1     {v5.16b}, [x26], #16
    sub     w28, w28, #4
    b       fb_blend_rect_col4

fb_blend_rect_col:
    cbz     w28, fb_blend_rect_next
    mov     x0, x26
    mov     x1, x25
    ldr     w2, [x27], #FB_BPP
    bl      fb_blend_pixel
    add     x26, x26, #FB_BPP
    sub     w28, w28, #1
    b       fb_blend_rect_col

fb_blend_rect_next:
    add     x19, x19, x20
    add     w22, w22, #1
    sub     w24, w24, #1
    b       fb_blend_rect_row

fb_blend_rect_done:
    ldp     x27, x28, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #96
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
    bl      fb_copy
    ldr     w0, [x19, #CURSOR_STATE_X]
    str     w0, [x19, #CURSOR_STATE_PREV_X]
    ldr     w0, [x19, #CURSOR_STATE_Y]
    str     w0, [x19, #CURSOR_STATE_PREV_Y]
    ldr     w0, [x19, #CURSOR_STATE_W]
    str     w0, [x19, #CURSOR_STATE_PREV_W]
    ldr     w0, [x19, #CURSOR_STATE_H]
    str     w0, [x19, #CURSOR_STATE_PREV_H]
    mov     w0, #1
    strb    w0, [x19, #CURSOR_STATE_PENDING]

cursor_hide_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

cursor_show:
    stp     x29, x30, [sp, #-80]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    bl      cursor_hide
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
    bl      fb_copy

cursor_show_draw:
    bl      mouse_get_buttons
    ladr    x21, cursor_sprite
    ladr    x9, cursor_sprite_pressed
    cmp     w0, #0
    csel    x21, x9, x21, ne
    ldr     w0, [x19, #CURSOR_STATE_X]
    ldr     w1, [x19, #CURSOR_STATE_Y]
    bl      fb_pixel_addr
    mov     x20, x0
    mov     w6, #0

cursor_show_draw_row:
    cmp     w6, w23
    b.hs    cursor_show_done
    mov     w4, #0
    mov     x5, x20
    mov     x7, x21

cursor_show_draw_col:
    cmp     w4, w22
    b.hs    cursor_show_draw_next
    ldr     w10, [x7], #FB_BPP
    lsr     w12, w10, #CH_SHIFT_A
    cbz     w12, cursor_show_draw_skip

cursor_show_draw_blend:
    cmp     w12, #CH_MAX
    b.eq    cursor_show_draw_put
    mov     w13, #CH_MAX
    sub     w12, w13, w12
    ldr     w11, [x5]
    ubfx    w14, w11, #CH_SHIFT_B, #8
    mul     w14, w14, w12
    add     w14, w14, #CH_ROUND
    add     w14, w14, w14, lsr #8
    lsr     w14, w14, #8
    ubfx    w15, w10, #CH_SHIFT_B, #8
    add     w14, w14, w15
    ubfx    w16, w11, #CH_SHIFT_G, #8
    mul     w16, w16, w12
    add     w16, w16, #CH_ROUND
    add     w16, w16, w16, lsr #8
    lsr     w16, w16, #8
    ubfx    w17, w10, #CH_SHIFT_G, #8
    add     w16, w16, w17
    orr     w14, w14, w16, lsl #CH_SHIFT_G
    ubfx    w16, w11, #CH_SHIFT_R, #8
    mul     w16, w16, w12
    add     w16, w16, #CH_ROUND
    add     w16, w16, w16, lsr #8
    lsr     w16, w16, #8
    ubfx    w17, w10, #CH_SHIFT_R, #8
    add     w16, w16, w17
    orr     w14, w14, w16, lsl #CH_SHIFT_R
    orr     w10, w14, #0xff000000

cursor_show_draw_put:
    str     w10, [x5]

cursor_show_draw_skip:
    add     x5, x5, #FB_BPP
    add     w4, w4, #1
    b       cursor_show_draw_col

cursor_show_draw_next:
    mov     x9, #FB_STRIDE
    add     x20, x20, x9
    add     x21, x21, #CURSOR_STRIDE
    add     w6, w6, #1
    b       cursor_show_draw_row

cursor_show_done:
    mov     w0, #1
    strb    w0, [x19, #CURSOR_STATE_VISIBLE]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #80
    ret

cursor_render:
    stp     x29, x30, [sp, #-16]!
    ladr    x0, cursor_sprite
    mov     w1, #0
    mov     x2, #CURSOR_SCALE
    bl      cursor_render_sprite
    ladr    x0, cursor_sprite_pressed
    mov     w1, #CURSOR_PRESSED_OFFSET
    mov     x2, #CURSOR_SCALE_PRESSED
    bl      cursor_render_sprite
    ladr    x0, cursor_sprite_pressed
    mov     w1, #CURSOR_ALPHA_PRESSED
    bl      cursor_sprite_opacity
    ldp     x29, x30, [sp], #16
    ret

cursor_sprite_opacity:
    mov     w2, #(CURSOR_W * CURSOR_H)

cursor_sprite_opacity_px:
    ldr     w8, [x0]
    ubfx    w10, w8, #0, #8
    mul     w10, w10, w1
    lsr     w10, w10, #16
    ubfx    w13, w8, #8, #8
    mul     w13, w13, w1
    lsr     w13, w13, #16
    orr     w10, w10, w13, lsl #8
    ubfx    w13, w8, #16, #8
    mul     w13, w13, w1
    lsr     w13, w13, #16
    orr     w10, w10, w13, lsl #16
    ubfx    w13, w8, #24, #8
    mul     w13, w13, w1
    lsr     w13, w13, #16
    orr     w10, w10, w13, lsl #24
    str     w10, [x0], #FB_BPP
    subs    w2, w2, #1
    b.ne    cursor_sprite_opacity_px
    ret

cursor_render_sprite:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     x19, x0
    mov     w20, w1
    mov     x21, x2
    mov     x1, #(CURSOR_SPRITE_SIZE / 8)

cursor_render_clear:
    str     xzr, [x0], #8
    subs    x1, x1, #1
    b.ne    cursor_render_clear
    mov     x0, x19
    mov     x1, #CURSOR_STRIDE
    bl      fb_target_set
    mov     w0, #0
    mov     w1, #0
    mov     w2, #CURSOR_W
    mov     w3, #CURSOR_H
    bl      fb_clip_set
    ladr    x0, icon_cursor_body
    mov     w1, w20
    mov     w2, w20
    ldr     x3, =COLOR_CURSOR_DARK
    mov     x4, x21
    bl      icon_fill
    ladr    x0, icon_cursor_body
    mov     w1, w20
    mov     w2, w20
    ldr     x3, =COLOR_CURSOR
    mov     x4, x21
    bl      icon_draw_scaled
    ladr    x0, icon_cursor_ring
    mov     w1, w20
    mov     w2, w20
    ldr     x3, =COLOR_CURSOR_DARK
    mov     x4, x21
    bl      icon_fill
    bl      fb_clip_full
    bl      fb_target_screen
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

cursor_present:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    ladr    x19, cursor_state
    ldr     w0, [x19, #CURSOR_STATE_X]
    ldr     w1, [x19, #CURSOR_STATE_Y]
    ldr     w2, [x19, #CURSOR_STATE_W]
    ldr     w3, [x19, #CURSOR_STATE_H]
    ldrb    w4, [x19, #CURSOR_STATE_PENDING]
    cbz     w4, cursor_present_new
    strb    wzr, [x19, #CURSOR_STATE_PENDING]
    ldr     w5, [x19, #CURSOR_STATE_PREV_X]
    ldr     w6, [x19, #CURSOR_STATE_PREV_Y]
    ldr     w7, [x19, #CURSOR_STATE_PREV_W]
    ldr     w8, [x19, #CURSOR_STATE_PREV_H]
    add     w2, w2, w0
    add     w3, w3, w1
    add     w7, w7, w5
    add     w8, w8, w6
    cmp     w0, w5
    csel    w20, w0, w5, lt
    cmp     w1, w6
    csel    w21, w1, w6, lt
    cmp     w2, w7
    csel    w22, w2, w7, gt
    cmp     w3, w8
    csel    w9, w3, w8, gt
    sub     w22, w22, w20
    sub     w9, w9, w21
    cmp     w22, #(CURSOR_W * 2)
    b.gt    cursor_present_split
    cmp     w9, #(CURSOR_H * 2)
    b.gt    cursor_present_split
    mov     w0, w20
    mov     w1, w21
    mov     w2, w22
    mov     w3, w9
    bl      fb_present
    b       cursor_present_done

cursor_present_split:
    ldr     w0, [x19, #CURSOR_STATE_X]
    ldr     w1, [x19, #CURSOR_STATE_Y]
    ldr     w2, [x19, #CURSOR_STATE_W]
    ldr     w3, [x19, #CURSOR_STATE_H]
    bl      fb_present
    ldr     w0, [x19, #CURSOR_STATE_PREV_X]
    ldr     w1, [x19, #CURSOR_STATE_PREV_Y]
    ldr     w2, [x19, #CURSOR_STATE_PREV_W]
    ldr     w3, [x19, #CURSOR_STATE_PREV_H]
    bl      fb_present
    b       cursor_present_done

cursor_present_new:
    bl      fb_present

cursor_present_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

cursor_update:
    stp     x29, x30, [sp, #-16]!
    bl      cursor_hide
    bl      cursor_show
    bl      cursor_present
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
    stp     x29, x30, [sp, #-16]!
    bl      fb_rect_screen
    ldp     x29, x30, [sp], #16
    cbz     w2, dirty_add_done
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

win_dirty_title:
    mov     w3, #(WIN_BORDER * 2 + WIN_TITLEBAR_H)
    b       win_dirty_bounds
win_dirty_rect:
    mov     w3, #0
win_dirty_bounds:
    stp     x29, x30, [sp, #-16]!
    ladr    x9, win_count
    ldr     w9, [x9]
    cmp     x0, x9
    b.hs    win_dirty_bounds_done
    mov     w12, w3
    bl      win_rect
    cmp     w12, #0
    csel    w3, w3, w12, eq
    bl      dirty_add

win_dirty_bounds_done:
    ldp     x29, x30, [sp], #16
    ret

win_rect:
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
    ret

win_repaint:
    stp     x29, x30, [sp, #-16]!
    bl      win_repaint_render
    bl      win_repaint_present
    ldp     x29, x30, [sp], #16
    ret

dirty_rect_load:
    ladr    x9, dirty_list
    mov     x10, #DIRTY_SIZE
    madd    x9, x19, x10, x9
    ldr     w0, [x9, #DIRTY_X]
    ldr     w1, [x9, #DIRTY_Y]
    ldr     w2, [x9, #DIRTY_X2]
    ldr     w3, [x9, #DIRTY_Y2]
    sub     w2, w2, w0
    sub     w3, w3, w1
    ret

win_repaint_render:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
.if WIN_FORCE_FULL
    bl      dirty_all
.endif
    ladr    x19, dirty_count
    ldrb    w0, [x19, #4]
    cbnz    w0, win_repaint_render_full
    ldr     w20, [x19]
    mov     w19, #0

win_repaint_render_loop:
    cmp     w19, w20
    b.hs    win_repaint_render_end
    bl      dirty_rect_load
    bl      fb_clip_set
    bl      win_draw_all
    add     w19, w19, #1
    b       win_repaint_render_loop

win_repaint_render_full:
    bl      fb_clip_full
    bl      win_draw_all

win_repaint_render_end:
    bl      fb_clip_full
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

win_repaint_present:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    ladr    x19, dirty_count
    ldrb    w0, [x19, #4]
    cbnz    w0, win_repaint_present_full
    ldr     w20, [x19]
    mov     w19, #0

win_repaint_present_loop:
    cmp     w19, w20
    b.hs    win_repaint_present_end
    bl      dirty_rect_load
    bl      fb_present
    add     w19, w19, #1
    b       win_repaint_present_loop

win_repaint_present_full:
    bl      fb_present_all

win_repaint_present_end:
    bl      dirty_reset
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

win_move:
    ladr    x9, win_count
    ldr     w9, [x9]
    cmp     w0, w9
    b.hs    win_move_invalid
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

win_move_invalid:
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
    mov     x4, #ICON_SCALE
icon_draw_scaled:
    mov     w5, #1
    b       icon_run
icon_fill:
    mov     w5, #0
icon_run:
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
    mov     x20, x4
    mov     w28, w5
    bl      vg_edge_reset
    cbz     w28, icon_run_width
    ladr    x0, vg_emit
    ladr    x1, vg_seg
    str     x1, [x0]
icon_run_width:
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
    b.hs    icon_run_fill
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
    ladr    x4, vg_emit
    ldr     x4, [x4]
    blr     x4
    ldp     x0, x1, [sp], #16

icon_cmd_move:
    bl      icon_set_cur
    cbz     w28, icon_cmd_next
    bl      vg_dot

icon_cmd_next:
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
    b       icon_cmd_move

icon_contour_next:
    add     w22, w22, #1
    b       icon_contour

icon_run_fill:
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
    cbz     x0, anim_slot_none
    and     x1, x0, #ANIM_SLOT_MASK
    cmp     x1, #ANIM_MAX
    b.hs    anim_slot_none
    ladr    x2, anim_list
    mov     x3, #ANIM_ENTRY_SIZE
    madd    x2, x1, x3, x2
    ldr     w3, [x2, #ANIM_GEN]
    cbz     w3, anim_slot_none
    lsr     x4, x0, #16
    cmp     x3, x4
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
    cmp     w24, #ANIM_EASE_COUNT
    b.hs    anim_start_invalid
anim_start_valid:
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
    str     xzr, [x25, #ANIM_DONE]
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
    b       anim_start_zero

anim_start_invalid:
    ladr    x0, anim_invalid_msg
    bl      uart_puts

anim_start_zero:
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
    cmp     w4, #ANIM_RUNNING
    b.ne    anim_alloc_found
    add     w2, w2, #1
    b       anim_alloc_loop

anim_alloc_found:
    ladr    x4, anim_gen_next
    ldr     w5, [x4]
    str     w5, [x3, #ANIM_GEN]
    add     w5, w5, #1
    cmp     w5, #0
    csinc   w5, w5, wzr, ne

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

anim_set_done:
    cbz     x0, anim_set_done_ret
    and     x0, x0, #ANIM_SLOT_MASK
    mov     x2, #ANIM_ENTRY_SIZE
    ladr    x3, anim_list
    madd    x0, x0, x2, x3
    str     x1, [x0, #ANIM_DONE]

anim_set_done_ret:
    ret

anim_apply:
    cmp     x0, #WIN_MAX
    b.eq    anim_apply_screen
    b.hs    anim_apply_none
    cmp     w1, #ANIM_PROP_COUNT
    b.hs    anim_apply_none
    cmp     w1, #ANIM_PROP_SCREEN
    b.eq    anim_apply_none
    ladr    x3, win_count
    ldr     w3, [x3]
    cmp     x0, x3
    b.hs    anim_apply_none
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     x19, x0
    mov     w20, w1
    mov     x21, x2
    ladr    x3, win_list
    mov     x4, #WIN_SIZE
    madd    x3, x19, x4, x3
    cmp     w20, #ANIM_PROP_H
    b.ne    anim_apply_current
    ldr     w4, [x3, #WIN_H]
    lsl     x4, x4, #ANIM_SHIFT
    b       anim_apply_compare

anim_apply_current:
    cmp     w20, #ANIM_PROP_ALPHA
    mov     w4, #3
    csel    w4, w4, w20, eq
    add     x3, x3, #WIN_TX
    ldr     x4, [x3, x4, lsl #3]

anim_apply_compare:
    cmp     x4, x21
    b.eq    anim_apply_ret
    cmp     w20, #ANIM_PROP_FOCUS
    b.eq    anim_apply_mark_title
    bl      win_dirty_rect
    b       anim_apply_write

anim_apply_mark_title:
    bl      win_dirty_title

anim_apply_write:
    ladr    x3, win_list
    mov     x4, #WIN_SIZE
    madd    x3, x19, x4, x3
    cmp     w20, #ANIM_PROP_TY
    b.eq    anim_apply_ty
    cmp     w20, #ANIM_PROP_FOCUS
    b.eq    anim_apply_focus
    cmp     w20, #ANIM_PROP_ALPHA
    b.eq    anim_apply_alpha
    cmp     w20, #ANIM_PROP_H
    b.eq    anim_apply_h
    str     x21, [x3, #WIN_TX]
    b       anim_apply_mark

anim_apply_h:
    asr     x4, x21, #ANIM_SHIFT
    str     w4, [x3, #WIN_H]
    b       anim_apply_mark

anim_apply_focus:
    str     x21, [x3, #WIN_FOCUS]
    mov     w4, #1
    strb    w4, [x3, #WIN_BUF_TITLE]
    b       anim_apply_mark

anim_apply_alpha:
    str     x21, [x3, #WIN_ALPHA]
    b       anim_apply_mark

anim_apply_ty:
    str     x21, [x3, #WIN_TY]

anim_apply_mark:
    mov     x0, x19
    cmp     w20, #ANIM_PROP_FOCUS
    b.eq    anim_apply_mark_title2
    bl      win_dirty_rect
    b       anim_apply_ret

anim_apply_mark_title2:
    bl      win_dirty_title

anim_apply_ret:
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
    mov     w0, #ANIM_FINISHED
    strh    w0, [x22, #ANIM_STATE]
    ladr    x0, anim_active
    ldr     w1, [x0]
    subs    w1, w1, #1
    csel    w1, wzr, w1, mi
    str     w1, [x0]
    ldr     x1, [x22, #ANIM_DONE]
    cbz     x1, anim_tick_next
    ldr     x0, [x22, #ANIM_TARGET]
    blr     x1

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
    mov     w1, w19
    bl      anim_cancel_slot
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

anim_cancel_slot:
    cbz     x0, anim_cancel_slot_done
    ldrh    w2, [x0, #ANIM_STATE]
    cmp     w2, #ANIM_RUNNING
    b.ne    anim_cancel_slot_free
    ladr    x3, anim_active
    ldr     w2, [x3]
    sub     w2, w2, #1
    str     w2, [x3]
    strh    wzr, [x0, #ANIM_STATE]
    str     wzr, [x0, #ANIM_GEN]
    cmp     w1, #ANIM_STOP_END
    b.ne    anim_cancel_slot_done
    ldr     x2, [x0, #ANIM_TO]
    str     x2, [x0, #ANIM_VALUE]
    ldr     w1, [x0, #ANIM_PROP]
    ldr     x0, [x0, #ANIM_TARGET]
    b       anim_apply
anim_cancel_slot_free:
    strh    wzr, [x0, #ANIM_STATE]
    str     wzr, [x0, #ANIM_GEN]
anim_cancel_slot_done:
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
    str     wzr, [x0, #ANIM_GEN]

anim_cancel_target_next:
    add     w21, w21, #1
    b       anim_cancel_target_loop

anim_cancel_target_done:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

anim_raise_targets:
    ladr    x2, anim_list
    mov     w3, #ANIM_MAX
anim_raise_targets_loop:
    ldr     x4, [x2, #ANIM_TARGET]
    cmp     x4, x0
    b.lo    anim_raise_targets_next
    cmp     x4, x1
    b.hi    anim_raise_targets_next
    cmp     x4, x0
    sub     x5, x4, #1
    csel    x4, x1, x5, eq
    str     x4, [x2, #ANIM_TARGET]
anim_raise_targets_next:
    add     x2, x2, #ANIM_ENTRY_SIZE
    subs    w3, w3, #1
    b.ne    anim_raise_targets_loop
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
    cbz     x2, anim_lerp_done
    mov     x3, #0x100000000
    cmp     x2, x3
    b.hs    anim_lerp_target
    sub     x3, x3, x2
    mul     x4, x0, x3
    smulh   x5, x0, x3
    mul     x6, x1, x2
    smulh   x7, x1, x2
    adds    x4, x4, x6
    adc     x5, x5, x7
    mov     x6, #ANIM_HALF
    adds    x4, x4, x6
    adc     x5, x5, xzr
    extr    x0, x5, x4, #ANIM_SHIFT
anim_lerp_done:
    ret
anim_lerp_target:
    mov     x0, x1
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
    mov     x2, #-2147483648
    cmp     x1, #0
    csel    x0, x0, x2, eq
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
    stp     x29, x30, [sp, #-16]!
    ladr    x0, vin_tablet
    ldr     x0, [x0, #VIN_BASE]
    cbz     x0, power_device_blk
    bl      virtio_reset
power_device_blk:
    ladr    x0, blk_base
    ldr     x0, [x0]
    cbz     x0, power_device_net
    bl      virtio_reset
power_device_net:
    ladr    x0, net_base
    ldr     x0, [x0]
    cbz     x0, power_device_done
    bl      virtio_reset
power_device_done:
    ldp     x29, x30, [sp], #16
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
    ladr    x0, win_buf_arena
    mov     x1, #WIN_BUF_BUDGET
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
    ladr    x12, win_class_base
    cmp     x5, #0
    csel    x12, x12, x5, eq
    str     x12, [x11, #WIN_CLASS]
    ladr    x12, win_next_id
    ldr     w13, [x12]
    add     w13, w13, #1
    str     w13, [x12]
    str     w13, [x11, #WIN_ID]
    str     w3, [x11, #WIN_H_FULL]
    str     wzr, [x11, #WIN_FLAGS]
    umull   x12, w2, w3
    lsl     x12, x12, #2
    add     x12, x12, #63
    and     x12, x12, #-64
    ladr    x13, win_buf_used
    ldr     x14, [x13]
    add     x15, x14, x12
    mov     x16, #WIN_BUF_BUDGET
    cmp     x15, x16
    b.hi    win_add_no_buffer
    ladr    x16, win_buf_arena
    add     x16, x16, x14
    str     x16, [x11, #WIN_BUF]
    str     x15, [x13]
    mov     w16, #1
    strb    w16, [x11, #WIN_BUF_DIRTY]
    strb    wzr, [x11, #WIN_BUF_TITLE]
    b       win_add_buffer_done

win_add_no_buffer:
    str     xzr, [x11, #WIN_BUF]
    strb    wzr, [x11, #WIN_BUF_DIRTY]
    stp     x29, x30, [sp, #-32]!
    stp     x9, x10, [sp, #16]
    ladr    x0, win_buffer_msg
    bl      uart_puts
    ldp     x9, x10, [sp, #16]
    ldp     x29, x30, [sp], #32
    ladr    x11, win_list
    mov     x12, #WIN_SIZE
    madd    x11, x10, x12, x11

win_add_buffer_done:
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
    mov     x7, #CH_MAX

win_mix_loop:
    cmp     w4, #32
    b.hs    win_mix_done
    lsr     x5, x0, x4
    and     x5, x5, #CH_MAX
    lsr     x6, x1, x4
    and     x6, x6, #CH_MAX
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
    add     w4, w4, #8
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
    cbnz    x0, win_fade_all_next
    ladr    x0, win_list
    mov     x1, #WIN_SIZE
    madd    x0, x19, x1, x0
    mov     x1, #1
    lsl     x1, x1, #ANIM_SHIFT
    str     x1, [x0, #WIN_ALPHA]

win_fade_all_next:
    add     w19, w19, #1
    b       win_fade_all_loop

win_fade_all_done:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret


win_fade_color:
    ladr    x1, win_color_fade
    ldrb    w1, [x1]
    cbz     w1, win_fade_color_none
    stp     x29, x30, [sp, #-16]!
    mov     x1, x0
    ldr     x2, [x19, #WIN_ALPHA]
    asr     x2, x2, #16
    ldr     x0, =COLOR_BACKGROUND
    bl      win_mix_color
    ldp     x29, x30, [sp], #16

win_fade_color_none:
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
    bl      anim_raise_targets
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
    mov     x0, x19
    mov     w1, #ANIM_PROP_TX
    bl      anim_find_running
    mov     w1, #ANIM_STOP_HOLD
    bl      anim_cancel_slot
    mov     x0, x19
    mov     w1, #ANIM_PROP_TY
    bl      anim_find_running
    mov     w1, #ANIM_STOP_HOLD
    bl      anim_cancel_slot
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
    str     xzr, [x9, #WIN_TX]
    str     xzr, [x9, #WIN_TY]
    str     w20, [x9, #WIN_X]
    str     w21, [x9, #WIN_Y]
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
    cbnz    x0, win_focus_top_ok
    madd    x0, x19, x21, x20
    mov     x1, #1
    lsl     x1, x1, #ANIM_SHIFT
    str     x1, [x0, #WIN_FOCUS]

win_focus_top_ok:
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
    cbnz    x0, win_focus_other_ok
    ldr     x0, [sp]
    madd    x0, x0, x21, x20
    str     xzr, [x0, #WIN_FOCUS]

win_focus_other_ok:
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
    mov     w1, w19
    mov     w2, w20
    bl      win_button_hit
    cbz     w0, win_click_raise
    ladr    x9, win_btn_armed
    strb    w0, [x9]
    ladr    x9, win_list
    mov     x10, #WIN_SIZE
    madd    x9, x21, x10, x9
    ldr     w0, [x9, #WIN_ID]
    ladr    x9, win_btn_id
    str     w0, [x9]
    b       win_click_done

win_click_raise:
    ladr    x9, win_count
    ldr     w0, [x9]
    sub     w0, w0, #1
    cmp     w21, w0
    b.eq    win_click_drag
    mov     w0, w21
    bl      win_raise
    ladr    x9, win_count
    ldr     w21, [x9]
    sub     w21, w21, #1
    bl      win_focus_start
    mov     w0, w21
    bl      win_dirty_rect

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
    stp     x29, x30, [sp, #-80]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    str     x25, [sp, #64]
    mov     w20, w0
    ladr    x19, win_list
    mov     x9, #WIN_SIZE
    madd    x19, x0, x9, x19
    ldr     x23, [x19, #WIN_BUF]
    cbz     x23, win_draw_one_direct
    ldrb    w0, [x19, #WIN_BUF_DIRTY]
    cbnz    w0, win_draw_one_full
    ldrb    w0, [x19, #WIN_BUF_TITLE]
    cbz     w0, win_draw_one_blit
    mov     w0, #WIN_BORDER
    mov     w1, #WIN_BORDER
    ldr     w2, [x19, #WIN_W]
    sub     w2, w2, #(WIN_BORDER * 2)
    mov     w3, #WIN_TITLEBAR_H
    b       win_draw_one_render

win_draw_one_full:
    mov     w0, #0
    mov     w1, #0
    ldr     w2, [x19, #WIN_W]
    ldr     w3, [x19, #WIN_H_FULL]

win_draw_one_render:
    stp     x0, x1, [sp, #-32]!
    stp     x2, x3, [sp, #16]
    ladr    x0, fb_clip
    ldp     x24, x25, [x0]
    mov     x0, x23
    ldr     w1, [x19, #WIN_W]
    lsl     x1, x1, #2
    bl      fb_target_set
    ldp     x2, x3, [sp, #16]
    ldp     x0, x1, [sp], #32
    bl      fb_clip_set
    ladr    x0, win_color_fade
    strb    wzr, [x0]
    mov     w0, w20
    mov     w1, #0
    mov     w2, #0
    bl      win_draw_content
    bl      fb_target_screen
    mov     x0, x24
    mov     x1, x25
    bl      fb_clip_restore
    strb    wzr, [x19, #WIN_BUF_DIRTY]
    strb    wzr, [x19, #WIN_BUF_TITLE]

win_draw_one_blit:
    mov     w0, w20
    bl      win_rect
    ldr     x4, [x19, #WIN_ALPHA]
    asr     x4, x4, #16
    cbz     x4, win_draw_one_done
    mov     w5, w3
    ldr     w3, [x19, #WIN_W]
    lsl     w3, w3, #2
    mov     x6, #FADE_ONE
    cmp     x4, x6
    mov     w4, w2
    mov     x2, x23
    b.hs    win_draw_one_copy
    ldr     x6, [x19, #WIN_ALPHA]
    asr     x6, x6, #16
    mov     x7, #ALPHA_MAX
    cmp     x6, x7
    csel    x6, x7, x6, hi
    bl      fb_blend_rect
    b       win_draw_one_done

win_draw_one_copy:
    bl      fb_copy_rect
    ldr     w0, [x19, #WIN_H]
    ldr     w1, [x19, #WIN_H_FULL]
    cmp     w0, w1
    b.hs    win_draw_one_done
    mov     w0, w20
    bl      win_rect
    add     w1, w1, w3
    sub     w1, w1, #WIN_BORDER
    mov     w3, #WIN_BORDER
    ldr     x4, =COLOR_WIN_BORDER
    bl      fb_fill_rect
    b       win_draw_one_done

win_draw_one_direct:
    ladr    x0, win_color_fade
    mov     w1, #1
    strb    w1, [x0]
    mov     w0, w20
    bl      win_rect
    mov     w21, w0
    mov     w22, w1
    bl      fb_clip_intersect
    mov     x24, x0
    mov     x25, x1
    cbz     w2, win_draw_one_direct_restore
    mov     w0, w20
    mov     w1, w21
    mov     w2, w22
    bl      win_draw_content

win_draw_one_direct_restore:
    mov     x0, x24
    mov     x1, x25
    bl      fb_clip_restore

win_draw_one_done:
    ldr     x25, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #80
    ret

win_draw_content:
    stp     x29, x30, [sp, #-80]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    str     x25, [sp, #64]
    ladr    x19, win_list
    mov     x9, #WIN_SIZE
    madd    x19, x0, x9, x19
    mov     w20, w0
    mov     w21, w1
    mov     w22, w2
    mov     w0, w21
    mov     w1, w22
    ldr     w2, [x19, #WIN_W]
    ldr     w3, [x19, #WIN_H_FULL]
    stp     x0, x1, [sp, #-32]!
    stp     x2, x3, [sp, #16]
    ldr     x0, =COLOR_WIN_BORDER
    bl      win_fade_color
    mov     x4, x0
    ldp     x2, x3, [sp, #16]
    ldp     x0, x1, [sp], #32
    add     w9, w0, #WIN_BORDER
    add     w10, w1, #WIN_BORDER
    sub     w11, w2, #(WIN_BORDER * 2)
    sub     w12, w3, #(WIN_BORDER * 2)
    stp     w9, w10, [sp, #-16]!
    stp     w11, w12, [sp, #8]
    mov     x5, sp
    bl      fb_fill_around
    add     sp, sp, #16
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
    ldr     w3, [x19, #WIN_H_FULL]
    sub     w3, w3, #(WIN_BORDER * 2 + WIN_TITLEBAR_H)
    stp     x0, x1, [sp, #-32]!
    stp     x2, x3, [sp, #16]
    ldr     x0, =COLOR_WIN_BODY
    bl      win_fade_color
    mov     x4, x0
    ldp     x2, x3, [sp, #16]
    ldp     x0, x1, [sp], #32
    bl      fb_fill_rect
    add     w0, w21, #WIN_BORDER
    add     w1, w22, #(WIN_BORDER + WIN_TITLEBAR_H)
    ldr     w2, [x19, #WIN_W]
    sub     w2, w2, #(WIN_BORDER * 2)
    ldr     w3, [x19, #WIN_H_FULL]
    sub     w3, w3, #(WIN_BORDER * 2 + WIN_TITLEBAR_H)
    stp     x0, x1, [sp, #-32]!
    stp     x2, x3, [sp, #16]
    bl      fb_clip_intersect
    mov     x24, x0
    mov     x25, x1
    cbz     w2, win_draw_content_skip
    mov     w0, w20
    mov     w1, #CLS_DRAW
    bl      win_method
    str     x0, [sp, #-16]!
    ldr     x0, =COLOR_FILES_TEXT
    bl      win_fade_color
    mov     x3, x0
    ldr     x9, [sp], #16
    cbz     x9, win_draw_content_skip
    ldr     x0, [sp]
    ldr     x1, [sp, #8]
    ldr     x2, [sp, #24]
    mov     w4, w20
    blr     x9

win_draw_content_skip:
    add     sp, sp, #32
    mov     x0, x24
    mov     x1, x25
    bl      fb_clip_restore

win_draw_content_title:
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
    ldr     w23, [x19, #WIN_W]
    add     w23, w23, w21
    sub     w23, w23, #(WIN_BORDER + WIN_BTN_PAD + ICON_SIZE)
    add     w24, w22, #(WIN_BORDER + (WIN_TITLEBAR_H - ICON_SIZE) / 2)
    ldr     x0, =COLOR_WIN_TEXT
    bl      win_fade_color
    mov     x25, x0
    ladr    x0, icon_x
    mov     w1, w23
    mov     w2, w24
    mov     x3, x25
    bl      icon_draw
    ladr    x0, icon_minus
    sub     w1, w23, #(WIN_BTN_PAD + ICON_SIZE)
    mov     w2, w24
    mov     x3, x25
    bl      icon_draw
    ldr     x25, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #80
    ret

win_draw_all:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    ladr    x9, win_count
    ldr     w20, [x9]
    stp     xzr, xzr, [sp, #32]
    cbz     w20, win_draw_all_background
    sub     w0, w20, #1
    ladr    x9, win_list
    mov     x10, #WIN_SIZE
    madd    x9, x0, x10, x9
    ldr     x9, [x9, #WIN_ALPHA]
    asr     x9, x9, #16
    mov     x10, #FADE_ONE
    cmp     x9, x10
    b.lo    win_draw_all_background
    bl      win_rect
    stp     w0, w1, [sp, #32]
    stp     w2, w3, [sp, #40]

win_draw_all_background:
    mov     w0, #0
    mov     w1, #0
    mov     w2, #FB_WIDTH
    mov     w3, #FB_HEIGHT
    ldr     x4, =COLOR_BACKGROUND
    add     x5, sp, #32
    bl      fb_fill_around
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

desktop_start:
    stp     x29, x30, [sp, #-16]!
    mov     x0, #WIN_MAX
    mov     w1, #ANIM_PROP_SCREEN
    mov     x2, #0
    mov     x3, #1
    lsl     x3, x3, #ANIM_SHIFT
    mov     w4, #SCREEN_FADE_MS
    mov     w5, #ANIM_EASE_QUAD_OUT
    bl      anim_start
    cbz     x0, desktop_start_now
    ladr    x1, net_start
    bl      anim_set_done
    ldp     x29, x30, [sp], #16
    ret

desktop_start_now:
    ladr    x0, fb_fade
    mov     w1, #FADE_ONE
    str     w1, [x0]
    bl      fb_present_all
    ldp     x29, x30, [sp], #16
    b       net_start

win_demo:
    stp     x29, x30, [sp, #-16]!
    bl      term_init
    bl      netlog_init
    mov     w0, #2560
    mov     w1, #200
    mov     w2, #1180
    mov     w3, #1160
    ladr    x4, win_title_2
    ladr    x5, win_class_files
    bl      win_add
    mov     w0, #1330
    mov     w1, #200
    mov     w2, #1180
    mov     w3, #1160
    ladr    x4, win_title_3
    ladr    x5, win_class_net
    bl      win_add
    mov     w0, #100
    mov     w1, #200
    mov     w2, #1180
    mov     w3, #1160
    ladr    x4, win_title_1
    ladr    x5, win_class_term
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

pmm_stack_check:
    ladr    x0, __stack_bottom
    ldr     x0, [x0]
    ldr     x1, =STACK_GUARD
    cmp     x0, x1
    b.ne    pmm_stack_overflow
    ret

pmm_stack_overflow:
    msr     daifset, #DAIF_I
    ladr    x0, pmm_stack_msg
    bl      uart_puts
    b       boot_park

pmm_init:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    ladr    x0, __stack_bottom
    ldr     x1, =STACK_GUARD
    str     x1, [x0]
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
    ldr     x6, [x1, x5]
    mvn     x7, x6
    cbnz    x7, pmm_alloc_found
    add     x4, x4, #64
    b       pmm_alloc_loop
pmm_alloc_found:
    rbit    x7, x7
    clz     x7, x7
    add     x4, x4, x7
    cmp     x4, x3
    b.hs    pmm_alloc_none
    mov     x8, #1
    lsl     x8, x8, x7
    orr     x6, x6, x8
    str     x6, [x1, x5]
    ldr     x0, [x2]
    add     x0, x0, x4, lsl #PAGE_SHIFT
    ret
pmm_alloc_none:
    mov     x0, #0
    ret

pmm_free:
    tst     x0, #(PAGE_SIZE - 1)
    b.ne    pmm_free_done
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

.section .text.boot

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

.section .text

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

.section .text.boot

fdt_align4:
    add     x0, x0, #3
    bic     x0, x0, #3
    ret

fdt_find_memory:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    ladr    x1, fdt_memory_name
    mov     w2, #6
    ladr    x3, fdt_reg_name
    bl      fdt_find_prop
    cbz     x0, fdt_find_memory_fail
    cmp     w1, #16
    b.lo    fdt_find_memory_fail
    mov     x19, x0
    ldr     w0, [x19]
    rev     w0, w0
    ldr     w2, [x19, #4]
    rev     w2, w2
    orr     x0, x2, x0, lsl #32
    ldr     w1, [x19, #8]
    rev     w1, w1
    ldr     w2, [x19, #12]
    rev     w2, w2
    orr     x1, x2, x1, lsl #32
    b       fdt_find_memory_done

fdt_find_memory_fail:
    mov     x0, #0
    mov     x1, #0

fdt_find_memory_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

fdt_find_prop:
    stp     x29, x30, [sp, #-96]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    str     x27, [sp, #80]
    mov     x25, x1
    mov     w26, w2
    mov     x27, x3
    mov     x22, x0
    cbz     x22, fdt_find_prop_fail
    tst     x22, #3
    b.ne    fdt_find_prop_fail
    ldr     w0, [x22]
    rev     w0, w0
    ldr     w1, =FDT_MAGIC
    cmp     w0, w1
    b.ne    fdt_find_prop_fail
    ldr     w1, [x22, #4]
    rev     w1, w1
    cmp     w1, #40
    b.lo    fdt_find_prop_fail
    ldr     w0, [x22, #FDT_OFF_DT_STRUCT]
    rev     w0, w0
    cmp     w0, #40
    b.lo    fdt_find_prop_fail
    tst     w0, #3
    b.ne    fdt_find_prop_fail
    ldr     w2, [x22, #36]
    rev     w2, w2
    add     x3, x0, x2
    cmp     x3, x1
    b.hi    fdt_find_prop_fail
    add     x19, x22, x0
    add     x23, x22, x3
    ldr     w0, [x22, #FDT_OFF_DT_STRINGS]
    rev     w0, w0
    cmp     w0, #40
    b.lo    fdt_find_prop_fail
    ldr     w2, [x22, #32]
    rev     w2, w2
    add     x3, x0, x2
    cmp     x3, x1
    b.hi    fdt_find_prop_fail
    add     x20, x22, x0
    add     x24, x22, x3
    mov     w21, #0

fdt_find_prop_loop:
    add     x0, x19, #4
    cmp     x0, x23
    b.hi    fdt_find_prop_fail
    ldr     w0, [x19]
    rev     w0, w0
    cmp     w0, #FDT_TOKEN_BEGIN_NODE
    b.eq    fdt_find_prop_node
    cmp     w0, #FDT_TOKEN_PROP
    b.eq    fdt_find_prop_prop
    cmp     w0, #FDT_TOKEN_END_NODE
    b.eq    fdt_find_prop_endnode
    cmp     w0, #FDT_TOKEN_NOP
    b.eq    fdt_find_prop_nop
    b       fdt_find_prop_fail

fdt_find_prop_nop:
    add     x19, x19, #4
    b       fdt_find_prop_loop

fdt_find_prop_endnode:
    add     x19, x19, #4
    mov     w21, #0
    b       fdt_find_prop_loop

fdt_find_prop_node:
    add     x0, x19, #4
    mov     x1, x23
    bl      string_length_bounded
    tbnz    x0, #63, fdt_find_prop_fail
    mov     x22, x0
    mov     w21, #0
    cmp     x22, x26
    b.lo    fdt_find_prop_node_next
    add     x0, x19, #4
    mov     x1, x25
    bl      string_starts_with
    cbz     w0, fdt_find_prop_node_next
    add     x1, x19, #4
    ldrb    w1, [x1, x26]
    cmp     w1, #0
    cset    w21, eq
    cmp     w1, #64
    cset    w0, eq
    orr     w21, w21, w0

fdt_find_prop_node_next:
    add     x0, x22, #1
    bl      fdt_align4
    add     x19, x19, #4
    add     x19, x19, x0
    b       fdt_find_prop_loop

fdt_find_prop_prop:
    add     x0, x19, #FDT_PROP_HEADER_SIZE
    cmp     x0, x23
    b.hi    fdt_find_prop_fail
    ldr     w0, [x19, #4]
    rev     w0, w0
    mov     w22, w0
    add     x1, x19, #FDT_PROP_HEADER_SIZE
    add     x1, x1, x22
    cmp     x1, x23
    b.hi    fdt_find_prop_fail
    cbz     w21, fdt_find_prop_skip
    ldr     w0, [x19, #8]
    rev     w0, w0
    add     x0, x20, x0
    add     x1, x0, #4
    cmp     x1, x24
    b.hi    fdt_find_prop_fail
    mov     x1, x27
    bl      string_equal
    cbz     w0, fdt_find_prop_skip
    add     x0, x19, #FDT_PROP_HEADER_SIZE
    mov     w1, w22
    b       fdt_find_prop_done

fdt_find_prop_skip:
    mov     x0, x22
    bl      fdt_align4
    add     x19, x19, #FDT_PROP_HEADER_SIZE
    add     x19, x19, x0
    b       fdt_find_prop_loop

fdt_find_prop_fail:
    mov     x0, #0
    mov     x1, #0

fdt_find_prop_done:
    ldr     x27, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #96
    ret

.section .text

string_length_bounded:
    mov     x2, x0
string_length_bounded_loop:
    cmp     x0, x1
    b.hs    string_length_bounded_fail
    ldrb    w3, [x0], #1
    cbnz    w3, string_length_bounded_loop
    sub     x0, x0, x2
    sub     x0, x0, #1
    ret
string_length_bounded_fail:
    mov     x0, #-1
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
    mov     x1, #VIRTIO_MMIO_BASE

virtio_find_from:
    mov     x4, x0
    mov     x2, x1
    mov     x3, #VIRTIO_MMIO_BASE
    sub     x3, x1, x3
    lsr     x3, x3, #9
    mov     w5, #VIRTIO_MMIO_COUNT
    subs    w3, w5, w3
    b.le    virtio_find_none

virtio_find_loop:
    ldr     w0, [x2, #VIRTIO_REG_MAGIC]
    ldr     w1, =VIRTIO_MAGIC
    cmp     w0, w1
    b.ne    virtio_find_next
    ldr     w0, [x2, #VIRTIO_REG_DEVICE_ID]
    cmp     w0, w4
    b.ne    virtio_find_next
    ldr     w0, [x2, #VIRTIO_REG_VERSION]
    cmp     w0, #VIRTIO_VERSION_MODERN
    b.ne    virtio_find_oldver
    mov     x0, x2
    ret

virtio_find_oldver:
    stp     x29, x30, [sp, #-48]!
    stp     x2, x3, [sp, #16]
    str     x4, [sp, #32]
    ladr    x0, virtio_oldver_msg
    bl      uart_puts
    ldr     x4, [sp, #32]
    ldp     x2, x3, [sp, #16]
    ldp     x29, x30, [sp], #48
    b       virtio_find_next

virtio_find_next:
    add     x2, x2, #VIRTIO_MMIO_STRIDE
    subs    w3, w3, #1
    b.ne    virtio_find_loop

virtio_find_none:
    mov     x0, #0
    ret

virtio_reset:
    str     wzr, [x0, #VIRTIO_REG_STATUS]
    dsb     sy
    mov     x9, #BLK_TIMEOUT
virtio_reset_wait:
    ldr     w10, [x0, #VIRTIO_REG_STATUS]
    cbz     w10, virtio_reset_done
    subs    x9, x9, #1
    b.ne    virtio_reset_wait
    ladr    x0, virtio_reset_msg
    bl      uart_puts
    b       boot_park
virtio_reset_done:
    dsb     sy
    ret

virtio_setup:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x19, x0
    mov     x20, x1
    mov     x21, x2
    mov     x22, x3
    stp     x4, x5, [sp, #-16]!
    mov     w1, #0
    bl      virtio_negotiate
    ldp     x4, x5, [sp], #16
    cbnz    w0, virtio_setup_fail
    mov     w5, w4
    mov     x0, x19
    mov     w1, #0
    mov     x2, x20
    mov     x3, x21
    mov     x4, x22
    bl      virtio_queue_setup
    cbnz    w0, virtio_setup_fail
    mov     w0, #0
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

virtio_setup_fail:
    mov     w0, #VIRTIO_STATUS_FAILED
    str     w0, [x19, #VIRTIO_REG_STATUS]
    dsb     sy
    mov     w0, #1
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

virtio_negotiate:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     w20, w1
    bl      virtio_reset
    mov     w0, #VIRTIO_STATUS_ACK
    str     w0, [x19, #VIRTIO_REG_STATUS]
    mov     w0, #(VIRTIO_STATUS_ACK | VIRTIO_STATUS_DRIVER)
    str     w0, [x19, #VIRTIO_REG_STATUS]
    mov     w0, #1
    str     w0, [x19, #VIRTIO_REG_DEV_FEAT_SEL]
    ldr     w0, [x19, #VIRTIO_REG_DEV_FEAT]
    tst     w0, #VIRTIO_FEAT_VERSION_1_BIT
    b.eq    virtio_negotiate_fail
    str     wzr, [x19, #VIRTIO_REG_DEV_FEAT_SEL]
    ldr     w0, [x19, #VIRTIO_REG_DEV_FEAT]
    and     w20, w20, w0
    mov     w0, #1
    str     w0, [x19, #VIRTIO_REG_DRV_FEAT_SEL]
    mov     w0, #VIRTIO_FEAT_VERSION_1_BIT
    str     w0, [x19, #VIRTIO_REG_DRV_FEAT]
    str     wzr, [x19, #VIRTIO_REG_DRV_FEAT_SEL]
    str     w20, [x19, #VIRTIO_REG_DRV_FEAT]
    mov     w0, #(VIRTIO_STATUS_ACK | VIRTIO_STATUS_DRIVER | VIRTIO_STATUS_FEATURES_OK)
    str     w0, [x19, #VIRTIO_REG_STATUS]
    ldr     w0, [x19, #VIRTIO_REG_STATUS]
    tst     w0, #VIRTIO_STATUS_FEATURES_OK
    b.eq    virtio_negotiate_fail
    mov     w0, #0
    mov     w1, w20
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

virtio_negotiate_fail:
    mov     w0, #1
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

virtio_queue_setup:
    str     w1, [x0, #VIRTIO_REG_QUEUE_SEL]
    ldr     w9, [x0, #VIRTIO_REG_QUEUE_NUM_MAX]
    cmp     w9, w5
    b.lo    virtio_queue_setup_fail
    str     w5, [x0, #VIRTIO_REG_QUEUE_NUM]
    str     w2, [x0, #VIRTIO_REG_DESC_LOW]
    lsr     x9, x2, #32
    str     w9, [x0, #VIRTIO_REG_DESC_HIGH]
    str     w3, [x0, #VIRTIO_REG_AVAIL_LOW]
    lsr     x9, x3, #32
    str     w9, [x0, #VIRTIO_REG_AVAIL_HIGH]
    str     w4, [x0, #VIRTIO_REG_USED_LOW]
    lsr     x9, x4, #32
    str     w9, [x0, #VIRTIO_REG_USED_HIGH]
    mov     w9, #1
    str     w9, [x0, #VIRTIO_REG_QUEUE_READY]
    mov     w0, #0
    ret

virtio_queue_setup_fail:
    mov     w0, #1
    ret

virtio_driver_ok:
    ldr     w1, [x0, #VIRTIO_REG_STATUS]
    orr     w1, w1, #VIRTIO_STATUS_DRIVER_OK
    str     w1, [x0, #VIRTIO_REG_STATUS]
    dsb     sy
    ret



mem_read16:
    ldrb    w2, [x0, x1]
    add     x3, x1, #1
    ldrb    w3, [x0, x3]
    orr     w0, w2, w3, lsl #8
    ret

mem_read16be:
    ldrb    w2, [x0, x1]
    add     x3, x1, #1
    ldrb    w3, [x0, x3]
    orr     w0, w3, w2, lsl #8
    ret

mem_read32be:
    ldrb    w2, [x0, x1]
    add     x3, x1, #1
    ldrb    w4, [x0, x3]
    orr     w2, w4, w2, lsl #8
    add     x3, x1, #2
    ldrb    w4, [x0, x3]
    orr     w2, w4, w2, lsl #8
    add     x3, x1, #3
    ldrb    w4, [x0, x3]
    orr     w0, w4, w2, lsl #8
    ret

mem_write16be:
    lsr     w3, w2, #8
    strb    w3, [x0, x1]
    add     x3, x1, #1
    strb    w2, [x0, x3]
    ret

mem_write32be:
    lsr     w3, w2, #24
    strb    w3, [x0, x1]
    add     x3, x1, #1
    lsr     w4, w2, #16
    strb    w4, [x0, x3]
    add     x3, x1, #2
    lsr     w4, w2, #8
    strb    w4, [x0, x3]
    add     x3, x1, #3
    strb    w2, [x0, x3]
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
    cmp     w0, #128
    b.hi    fat_init_fail
    sub     w1, w0, #1
    tst     w0, w1
    b.ne    fat_init_fail
    str     w0, [x20, #FAT_SEC_PER_CLUS]
    mov     x0, x19
    mov     x1, #BPB_RESERVED
    bl      mem_read16
    cbz     w0, fat_init_fail
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
    umull   x0, w0, w1
    ldr     w1, [x20, #FAT_START]
    add     x0, x0, x1
    lsr     x1, x0, #32
    cbnz    x1, fat_init_fail
    str     w0, [x20, #FAT_DATA_START]
    mov     x0, x19
    mov     x1, #BPB_TOTAL16
    bl      mem_read16
    cbnz    w0, fat_init_total
    mov     x0, x19
    mov     x1, #BPB_TOTAL32
    bl      mem_read32
fat_init_total:
    str     w0, [x20, #FAT_TOTAL_SECTORS]
    ldr     w1, [x20, #FAT_DATA_START]
    subs    w0, w0, w1
    b.ls    fat_init_fail
    ldr     w1, [x20, #FAT_SEC_PER_CLUS]
    udiv    w0, w0, w1
    cbz     w0, fat_init_fail
    add     x0, x0, #2
    mov     w1, #0x0ffffff0
    cmp     x0, x1
    b.hi    fat_init_fail
    ldr     w1, [x20, #FAT_SECTORS]
    lsl     x1, x1, #7
    cmp     x0, x1
    b.hi    fat_init_fail
    str     w0, [x20, #FAT_CLUSTER_END]
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
    ldr     w1, [x20, #FAT_CLUSTER_END]
    cmp     w0, w1
    b.hs    fat_init_fail
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
    ladr    x0, fat_state
    stp     xzr, xzr, [x0]
    stp     xzr, xzr, [x0, #16]
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
    ldr     w2, [x1, #FAT_CLUSTER_END]
    cmp     w0, w2
    b.hs    fat_cluster_invalid
    ldr     w2, [x1, #FAT_SEC_PER_CLUS]
    sub     w0, w0, #2
    mul     w0, w0, w2
    ldr     w2, [x1, #FAT_DATA_START]
    add     w0, w0, w2
    ret

fat_cluster_invalid:
    mov     w0, #0
    ret

fat_root_walk:
    stp     x29, x30, [sp, #-80]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    mov     x23, x0
    mov     x24, x1
    ladr    x0, fat_state
    ldr     w19, [x0, #FAT_ROOT_CLUSTER]
    ldr     w25, [x0, #FAT_CLUSTER_END]
fat_root_cluster:
    subs    w25, w25, #1
    b.ls    fat_root_error
    mov     w0, w19
    bl      fat_cluster_to_sector
    cbz     w0, fat_root_error
    mov     w20, w0
    ladr    x0, fat_state
    ldr     w21, [x0, #FAT_SEC_PER_CLUS]
fat_root_sector:
    mov     w0, w20
    ladr    x1, blk_buffer
    bl      blk_read
    cbnz    w0, fat_root_error
    ladr    x22, blk_buffer
    mov     w26, #(BLK_SECTOR_SIZE / DIR_ENTRY_SIZE)
fat_root_entry:
    ldrb    w0, [x22]
    cbz     w0, fat_root_done
    cmp     w0, #DIR_FREE
    b.eq    fat_root_next
    ldrb    w0, [x22, #DIR_ATTR]
    tst     w0, #DIR_ATTR_VOLUME
    b.ne    fat_root_next
    mov     x0, x22
    mov     x1, x24
    blr     x23
    cbnz    w0, fat_root_done
fat_root_next:
    add     x22, x22, #DIR_ENTRY_SIZE
    subs    w26, w26, #1
    b.ne    fat_root_entry
    add     w20, w20, #1
    subs    w21, w21, #1
    b.ne    fat_root_sector
    mov     w0, w19
    bl      fat_next_cluster
    mov     w19, w0
    mov     w1, #FAT_EOC
    cmp     w0, w1
    b.lo    fat_root_cluster
    mov     w0, #0
    b       fat_root_done
fat_root_error:
    mov     w0, #-1
fat_root_done:
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #80
    ret

files_scan:
    stp     x29, x30, [sp, #-16]!
    ladr    x0, files_count
    str     wzr, [x0]
    ladr    x0, files_collect
    mov     x1, #0
    bl      fat_root_walk
    tbz     w0, #31, files_scan_done
    ladr    x0, files_error_msg
    bl      uart_puts
files_scan_done:
    ladr    x0, files_count_label
    ladr    x1, files_count
    ldr     w1, [x1]
    bl      uart_field
    ladr    x0, uart_newline
    bl      uart_puts
    ldp     x29, x30, [sp], #16
    ret

files_collect:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    ladr    x9, files_count
    ldr     w10, [x9]
    cmp     w10, #FILES_MAX
    b.hs    files_collect_full
    ldrb    w11, [x19, #DIR_ATTR]
    and     w12, w11, #DIR_ATTR_LFN
    cmp     w12, #DIR_ATTR_LFN
    b.eq    files_collect_skip
    ladr    x20, files_table
    mov     x12, #FILES_ENTRY
    madd    x20, x10, x12, x20
    mov     w13, #0
    mov     w14, #0

files_collect_base:
    cmp     w13, #8
    b.hs    files_collect_dot
    ldrb    w15, [x19, w13, uxtw]
    cmp     w15, #0x20
    b.eq    files_collect_dot
    strb    w15, [x20, w14, uxtw]
    add     w14, w14, #1
    add     w13, w13, #1
    b       files_collect_base

files_collect_dot:
    ldrb    w15, [x19, #8]
    cmp     w15, #0x20
    b.eq    files_collect_name_end
    mov     w15, #'.'
    strb    w15, [x20, w14, uxtw]
    add     w14, w14, #1
    mov     w13, #8

files_collect_ext:
    cmp     w13, #DIR_NAME_LEN
    b.hs    files_collect_name_end
    ldrb    w15, [x19, w13, uxtw]
    cmp     w15, #0x20
    b.eq    files_collect_name_end
    strb    w15, [x20, w14, uxtw]
    add     w14, w14, #1
    add     w13, w13, #1
    b       files_collect_ext

files_collect_name_end:
    strb    wzr, [x20, w14, uxtw]
    ldrb    w9, [x19, #DIR_ATTR]
    strb    w9, [x20, #FILES_ATTR]
    mov     x0, x19
    mov     x1, #DIR_SIZE
    bl      mem_read32
    str     w0, [x20, #FILES_SIZE]
    ladr    x9, files_count
    ldr     w10, [x9]
    add     w10, w10, #1
    str     w10, [x9]

files_collect_skip:
    mov     w0, #0
    b       files_collect_done

files_collect_full:
    ladr    x0, files_full_msg
    bl      uart_puts
    mov     w0, #1

files_collect_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

files_draw:
    stp     x29, x30, [sp, #-80]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    str     x25, [sp, #64]
    mov     w19, w0
    mov     w20, w1
    mov     w21, w2
    mov     x22, x3
    ladr    x0, files_count
    ldr     w23, [x0]
    mov     w24, #0

files_draw_loop:
    cmp     w24, w23
    b.hs    files_draw_done
    mov     w9, #FILES_LINE_H
    madd    w25, w24, w9, w20
    add     w25, w25, #FILES_PAD_Y
    add     w9, w20, w21
    cmp     w25, w9
    b.gt    files_draw_done
    add     w0, w19, #FILES_PAD_X
    mov     w1, w25
    ladr    x2, files_table
    mov     x9, #FILES_ENTRY
    madd    x2, x24, x9, x2
    mov     w3, #FILES_TEXT_SIZE
    mov     x4, x22
    bl      font_text
    add     w24, w24, #1
    b       files_draw_loop

files_draw_done:
    ldr     x25, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #80
    ret

fat_list_root:
    stp     x29, x30, [sp, #-16]!
    ladr    x0, fat_list_entry
    mov     x1, #0
    bl      fat_root_walk
    tbz     w0, #31, fat_list_done
    ladr    x0, fat_error_msg
    bl      uart_puts
fat_list_done:
    ladr    x0, uart_newline
    bl      uart_puts
    ldp     x29, x30, [sp], #16
    ret
fat_list_entry:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x19, x0
    ladr    x0, fat_entry_prefix
    bl      uart_puts
    mov     x0, x19
    mov     w1, #DIR_NAME_LEN
    bl      uart_putn
    mov     x0, x19
    mov     x1, #DIR_SIZE
    bl      mem_read32
    mov     x1, x0
    ladr    x0, fat_size_label
    bl      uart_field
    mov     w0, #0
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

fat_find:
    stp     x29, x30, [sp, #-32]!
    str     x0, [sp, #16]
    str     xzr, [sp, #24]
    ladr    x0, fat_find_entry
    add     x1, sp, #16
    bl      fat_root_walk
    ldp     w1, w2, [sp, #24]
    ldp     x29, x30, [sp], #32
    ret
fat_find_entry:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     x19, x0
    mov     x20, x1
    ldrb    w1, [x19, #DIR_ATTR]
    tst     w1, #DIR_ATTR_DIR
    b.ne    fat_find_entry_none
    ldr     x1, [x20]
    mov     w2, #DIR_NAME_LEN
    bl      mem_equal
    cbz     w0, fat_find_entry_done
    mov     x0, x19
    mov     x1, #DIR_CLUSTER_HIGH
    bl      mem_read16
    mov     w21, w0
    mov     x0, x19
    mov     x1, #DIR_CLUSTER_LOW
    bl      mem_read16
    orr     w21, w0, w21, lsl #16
    and     w21, w21, #FAT_ENTRY_MASK
    mov     x0, x19
    mov     x1, #DIR_SIZE
    bl      mem_read32
    stp     w21, w0, [x20, #8]
    mov     w0, #1
    b       fat_find_entry_done
fat_find_entry_none:
    mov     w0, #0
fat_find_entry_done:
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
    cmp     x1, x0
    b.ls    mem_copy_loop
    add     x3, x0, x2
    cmp     x1, x3
    b.hs    mem_copy_loop
    add     x0, x0, x2
    add     x1, x1, x2
mem_copy_back:
    ldrb    w3, [x0, #-1]!
    strb    w3, [x1, #-1]!
    subs    w2, w2, #1
    b.ne    mem_copy_back
    ret

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
    cmp     w0, #1
    b.ne    fat_load_fail
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
    tbnz    w0, #31, fat_cat_error
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
    mov     w6, #8
blk_read_capacity:
    ldr     w2, [x19, #VIRTIO_REG_CONFIG_GEN]
    ldr     w3, [x19, #VIRTIO_REG_CONFIG]
    ldr     w4, [x19, #(VIRTIO_REG_CONFIG + 4)]
    ldr     w5, [x19, #VIRTIO_REG_CONFIG_GEN]
    cmp     w2, w5
    b.eq    blk_read_capacity_ready
    subs    w6, w6, #1
    b.ne    blk_read_capacity
    b       blk_read_fail
blk_read_capacity_ready:
    orr     x3, x3, x4, lsl #32
    cmp     x0, x3
    b.hs    blk_read_fail
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
    ladr    x20, blk_timeout_msg
    b       blk_read_stop

blk_read_ready:
    dmb     ishld
    sub     w5, w5, w21
    and     w5, w5, #VRING_IDX_MASK
    cmp     w5, #1
    b.ne    blk_read_bad
    and     w21, w21, #(BLK_QUEUE_SIZE - 1)
    add     x4, x4, x21, lsl #3
    ldr     w5, [x4, #VRING_USED_RING]
    cbnz    w5, blk_read_bad
    ldr     w5, [x4, #(VRING_USED_RING + 4)]
    cmp     w5, #(BLK_SECTOR_SIZE + 1)
    b.ne    blk_read_bad

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

blk_read_bad:
    ladr    x20, blk_read_fail_msg
blk_read_stop:
    mov     x0, x19
    bl      virtio_reset
    ladr    x0, blk_base
    str     xzr, [x0]
    mov     x0, x20
    bl      uart_puts
blk_read_fail:
    mov     w0, #1
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

virtio_input_init:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x21, #VIRTIO_MMIO_BASE
    mov     w22, #0

virtio_input_init_scan:
    cmp     w22, #2
    b.hs    virtio_input_init_done
    mov     x0, #VIRTIO_ID_INPUT
    mov     x1, x21
    bl      virtio_find_from
    cbz     x0, virtio_input_init_done
    mov     x19, x0
    add     x21, x19, #VIRTIO_MMIO_STRIDE
    ladr    x20, vin_tablet
    mov     x0, x19
    mov     w1, #VIN_CFG_EV_BITS
    mov     w2, #EV_ABS
    bl      vin_config_size
    cbnz    w0, virtio_input_init_kind
    ladr    x20, vin_keyboard

virtio_input_init_kind:
    ldr     x0, [x20, #VIN_BASE]
    cbnz    x0, virtio_input_init_scan
    str     x19, [x20, #VIN_BASE]
    mov     x0, x19
    add     x1, x20, #VIN_DESC
    add     x2, x20, #VIN_AVAIL
    add     x3, x20, #VIN_USED
    mov     x4, #VIRTIO_QUEUE_SIZE
    bl      virtio_setup
    cbnz    w0, virtio_input_fail
    mov     x0, x20
    bl      virtio_input_fill
    mov     x0, x19
    bl      virtio_driver_ok
    str     wzr, [x19, #VIRTIO_REG_QUEUE_NOTIFY]
    mov     x0, x19
    mov     x1, #VIRTIO_MMIO_BASE
    sub     x0, x0, x1
    lsr     x0, x0, #9
    add     w0, w0, #VIRTIO_MMIO_IRQ_BASE
    str     w0, [x20, #VIN_INTID]
    bl      gic_enable_irq
    ladr    x0, vin_tablet
    cmp     x20, x0
    b.ne    virtio_input_init_keyboard
    mov     w0, #VIN_KIND_TABLET
    strb    w0, [x20, #VIN_KIND]
    bl      virtio_input_init_abs
    ladr    x0, virtio_ready_msg
    bl      uart_puts
    add     w22, w22, #1
    b       virtio_input_init_scan

virtio_input_init_keyboard:
    mov     w0, #VIN_KIND_KEYBOARD
    strb    w0, [x20, #VIN_KIND]
    ladr    x0, virtio_keyboard_msg
    bl      uart_puts
    add     w22, w22, #1
    b       virtio_input_init_scan

virtio_input_init_done:
    ladr    x0, vin_tablet
    ldr     x0, [x0, #VIN_BASE]
    cbz     x0, virtio_input_fail_msg
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

virtio_input_fail:
    str     xzr, [x20, #VIN_BASE]
    str     wzr, [x20, #VIN_INTID]

virtio_input_fail_msg:
    ladr    x0, virtio_fail_msg
    bl      uart_puts
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

vin_config_size:
    add     x9, x0, #VIRTIO_REG_CONFIG
    strb    w1, [x9, #VIN_CFG_SELECT]
    strb    w2, [x9, #VIN_CFG_SUBSEL]
    dsb     sy
    ldrb    w0, [x9, #VIN_CFG_SIZE]
    ret

virtio_input_read_abs:
    ladr    x9, vin_tablet
    ldr     x9, [x9, #VIN_BASE]
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
    stp     x21, x22, [sp, #32]
    mov     x22, x0
    ldr     x19, [x22, #VIN_BASE]
    cbz     x19, virtio_input_poll_end
    ldr     w0, [x19, #VIRTIO_REG_INT_STATUS]
    str     w0, [x19, #VIRTIO_REG_INT_ACK]
    add     x0, x22, #VIN_USED
    ldrh    w20, [x0, #VRING_USED_IDX]
    dmb     ishld
    ldrh    w21, [x22, #VIN_LAST]
    sub     w1, w20, w21
    and     w1, w1, #VRING_IDX_MASK
    cmp     w1, #VIRTIO_QUEUE_SIZE
    b.hi    virtio_input_poll_baddesc

virtio_input_poll_loop:
    cmp     w21, w20
    b.eq    virtio_input_poll_kick
    and     w0, w21, #VIRTIO_QUEUE_MASK
    add     x1, x22, #VIN_USED
    add     x1, x1, #VRING_USED_RING
    add     x1, x1, x0, lsl #3
    ldr     w2, [x1, #4]
    cmp     w2, #VIRTIO_EVENT_SIZE
    b.ne    virtio_input_poll_baddesc
    ldr     w0, [x1]
    cmp     w0, #VIRTIO_QUEUE_SIZE
    b.hs    virtio_input_poll_baddesc
    add     x1, x22, #VIN_EVENTS
    add     x1, x1, x0, lsl #3
    ldrh    w6, [x1]
    ldrh    w7, [x1, #2]
    ldr     w8, [x1, #4]
    add     x1, x22, #VIN_AVAIL
    ldrh    w2, [x1, #VRING_AVAIL_IDX]
    and     w3, w2, #VIRTIO_QUEUE_MASK
    add     x4, x1, x3, lsl #1
    strh    w0, [x4, #VRING_AVAIL_RING]
    dmb     ish
    add     w2, w2, #1
    strh    w2, [x1, #VRING_AVAIL_IDX]
    mov     w0, w6
    mov     w1, w7
    mov     w2, w8
    ldrb    w3, [x22, #VIN_KIND]
    cmp     w3, #VIN_KIND_KEYBOARD
    b.eq    virtio_input_poll_key
    bl      mouse_apply
    b       virtio_input_poll_next

virtio_input_poll_key:
    bl      keyboard_apply

virtio_input_poll_next:
    add     w21, w21, #1
    and     w21, w21, #VRING_IDX_MASK
    b       virtio_input_poll_loop

virtio_input_poll_baddesc:
    mov     x0, x19
    bl      virtio_reset
    str     xzr, [x22, #VIN_BASE]
    str     wzr, [x22, #VIN_INTID]
    ladr    x0, vin_baddesc_pending
    mov     w1, #1
    strb    w1, [x0]
    b       virtio_input_poll_end

virtio_input_poll_kick:
    strh    w21, [x22, #VIN_LAST]
    dsb     sy
    str     wzr, [x19, #VIRTIO_REG_QUEUE_NOTIFY]

virtio_input_poll_end:
    ldp     x21, x22, [sp, #32]
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

mouse_get_buttons:
    ladr    x2, mouse_buttons
    ldrb    w0, [x2]
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
    cbnz    w2, mouse_click
    ladr    x3, release_record
    b       mouse_click_record

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
    ladr    x3, click_record

mouse_click_record:
    ladr    x4, mouse_x
    ldr     w0, [x4]
    ldr     w1, [x4, #4]
    str     w0, [x3, #CLICK_X]
    str     w1, [x3, #CLICK_Y]
    mov     w0, #1
    strb    w0, [x3, #CLICK_PENDING]
    b       mouse_apply_done

mouse_apply_syn:
    ladr    x3, mouse_dirty
    mov     w0, #1
    strb    w0, [x3]

mouse_apply_done:
    ldp     x29, x30, [sp], #16
    ret

virtio_input_fill:
    add     x1, x0, #VIN_EVENTS
    add     x2, x0, #VIN_AVAIL
    add     x0, x0, #VIN_DESC
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
    madd    x22, x22, x0, x20
    add     x22, x22, #(FONT_TABLE_DIR + FONT_TAG_OFFSET)
    mov     x0, x22
    bl      font_be32
    mov     w21, w0
    add     x0, x22, #4
    bl      font_be32
    mov     w1, w0
    add     x2, x21, x1
    ladr    x0, font_state
    ldr     w0, [x0, #FONT_FILESIZE]
    cmp     x2, x0
    b.hi    font_find_none
    add     x0, x20, x21
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
    add     x20, x0, x1
    add     x0, x19, #CMAP_NTABLES
    bl      font_be16
    mov     w21, w0
    add     x22, x19, #CMAP_RECORDS
    add     x0, x22, x21, lsl #3
    cmp     x0, x20
    b.hi    font_find_cmap4_none
font_find_cmap4_loop:
    cbz     w21, font_find_cmap4_none
    add     x0, x22, #CMAP_REC_OFFSET
    bl      font_be32
    add     x3, x19, x0
    add     x0, x3, #4
    cmp     x0, x20
    b.hi    font_find_cmap4_none
    mov     x0, x3
    bl      font_be16
    cmp     w0, #4
    b.eq    font_find_cmap4_hit
    add     x22, x22, #CMAP_RECORD_SIZE
    sub     w21, w21, #1
    b       font_find_cmap4_loop
font_find_cmap4_hit:
    mov     x22, x3
    add     x0, x22, #2
    bl      font_be16
    cmp     w0, #16
    b.lo    font_find_cmap4_none
    add     x21, x22, x0
    cmp     x21, x20
    b.hi    font_find_cmap4_none
    add     x0, x22, #CMAP4_SEGX2
    bl      font_be16
    cbz     w0, font_find_cmap4_none
    tbnz    w0, #0, font_find_cmap4_none
    add     x0, x22, x0, lsl #2
    add     x0, x0, #16
    cmp     x0, x21
    b.hi    font_find_cmap4_none
    ladr    x0, font_state
    str     x21, [x0, #FONT_CMAP4_END]
    mov     x0, x22
    b       font_find_cmap4_done
font_find_cmap4_none:
    mov     x0, #0
font_find_cmap4_done:
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
    add     x1, x0, #2
    ladr    x2, font_state
    ldr     x2, [x2, #FONT_CMAP4_END]
    cmp     x1, x2
    b.hi    font_glyph_index_none
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
    ladr    x1, font_state
    ldr     w1, [x1, #FONT_NGLYPHS]
    cmp     w19, w1
    b.hs    font_load_glyph_empty
    bl      font_glyph_offset
    mov     w20, w0
    add     w0, w19, #1
    bl      font_glyph_offset
    subs    w21, w0, w20
    b.ls    font_load_glyph_empty
    ladr    x0, font_state
    ldr     x22, [x0, #FONT_GLYF]
    add     x22, x22, x20
    ldr     w1, [x0, #(FONT_LENGTHS + 3 * 4)]
    add     x2, x20, x21
    cmp     x2, x1
    b.hi    font_load_glyph_outside
    cmp     w21, #GLYF_ENDPTS
    b.lo    font_load_glyph_outside
    add     x21, x22, x21
    str     x21, [sp, #96]
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
    add     x0, x25, x23, lsl #1
    add     x0, x0, #2
    cmp     x0, x21
    b.hi    font_load_glyph_outside
    mov     w26, #0
    mov     w20, #0

font_load_ends:
    cmp     w26, w23
    b.hs    font_load_ends_done
    add     x0, x25, x26, lsl #1
    bl      font_be16
    cmp     w0, w20
    b.lo    font_load_glyph_outside
    cmp     w0, #GLYPH_MAX_POINTS
    b.hs    font_load_glyph_outside
    add     w20, w0, #1
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
    cmp     x25, x21
    b.hi    font_load_glyph_outside
    ladr    x28, glyph_flags
    mov     w26, #0

font_load_flags:
    cmp     w26, w27
    b.hs    font_load_flags_done
    cmp     x25, x21
    b.hs    font_load_glyph_outside
    ldrb    w0, [x25], #1
    strb    w0, [x28, w26, uxtw]
    add     w26, w26, #1
    tst     w0, #PT_REPEAT
    b.eq    font_load_flags
    cmp     x25, x21
    b.hs    font_load_glyph_outside
    ldrb    w1, [x25], #1
    add     w2, w26, w1
    cmp     w2, w27
    b.hi    font_load_glyph_outside

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
font_load_coord_size:
    cmp     w26, w27
    b.hs    font_load_coord_check
    ldrb    w0, [x28, x26]
    mov     w1, #2
    tst     w0, #PT_X_SAME
    csel    w1, wzr, w1, ne
    tst     w0, #PT_X_SHORT
    mov     w2, #1
    csel    w1, w2, w1, ne
    add     w20, w20, w1
    mov     w1, #2
    tst     w0, #PT_Y_SAME
    csel    w1, wzr, w1, ne
    tst     w0, #PT_Y_SHORT
    csel    w1, w2, w1, ne
    add     w20, w20, w1
    add     w26, w26, #1
    b       font_load_coord_size
font_load_coord_check:
    add     x0, x25, x20
    cmp     x0, x21
    b.hi    font_load_glyph_outside
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
    str     w22, [sp, #124]
    mov     w0, w21
    bl      font_point_flag
    add     w27, w21, #1
    cbnz    w0, font_build_start_ready
    mov     w0, w22
    bl      font_point
    mov     w25, w0
    mov     w26, w1
    mov     w0, w22
    bl      font_point_flag
    cbz     w0, font_build_start_mid
    mov     w23, w25
    mov     w24, w26
    sub     w22, w22, #1
    b       font_build_start_first
font_build_start_mid:
    sxtw    x0, w23
    add     x0, x0, w25, sxtw
    asr     x23, x0, #1
    sxtw    x0, w24
    add     x0, x0, w26, sxtw
    asr     x24, x0, #1
font_build_start_first:
    mov     w27, w21
font_build_start_ready:
    mov     w25, w23
    mov     w26, w24

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
    ldr     w22, [sp, #124]
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

.macro blend_ch shift
    ubfx    w7, w2, #\shift, #8
    mul     w7, w7, w5
    ubfx    w8, w3, #\shift, #8
    madd    w7, w8, w6, w7
    add     w7, w7, #CH_ROUND
    add     w7, w7, w7, lsr #8
    lsr     w7, w7, #8
    orr     w9, w9, w7, lsl #\shift
.endm

fb_blend_pixel:
    cbz     x1, fb_blend_done
    mov     w4, #ALPHA_MAX
    cmp     w1, w4
    b.eq    fb_blend_opaque
    ldr     w3, [x0]
    add     w5, w1, #CH_ROUND
    lsr     w5, w5, #8
    mov     w6, #CH_MAX
    cmp     w5, w6
    csel    w5, w6, w5, hi
    sub     w6, w6, w5
    mov     w9, #0
    blend_ch CH_SHIFT_B
    blend_ch CH_SHIFT_G
    blend_ch CH_SHIFT_R
    blend_ch CH_SHIFT_A
    str     w9, [x0]
fb_blend_done:
    ret
fb_blend_opaque:
    orr     w2, w2, #0xff000000
    str     w2, [x0]
    ret

vg_cov_span:
    ladr    x9, vg_cov_xmin
    ldp     w2, w3, [x9]
    lsl     w2, w2, #FIX_SHIFT
    lsl     w3, w3, #FIX_SHIFT
    cmp     w0, w2
    csel    w0, w2, w0, lt
    cmp     w1, w3
    csel    w1, w3, w1, gt
    cmp     w0, w1
    b.ge    cov_span_done
    sub     w0, w0, w2
    sub     w1, w1, w2
    lsr     w2, w0, #FIX_SHIFT
    lsr     w3, w1, #FIX_SHIFT
    ladr    x9, vg_cov_buffer
    add     x9, x9, x2, lsl #2
    cmp     w2, w3
    b.ne    cov_span_multi
    sub     w5, w1, w0
    b       cov_span_tail_add

cov_span_multi:
    and     w5, w0, #0xffff
    mov     w6, #FIX_ONE
    sub     w5, w6, w5
    ldr     w7, [x9]
    add     w7, w7, w5
    str     w7, [x9], #4
    add     w2, w2, #1

cov_span_mid:
    cmp     w2, w3
    b.hs    cov_span_tail
    ldr     w7, [x9]
    add     w7, w7, w6
    str     w7, [x9], #4
    add     w2, w2, #1
    b       cov_span_mid

cov_span_tail:
    and     w5, w1, #0xffff
    cbz     w5, cov_span_done

cov_span_tail_add:
    ldr     w7, [x9]
    add     w7, w7, w5
    str     w7, [x9]

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
    mov     w10, #0x80000000
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
    cmp     w1, w10
    csel    w10, w1, w10, gt
    ldr     w1, [x0, #VG_EDGE_XBOT]
    cmp     w1, w9
    csel    w9, w1, w9, lt
    cmp     w1, w10
    csel    w10, w1, w10, gt
    add     w24, w24, #1
    b       font_fill_bounds

font_fill_rows:
    asr     w9, w9, #FIX_SHIFT
    asr     w10, w10, #FIX_SHIFT
    add     w10, w10, #1
    ladr    x0, fb_clip
    ldr     w1, [x0, #CLIP_X]
    cmp     w9, w1
    csel    w9, w1, w9, lt
    ldr     w1, [x0, #CLIP_X2]
    cmp     w10, w1
    csel    w10, w1, w10, gt
    subs    w1, w10, w9
    b.le    font_fill_end
    str     w1, [sp, #136]
    ladr    x0, vg_cov_xmin
    stp     w9, w10, [x0]
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
    ldr     w2, [sp, #136]

font_fill_clear:
    cmp     w1, w2
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
    bl      font_limit_report
    b       font_fill_end

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
    ldr     w24, [sp, #136]

font_fill_emit_loop:
    cmp     w12, w24
    b.hs    font_fill_next
    ladr    x0, vg_cov_buffer
    ldr     w13, [x0, w12, uxtw #2]
    cbz     w13, font_fill_emit_next
    lsr     w13, w13, #2
    mov     w0, #ALPHA_MAX
    cmp     w13, w0
    csel    w13, w0, w13, hi
    add     w14, w11, w12
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
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    ladr    x19, font_state
    mov     x0, x19
    mov     x1, #FONT_STATE_SIZE
    bl      power_wipe
    ladr    x0, font_name
    ladr    x1, font_buffer
    mov     w2, #FONT_MAX_SIZE
    bl      fat_load
    cmp     w0, #FONT_TABLE_DIR
    b.lo    font_init_fail
    str     w0, [x19, #FONT_FILESIZE]
    mov     w20, #0
    ladr    x21, font_table_tags
font_init_tables:
    add     x0, x21, x20, lsl #2
    bl      font_find_table
    cbz     x0, font_init_fail
    ladr    x2, font_table_min
    ldrb    w2, [x2, x20]
    cmp     w1, w2
    b.lo    font_init_fail
    str     x0, [x19, x20, lsl #3]
    add     x2, x19, #FONT_LENGTHS
    str     w1, [x2, x20, lsl #2]
    add     w20, w20, #1
    cmp     w20, #7
    b.lo    font_init_tables
    ldr     x0, [x19, #FONT_HEAD]
    add     x0, x0, #HEAD_UNITS_PER_EM
    bl      font_be16
    cbz     w0, font_init_fail
    str     w0, [x19, #FONT_UNITS]
    ldr     x0, [x19, #FONT_HEAD]
    add     x0, x0, #HEAD_INDEX_TO_LOC
    bl      font_be16
    cmp     w0, #1
    b.hi    font_init_fail
    str     w0, [x19, #FONT_LOCFMT]
    ldr     x0, [x19, #FONT_MAXP]
    add     x0, x0, #MAXP_NUM_GLYPHS
    bl      font_be16
    cbz     w0, font_init_fail
    str     w0, [x19, #FONT_NGLYPHS]
    add     w0, w0, #1
    ldr     w1, [x19, #FONT_LOCFMT]
    add     w1, w1, #1
    lsl     w0, w0, w1
    ldr     w1, [x19, #(FONT_LENGTHS + 2 * 4)]
    cmp     w0, w1
    b.hi    font_init_fail
    ldr     x0, [x19, #FONT_HHEA]
    add     x0, x0, #HHEA_NUM_HMETRICS
    bl      font_be16
    cbz     w0, font_init_fail
    ldr     w1, [x19, #FONT_NGLYPHS]
    cmp     w0, w1
    b.hi    font_init_fail
    str     w0, [x19, #FONT_NUMH]
    add     w0, w0, w1
    lsl     w0, w0, #1
    ldr     w1, [x19, #(FONT_LENGTHS + 5 * 4)]
    cmp     w0, w1
    b.hi    font_init_fail
    ldr     x0, [x19, #FONT_CMAP]
    ldr     w1, [x19, #(FONT_LENGTHS + 4 * 4)]
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
    b       font_init_done
font_init_fail:
    mov     x0, x19
    mov     x1, #FONT_STATE_SIZE
    bl      power_wipe
    ladr    x0, vg_scale
    str     wzr, [x0]
    ladr    x0, font_fail_msg
    bl      uart_puts
    mov     w0, #0
font_init_done:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

.section .text.boot

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
    cbz     w1, timer_tick_net
    ladr    x0, anim_pending
    mov     w1, #1
    strb    w1, [x0]

timer_tick_net:
    ladr    x0, net_timer_armed
    ldrb    w1, [x0]
    cbz     w1, timer_tick_blink
    ladr    x0, net_tick_pending
    ldrb    w1, [x0]
    cmp     w1, #255
    b.hs    timer_tick_blink
    add     w1, w1, #1
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

.section .text

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

console_take_flag:
    mrs     x2, daif
    msr     daifset, #DAIF_I
    mov     x1, x0
    ldrb    w0, [x1]
    strb    wzr, [x1]
    msr     daif, x2
    ret

click_take:
    ladr    x0, click_record
    b       click_take_record

release_take:
    ladr    x0, release_record

click_take_record:
    mrs     x3, daif
    msr     daifset, #DAIF_I
    mov     x4, x0
    ldrb    w0, [x4, #CLICK_PENDING]
    strb    wzr, [x4, #CLICK_PENDING]
    ldr     w1, [x4, #CLICK_X]
    ldr     w2, [x4, #CLICK_Y]
    msr     daif, x3
    ret

console_drain:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    mov     w19, #0
    mov     w20, #UART_RX_RING_SIZE
console_drain_rx:
    bl      uart_rx_get
    cmn     w0, #1
    b.eq    console_drain_overflow
    bl      console_echo
    subs    w20, w20, #1
    b.ne    console_drain_rx
console_drain_overflow:
    ladr    x0, uart_rx_overflow
    bl      console_take_flag
    cbz     w0, console_drain_keys
    ladr    x0, console_overflow_msg
    bl      uart_puts

console_drain_keys:
    bl      key_get
    cmn     w0, #1
    b.eq    console_drain_irq_msgs
    bl      win_key_top
    b       console_drain_keys

console_drain_irq_msgs:
    ladr    x0, key_overflow
    bl      console_take_flag
    cbz     w0, console_drain_irq_desc
    ladr    x0, key_overflow_msg
    bl      uart_puts

console_drain_irq_desc:
    ladr    x0, vin_baddesc_pending
    bl      console_take_flag
    cbz     w0, console_drain_irq_unexpected
    ladr    x0, virtio_baddesc_msg
    bl      uart_puts

console_drain_irq_unexpected:
    ladr    x0, irq_unexpected_pending
    bl      console_take_flag
    cbz     w0, console_drain_click
    ladr    x0, irq_label
    ladr    x1, irq_unexpected_id
    ldr     w1, [x1]
    bl      uart_field

console_drain_click:
    bl      click_take
    cbz     w0, console_drain_release
    stp     w1, w2, [sp, #32]
    mov     w0, w1
    mov     w1, w2
    bl      power_hit
    ladr    x1, power_armed
    strb    w0, [x1]
    cbnz    w0, console_drain_release
    ldp     w0, w1, [sp, #32]
    bl      win_click
    mov     w19, #1
console_drain_release:
    bl      release_take
    cbz     w0, console_drain_mouse
    stp     w1, w2, [sp, #32]
    ladr    x0, power_armed
    bl      console_take_flag
    cbz     w0, console_drain_button
    ldp     w0, w1, [sp, #32]
    bl      power_hit
    cbz     w0, console_drain_mouse
    bl      power_off
    b       console_drain_mouse

console_drain_button:
    ldp     w0, w1, [sp, #32]
    bl      win_button_release
    cbz     w0, console_drain_mouse
    mov     w19, #1

console_drain_mouse:
    ladr    x0, net_pending
    bl      console_take_flag
    cbz     w0, console_drain_net_tick
    bl      net_poll

console_drain_net_tick:
    ladr    x0, net_tick_pending
    bl      console_take_flag
    cbz     w0, console_drain_mouse_flag

console_drain_net_tick_loop:
    str     w0, [sp, #32]
    bl      net_tick
    ldr     w0, [sp, #32]
    subs    w0, w0, #1
    b.ne    console_drain_net_tick_loop

console_drain_mouse_flag:
    ladr    x0, mouse_dirty
    bl      console_take_flag
    cbz     w0, console_drain_anim
    bl      win_drag_move
    mov     w19, #1
console_drain_anim:
    ladr    x0, anim_pending
    bl      console_take_flag
    cbz     w0, console_drain_gui
    bl      anim_tick
    mov     w19, #1

console_drain_gui:
    bl      gui_refresh
    orr     w19, w19, w0

console_drain_repaint:
    cbz     w19, console_drain_blink
    bl      cursor_hide
    bl      win_repaint_render
    bl      cursor_show
    ladr    x0, fb_fade_dirty
    bl      console_take_flag
    cbnz    w0, console_drain_fade
    bl      win_repaint_present
    bl      cursor_present
    b       console_drain_blink

console_drain_fade:
    bl      dirty_reset
    bl      fb_present_all
    bl      cursor_present
console_drain_blink:
    ladr    x0, console_blink_pending
    bl      console_take_flag
    cbz     w0, console_drain_done
    bl      pmm_stack_check
    bl      dhcp_lease_check
    bl      console_draw_cursor
console_drain_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
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
    ladr    x1, gic_version
    ldrb    w1, [x1]
    cmp     w1, #GIC_VERSION_3
    b.eq    irq_entry_v3
    mov     x1, #GICC_BASE
    ldr     w19, [x1, #GICC_IAR]
    b       irq_entry_id

irq_entry_v3:
    mrs     x19, icc_iar1_el1

irq_entry_id:
    and     w0, w19, #GIC_INTID_MASK
    cmp     w0, #GIC_INTID_SPURIOUS
    b.eq    irq_return
    cmp     w0, #TIMER_INTID
    b.eq    irq_timer
    cmp     w0, #UART_INTID
    b.eq    irq_uart
    ladr    x1, vin_tablet
    ldr     w1, [x1, #VIN_INTID]
    cmp     w0, w1
    b.eq    irq_virtio
    ladr    x1, vin_keyboard
    ldr     w1, [x1, #VIN_INTID]
    cmp     w0, w1
    b.eq    irq_virtio_keyboard
    b       irq_other

irq_timer:
    bl      timer_tick
    b       irq_eoi

irq_uart:
    bl      uart_rx_isr
    b       irq_eoi

irq_virtio:
    ladr    x0, vin_tablet
    bl      virtio_input_poll
    b       irq_eoi

irq_virtio_keyboard:
    ladr    x0, vin_keyboard
    bl      virtio_input_poll

irq_eoi:
    ladr    x1, gic_version
    ldrb    w1, [x1]
    cmp     w1, #GIC_VERSION_3
    b.eq    irq_eoi_v3
    mov     x1, #GICC_BASE
    str     w19, [x1, #GICC_EOIR]
    b       irq_return

irq_eoi_v3:
    msr     icc_eoir1_el1, x19

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
    ladr    x3, gui_line_len
    ldr     w4, [x3]
    cmp     w0, #ASCII_BS
    b.eq    uart_putc_capture_bs
    cmp     w0, #ASCII_LF
    b.eq    uart_putc_capture_lf
    cmp     w0, #ASCII_SPACE
    b.lo    uart_putc_emit
    cmp     w4, #(GUI_LINE_MAX - 1)
    b.hs    uart_putc_emit
    ladr    x5, gui_line
    strb    w0, [x5, x4]
    add     w4, w4, #1
    str     w4, [x3]
    b       uart_putc_emit

uart_putc_capture_bs:
    cbz     w4, uart_putc_emit
    sub     w4, w4, #1
    str     w4, [x3]
    b       uart_putc_emit

uart_putc_capture_lf:
    stp     x29, x30, [sp, #-32]!
    stp     x0, x1, [sp, #16]
    bl      gui_line_end
    ldp     x0, x1, [sp, #16]
    ldp     x29, x30, [sp], #32

uart_putc_emit:
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
    mov     w1, #HEX_START_SHIFT
    b       uart_puthex_from

uart_puthex8:
    mov     w1, #HEX_SHIFT_STEP

uart_puthex_from:
    stp     x29, x30, [sp, #-48]!
    str     x19, [sp, #16]
    str     x20, [sp, #24]
    mov     x19, x0
    mov     w20, w1

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


net_init:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x0, #VIRTIO_ID_NET
    bl      virtio_find
    cbz     x0, net_init_missing
    mov     x19, x0
    ladr    x1, net_base
    str     x19, [x1]
    mov     w1, #VIRTIO_NET_F_MAC
    bl      virtio_negotiate
    cbnz    w0, net_init_fail
    tst     w1, #VIRTIO_NET_F_MAC
    b.eq    net_init_fail
    mov     x0, x19
    mov     w1, #NET_QUEUE_RX
    ladr    x2, net_rx_desc
    ladr    x3, net_rx_avail
    ladr    x4, net_rx_used
    mov     w5, #NET_QUEUE_SIZE
    bl      virtio_queue_setup
    cbnz    w0, net_init_fail
    mov     x0, x19
    mov     w1, #NET_QUEUE_TX
    ladr    x2, net_tx_desc
    ladr    x3, net_tx_avail
    ladr    x4, net_tx_used
    mov     w5, #NET_QUEUE_SIZE
    bl      virtio_queue_setup
    cbnz    w0, net_init_fail
    ladr    x1, net_mac
    mov     w2, #0

net_init_mac:
    add     x3, x19, #VIRTIO_REG_CONFIG
    ldrb    w4, [x3, x2]
    strb    w4, [x1, x2]
    add     w2, w2, #1
    cmp     w2, #6
    b.lo    net_init_mac
    mov     x0, x19
    bl      virtio_driver_ok
    mov     x0, x19
    mov     x1, #VIRTIO_MMIO_BASE
    sub     x0, x0, x1
    lsr     x0, x0, #9
    add     w0, w0, #VIRTIO_MMIO_IRQ_BASE
    ladr    x1, net_intid
    str     w0, [x1]
    bl      gic_enable_irq
    bl      net_rx_fill
    ladr    x0, net_ready_msg
    bl      uart_puts
    ladr    x0, net_mac
    bl      net_put_mac
    ladr    x0, uart_newline
    bl      uart_puts
    b       net_init_done

net_init_fail:
    mov     w0, #VIRTIO_STATUS_FAILED
    str     w0, [x19, #VIRTIO_REG_STATUS]
    dsb     sy
    ladr    x0, net_base
    str     xzr, [x0]
    ladr    x0, net_fail_msg
    bl      uart_puts
    b       net_init_done

net_init_missing:
    ladr    x0, net_missing_msg
    bl      uart_puts

net_init_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

net_start:
    ladr    x0, net_base
    ldr     x0, [x0]
    cbnz    x0, dhcp_discover
    ret

net_demo_resolved:
    cbz     w0, net_demo_resolved_none
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     w19, w0
    mov     w1, #HTTP_PORT
    ladr    x2, http_on_data
    bl      tcp_open
    cbz     x0, net_demo_resolved_tls
    ladr    x1, http_request
    mov     w2, #(http_request_end - http_request)
    bl      tcp_write

net_demo_resolved_tls:
    ladr    x0, tls_host
    mov     w1, #(tls_host_end - tls_host)
    ladr    x2, http_request
    mov     w3, #(http_request_end - http_request)
    ladr    x4, tls_demo_app
    bl      tls_configure
    mov     w0, w19
    mov     w1, #HTTPS_PORT
    bl      tls_connect
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32

net_demo_resolved_none:
    ret

net_put_mac:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     w20, #0

net_put_mac_loop:
    ldrb    w0, [x19, x20]
    bl      uart_puthex8
    add     w20, w20, #1
    cmp     w20, #6
    b.hs    net_put_mac_done
    mov     w0, #0x3a
    bl      uart_putc
    b       net_put_mac_loop

net_put_mac_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

net_rx_fill:
    ladr    x0, net_rx_desc
    ladr    x1, net_rx_avail
    ladr    x2, net_rx_buf
    mov     w3, #0

net_rx_fill_loop:
    mov     x4, #VRING_DESC_SIZE
    madd    x4, x3, x4, x0
    mov     x5, #NET_BUF_SIZE
    madd    x6, x3, x5, x2
    str     x6, [x4, #VRING_DESC_ADDR]
    str     w5, [x4, #VRING_DESC_LEN]
    mov     w6, #VRING_DESC_F_WRITE
    strh    w6, [x4, #VRING_DESC_FLAGS]
    strh    wzr, [x4, #VRING_DESC_NEXT]
    add     x4, x1, #VRING_AVAIL_RING
    strh    w3, [x4, x3, lsl #1]
    add     w3, w3, #1
    cmp     w3, #NET_QUEUE_SIZE
    b.lo    net_rx_fill_loop
    dsb     sy
    strh    w3, [x1, #VRING_AVAIL_IDX]
    dsb     sy
    ladr    x0, net_base
    ldr     x0, [x0]
    mov     w1, #NET_QUEUE_RX
    str     w1, [x0, #VIRTIO_REG_QUEUE_NOTIFY]
    ret

net_rx_requeue:
    ladr    x1, net_rx_avail
    ldrh    w2, [x1, #VRING_AVAIL_IDX]
    and     w3, w2, #NET_QUEUE_MASK
    add     x4, x1, #VRING_AVAIL_RING
    strh    w0, [x4, x3, lsl #1]
    dsb     sy
    add     w2, w2, #1
    strh    w2, [x1, #VRING_AVAIL_IDX]
    dsb     sy
    ladr    x0, net_base
    ldr     x0, [x0]
    mov     w1, #NET_QUEUE_RX
    str     w1, [x0, #VIRTIO_REG_QUEUE_NOTIFY]
    ret

net_poll:
    ladr    x0, net_base
    ldr     x0, [x0]
    cbz     x0, net_poll_none
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]

net_poll_loop:
    ladr    x19, net_rx_used
    dsb     sy
    ldrh    w0, [x19, #VRING_USED_IDX]
    dmb     ishld
    ladr    x1, net_rx_last
    ldrh    w1, [x1]
    cmp     w0, w1
    b.eq    net_poll_done
    and     w2, w1, #NET_QUEUE_MASK
    add     x3, x19, #VRING_USED_RING
    add     x3, x3, x2, lsl #3
    ldr     w20, [x3]
    ldr     w2, [x3, #4]
    add     w1, w1, #1
    ladr    x3, net_rx_last
    strh    w1, [x3]
    cmp     w20, #NET_QUEUE_SIZE
    b.hs    net_poll_bad
    cmp     w2, #NET_BUF_SIZE
    b.hi    net_poll_badlen
    subs    w2, w2, #NET_HDR_SIZE
    b.le    net_poll_requeue
    ladr    x0, net_rx_buf
    mov     x1, #NET_BUF_SIZE
    madd    x0, x20, x1, x0
    add     x0, x0, #NET_HDR_SIZE
    mov     w1, w2
    bl      net_receive

net_poll_requeue:
    mov     w0, w20
    bl      net_rx_requeue
    b       net_poll_loop

net_poll_badlen:
    ladr    x0, net_rx_badlen_msg
    bl      uart_puts
    b       net_poll_requeue

net_poll_bad:
    ladr    x0, virtio_baddesc_msg
    bl      uart_puts

net_poll_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32

net_poll_none:
    ret

irq_other:
    ladr    x1, net_intid
    ldr     w1, [x1]
    cmp     w0, w1
    b.ne    irq_unexpected
    ladr    x0, net_base
    ldr     x0, [x0]
    cbz     x0, irq_eoi
    ldr     w1, [x0, #VIRTIO_REG_INT_STATUS]
    str     w1, [x0, #VIRTIO_REG_INT_ACK]
    ladr    x0, net_pending
    mov     w1, #1
    strb    w1, [x0]
    b       irq_eoi

irq_unexpected:
    ladr    x0, irq_unexpected_id
    str     w19, [x0]
    ladr    x0, irq_unexpected_pending
    mov     w1, #1
    strb    w1, [x0]
    b       irq_eoi

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
    ladr    x1, click_record
    ldrb    w2, [x1, #CLICK_PENDING]
    cbnz    w2, console_pending_yes
    ladr    x1, release_record
    ldrb    w2, [x1, #CLICK_PENDING]
    cbnz    w2, console_pending_yes
    ladr    x1, mouse_dirty
    ldrb    w2, [x1]
    cbnz    w2, console_pending_yes
    ladr    x1, console_blink_pending
    ldrb    w2, [x1]
    cbnz    w2, console_pending_yes
    ladr    x1, anim_pending
    ldrb    w2, [x1]
    cbnz    w2, console_pending_yes
    ladr    x1, net_pending
    ldrb    w2, [x1]
    cbnz    w2, console_pending_yes
    ladr    x1, net_tick_pending
    ldrb    w2, [x1]
    cbnz    w2, console_pending_yes
    ladr    x1, key_head
    ldr     w2, [x1]
    ladr    x1, key_tail
    ldr     w3, [x1]
    cmp     w2, w3
    b.ne    console_pending_yes
    mov     w0, #0
    ret

console_pending_yes:
    mov     w0, #1
    ret

net_tick:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    bl      dhcp_tick
    bl      dns_tick
    bl      tcp_tick
    mov     w19, w0
    ladr    x0, dhcp_state
    ldrb    w0, [x0]
    cmp     w0, #DHCP_STATE_DISCOVER
    ccmp    w0, #DHCP_STATE_REQUEST, #4, ne
    cset    w0, eq
    orr     w19, w19, w0
    ladr    x0, dns_state
    ldrb    w0, [x0]
    cmp     w0, #DNS_STATE_SENT
    cset    w0, eq
    orr     w19, w19, w0
    ladr    x0, net_timer_armed
    strb    w19, [x0]
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

net_send:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    add     w19, w0, #NET_HDR_SIZE
    ladr    x1, net_tx_avail
    ldrh    w2, [x1, #VRING_AVAIL_IDX]
    ladr    x3, net_tx_used
    mov     x4, #NET_TIMEOUT

net_send_owner:
    dsb     sy
    ldrh    w5, [x3, #VRING_USED_IDX]
    cmp     w5, w2
    b.eq    net_send_owned
    subs    x4, x4, #1
    b.ne    net_send_owner
    ladr    x0, net_tx_busy_msg
    bl      uart_puts
    b       net_send_done

net_send_owned:
    ladr    x0, net_tx_buf
    str     xzr, [x0]
    str     wzr, [x0, #8]
    ladr    x1, net_tx_desc
    str     x0, [x1, #VRING_DESC_ADDR]
    str     w19, [x1, #VRING_DESC_LEN]
    strh    wzr, [x1, #VRING_DESC_FLAGS]
    strh    wzr, [x1, #VRING_DESC_NEXT]
    ladr    x1, net_tx_avail
    ldrh    w2, [x1, #VRING_AVAIL_IDX]
    add     x3, x1, #VRING_AVAIL_RING
    and     w4, w2, #NET_QUEUE_MASK
    strh    wzr, [x3, x4, lsl #1]
    dsb     sy
    add     w2, w2, #1
    and     w2, w2, #VRING_IDX_MASK
    strh    w2, [x1, #VRING_AVAIL_IDX]
    dsb     sy
    ladr    x0, net_base
    ldr     x0, [x0]
    mov     w1, #NET_QUEUE_TX
    str     w1, [x0, #VIRTIO_REG_QUEUE_NOTIFY]
    ladr    x3, net_tx_used
    mov     x4, #NET_TIMEOUT

net_send_wait:
    dsb     sy
    ldrh    w5, [x3, #VRING_USED_IDX]
    cmp     w5, w2
    b.eq    net_send_done
    subs    x4, x4, #1
    b.ne    net_send_wait
    ladr    x0, net_tx_timeout_msg
    bl      uart_puts

net_send_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

net_frame_begin:
    ladr    x2, net_tx_buf
    add     x2, x2, #NET_HDR_SIZE
    ldr     w3, [x0]
    str     w3, [x2, #ETH_DST]
    ldrh    w3, [x0, #4]
    strh    w3, [x2, #(ETH_DST + 4)]
    ladr    x3, net_mac
    ldr     w4, [x3]
    str     w4, [x2, #ETH_SRC]
    ldrh    w4, [x3, #4]
    strh    w4, [x2, #(ETH_SRC + 4)]
    mov     x0, x2
    mov     x3, x1
    mov     x1, #ETH_TYPE
    mov     w2, w3
    stp     x29, x30, [sp, #-32]!
    str     x0, [sp, #16]
    bl      mem_write16be
    ldr     x0, [sp, #16]
    ldp     x29, x30, [sp], #32
    add     x0, x0, #ETH_HDR_SIZE
    ret

net_arp_build:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     w20, w1
    mov     x0, x19
    mov     x1, #ARP_HTYPE
    mov     w2, #1
    bl      mem_write16be
    mov     x0, x19
    mov     x1, #ARP_PTYPE
    mov     w2, #ETH_TYPE_IP
    bl      mem_write16be
    mov     w0, #6
    strb    w0, [x19, #ARP_HLEN]
    mov     w0, #4
    strb    w0, [x19, #ARP_PLEN]
    mov     x0, x19
    mov     x1, #ARP_OPER
    mov     w2, w20
    bl      mem_write16be
    ladr    x1, net_mac
    ldr     w2, [x1]
    str     w2, [x19, #ARP_SHA]
    ldrh    w2, [x1, #4]
    strh    w2, [x19, #(ARP_SHA + 4)]
    mov     x0, x19
    mov     x1, #ARP_SPA
    ladr    x2, net_ip
    ldr     w2, [x2]
    bl      mem_write32be
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

net_arp_request:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     w20, w0
    ladr    x0, net_mac_broadcast
    mov     w1, #ETH_TYPE_ARP
    bl      net_frame_begin
    mov     x19, x0
    mov     w1, #ARP_OP_REQUEST
    bl      net_arp_build
    str     wzr, [x19, #ARP_THA]
    strh    wzr, [x19, #(ARP_THA + 4)]
    mov     x0, x19
    mov     x1, #ARP_TPA
    mov     w2, w20
    bl      mem_write32be
    mov     w0, #(ETH_HDR_SIZE + ARP_SIZE)
    bl      net_send
    ladr    x0, net_state
    mov     w1, #NET_STATE_ARP_SENT
    strb    w1, [x0]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

net_receive:
    cmp     w1, #ETH_HDR_SIZE
    b.lo    net_receive_done
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     w20, w1
    mov     x1, #ETH_TYPE
    bl      mem_read16be
    cmp     w0, #ETH_TYPE_ARP
    b.eq    net_receive_arp
    cmp     w0, #ETH_TYPE_IP
    b.eq    net_receive_ip
    b       net_receive_end

net_receive_arp:
    add     x0, x19, #ETH_HDR_SIZE
    sub     w1, w20, #ETH_HDR_SIZE
    bl      net_arp_handle
    b       net_receive_end

net_receive_ip:
    add     x0, x19, #ETH_HDR_SIZE
    sub     w1, w20, #ETH_HDR_SIZE
    bl      net_ip_handle

net_receive_end:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32

net_receive_done:
    ret

net_arp_handle:
    cmp     w1, #ARP_SIZE
    b.lo    net_arp_handle_ret
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     x1, #ARP_TPA
    bl      mem_read32be
    ladr    x1, net_ip
    ldr     w1, [x1]
    cbz     w1, net_arp_handle_done
    cmp     w0, w1
    b.ne    net_arp_handle_done
    mov     x0, x19
    mov     x1, #ARP_OPER
    bl      mem_read16be
    cmp     w0, #ARP_OP_REPLY
    b.eq    net_arp_reply_in
    cmp     w0, #ARP_OP_REQUEST
    b.ne    net_arp_handle_done
    add     x0, x19, #ARP_SHA
    mov     w1, #ETH_TYPE_ARP
    bl      net_frame_begin
    mov     x20, x0
    mov     w1, #ARP_OP_REPLY
    bl      net_arp_build
    ldr     w0, [x19, #ARP_SHA]
    str     w0, [x20, #ARP_THA]
    ldrh    w0, [x19, #(ARP_SHA + 4)]
    strh    w0, [x20, #(ARP_THA + 4)]
    ldr     w0, [x19, #ARP_SPA]
    str     w0, [x20, #ARP_TPA]
    mov     w0, #(ETH_HDR_SIZE + ARP_SIZE)
    bl      net_send
    b       net_arp_handle_done

net_arp_reply_in:
    mov     x0, x19
    mov     x1, #ARP_SPA
    bl      mem_read32be
    ladr    x1, net_gw
    ldr     w1, [x1]
    cmp     w0, w1
    b.ne    net_arp_handle_done
    ladr    x1, net_gw_mac
    ldr     w0, [x19, #ARP_SHA]
    str     w0, [x1]
    ldrh    w0, [x19, #(ARP_SHA + 4)]
    strh    w0, [x1, #4]
    ladr    x0, net_arp_msg
    bl      uart_puts
    ladr    x0, net_gw_mac
    bl      net_put_mac
    ladr    x0, uart_newline
    bl      uart_puts
    ladr    x0, net_state
    mov     w1, #NET_STATE_ARP_OK
    strb    w1, [x0]
    bl      net_ping_send

net_arp_handle_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32

net_arp_handle_ret:
    ret

net_checksum:
    mov     w2, #0

net_checksum_seed:
net_checksum_loop:
    cmp     w1, #2
    b.lo    net_checksum_tail
    ldrb    w3, [x0], #1
    ldrb    w4, [x0], #1
    orr     w3, w4, w3, lsl #8
    add     w2, w2, w3
    sub     w1, w1, #2
    b       net_checksum_loop

net_checksum_tail:
    cbz     w1, net_checksum_fold
    ldrb    w3, [x0]
    add     w2, w2, w3, lsl #8

net_checksum_fold:
    lsr     w3, w2, #16
    cbz     w3, net_checksum_done
    and     w2, w2, #0xffff
    add     w2, w2, w3
    b       net_checksum_fold

net_checksum_done:
    mvn     w0, w2
    and     w0, w0, #0xffff
    ret

rng_init:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x0, #VIRTIO_ID_RNG
    bl      virtio_find
    cbz     x0, rng_init_fail
    mov     x19, x0
    ladr    x1, rng_base
    str     x19, [x1]
    mov     x0, x19
    ladr    x1, rng_desc
    ladr    x2, rng_avail
    ladr    x3, rng_used
    mov     x4, #RNG_QUEUE_SIZE
    bl      virtio_setup
    cbnz    w0, rng_init_fail
    mov     x0, x19
    bl      virtio_driver_ok
    ladr    x0, rng_seed
    mov     w1, #8
    bl      rng_get
    cbnz    w0, rng_init_fail
    ladr    x0, rng_seed
    ldr     x0, [x0]
    ladr    x1, net_rand_state
    ldr     x2, [x1]
    eor     x2, x2, x0
    str     x2, [x1]
    ladr    x0, rng_ready_msg
    bl      uart_puts
    mov     w0, #0
    b       rng_init_done

rng_init_fail:
    ladr    x1, rng_base
    str     xzr, [x1]
    ladr    x0, rng_fail_msg
    bl      uart_puts
    mov     w0, #1

rng_init_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

rng_get:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x20, x0
    mov     w21, w1
    ladr    x19, rng_base
    ldr     x19, [x19]
    cbz     x19, rng_get_fail
    cmp     w21, #RNG_BUF_SIZE
    b.hi    rng_get_fail

rng_get_more:
    cbz     w21, rng_get_ok
    ladr    x2, rng_desc
    ladr    x1, rng_buf
    str     x1, [x2, #VRING_DESC_ADDR]
    str     w21, [x2, #VRING_DESC_LEN]
    mov     w3, #VRING_DESC_F_WRITE
    strh    w3, [x2, #VRING_DESC_FLAGS]
    strh    wzr, [x2, #VRING_DESC_NEXT]
    ladr    x4, rng_used
    ldrh    w22, [x4, #VRING_USED_IDX]
    ladr    x4, rng_avail
    ldrh    w5, [x4, #VRING_AVAIL_IDX]
    and     w6, w5, #(RNG_QUEUE_SIZE - 1)
    add     x7, x4, x6, lsl #1
    strh    wzr, [x7, #VRING_AVAIL_RING]
    add     w5, w5, #1
    and     w5, w5, #VRING_IDX_MASK
    dmb     ishst
    strh    w5, [x4, #VRING_AVAIL_IDX]
    dsb     sy
    str     wzr, [x19, #VIRTIO_REG_QUEUE_NOTIFY]
    ldr     x1, =BLK_TIMEOUT

rng_get_wait:
    ladr    x4, rng_used
    ldrh    w5, [x4, #VRING_USED_IDX]
    cmp     w5, w22
    b.ne    rng_get_ready
    subs    x1, x1, #1
    b.ne    rng_get_wait
    b       rng_get_fail

rng_get_ready:
    dmb     ishld
    and     w22, w22, #(RNG_QUEUE_SIZE - 1)
    add     x4, x4, x22, lsl #3
    ldr     w5, [x4, #VRING_USED_RING]
    cbnz    w5, rng_get_fail
    ldr     w5, [x4, #(VRING_USED_RING + 4)]
    cbz     w5, rng_get_fail
    cmp     w5, w21
    b.hi    rng_get_fail
    mov     w22, w5
    ldr     w0, [x19, #VIRTIO_REG_INT_STATUS]
    str     w0, [x19, #VIRTIO_REG_INT_ACK]
    ladr    x0, rng_buf
    mov     x1, x20
    mov     w2, w22
    bl      mem_copy
    add     x20, x20, x22
    sub     w21, w21, w22
    b       rng_get_more

rng_get_ok:
    ladr    x0, rng_buf
    mov     w1, #RNG_BUF_SIZE
    bl      mem_wipe
    mov     w0, #0
    b       rng_get_done

rng_get_fail:
    ladr    x0, rng_buf
    mov     w1, #RNG_BUF_SIZE
    bl      mem_wipe
    mov     w0, #1

rng_get_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

net_random:
    ladr    x1, net_rand_state
    ldr     x0, [x1]
    mrs     x2, cntvct_el0
    eor     x0, x0, x2
    cbnz    x0, net_random_step
    ldr     x0, =NET_RAND_SEED

net_random_step:
    eor     x0, x0, x0, lsl #13
    eor     x0, x0, x0, lsr #7
    eor     x0, x0, x0, lsl #17
    str     x0, [x1]
    lsr     x0, x0, #32
    ret

net_pseudo_sum:
    lsr     w4, w0, #16
    and     w0, w0, #0xffff
    add     w4, w4, w0
    lsr     w0, w1, #16
    and     w1, w1, #0xffff
    add     w4, w4, w0
    add     w4, w4, w1
    add     w4, w4, w2
    add     w0, w4, w3
    ret

net_sum_check:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     w20, w1
    ladr    x0, net_last_src
    ldr     w0, [x0]
    ladr    x1, net_last_dst
    ldr     w1, [x1]
    mov     w3, w20
    bl      net_pseudo_sum
    mov     w2, w0
    mov     x0, x19
    mov     w1, w20
    bl      net_checksum_seed
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

net_sum_fail:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x19, x0
    ladr    x0, net_sum_msg
    bl      uart_puts
    mov     x0, x19
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

net_ip_begin:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     w20, w1
    mov     w21, w2
    mov     w22, w3
    mov     w1, #ETH_TYPE_IP
    bl      net_frame_begin
    mov     x19, x0
    mov     w0, #IP_VERSION_4
    strb    w0, [x19, #IP_VER_IHL]
    strb    wzr, [x19, #1]
    mov     x0, x19
    mov     x1, #IP_TOTAL_LEN
    add     w2, w22, #IP_HDR_SIZE
    bl      mem_write16be
    ladr    x2, net_ip_id
    ldrh    w3, [x2]
    add     w3, w3, #1
    strh    w3, [x2]
    mov     x0, x19
    mov     x1, #IP_ID
    mov     w2, w3
    bl      mem_write16be
    strh    wzr, [x19, #IP_FLAGS]
    mov     w0, #IP_TTL_DEFAULT
    strb    w0, [x19, #IP_TTL]
    strb    w21, [x19, #IP_PROTO]
    strh    wzr, [x19, #IP_CHECKSUM]
    mov     x0, x19
    mov     x1, #IP_SRC
    ladr    x2, net_ip
    ldr     w2, [x2]
    bl      mem_write32be
    mov     x0, x19
    mov     x1, #IP_DST
    mov     w2, w20
    bl      mem_write32be
    mov     x0, x19
    mov     w1, #IP_HDR_SIZE
    bl      net_checksum
    mov     w2, w0
    mov     x0, x19
    mov     x1, #IP_CHECKSUM
    bl      mem_write16be
    add     x0, x19, #IP_HDR_SIZE
    add     w1, w22, #(ETH_HDR_SIZE + IP_HDR_SIZE)
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

net_udp_begin:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     w20, w2
    mov     w21, w3
    mov     w22, w4
    mov     w2, #IP_PROTO_UDP
    add     w3, w4, #UDP_HDR_SIZE
    bl      net_ip_begin
    mov     x19, x0
    mov     w22, w1
    mov     x0, x19
    mov     x1, #UDP_SRC
    mov     w2, w20
    bl      mem_write16be
    mov     x0, x19
    mov     x1, #UDP_DST
    mov     w2, w21
    bl      mem_write16be
    mov     x0, x19
    mov     x1, #UDP_LEN
    sub     w2, w22, #(ETH_HDR_SIZE + IP_HDR_SIZE)
    bl      mem_write16be
    strh    wzr, [x19, #UDP_CHECKSUM]
    add     x0, x19, #UDP_HDR_SIZE
    mov     w1, w22
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

net_ping_send:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    ladr    x0, net_gw_mac
    ladr    x1, net_gw
    ldr     w1, [x1]
    mov     w2, #IP_PROTO_ICMP
    mov     w3, #(ICMP_HDR_SIZE + ICMP_PAYLOAD)
    bl      net_ip_begin
    mov     x20, x0
    mov     w19, w1
    mov     w0, #ICMP_ECHO_REQUEST
    strb    w0, [x20, #ICMP_TYPE]
    strb    wzr, [x20, #ICMP_CODE]
    strh    wzr, [x20, #ICMP_CHECKSUM]
    mov     x0, x20
    mov     x1, #ICMP_ID
    mov     w2, #ICMP_ECHO_ID
    bl      mem_write16be
    mov     x0, x20
    mov     x1, #ICMP_SEQ
    mov     w2, #1
    bl      mem_write16be
    mov     w0, #0

net_ping_payload:
    add     w1, w0, #0x61
    add     x2, x20, #ICMP_HDR_SIZE
    strb    w1, [x2, x0]
    add     w0, w0, #1
    cmp     w0, #ICMP_PAYLOAD
    b.lo    net_ping_payload
    mov     x0, x20
    mov     w1, #(ICMP_HDR_SIZE + ICMP_PAYLOAD)
    bl      net_checksum
    mov     w2, w0
    mov     x0, x20
    mov     x1, #ICMP_CHECKSUM
    bl      mem_write16be
    mov     w0, w19
    bl      net_send
    ladr    x0, net_state
    mov     w1, #NET_STATE_PING_SENT
    strb    w1, [x0]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

net_ip_handle:
    cmp     w1, #IP_HDR_SIZE
    b.lo    net_ip_handle_ret
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     x19, x0
    mov     w20, w1
    ldrb    w0, [x19, #IP_VER_IHL]
    lsr     w1, w0, #4
    cmp     w1, #4
    b.ne    net_ip_handle_done
    and     w21, w0, #IP_IHL_MASK
    lsl     w21, w21, #2
    cmp     w21, #IP_HDR_SIZE
    b.lo    net_ip_handle_done
    mov     x0, x19
    mov     x1, #IP_TOTAL_LEN
    bl      mem_read16be
    cmp     w0, w20
    b.hi    net_ip_handle_done
    mov     w20, w0
    cmp     w20, w21
    b.lo    net_ip_handle_done
    mov     x0, x19
    mov     w1, w21
    bl      net_checksum
    cbnz    w0, net_ip_handle_bad_ip
    mov     x0, x19
    mov     x1, #IP_FLAGS
    bl      mem_read16be
    mov     w1, #IP_FRAGMENT_MASK
    tst     w0, w1
    b.ne    net_ip_handle_fragment
    mov     x0, x19
    mov     x1, #IP_DST
    bl      mem_read32be
    ladr    x1, net_last_dst
    str     w0, [x1]
    ldr     w1, =NET_IP_BROADCAST
    cmp     w0, w1
    b.eq    net_ip_handle_proto
    ladr    x1, net_ip
    ldr     w1, [x1]
    cbz     w1, net_ip_handle_proto
    cmp     w0, w1
    b.ne    net_ip_handle_done

net_ip_handle_proto:
    mov     x0, x19
    mov     x1, #IP_SRC
    bl      mem_read32be
    ladr    x1, net_last_src
    str     w0, [x1]
    ldrb    w0, [x19, #IP_PROTO]
    cmp     w0, #IP_PROTO_UDP
    b.eq    net_ip_handle_udp
    cmp     w0, #IP_PROTO_TCP
    b.eq    net_ip_handle_tcp
    cmp     w0, #IP_PROTO_ICMP
    b.ne    net_ip_handle_done
    sub     w1, w20, w21
    cmp     w1, #ICMP_HDR_SIZE
    b.lo    net_ip_handle_done
    add     x0, x19, x21
    mov     w2, #0
    bl      net_checksum_seed
    cbnz    w0, net_ip_handle_bad_icmp
    ldrb    w0, [x19, x21]
    cmp     w0, #ICMP_ECHO_REPLY
    b.ne    net_ip_handle_done
    add     x0, x19, x21
    ldrb    w1, [x0, #ICMP_CODE]
    cbnz    w1, net_ip_handle_done
    mov     x1, #ICMP_ID
    bl      mem_read16be
    mov     w1, #ICMP_ECHO_ID
    cmp     w0, w1
    b.ne    net_ip_handle_done
    add     x0, x19, x21
    mov     x1, #ICMP_SEQ
    bl      mem_read16be
    cmp     w0, #1
    b.ne    net_ip_handle_done
    ladr    x0, net_last_src
    ldr     w0, [x0]
    ladr    x1, net_gw
    ldr     w1, [x1]
    cmp     w0, w1
    b.ne    net_ip_handle_done
    ladr    x0, net_state
    ldrb    w1, [x0]
    cmp     w1, #NET_STATE_PING_SENT
    b.ne    net_ip_handle_done
    mov     w1, #NET_STATE_PING_OK
    strb    w1, [x0]
    ladr    x0, net_ping_msg
    bl      uart_puts
    ladr    x0, dns_test_name
    ladr    x1, net_demo_resolved
    bl      dns_resolve
    b       net_ip_handle_done

net_ip_handle_udp:
    add     x0, x19, x21
    sub     w1, w20, w21
    bl      net_udp_handle
    b       net_ip_handle_done

net_ip_handle_tcp:
    add     x0, x19, x21
    sub     w1, w20, w21
    mov     w2, #IP_PROTO_TCP
    bl      net_sum_check
    cbnz    w0, net_ip_handle_bad_tcp
    add     x0, x19, x21
    sub     w1, w20, w21
    bl      tcp_handle
    b       net_ip_handle_done

net_ip_handle_fragment:
    ladr    x0, net_fragment_msg
    bl      uart_puts
    b       net_ip_handle_done

net_ip_handle_bad_ip:
    ladr    x0, net_sum_ip_name
    b       net_ip_handle_bad

net_ip_handle_bad_icmp:
    ladr    x0, net_sum_icmp_name
    b       net_ip_handle_bad

net_ip_handle_bad_tcp:
    ladr    x0, net_sum_tcp_name

net_ip_handle_bad:
    bl      net_sum_fail

net_ip_handle_done:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48

net_ip_handle_ret:
    ret

net_udp_handle:
    cmp     w1, #UDP_HDR_SIZE
    b.lo    net_udp_handle_ret
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     w20, w1
    mov     x1, #UDP_LEN
    bl      mem_read16be
    cmp     w0, #UDP_HDR_SIZE
    b.lo    net_udp_handle_done
    cmp     w0, w20
    b.hi    net_udp_handle_done
    mov     w20, w0
    ldrh    w0, [x19, #UDP_CHECKSUM]
    cbz     w0, net_udp_handle_port
    mov     x0, x19
    mov     w1, w20
    mov     w2, #IP_PROTO_UDP
    bl      net_sum_check
    cbz     w0, net_udp_handle_port
    ladr    x0, net_sum_udp_name
    bl      net_sum_fail
    b       net_udp_handle_done

net_udp_handle_port:
    mov     x0, x19
    mov     x1, #UDP_SRC
    bl      mem_read16be
    ladr    x1, net_last_sport
    str     w0, [x1]
    mov     x0, x19
    mov     x1, #UDP_DST
    bl      mem_read16be
    ladr    x1, dns_local_port
    ldr     w1, [x1]
    cmp     w0, w1
    b.eq    net_udp_handle_dns
    cmp     w0, #UDP_PORT_DHCP_CLIENT
    b.ne    net_udp_handle_done
    add     x0, x19, #UDP_HDR_SIZE
    sub     w1, w20, #UDP_HDR_SIZE
    bl      dhcp_handle
    b       net_udp_handle_done

net_udp_handle_dns:
    add     x0, x19, #UDP_HDR_SIZE
    sub     w1, w20, #UDP_HDR_SIZE
    bl      dns_handle

net_udp_handle_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32

net_udp_handle_ret:
    ret


dhcp_build:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     w21, w0
    ladr    x0, net_mac_broadcast
    ldr     w1, =NET_IP_BROADCAST
    mov     w2, #UDP_PORT_DHCP_CLIENT
    mov     w3, #UDP_PORT_DHCP_SERVER
    mov     w4, #DHCP_MIN_SIZE
    bl      net_udp_begin
    mov     x19, x0
    mov     w20, w1
    mov     x1, #0

dhcp_build_clear:
    str     xzr, [x19, x1]
    add     x1, x1, #8
    cmp     x1, #DHCP_MIN_SIZE
    b.lo    dhcp_build_clear
    mov     w0, #DHCP_BOOTREQUEST
    strb    w0, [x19, #DHCP_OP]
    mov     w0, #1
    strb    w0, [x19, #DHCP_HTYPE]
    mov     w0, #6
    strb    w0, [x19, #DHCP_HLEN]
    mov     x0, x19
    mov     x1, #DHCP_XID
    ladr    x2, dhcp_xid
    ldr     w2, [x2]
    bl      mem_write32be
    mov     x0, x19
    mov     x1, #DHCP_FLAGS
    mov     w2, #DHCP_FLAG_BROADCAST
    bl      mem_write16be
    ladr    x1, net_mac
    ldr     w2, [x1]
    str     w2, [x19, #DHCP_CHADDR]
    ldrh    w2, [x1, #4]
    strh    w2, [x19, #(DHCP_CHADDR + 4)]
    mov     x0, x19
    mov     x1, #DHCP_COOKIE
    ldr     w2, =DHCP_MAGIC
    bl      mem_write32be
    add     x0, x19, #DHCP_OPTIONS
    mov     w1, #DHCP_OPT_MSG_TYPE
    strb    w1, [x0], #1
    mov     w1, #1
    strb    w1, [x0], #1
    strb    w21, [x0], #1
    cmp     w21, #DHCP_REQUEST
    b.ne    dhcp_build_params
    ladr    x1, dhcp_renewing
    ldrb    w1, [x1]
    cbz     w1, dhcp_build_select
    ladr    x1, net_ip
    ldr     w2, [x1]
    mov     x1, #DHCP_CIADDR
    stp     x0, x19, [sp, #-16]!
    mov     x0, x19
    bl      mem_write32be
    ldp     x0, x19, [sp], #16
    b       dhcp_build_params

dhcp_build_select:
    mov     w1, #DHCP_OPT_REQ_IP
    strb    w1, [x0], #1
    mov     w1, #4
    strb    w1, [x0], #1
    ladr    x1, dhcp_offer
    ldr     w2, [x1]
    mov     x1, #0
    stp     x0, x19, [sp, #-16]!
    bl      mem_write32be
    ldp     x0, x19, [sp], #16
    add     x0, x0, #4
    mov     w1, #DHCP_OPT_SERVER_ID
    strb    w1, [x0], #1
    mov     w1, #4
    strb    w1, [x0], #1
    ladr    x1, dhcp_server
    ldr     w2, [x1]
    mov     x1, #0
    stp     x0, x19, [sp, #-16]!
    bl      mem_write32be
    ldp     x0, x19, [sp], #16
    add     x0, x0, #4

dhcp_build_params:
    mov     w1, #DHCP_OPT_PARAM_LIST
    strb    w1, [x0], #1
    mov     w1, #3
    strb    w1, [x0], #1
    mov     w1, #DHCP_OPT_SUBNET
    strb    w1, [x0], #1
    mov     w1, #DHCP_OPT_ROUTER
    strb    w1, [x0], #1
    mov     w1, #DHCP_OPT_DNS
    strb    w1, [x0], #1
    mov     w1, #DHCP_OPT_END
    strb    w1, [x0], #1
    mov     w0, w20
    bl      net_send
    ladr    x0, dhcp_timer
    str     wzr, [x0]
    bl      net_timer_arm
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

dhcp_lease_arm:
    ladr    x0, dhcp_lease_new
    ldr     w1, [x0]
    ladr    x2, dhcp_renew_at
    stp     xzr, xzr, [x2]
    cbz     w1, dhcp_lease_arm_done
    cmn     w1, #1
    b.eq    dhcp_lease_arm_done
    mrs     x3, cntfrq_el0
    cbz     x3, dhcp_lease_arm_done
    mrs     x4, cntvct_el0
    mul     x5, x1, x3
    add     x6, x4, x5
    lsr     x5, x5, #1
    add     x5, x4, x5
    stp     x5, x6, [x2]

dhcp_lease_arm_done:
    ret

dhcp_lease_check:
    ladr    x0, dhcp_renew_at
    ldp     x1, x2, [x0]
    cbz     x2, dhcp_lease_arm_done
    mrs     x3, cntvct_el0
    cmp     x3, x2
    b.hs    dhcp_lease_expired
    cbz     x1, dhcp_lease_arm_done
    cmp     x3, x1
    b.lo    dhcp_lease_arm_done
    ladr    x4, dhcp_state
    ldrb    w5, [x4]
    cmp     w5, #DHCP_STATE_BOUND
    b.ne    dhcp_lease_arm_done
    str     xzr, [x0]
    stp     x29, x30, [sp, #-16]!
    ladr    x0, dhcp_renewing
    mov     w1, #1
    strb    w1, [x0]
    ladr    x0, dhcp_tries
    strb    wzr, [x0]
    ladr    x0, dhcp_renew_msg
    bl      uart_puts
    mov     w0, #DHCP_REQUEST
    bl      dhcp_build
    ladr    x0, dhcp_state
    mov     w1, #DHCP_STATE_REQUEST
    strb    w1, [x0]
    ldp     x29, x30, [sp], #16
    ret

dhcp_lease_expired:
    stp     xzr, xzr, [x0]
    stp     x29, x30, [sp, #-16]!
    ladr    x0, dhcp_renewing
    strb    wzr, [x0]
    ladr    x0, dhcp_tries
    strb    wzr, [x0]
    ladr    x0, dhcp_expired_msg
    bl      uart_puts
    ldp     x29, x30, [sp], #16
    b       dhcp_discover

dhcp_discover:
    stp     x29, x30, [sp, #-16]!
    ladr    x0, net_ip
    str     wzr, [x0]
    bl      net_random
    ladr    x1, dhcp_xid
    str     w0, [x1]
    mov     w0, #DHCP_DISCOVER
    bl      dhcp_build
    ladr    x0, dhcp_state
    mov     w1, #DHCP_STATE_DISCOVER
    strb    w1, [x0]
    ldp     x29, x30, [sp], #16
    ret

dhcp_tick:
    ladr    x0, dhcp_state
    ldrb    w1, [x0]
    cbz     w1, dhcp_tick_ret
    cmp     w1, #DHCP_STATE_BOUND
    b.eq    dhcp_tick_ret
    ladr    x2, dhcp_timer
    ldr     w3, [x2]
    add     w3, w3, #1
    str     w3, [x2]
    cmp     w3, #DHCP_RETRY_TICKS
    b.lo    dhcp_tick_ret
    stp     x29, x30, [sp, #-16]!
    ladr    x2, dhcp_tries
    ldrb    w3, [x2]
    add     w3, w3, #1
    strb    w3, [x2]
    cmp     w3, #DHCP_RETRY_MAX
    b.hs    dhcp_tick_giveup
    cmp     w1, #DHCP_STATE_REQUEST
    b.eq    dhcp_tick_request
    bl      dhcp_discover
    b       dhcp_tick_done

dhcp_tick_request:
    mov     w0, #DHCP_REQUEST
    bl      dhcp_build
    b       dhcp_tick_done

dhcp_tick_giveup:
    ladr    x1, dhcp_renewing
    ldrb    w2, [x1]
    cbnz    w2, dhcp_tick_giveup_renew
    strb    wzr, [x0]
    ladr    x0, dhcp_timeout_msg
    bl      uart_puts
    b       dhcp_tick_done

dhcp_tick_giveup_renew:
    strb    wzr, [x1]
    mov     w2, #DHCP_STATE_BOUND
    strb    w2, [x0]
    ladr    x0, dhcp_renew_fail_msg
    bl      uart_puts

dhcp_tick_done:
    ldp     x29, x30, [sp], #16

dhcp_tick_ret:
    ret

dhcp_handle:
    cmp     w1, #DHCP_OPTIONS
    b.lo    dhcp_handle_ret
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    mov     x19, x0
    mov     w20, w1
    ldrb    w0, [x19, #DHCP_OP]
    cmp     w0, #DHCP_BOOTREPLY
    b.ne    dhcp_handle_done
    ladr    x0, net_last_sport
    ldr     w0, [x0]
    cmp     w0, #UDP_PORT_DHCP_SERVER
    b.ne    dhcp_handle_done
    ladr    x1, net_mac
    ldr     w0, [x19, #DHCP_CHADDR]
    ldr     w2, [x1]
    cmp     w0, w2
    b.ne    dhcp_handle_done
    ldrh    w0, [x19, #(DHCP_CHADDR + 4)]
    ldrh    w2, [x1, #4]
    cmp     w0, w2
    b.ne    dhcp_handle_done
    mov     x0, x19
    mov     x1, #DHCP_XID
    bl      mem_read32be
    ladr    x1, dhcp_xid
    ldr     w1, [x1]
    cmp     w0, w1
    b.ne    dhcp_handle_done
    mov     x0, x19
    mov     x1, #DHCP_COOKIE
    bl      mem_read32be
    ldr     w1, =DHCP_MAGIC
    cmp     w0, w1
    b.ne    dhcp_handle_done
    mov     w21, #0
    mov     w22, #0
    mov     w23, #0
    mov     w24, #0
    ladr    x0, dhcp_lease_new
    str     wzr, [x0]
    mov     x0, x19
    mov     x1, #DHCP_YIADDR
    bl      mem_read32be
    str     x0, [sp, #-16]!
    mov     w2, #DHCP_OPTIONS

dhcp_handle_opts:
    cmp     w2, w20
    b.hs    dhcp_handle_parsed
    ldrb    w3, [x19, x2]
    cmp     w3, #DHCP_OPT_END
    b.eq    dhcp_handle_parsed
    cbz     w3, dhcp_handle_pad
    add     w4, w2, #1
    cmp     w4, w20
    b.hs    dhcp_handle_parsed
    ldrb    w5, [x19, x4]
    add     w6, w4, #1
    add     w7, w6, w5
    cmp     w7, w20
    b.hi    dhcp_handle_parsed
    cmp     w3, #DHCP_OPT_MSG_TYPE
    b.ne    dhcp_handle_opt_ip
    cmp     w5, #1
    b.ne    dhcp_handle_next
    ldrb    w21, [x19, x6]
    b       dhcp_handle_next

dhcp_handle_opt_ip:
    cmp     w5, #4
    b.lo    dhcp_handle_next
    stp     x2, x7, [sp, #-16]!
    str     x3, [sp, #-16]!
    mov     x0, x19
    mov     x1, x6
    bl      mem_read32be
    ldr     x3, [sp], #16
    ldp     x2, x7, [sp], #16
    cmp     w3, #DHCP_OPT_SERVER_ID
    csel    w22, w0, w22, eq
    cmp     w3, #DHCP_OPT_ROUTER
    csel    w23, w0, w23, eq
    cmp     w3, #DHCP_OPT_DNS
    csel    w24, w0, w24, eq
    cmp     w3, #DHCP_OPT_LEASE
    b.ne    dhcp_handle_opt_mask
    ladr    x1, dhcp_lease_new
    str     w0, [x1]
    b       dhcp_handle_next

dhcp_handle_opt_mask:
    cmp     w3, #DHCP_OPT_SUBNET
    b.ne    dhcp_handle_next
    ladr    x1, net_mask
    str     w0, [x1]
    b       dhcp_handle_next

dhcp_handle_pad:
    add     w2, w2, #1
    b       dhcp_handle_opts

dhcp_handle_next:
    mov     w2, w7
    b       dhcp_handle_opts

dhcp_handle_parsed:
    ldr     x0, [sp], #16
    ladr    x1, dhcp_state
    ldrb    w2, [x1]
    cmp     w21, #DHCP_OFFER
    b.eq    dhcp_handle_offer
    cmp     w2, #DHCP_STATE_REQUEST
    b.ne    dhcp_handle_done
    ladr    x1, dhcp_server
    ldr     w1, [x1]
    cmp     w22, w1
    b.ne    dhcp_handle_done
    cmp     w21, #DHCP_NAK
    b.eq    dhcp_handle_nak
    cmp     w21, #DHCP_ACK
    b.ne    dhcp_handle_done
    ladr    x1, dhcp_offer
    ldr     w1, [x1]
    cmp     w0, w1
    b.ne    dhcp_handle_done
    ladr    x1, dhcp_state
    mov     w2, #DHCP_STATE_BOUND
    strb    w2, [x1]
    ladr    x1, net_ip
    str     w0, [x1]
    ladr    x1, net_gw
    str     w23, [x1]
    ladr    x1, net_dns
    str     w24, [x1]
    bl      dhcp_lease_arm
    ladr    x0, dhcp_renewing
    bl      console_take_flag
    cbz     w0, dhcp_handle_bound
    ladr    x0, dhcp_renewed_msg
    bl      uart_puts
    b       dhcp_handle_done

dhcp_handle_nak:
    ladr    x0, dhcp_nak_msg
    bl      uart_puts
    ladr    x0, dhcp_renewing
    strb    wzr, [x0]
    bl      dhcp_discover
    b       dhcp_handle_done

dhcp_handle_bound:
    ladr    x0, dhcp_msg
    bl      uart_puts
    ladr    x0, net_ip
    ldr     w0, [x0]
    bl      net_put_ip
    ladr    x0, dhcp_gw_label
    bl      uart_puts
    mov     w0, w23
    bl      net_put_ip
    ladr    x0, dhcp_dns_label
    bl      uart_puts
    mov     w0, w24
    bl      net_put_ip
    ladr    x0, dhcp_mask_label
    bl      uart_puts
    ladr    x0, net_mask
    ldr     w0, [x0]
    bl      net_put_ip
    ladr    x0, uart_newline
    bl      uart_puts
    cbz     w23, dhcp_handle_done
    mov     w0, w23
    bl      net_arp_request
    b       dhcp_handle_done

dhcp_handle_offer:
    cmp     w2, #DHCP_STATE_DISCOVER
    b.ne    dhcp_handle_done
    cbz     w22, dhcp_handle_done
    ladr    x1, dhcp_offer
    str     w0, [x1]
    ladr    x1, dhcp_server
    str     w22, [x1]
    mov     w0, #DHCP_REQUEST
    bl      dhcp_build
    ladr    x1, dhcp_state
    mov     w2, #DHCP_STATE_REQUEST
    strb    w2, [x1]

dhcp_handle_done:
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64

dhcp_handle_ret:
    ret


dns_resolve:
    ladr    x2, dns_name
    stp     x0, x1, [x2]
    ladr    x1, dns_tries
    strb    wzr, [x1]

dns_query:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x21, x0
    ladr    x0, dns_state
    mov     w1, #DNS_STATE_SENT
    strb    w1, [x0]
    ladr    x0, dns_timer
    str     wzr, [x0]
    bl      net_timer_arm
    ladr    x22, net_tx_buf
    add     x22, x22, #(NET_HDR_SIZE + ETH_HDR_SIZE + IP_HDR_SIZE + UDP_HDR_SIZE)
    mov     x0, x21
    add     x1, x22, #DNS_HDR_SIZE
    bl      dns_encode_name
    mov     x19, x0
    mov     x1, #0
    mov     w2, #DNS_TYPE_A
    bl      mem_write16be
    mov     x0, x19
    mov     x1, #2
    mov     w2, #DNS_CLASS_IN
    bl      mem_write16be
    add     x19, x19, #4
    sub     x20, x19, x22
    sub     w2, w20, #DNS_HDR_SIZE
    mov     w3, #DNS_QUESTION_MAX
    cmp     w2, w3
    csel    w2, w3, w2, hi
    ladr    x1, dns_question_len
    str     w2, [x1]
    add     x0, x22, #DNS_HDR_SIZE
    ladr    x1, dns_question
    bl      mem_copy
    bl      net_random
    and     w0, w0, #TCP_PORT_MASK
    mov     w2, #TCP_LOCAL_PORT_BASE
    add     w2, w2, w0
    ladr    x0, dns_local_port
    str     w2, [x0]
    ladr    x0, net_gw_mac
    ladr    x1, net_dns
    ldr     w1, [x1]
    mov     w3, #UDP_PORT_DNS
    mov     w4, w20
    bl      net_udp_begin
    mov     w20, w1
    bl      net_random
    and     w2, w0, #0xffff
    ladr    x1, dns_id
    strh    w2, [x1]
    mov     x0, x22
    mov     x1, #DNS_ID
    bl      mem_write16be
    mov     x0, x22
    mov     x1, #DNS_FLAGS
    mov     w2, #DNS_FLAG_RD
    bl      mem_write16be
    mov     x0, x22
    mov     x1, #DNS_QDCOUNT
    mov     w2, #1
    bl      mem_write16be
    strh    wzr, [x22, #DNS_ANCOUNT]
    str     wzr, [x22, #8]
    mov     w0, w20
    bl      net_send
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

dns_encode_name:
    mov     x2, x1
    add     x1, x1, #1
    mov     w3, #0

dns_encode_loop:
    ldrb    w4, [x0], #1
    cbz     w4, dns_encode_end
    cmp     w4, #0x2e
    b.eq    dns_encode_dot
    strb    w4, [x1], #1
    add     w3, w3, #1
    cmp     w3, #63
    b.lo    dns_encode_loop
    b       dns_encode_end

dns_encode_dot:
    strb    w3, [x2]
    mov     x2, x1
    add     x1, x1, #1
    mov     w3, #0
    b       dns_encode_loop

dns_encode_end:
    strb    w3, [x2]
    strb    wzr, [x1], #1
    mov     x0, x1
    ret

dns_skip_name:
    cmp     x0, x1
    b.hs    dns_skip_name_over
    ldrb    w2, [x0]
    cbz     w2, dns_skip_name_end
    and     w3, w2, #0xc0
    cmp     w3, #0xc0
    b.eq    dns_skip_name_ptr
    add     x0, x0, #1
    add     x0, x0, x2
    b       dns_skip_name

dns_skip_name_ptr:
    add     x0, x0, #2
    ret

dns_skip_name_end:
    add     x0, x0, #1
    ret

dns_skip_name_over:
    mov     x0, x1
    ret

dns_handle:
    cmp     w1, #DNS_HDR_SIZE
    b.lo    dns_handle_ret
    stp     x29, x30, [sp, #-80]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    str     x23, [sp, #48]
    mov     x19, x0
    mov     x23, x0
    add     x20, x19, x1
    ladr    x0, dns_state
    ldrb    w0, [x0]
    cmp     w0, #DNS_STATE_SENT
    b.ne    dns_handle_done
    mov     x0, x19
    mov     x1, #DNS_ID
    bl      mem_read16be
    ladr    x1, dns_id
    ldrh    w1, [x1]
    cmp     w0, w1
    b.ne    dns_handle_done
    ladr    x0, net_last_src
    ldr     w0, [x0]
    ladr    x1, net_dns
    ldr     w1, [x1]
    cmp     w0, w1
    b.ne    dns_handle_done
    ladr    x0, net_last_sport
    ldr     w0, [x0]
    cmp     w0, #UDP_PORT_DNS
    b.ne    dns_handle_done
    mov     x0, x19
    mov     x1, #DNS_FLAGS
    bl      mem_read16be
    tst     w0, #DNS_FLAG_QR
    b.eq    dns_handle_done
    ands    w21, w0, #DNS_RCODE_MASK
    b.ne    dns_handle_rcode
    mov     x0, x19
    mov     x1, #DNS_QDCOUNT
    bl      mem_read16be
    mov     w21, w0
    mov     x0, x19
    mov     x1, #DNS_ANCOUNT
    bl      mem_read16be
    mov     w22, w0
    cmp     w21, #1
    b.ne    dns_handle_done
    ladr    x1, dns_question_len
    ldr     w2, [x1]
    add     x0, x19, #DNS_HDR_SIZE
    add     x1, x0, x2
    cmp     x1, x20
    b.hi    dns_handle_done
    ladr    x1, dns_question
    bl      mem_equal
    cbz     w0, dns_handle_done
    ladr    x1, dns_target
    ladr    x2, dns_question
    ladr    x3, dns_question_len
    ldr     w3, [x3]
    add     x3, x2, x3
    str     x2, [x1]
    stp     x2, x3, [x1, #8]
    add     x0, x19, #DNS_HDR_SIZE

dns_handle_questions:
    cbz     w21, dns_handle_answers
    cmp     x0, x20
    b.hs    dns_handle_noanswer
    mov     x1, x20
    bl      dns_skip_name
    add     x0, x0, #4
    sub     w21, w21, #1
    b       dns_handle_questions

dns_handle_answers:
    cbz     w22, dns_handle_noanswer
    add     x1, x0, #12
    cmp     x1, x20
    b.hi    dns_handle_noanswer
    str     x0, [sp, #56]
    mov     x1, x20
    bl      dns_skip_name
    add     x1, x0, #10
    cmp     x1, x20
    b.hi    dns_handle_noanswer
    mov     x19, x0
    mov     x1, #8
    bl      mem_read16be
    add     x1, x19, #10
    add     x1, x1, x0
    cmp     x1, x20
    b.hi    dns_handle_noanswer
    str     x1, [sp, #64]
    mov     w21, w0
    mov     x0, x19
    mov     x1, #2
    bl      mem_read16be
    cmp     w0, #DNS_CLASS_IN
    b.ne    dns_handle_answer_next
    ldr     x0, [sp, #56]
    mov     x1, x23
    mov     x2, x20
    ladr    x3, dns_target
    ldp     x4, x5, [x3, #8]
    ldr     x3, [x3]
    bl      dns_name_equal
    cbz     w0, dns_handle_answer_next
    mov     x0, x19
    mov     x1, #0
    bl      mem_read16be
    cmp     w0, #DNS_TYPE_CNAME
    b.ne    dns_handle_answer_a
    ladr    x2, dns_target
    add     x3, x19, #10
    str     x3, [x2]
    stp     x23, x20, [x2, #8]
    b       dns_handle_answer_next

dns_handle_answer_a:
    cmp     w0, #DNS_TYPE_A
    b.ne    dns_handle_answer_next
    cmp     w21, #4
    b.ne    dns_handle_answer_next
    mov     x0, x19
    mov     x1, #10
    bl      mem_read32be
    ladr    x1, dns_result
    str     w0, [x1]
    ladr    x1, dns_state
    mov     w2, #DNS_STATE_DONE
    strb    w2, [x1]
    mov     x21, x0
    ladr    x0, dns_msg
    bl      uart_puts
    ladr    x0, dns_name
    ldr     x0, [x0]
    bl      uart_puts
    ladr    x0, dns_equals
    bl      uart_puts
    mov     w0, w21
    bl      net_put_ip
    ladr    x0, uart_newline
    bl      uart_puts
    mov     w0, w21
    bl      dns_notify
    b       dns_handle_done

dns_handle_answer_next:
    ldr     x0, [sp, #64]
    sub     w22, w22, #1
    b       dns_handle_answers

dns_handle_rcode:
    ladr    x0, dns_state
    strb    wzr, [x0]
    ladr    x0, dns_rcode_msg
    bl      uart_puts
    mov     x0, x21
    bl      uart_putdec
    ladr    x0, uart_newline
    bl      uart_puts
    mov     w0, #0
    bl      dns_notify
    b       dns_handle_done

dns_handle_noanswer:
    ladr    x0, dns_state
    strb    wzr, [x0]
    ladr    x0, dns_noanswer_msg
    bl      uart_puts
    mov     w0, #0
    bl      dns_notify

dns_handle_done:
    ldr     x23, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #80

dns_handle_ret:
    ret

dns_notify:
    ladr    x1, dns_handler
    ldr     x1, [x1]
    cbz     x1, dns_notify_none
    br      x1

dns_notify_none:
    ret

dns_name_equal:
    mov     w6, #DNS_NAME_HOPS
    mov     w7, #DNS_NAME_HOPS

dns_name_equal_ptr_a:
    cmp     x0, x2
    b.hs    dns_name_equal_no
    ldrb    w8, [x0]
    and     w9, w8, #0xc0
    cmp     w9, #0xc0
    b.ne    dns_name_equal_ptr_b
    add     x9, x0, #1
    cmp     x9, x2
    b.hs    dns_name_equal_no
    ldrb    w9, [x0, #1]
    and     w8, w8, #0x3f
    orr     w8, w9, w8, lsl #8
    add     x0, x1, x8
    subs    w6, w6, #1
    b.eq    dns_name_equal_no
    b       dns_name_equal_ptr_a

dns_name_equal_ptr_b:
    cmp     x3, x5
    b.hs    dns_name_equal_no
    ldrb    w9, [x3]
    and     w10, w9, #0xc0
    cmp     w10, #0xc0
    b.ne    dns_name_equal_label
    add     x10, x3, #1
    cmp     x10, x5
    b.hs    dns_name_equal_no
    ldrb    w10, [x3, #1]
    and     w9, w9, #0x3f
    orr     w9, w10, w9, lsl #8
    add     x3, x4, x9
    subs    w7, w7, #1
    b.eq    dns_name_equal_no
    b       dns_name_equal_ptr_b

dns_name_equal_label:
    tst     w8, #0xc0
    b.ne    dns_name_equal_no
    tst     w9, #0xc0
    b.ne    dns_name_equal_no
    cmp     w8, w9
    b.ne    dns_name_equal_no
    cbz     w8, dns_name_equal_yes
    add     x0, x0, #1
    add     x3, x3, #1
    add     x10, x0, x8
    cmp     x10, x2
    b.hi    dns_name_equal_no
    add     x10, x3, x8
    cmp     x10, x5
    b.hi    dns_name_equal_no

dns_name_equal_byte:
    ldrb    w10, [x0], #1
    ldrb    w11, [x3], #1
    sub     w12, w10, #0x41
    cmp     w12, #25
    b.hi    dns_name_equal_byte_b
    add     w10, w10, #0x20

dns_name_equal_byte_b:
    sub     w12, w11, #0x41
    cmp     w12, #25
    b.hi    dns_name_equal_byte_cmp
    add     w11, w11, #0x20

dns_name_equal_byte_cmp:
    cmp     w10, w11
    b.ne    dns_name_equal_no
    subs    w8, w8, #1
    b.ne    dns_name_equal_byte
    b       dns_name_equal_ptr_a

dns_name_equal_yes:
    mov     w0, #1
    ret

dns_name_equal_no:
    mov     w0, #0
    ret

dns_tick:
    ladr    x0, dns_state
    ldrb    w1, [x0]
    cmp     w1, #DNS_STATE_SENT
    b.ne    dns_tick_ret
    ladr    x2, dns_timer
    ldr     w3, [x2]
    add     w3, w3, #1
    str     w3, [x2]
    cmp     w3, #DNS_RETRY_TICKS
    b.lo    dns_tick_ret
    stp     x29, x30, [sp, #-16]!
    ladr    x2, dns_tries
    ldrb    w3, [x2]
    add     w3, w3, #1
    strb    w3, [x2]
    cmp     w3, #DNS_RETRY_MAX
    b.hs    dns_tick_giveup
    ladr    x0, dns_name
    ldr     x0, [x0]
    bl      dns_query
    b       dns_tick_done

dns_tick_giveup:
    strb    wzr, [x0]
    ladr    x0, dns_fail_msg
    bl      uart_puts
    mov     w0, #0
    bl      dns_notify

dns_tick_done:
    ldp     x29, x30, [sp], #16

dns_tick_ret:
    ret



tcp_slot:
    ladr    x1, tcp_table
    mov     x2, #TCB_SIZE
    madd    x0, x0, x2, x1
    ret

tcp_open:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     w20, w0
    mov     w21, w1
    mov     x22, x2
    mov     w19, #0

tcp_open_find:
    cmp     w19, #TCP_MAX
    b.hs    tcp_open_full
    mov     x0, x19
    bl      tcp_slot
    ldrb    w1, [x0, #TCB_STATE]
    cbz     w1, tcp_open_found
    add     w19, w19, #1
    b       tcp_open_find

tcp_open_found:
    mov     x1, x0
    mov     x2, #TCB_TX_BUF

tcp_open_clear:
    str     xzr, [x1], #8
    subs    x2, x2, #8
    b.ne    tcp_open_clear
    mov     x19, x0
    str     w20, [x19, #TCB_REMOTE_IP]
    str     w21, [x19, #TCB_REMOTE_PORT]
    str     x22, [x19, #TCB_HANDLER]
    add     x0, x19, #TCB_ISS
    mov     w1, #4
    bl      rng_get
    cbz     w0, tcp_open_iss_ready
    bl      net_random
    str     w0, [x19, #TCB_ISS]

tcp_open_iss_ready:
    ldr     w0, [x19, #TCB_ISS]
    str     w0, [x19, #TCB_SND_NXT]
    str     w0, [x19, #TCB_SND_UNA]

tcp_open_port:
    bl      net_random
    and     w0, w0, #TCP_PORT_MASK
    mov     w1, #TCP_LOCAL_PORT_BASE
    add     w22, w1, w0
    mov     w0, #0

tcp_open_port_check:
    cmp     w0, #TCP_MAX
    b.hs    tcp_open_port_ok
    str     x0, [sp, #-16]!
    bl      tcp_slot
    ldr     x1, [sp], #16
    add     w1, w1, #1
    ldrb    w2, [x0, #TCB_STATE]
    cbz     w2, tcp_open_port_next
    ldr     w2, [x0, #TCB_LOCAL_PORT]
    cmp     w2, w22
    b.eq    tcp_open_port

tcp_open_port_next:
    mov     w0, w1
    b       tcp_open_port_check

tcp_open_port_ok:
    str     w22, [x19, #TCB_LOCAL_PORT]
    ladr    x0, tcp_syn_msg
    bl      uart_puts
    mov     w0, w20
    bl      net_put_ip
    ladr    x0, tcp_colon
    bl      uart_puts
    mov     w0, w21
    bl      uart_putdec
    ladr    x0, uart_newline
    bl      uart_puts
    mov     x0, x19
    bl      tcp_send_syn
    mov     x0, x19
    b       tcp_open_done

tcp_open_full:
    ladr    x0, tcp_full_msg
    bl      uart_puts
    mov     x0, #0

tcp_open_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

tcp_send_syn:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x19, x0
    ldr     w4, [x19, #TCB_ISS]
    mov     w1, #TCP_FLAG_SYN
    mov     x2, #0
    mov     w3, #0
    bl      tcp_send
    mov     w0, #TCP_STATE_SYN_SENT
    strb    w0, [x19, #TCB_STATE]
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

tcp_write:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    ldr     w3, [x19, #TCB_TX_LEN]
    add     w4, w3, w2
    cmp     w4, #TCP_TX_BUF_SIZE
    b.hi    tcp_write_full
    add     x5, x19, #TCB_TX_BUF
    add     x5, x5, x3
    mov     w20, w2

tcp_write_copy:
    cbz     w2, tcp_write_stored
    ldrb    w6, [x1], #1
    strb    w6, [x5], #1
    sub     w2, w2, #1
    b       tcp_write_copy

tcp_write_stored:
    str     w4, [x19, #TCB_TX_LEN]
    mov     x0, x19
    bl      tcp_flush
    mov     w0, #0
    b       tcp_write_done

tcp_write_full:
    ladr    x0, tcp_txfull_msg
    bl      uart_puts
    mov     w0, #1

tcp_write_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

tcp_flush:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0

tcp_flush_loop:
    ldrb    w0, [x19, #TCB_STATE]
    cmp     w0, #TCP_STATE_ESTABLISHED
    ccmp    w0, #TCP_STATE_CLOSE_WAIT, #4, ne
    b.ne    tcp_flush_done
    ldr     w1, [x19, #TCB_SND_NXT]
    ldr     w2, [x19, #TCB_SND_UNA]
    sub     w20, w1, w2
    ldr     w3, [x19, #TCB_TX_LEN]
    subs    w3, w3, w20
    b.le    tcp_flush_done
    mov     w4, #TCP_MSS
    cmp     w3, w4
    csel    w3, w4, w3, hi
    mov     x0, x19
    mov     w1, #(TCP_FLAG_PSH | TCP_FLAG_ACK)
    add     x2, x19, #TCB_TX_BUF
    add     x2, x2, x20
    ldr     w4, [x19, #TCB_SND_NXT]
    stp     x3, x4, [sp, #-16]!
    bl      tcp_send
    ldp     x3, x4, [sp], #16
    add     w4, w4, w3
    str     w4, [x19, #TCB_SND_NXT]
    b       tcp_flush_loop

tcp_flush_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

tcp_close:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x19, x0
    ldrb    w0, [x19, #TCB_STATE]
    cmp     w0, #TCP_STATE_ESTABLISHED
    ccmp    w0, #TCP_STATE_CLOSE_WAIT, #4, ne
    b.ne    tcp_close_done
    ldr     w0, [x19, #TCB_TX_LEN]
    cbz     w0, tcp_close_fin
    mov     w0, #1
    strb    w0, [x19, #TCB_CLOSING]
    b       tcp_close_done

tcp_close_fin:
    mov     x0, x19
    mov     w1, #(TCP_FLAG_FIN | TCP_FLAG_ACK)
    mov     x2, #0
    mov     w3, #0
    ldr     w4, [x19, #TCB_SND_NXT]
    bl      tcp_send
    ldr     w0, [x19, #TCB_SND_NXT]
    add     w0, w0, #1
    str     w0, [x19, #TCB_SND_NXT]
    ldrb    w0, [x19, #TCB_STATE]
    cmp     w0, #TCP_STATE_CLOSE_WAIT
    mov     w1, #TCP_STATE_LAST_ACK
    mov     w2, #TCP_STATE_FIN_WAIT_1
    csel    w0, w1, w2, eq
    strb    w0, [x19, #TCB_STATE]

tcp_close_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

tcp_finish:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x19, x0
    strb    wzr, [x19, #TCB_STATE]
    str     wzr, [x19, #TCB_TX_LEN]
    ldr     x3, [x19, #TCB_HANDLER]
    cbz     x3, tcp_finish_done
    mov     x0, x19
    mov     x1, #0
    mov     w2, #0
    blr     x3

tcp_finish_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

tcp_send:
    stp     x29, x30, [sp, #-80]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    mov     x25, x0
    mov     w19, w1
    mov     x20, x2
    mov     w21, w3
    mov     w26, w4
    mov     w22, #TCP_HDR_SIZE
    tst     w19, #TCP_FLAG_SYN
    b.eq    tcp_send_size
    mov     w22, #TCP_HDR_SYN_SIZE

tcp_send_size:
    ladr    x0, net_gw_mac
    ldr     w1, [x25, #TCB_REMOTE_IP]
    mov     w2, #IP_PROTO_TCP
    add     w3, w22, w21
    bl      net_ip_begin
    mov     x23, x0
    mov     w24, w1
    mov     x0, x23
    mov     x1, #TCP_SRC
    ldr     w2, [x25, #TCB_LOCAL_PORT]
    bl      mem_write16be
    mov     x0, x23
    mov     x1, #TCP_DST
    ldr     w2, [x25, #TCB_REMOTE_PORT]
    bl      mem_write16be
    mov     x0, x23
    mov     x1, #TCP_SEQ
    mov     w2, w26
    bl      mem_write32be
    mov     x0, x23
    mov     x1, #TCP_ACK
    ldr     w2, [x25, #TCB_RCV_NXT]
    bl      mem_write32be
    lsr     w2, w22, #2
    lsl     w2, w2, #12
    orr     w2, w2, w19
    mov     x0, x23
    mov     x1, #TCP_OFFSET_FLAGS
    bl      mem_write16be
    mov     x0, x23
    mov     x1, #TCP_WINDOW
    mov     w2, #TCP_WINDOW_SIZE
    bl      mem_write16be
    strh    wzr, [x23, #TCP_CHECKSUM]
    strh    wzr, [x23, #TCP_URGENT]
    tst     w19, #TCP_FLAG_SYN
    b.eq    tcp_send_payload
    mov     w0, #TCP_OPT_MSS
    strb    w0, [x23, #TCP_HDR_SIZE]
    mov     w0, #4
    strb    w0, [x23, #(TCP_HDR_SIZE + 1)]
    mov     x0, x23
    mov     x1, #(TCP_HDR_SIZE + 2)
    mov     w2, #TCP_MSS
    bl      mem_write16be

tcp_send_payload:
    cbz     w21, tcp_send_sum
    add     x0, x23, x22
    mov     x1, x20
    mov     w2, w21

tcp_send_copy:
    ldrb    w3, [x1], #1
    strb    w3, [x0], #1
    subs    w2, w2, #1
    b.ne    tcp_send_copy

tcp_send_sum:
    ladr    x0, net_ip
    ldr     w0, [x0]
    ldr     w1, [x25, #TCB_REMOTE_IP]
    mov     w2, #IP_PROTO_TCP
    add     w3, w22, w21
    bl      net_pseudo_sum
    mov     w2, w0
    mov     x0, x23
    add     w1, w22, w21
    bl      net_checksum_seed
    mov     w2, w0
    mov     x0, x23
    mov     x1, #TCP_CHECKSUM
    bl      mem_write16be
    mov     w0, w24
    bl      net_send
    str     wzr, [x25, #TCB_TIMER]
    bl      net_timer_arm
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #80
    ret

tcp_ack_out:
    stp     x29, x30, [sp, #-16]!
    mov     w1, #TCP_FLAG_ACK
    mov     x2, #0
    mov     w3, #0
    ldr     w4, [x0, #TCB_SND_NXT]
    bl      tcp_send
    ldp     x29, x30, [sp], #16
    ret

tcp_handle:
    cmp     w1, #TCP_HDR_SIZE
    b.lo    tcp_handle_ret
    stp     x29, x30, [sp, #-96]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    stp     x27, x28, [sp, #80]
    mov     x19, x0
    mov     w20, w1
    mov     x0, x19
    mov     x1, #TCP_DST
    bl      mem_read16be
    mov     w27, w0
    mov     x0, x19
    mov     x1, #TCP_SRC
    bl      mem_read16be
    mov     w28, w0
    ladr    x0, net_last_src
    ldr     w26, [x0]
    mov     w0, #0

tcp_handle_find:
    cmp     w0, #TCP_MAX
    b.hs    tcp_handle_done
    str     x0, [sp, #-16]!
    bl      tcp_slot
    ldr     x1, [sp], #16
    add     w1, w1, #1
    ldrb    w2, [x0, #TCB_STATE]
    cbz     w2, tcp_handle_find_next
    ldr     w2, [x0, #TCB_LOCAL_PORT]
    cmp     w2, w27
    b.ne    tcp_handle_find_next
    ldr     w2, [x0, #TCB_REMOTE_PORT]
    cmp     w2, w28
    b.ne    tcp_handle_find_next
    ldr     w2, [x0, #TCB_REMOTE_IP]
    cmp     w2, w26
    b.eq    tcp_handle_matched

tcp_handle_find_next:
    mov     w0, w1
    b       tcp_handle_find

tcp_handle_matched:
    mov     x26, x0
    mov     x0, x19
    mov     x1, #TCP_SEQ
    bl      mem_read32be
    mov     w21, w0
    mov     x0, x19
    mov     x1, #TCP_ACK
    bl      mem_read32be
    mov     w22, w0
    mov     x0, x19
    mov     x1, #TCP_OFFSET_FLAGS
    bl      mem_read16be
    and     w23, w0, #TCP_FLAG_MASK
    lsr     w24, w0, #12
    lsl     w24, w24, #2
    cmp     w24, #TCP_HDR_SIZE
    b.lo    tcp_handle_done
    cmp     w24, w20
    b.hi    tcp_handle_done
    sub     w25, w20, w24
    tst     w23, #TCP_FLAG_RST
    b.ne    tcp_handle_rst
    ldrb    w0, [x26, #TCB_STATE]
    cmp     w0, #TCP_STATE_SYN_SENT
    b.eq    tcp_handle_syn_sent
    b       tcp_handle_open

tcp_handle_syn_sent:
    mov     w1, #(TCP_FLAG_SYN | TCP_FLAG_ACK)
    and     w0, w23, w1
    cmp     w0, w1
    b.ne    tcp_handle_done
    ldr     w0, [x26, #TCB_ISS]
    add     w0, w0, #1
    cmp     w22, w0
    b.ne    tcp_handle_done
    str     w0, [x26, #TCB_SND_NXT]
    str     w0, [x26, #TCB_SND_UNA]
    add     w1, w21, #1
    str     w1, [x26, #TCB_RCV_NXT]
    mov     w1, #TCP_STATE_ESTABLISHED
    strb    w1, [x26, #TCB_STATE]
    strb    wzr, [x26, #TCB_TRIES]
    ladr    x0, tcp_open_msg
    bl      uart_puts
    mov     x0, x26
    bl      tcp_ack_out
    mov     x0, x26
    bl      tcp_flush
    b       tcp_handle_done

tcp_handle_open:
    tst     w23, #TCP_FLAG_ACK
    b.eq    tcp_handle_data
    ldr     w1, [x26, #TCB_SND_UNA]
    sub     w2, w22, w1
    cmp     w2, #0
    b.le    tcp_handle_data
    ldr     w3, [x26, #TCB_SND_NXT]
    sub     w4, w22, w3
    cmp     w4, #0
    b.gt    tcp_handle_data
    str     w22, [x26, #TCB_SND_UNA]
    strb    wzr, [x26, #TCB_TRIES]
    str     wzr, [x26, #TCB_TIMER]
    ldr     w3, [x26, #TCB_TX_LEN]
    cmp     w2, w3
    csel    w2, w3, w2, hi
    sub     w3, w3, w2
    str     w3, [x26, #TCB_TX_LEN]
    add     x0, x26, #TCB_TX_BUF
    add     x1, x0, x2

tcp_handle_shift:
    cbz     w3, tcp_handle_acked
    ldrb    w4, [x1], #1
    strb    w4, [x0], #1
    sub     w3, w3, #1
    b       tcp_handle_shift

tcp_handle_acked:
    ldrb    w0, [x26, #TCB_CLOSING]
    cbz     w0, tcp_handle_acked_state
    ldr     w0, [x26, #TCB_TX_LEN]
    cbnz    w0, tcp_handle_acked_state
    strb    wzr, [x26, #TCB_CLOSING]
    mov     x0, x26
    bl      tcp_close

tcp_handle_acked_state:
    ldrb    w0, [x26, #TCB_STATE]
    ldr     w1, [x26, #TCB_SND_NXT]
    cmp     w22, w1
    b.ne    tcp_handle_data
    cmp     w0, #TCP_STATE_FIN_WAIT_1
    b.ne    tcp_handle_acked_last
    mov     w0, #TCP_STATE_FIN_WAIT_2
    strb    w0, [x26, #TCB_STATE]
    b       tcp_handle_data

tcp_handle_acked_last:
    cmp     w0, #TCP_STATE_LAST_ACK
    b.ne    tcp_handle_data
    mov     x0, x26
    bl      tcp_finish
    ladr    x0, tcp_close_msg
    bl      uart_puts
    b       tcp_handle_done

tcp_handle_data:
    cbz     w25, tcp_handle_fin
    ldr     w0, [x26, #TCB_RCV_NXT]
    sub     w1, w0, w21
    tbnz    w1, #31, tcp_handle_ack_only
    cmp     w1, w25
    b.hs    tcp_handle_fin
    sub     w2, w25, w1
    add     w0, w0, w2
    str     w0, [x26, #TCB_RCV_NXT]
    ldr     x3, [x26, #TCB_HANDLER]
    cbz     x3, tcp_handle_fin
    add     x4, x19, x24
    add     x4, x4, w1, uxtw
    mov     x0, x26
    mov     x1, x4
    blr     x3

tcp_handle_fin:
    tst     w23, #TCP_FLAG_FIN
    b.eq    tcp_handle_ack_only
    add     w0, w21, w25
    ldr     w1, [x26, #TCB_RCV_NXT]
    cmp     w0, w1
    b.ne    tcp_handle_ack_only
    add     w1, w1, #1
    str     w1, [x26, #TCB_RCV_NXT]
    ldrb    w0, [x26, #TCB_STATE]
    cmp     w0, #TCP_STATE_FIN_WAIT_2
    b.eq    tcp_handle_fin_final
    cmp     w0, #TCP_STATE_FIN_WAIT_1
    b.eq    tcp_handle_fin_both
    ldr     w0, [x26, #TCB_TX_LEN]
    cbnz    w0, tcp_handle_fin_wait
    mov     x0, x26
    mov     w1, #(TCP_FLAG_FIN | TCP_FLAG_ACK)
    mov     x2, #0
    mov     w3, #0
    ldr     w4, [x26, #TCB_SND_NXT]
    bl      tcp_send
    ldr     w0, [x26, #TCB_SND_NXT]
    add     w0, w0, #1
    str     w0, [x26, #TCB_SND_NXT]
    mov     w0, #TCP_STATE_LAST_ACK
    strb    w0, [x26, #TCB_STATE]
    b       tcp_handle_done

tcp_handle_fin_wait:
    mov     x0, x26
    bl      tcp_ack_out
    mov     w0, #TCP_STATE_CLOSE_WAIT
    strb    w0, [x26, #TCB_STATE]
    mov     w0, #1
    strb    w0, [x26, #TCB_CLOSING]
    b       tcp_handle_done

tcp_handle_fin_both:
    mov     x0, x26
    bl      tcp_ack_out
    mov     w0, #TCP_STATE_LAST_ACK
    strb    w0, [x26, #TCB_STATE]
    b       tcp_handle_done

tcp_handle_fin_final:
    mov     x0, x26
    bl      tcp_ack_out
    mov     x0, x26
    bl      tcp_finish
    ladr    x0, tcp_close_msg
    bl      uart_puts
    b       tcp_handle_done

tcp_handle_ack_only:
    cbz     w25, tcp_handle_more
    mov     x0, x26
    bl      tcp_ack_out

tcp_handle_more:
    mov     x0, x26
    bl      tcp_flush
    b       tcp_handle_done

tcp_handle_rst:
    ldrb    w0, [x26, #TCB_STATE]
    cmp     w0, #TCP_STATE_SYN_SENT
    b.ne    tcp_handle_rst_sync
    tst     w23, #TCP_FLAG_ACK
    b.eq    tcp_handle_done
    ldr     w0, [x26, #TCB_ISS]
    add     w0, w0, #1
    cmp     w22, w0
    b.ne    tcp_handle_done
    b       tcp_handle_rst_do

tcp_handle_rst_sync:
    ldr     w0, [x26, #TCB_RCV_NXT]
    cmp     w21, w0
    b.ne    tcp_handle_done

tcp_handle_rst_do:
    mov     x0, x26
    bl      tcp_finish
    ladr    x0, tcp_rst_msg
    bl      uart_puts

tcp_handle_done:
    ldp     x27, x28, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #96

tcp_handle_ret:
    ret

tcp_tick:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     w20, #0
    mov     w21, #0

tcp_tick_loop:
    cmp     w20, #TCP_MAX
    b.hs    tcp_tick_done
    mov     x0, x20
    bl      tcp_slot
    mov     x19, x0
    add     w20, w20, #1
    ldrb    w0, [x19, #TCB_STATE]
    cbz     w0, tcp_tick_loop
    cmp     w0, #TCP_STATE_ESTABLISHED
    ccmp    w0, #TCP_STATE_CLOSE_WAIT, #4, ne
    b.ne    tcp_tick_wait
    ldr     w1, [x19, #TCB_SND_NXT]
    ldr     w2, [x19, #TCB_SND_UNA]
    cmp     w1, w2
    b.eq    tcp_tick_loop

tcp_tick_wait:
    mov     w21, #1
    ldr     w1, [x19, #TCB_TIMER]
    add     w1, w1, #1
    str     w1, [x19, #TCB_TIMER]
    cmp     w1, #TCP_RETRY_TICKS
    b.lo    tcp_tick_loop
    ldrb    w1, [x19, #TCB_TRIES]
    add     w1, w1, #1
    strb    w1, [x19, #TCB_TRIES]
    cmp     w1, #TCP_RETRY_MAX
    b.hs    tcp_tick_giveup
    cmp     w0, #TCP_STATE_FIN_WAIT_2
    b.ne    tcp_tick_retry
    str     wzr, [x19, #TCB_TIMER]
    b       tcp_tick_loop

tcp_tick_retry:
    cmp     w0, #TCP_STATE_SYN_SENT
    b.ne    tcp_tick_resend
    mov     x0, x19
    bl      tcp_send_syn
    b       tcp_tick_loop

tcp_tick_resend:
    cmp     w0, #TCP_STATE_ESTABLISHED
    ccmp    w0, #TCP_STATE_CLOSE_WAIT, #4, ne
    b.ne    tcp_tick_resend_fin
    ldr     w3, [x19, #TCB_TX_LEN]
    mov     w4, #TCP_MSS
    cmp     w3, w4
    csel    w3, w4, w3, hi
    mov     x0, x19
    mov     w1, #(TCP_FLAG_PSH | TCP_FLAG_ACK)
    add     x2, x19, #TCB_TX_BUF
    ldr     w4, [x19, #TCB_SND_UNA]
    bl      tcp_send
    b       tcp_tick_loop

tcp_tick_resend_fin:
    mov     x0, x19
    mov     w1, #(TCP_FLAG_FIN | TCP_FLAG_ACK)
    mov     x2, #0
    mov     w3, #0
    ldr     w4, [x19, #TCB_SND_NXT]
    sub     w4, w4, #1
    bl      tcp_send
    b       tcp_tick_loop

tcp_tick_giveup:
    mov     x0, x19
    bl      tcp_finish
    ladr    x0, tcp_timeout_msg
    bl      uart_puts
    b       tcp_tick_loop

tcp_tick_done:
    mov     w0, w21
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

http_on_data:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    cbz     w2, http_on_data_done
    ldrb    w3, [x19, #TCB_SEEN]
    cbnz    w3, http_on_data_done
    ladr    x0, http_line
    bl      line_collect
    cbz     w0, http_on_data_done
    mov     w3, #1
    strb    w3, [x19, #TCB_SEEN]
    ladr    x0, tcp_data_msg
    bl      uart_puts
    ladr    x0, http_line
    add     x0, x0, #4
    bl      uart_puts
    ladr    x0, uart_newline
    bl      uart_puts

http_on_data_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

line_collect:
    ldr     w3, [x0]

line_collect_loop:
    cbz     w2, line_collect_open
    ldrb    w4, [x1], #1
    sub     w2, w2, #1
    cmp     w4, #ASCII_CR
    b.eq    line_collect_end
    cmp     w4, #ASCII_LF
    b.eq    line_collect_end
    cmp     w3, #(TCP_LINE_MAX - 1)
    b.hs    line_collect_end
    add     x5, x0, #4
    strb    w4, [x5, x3]
    add     w3, w3, #1
    b       line_collect_loop

line_collect_open:
    str     w3, [x0]
    mov     w0, #0
    ret

line_collect_end:
    add     x5, x0, #4
    strb    wzr, [x5, x3]
    str     wzr, [x0]
    mov     w0, #1
    ret


.macro sha_round wv
    ld1     {v4.4s}, [x2], #16
    add     v4.4s, v4.4s, \wv\().4s
    mov     v2.16b, v0.16b
    sha256h q0, q1, v4.4s
    sha256h2 q1, q2, v4.4s
.endm

.macro sha_sched w0, w1, w2, w3
    sha256su0 \w0\().4s, \w1\().4s
    sha256su1 \w0\().4s, \w2\().4s, \w3\().4s
.endm

sha_available:
    mrs     x0, id_aa64isar0_el1
    ubfx    x0, x0, #12, #4
    ret

sha256_init:
    ladr    x1, sha_iv
    ld1     {v0.4s, v1.4s}, [x1]
    st1     {v0.4s, v1.4s}, [x0]
    str     xzr, [x0, #SHA_CTX_COUNT]
    str     xzr, [x0, #SHA_CTX_FILL]
    ret

sha256_block:
    ld1     {v0.4s, v1.4s}, [x0]
    mov     v6.16b, v0.16b
    mov     v7.16b, v1.16b
    ld1     {v16.4s, v17.4s, v18.4s, v19.4s}, [x1]
    rev32   v16.16b, v16.16b
    rev32   v17.16b, v17.16b
    rev32   v18.16b, v18.16b
    rev32   v19.16b, v19.16b
    ladr    x2, sha_k256
    mov     w3, #3

sha256_block_rounds:
    sha_round v16
    sha_sched v16, v17, v18, v19
    sha_round v17
    sha_sched v17, v18, v19, v16
    sha_round v18
    sha_sched v18, v19, v16, v17
    sha_round v19
    sha_sched v19, v16, v17, v18
    subs    w3, w3, #1
    b.ne    sha256_block_rounds
    sha_round v16
    sha_round v17
    sha_round v18
    sha_round v19
    add     v0.4s, v0.4s, v6.4s
    add     v1.4s, v1.4s, v7.4s
    st1     {v0.4s, v1.4s}, [x0]
    ret

sha256_update:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x19, x0
    mov     x20, x1
    mov     x21, x2
    ldr     x3, [x19, #SHA_CTX_COUNT]
    add     x3, x3, x21
    str     x3, [x19, #SHA_CTX_COUNT]

sha256_update_loop:
    cbz     x21, sha256_update_done
    ldr     w22, [x19, #SHA_CTX_FILL]
    cbnz    w22, sha256_update_buffer
    cmp     x21, #SHA_BLOCK_SIZE
    b.lo    sha256_update_buffer
    mov     x0, x19
    mov     x1, x20
    bl      sha256_block
    add     x20, x20, #SHA_BLOCK_SIZE
    sub     x21, x21, #SHA_BLOCK_SIZE
    b       sha256_update_loop

sha256_update_buffer:
    mov     w3, #SHA_BLOCK_SIZE
    sub     w3, w3, w22
    cmp     x21, x3
    csel    x3, x21, x3, lo
    add     x4, x19, #SHA_CTX_BUF
    add     x4, x4, x22
    mov     x5, x3

sha256_update_copy:
    ldrb    w6, [x20], #1
    strb    w6, [x4], #1
    subs    x5, x5, #1
    b.ne    sha256_update_copy
    add     w22, w22, w3
    sub     x21, x21, x3
    cmp     w22, #SHA_BLOCK_SIZE
    b.ne    sha256_update_store
    mov     x0, x19
    add     x1, x19, #SHA_CTX_BUF
    bl      sha256_block
    mov     w22, #0

sha256_update_store:
    str     w22, [x19, #SHA_CTX_FILL]
    b       sha256_update_loop

sha256_update_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

sha256_final:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x19, x0
    mov     x20, x1
    ldr     x21, [x19, #SHA_CTX_COUNT]
    ldr     w22, [x19, #SHA_CTX_FILL]
    add     x4, x19, #SHA_CTX_BUF
    mov     w0, #0x80
    strb    w0, [x4, x22]
    add     w22, w22, #1

sha256_final_pad:
    cmp     w22, #(SHA_BLOCK_SIZE - 8)
    b.eq    sha256_final_length
    cmp     w22, #SHA_BLOCK_SIZE
    b.ne    sha256_final_zero
    mov     x0, x19
    mov     x1, x4
    bl      sha256_block
    add     x4, x19, #SHA_CTX_BUF
    mov     w22, #0
    b       sha256_final_pad

sha256_final_zero:
    strb    wzr, [x4, x22]
    add     w22, w22, #1
    b       sha256_final_pad

sha256_final_length:
    lsl     x21, x21, #3
    rev     x21, x21
    str     x21, [x4, #(SHA_BLOCK_SIZE - 8)]
    mov     x0, x19
    mov     x1, x4
    bl      sha256_block
    ld1     {v0.4s, v1.4s}, [x19]
    rev32   v0.16b, v0.16b
    rev32   v1.16b, v1.16b
    st1     {v0.4s, v1.4s}, [x20]
    mov     x0, x19
    mov     w1, #SHA_CTX_SIZE

sha256_final_wipe:
    str     xzr, [x0], #8
    subs    w1, w1, #8
    b.ne    sha256_final_wipe
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

sha_compare:
    ldp     x2, x3, [x0]
    ldp     x4, x5, [x1]
    eor     x2, x2, x4
    eor     x3, x3, x5
    orr     x2, x2, x3
    ldp     x3, x4, [x0, #16]
    ldp     x5, x6, [x1, #16]
    eor     x3, x3, x5
    eor     x4, x4, x6
    orr     x2, x2, x3
    orr     x2, x2, x4
    cmp     x2, #0
    cset    w0, ne
    ret

sha_check:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     x19, x0
    mov     x20, x1
    mov     x21, x2
    ladr    x0, sha_ctx
    bl      sha256_init
    ladr    x0, sha_ctx
    mov     x1, x19
    mov     x2, x20
    bl      sha256_update
    ladr    x0, sha_ctx
    ladr    x1, sha_digest
    bl      sha256_final
    ladr    x0, sha_digest
    mov     x1, x21
    bl      sha_compare
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

sha_put_digest:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     w20, #0

sha_put_digest_loop:
    ldrb    w0, [x19, x20]
    bl      uart_puthex8
    add     w20, w20, #1
    cmp     w20, #SHA_DIGEST_SIZE
    b.lo    sha_put_digest_loop
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

crypto_selftest:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    bl      sha_selftest
    mov     w19, w0
    bl      hmac_selftest
    orr     w19, w19, w0
    bl      aes_selftest
    orr     w19, w19, w0
    bl      x25519_selftest
    orr     w19, w19, w0
    bl      sha384_selftest
    orr     w19, w19, w0
    bl      ecdsa_selftest
    orr     w19, w19, w0
    bl      x509_selftest
    orr     w19, w19, w0
    bl      time_selftest
    orr     w19, w19, w0
    bl      rng_init
    orr     w19, w19, w0
    eor     w19, w19, #1
    ladr    x0, crypto_ready
    strb    w19, [x0]
    ladr    x0, crypto_ready_msg
    ladr    x1, crypto_blocked_msg
    cmp     w19, #0
    csel    x0, x1, x0, eq
    bl      uart_puts
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

sha_selftest:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    bl      sha_available
    cbz     w0, sha_selftest_missing
    mov     w19, #1
    ladr    x0, sha_test_abc
    mov     x1, #3
    ladr    x2, sha_expect_abc
    bl      sha_check
    cbnz    w0, sha_selftest_fail
    ladr    x0, sha_abc_msg
    bl      uart_puts
    ladr    x0, sha_digest
    bl      sha_put_digest
    ladr    x0, uart_newline
    bl      uart_puts
    mov     w19, #2
    ladr    x0, sha_test_abc
    mov     x1, #0
    ladr    x2, sha_expect_empty
    bl      sha_check
    cbnz    w0, sha_selftest_fail
    mov     w19, #3
    ladr    x0, sha_test_two
    mov     x1, #(sha_test_two_end - sha_test_two)
    ladr    x2, sha_expect_two
    bl      sha_check
    cbnz    w0, sha_selftest_fail
    mov     w19, #4
    ladr    x0, sha_test_two
    mov     x1, #(SHA_BLOCK_SIZE - 9)
    ladr    x2, sha_expect_55
    bl      sha_check
    cbnz    w0, sha_selftest_fail
    mov     w19, #5
    ladr    x0, sha_buf
    mov     w1, #SHA_TEST_CHUNK
    mov     w2, #0x61

sha_selftest_fill:
    strb    w2, [x0], #1
    subs    w1, w1, #1
    b.ne    sha_selftest_fill
    ladr    x0, sha_ctx
    bl      sha256_init
    mov     w20, #SHA_TEST_CHUNK

sha_selftest_million:
    ladr    x0, sha_ctx
    ladr    x1, sha_buf
    mov     x2, #SHA_TEST_CHUNK
    bl      sha256_update
    subs    w20, w20, #1
    b.ne    sha_selftest_million
    ladr    x0, sha_ctx
    ladr    x1, sha_digest
    bl      sha256_final
    ladr    x0, sha_digest
    ladr    x1, sha_expect_million
    bl      sha_compare
    cbnz    w0, sha_selftest_fail
    ladr    x0, sha_ok_msg
    bl      uart_puts
    b       sha_selftest_done

sha_selftest_fail:
    ladr    x0, sha_fail_msg
    bl      uart_puts
    mov     x0, x19
    bl      uart_putdec
    ladr    x0, uart_newline
    bl      uart_puts
    b       sha_selftest_bad

sha_selftest_missing:
    ladr    x0, sha_missing_msg
    bl      uart_puts

sha_selftest_bad:
    mov     w0, #1
    b       sha_selftest_exit

sha_selftest_done:
    mov     w0, #0

sha_selftest_exit:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret


hmac_init:
    stp     x29, x30, [sp, #-112]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x19, x0
    mov     x20, x1
    mov     x21, x2
    cmp     x21, #SHA_BLOCK_SIZE
    b.ls    hmac_init_opad
    mov     x0, x19
    bl      sha256_init
    mov     x0, x19
    mov     x1, x20
    mov     x2, x21
    bl      sha256_update
    mov     x0, x19
    add     x1, x19, #HMAC_CTX_OPAD
    bl      sha256_final
    add     x20, x19, #HMAC_CTX_OPAD
    mov     x21, #SHA_DIGEST_SIZE

hmac_init_opad:
    add     x22, x19, #HMAC_CTX_OPAD
    mov     w6, #HMAC_OPAD
    mov     x3, #0

hmac_init_opad_key:
    cmp     x3, x21
    b.hs    hmac_init_opad_fill
    ldrb    w4, [x20, x3]
    eor     w4, w4, w6
    strb    w4, [x22, x3]
    add     x3, x3, #1
    b       hmac_init_opad_key

hmac_init_opad_fill:
    cmp     x3, #SHA_BLOCK_SIZE
    b.hs    hmac_init_inner
    strb    w6, [x22, x3]
    add     x3, x3, #1
    b       hmac_init_opad_fill

hmac_init_inner:
    mov     x0, x19
    bl      sha256_init
    add     x5, sp, #48
    mov     w6, #(HMAC_IPAD ^ HMAC_OPAD)
    mov     x3, #0

hmac_init_ipad:
    ldrb    w4, [x22, x3]
    eor     w4, w4, w6
    strb    w4, [x5, x3]
    add     x3, x3, #1
    cmp     x3, #SHA_BLOCK_SIZE
    b.lo    hmac_init_ipad
    mov     x0, x19
    mov     x1, x5
    mov     x2, #SHA_BLOCK_SIZE
    bl      sha256_update
    add     x0, sp, #48
    mov     w1, #SHA_BLOCK_SIZE
    bl      mem_wipe
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #112
    ret

hmac_update:
    b       sha256_update

hmac_final:
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     x20, x1
    mov     x0, x19
    add     x1, sp, #32
    bl      sha256_final
    mov     x0, x19
    bl      sha256_init
    mov     x0, x19
    add     x1, x19, #HMAC_CTX_OPAD
    mov     x2, #SHA_BLOCK_SIZE
    bl      sha256_update
    mov     x0, x19
    add     x1, sp, #32
    mov     x2, #SHA_DIGEST_SIZE
    bl      sha256_update
    mov     x0, x19
    mov     x1, x20
    bl      sha256_final
    add     x0, x19, #HMAC_CTX_OPAD
    mov     w1, #SHA_BLOCK_SIZE
    bl      mem_wipe
    add     x0, sp, #32
    mov     w1, #SHA_DIGEST_SIZE
    bl      mem_wipe
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

hmac_compute:
    stp     x29, x30, [sp, #-224]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     x19, x2
    mov     x20, x3
    mov     x21, x4
    mov     x2, x1
    mov     x1, x0
    add     x0, sp, #48
    bl      hmac_init
    add     x0, sp, #48
    mov     x1, x19
    mov     x2, x20
    bl      hmac_update
    add     x0, sp, #48
    mov     x1, x21
    bl      hmac_final
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #224
    ret

mem_wipe:
    cbz     w1, mem_wipe_done

mem_wipe_loop:
    strb    wzr, [x0], #1
    subs    w1, w1, #1
    b.ne    mem_wipe_loop

mem_wipe_done:
    ret

hkdf_extract:
    b       hmac_compute

hkdf_expand:
    stp     x29, x30, [sp, #-HKDF_FRAME_SIZE]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    mov     x19, x0
    mov     x20, x1
    mov     x21, x2
    mov     x22, x3
    mov     x23, x4
    mov     w24, #1
    mov     x0, #HKDF_MAX_OKM
    cmp     x23, x0
    b.hi    hkdf_expand_toolong

hkdf_expand_loop:
    cbz     x23, hkdf_expand_done
    add     x0, sp, #HKDF_FRAME_CTX
    mov     x1, x19
    mov     x2, #SHA_DIGEST_SIZE
    bl      hmac_init
    cmp     w24, #1
    b.eq    hkdf_expand_info
    add     x0, sp, #HKDF_FRAME_CTX
    add     x1, sp, #HKDF_FRAME_T
    mov     x2, #SHA_DIGEST_SIZE
    bl      hmac_update

hkdf_expand_info:
    add     x0, sp, #HKDF_FRAME_CTX
    mov     x1, x20
    mov     x2, x21
    bl      hmac_update
    strb    w24, [sp, #HKDF_FRAME_COUNT]
    add     x0, sp, #HKDF_FRAME_CTX
    add     x1, sp, #HKDF_FRAME_COUNT
    mov     x2, #1
    bl      hmac_update
    add     x0, sp, #HKDF_FRAME_CTX
    add     x1, sp, #HKDF_FRAME_T
    bl      hmac_final
    mov     x2, #SHA_DIGEST_SIZE
    cmp     x23, x2
    csel    x2, x23, x2, lo
    add     x0, sp, #HKDF_FRAME_T
    mov     x1, x22
    add     x22, x22, x2
    sub     x23, x23, x2
    bl      mem_copy
    add     w24, w24, #1
    b       hkdf_expand_loop

hkdf_expand_toolong:
    mov     w0, #1
    b       hkdf_expand_ret

hkdf_expand_done:
    add     x0, sp, #HKDF_FRAME_T
    mov     w1, #SHA_DIGEST_SIZE
    bl      mem_wipe
    mov     w0, #0

hkdf_expand_ret:
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #HKDF_FRAME_SIZE
    ret

hmac_check:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x19, x4
    ladr    x4, sha_digest
    bl      hmac_compute
    ladr    x0, sha_digest
    mov     x1, x19
    bl      sha_compare
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

hkdf_check:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x19, x0
    ldp     x0, x1, [x19]
    ldp     x2, x3, [x19, #16]
    ladr    x4, hkdf_prk
    bl      hkdf_extract
    ladr    x0, hkdf_prk
    ldp     x1, x2, [x19, #32]
    ldp     x3, x4, [x19, #48]
    bl      hkdf_expand
    cbnz    w0, hkdf_check_fail
    ladr    x0, hkdf_prk
    ldr     x1, [x19, #64]
    mov     w2, #SHA_DIGEST_SIZE
    bl      mem_equal
    cbz     w0, hkdf_check_fail
    ldr     x0, [x19, #48]
    ldr     x1, [x19, #72]
    ldr     w2, [x19, #56]
    bl      mem_equal
    cbz     w0, hkdf_check_fail
    mov     w0, #0
    b       hkdf_check_done

hkdf_check_fail:
    mov     w0, #1

hkdf_check_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

hmac_selftest:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     w19, #1
    ladr    x0, hmac_key_0b
    mov     x1, #20
    ladr    x2, hmac_data_1
    mov     x3, #(hmac_data_1_end - hmac_data_1)
    ladr    x4, hmac_expect_1
    bl      hmac_check
    cbnz    w0, hmac_selftest_fail
    mov     w19, #2
    ladr    x0, hmac_key_jefe
    mov     x1, #4
    ladr    x2, hmac_data_2
    mov     x3, #(hmac_data_2_end - hmac_data_2)
    ladr    x4, hmac_expect_2
    bl      hmac_check
    cbnz    w0, hmac_selftest_fail
    mov     w19, #3
    ladr    x0, hmac_key_aa
    mov     x1, #131
    ladr    x2, hmac_data_6
    mov     x3, #(hmac_data_6_end - hmac_data_6)
    ladr    x4, hmac_expect_6
    bl      hmac_check
    cbnz    w0, hmac_selftest_fail
    mov     w19, #4
    ladr    x0, hmac_key_aa
    mov     x1, #131
    ladr    x2, hmac_data_7
    mov     x3, #(hmac_data_7_end - hmac_data_7)
    ladr    x4, hmac_expect_7
    bl      hmac_check
    cbnz    w0, hmac_selftest_fail
    ladr    x0, hmac_ok_msg
    bl      uart_puts
    mov     w19, #1
    ladr    x0, hkdf_case_1
    bl      hkdf_check
    cbnz    w0, hkdf_selftest_fail
    mov     w19, #2
    ladr    x0, hkdf_case_2
    bl      hkdf_check
    cbnz    w0, hkdf_selftest_fail
    mov     w19, #3
    ladr    x0, hkdf_case_3
    bl      hkdf_check
    cbnz    w0, hkdf_selftest_fail
    ladr    x0, hkdf_ok_msg
    bl      uart_puts
    b       hmac_selftest_done

hmac_selftest_fail:
    ladr    x0, hmac_fail_msg
    b       hmac_selftest_report

hkdf_selftest_fail:
    ladr    x0, hkdf_fail_msg

hmac_selftest_report:
    bl      uart_puts
    mov     x0, x19
    bl      uart_putdec
    ladr    x0, uart_newline
    bl      uart_puts
    mov     w0, #1
    b       hmac_selftest_exit

hmac_selftest_done:
    mov     w0, #0

hmac_selftest_exit:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret


aes_enc_block:
    aese    v0.16b, v16.16b
    aesmc   v0.16b, v0.16b
    aese    v0.16b, v17.16b
    aesmc   v0.16b, v0.16b
    aese    v0.16b, v18.16b
    aesmc   v0.16b, v0.16b
    aese    v0.16b, v19.16b
    aesmc   v0.16b, v0.16b
    aese    v0.16b, v20.16b
    aesmc   v0.16b, v0.16b
    aese    v0.16b, v21.16b
    aesmc   v0.16b, v0.16b
    aese    v0.16b, v22.16b
    aesmc   v0.16b, v0.16b
    aese    v0.16b, v23.16b
    aesmc   v0.16b, v0.16b
    aese    v0.16b, v24.16b
    aesmc   v0.16b, v0.16b
    aese    v0.16b, v25.16b
    eor     v0.16b, v0.16b, v26.16b
    ret

.macro gcm_reflect vreg
    rbit    \vreg\().16b, \vreg\().16b
.endm

aes_available:
    mrs     x0, id_aa64isar0_el1
    ubfx    x0, x0, #4, #4
    cmp     x0, #2
    cset    w0, hs
    ret

aes_expand:
    ld1     {v2.16b}, [x1]
    st1     {v2.16b}, [x0], #16
    movi    v0.16b, #0
    ladr    x2, aes_rcon
    mov     w3, #10

aes_expand_round:
    ldrb    w5, [x2], #1
    dup     v1.4s, v2.s[3]
    aese    v1.16b, v0.16b
    ext     v1.16b, v1.16b, v1.16b, #1
    dup     v4.4s, w5
    eor     v1.16b, v1.16b, v4.16b
    ext     v3.16b, v0.16b, v2.16b, #12
    eor     v2.16b, v2.16b, v3.16b
    ext     v3.16b, v0.16b, v2.16b, #8
    eor     v2.16b, v2.16b, v3.16b
    eor     v2.16b, v2.16b, v1.16b
    st1     {v2.16b}, [x0], #16
    subs    w3, w3, #1
    b.ne    aes_expand_round
    ret

aes_load_keys:
    ld1     {v16.16b, v17.16b, v18.16b, v19.16b}, [x0], #64
    ld1     {v20.16b, v21.16b, v22.16b, v23.16b}, [x0], #64
    ld1     {v24.16b, v25.16b, v26.16b, v27.16b}, [x0]
    ret

aes_wipe_keys:
    movi    v16.16b, #0
    movi    v17.16b, #0
    movi    v18.16b, #0
    movi    v19.16b, #0
    movi    v20.16b, #0
    movi    v21.16b, #0
    movi    v22.16b, #0
    movi    v23.16b, #0
    movi    v24.16b, #0
    movi    v25.16b, #0
    movi    v26.16b, #0
    movi    v27.16b, #0
    movi    v30.16b, #0
    movi    v31.16b, #0
    ret

aes_gcm_setkey:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x19, x0
    bl      aes_expand
    mov     x0, x19
    bl      aes_load_keys
    movi    v0.16b, #0
    bl      aes_enc_block
    gcm_reflect v0
    add     x0, x19, #AES_CTX_H
    st1     {v0.16b}, [x0]
    bl      aes_wipe_keys
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

ghash_absorb:
    gcm_reflect v1
    eor     v30.16b, v30.16b, v1.16b
    pmull   v2.1q, v30.1d, v27.1d
    pmull2  v3.1q, v30.2d, v27.2d
    ext     v4.16b, v27.16b, v27.16b, #8
    pmull   v5.1q, v30.1d, v4.1d
    pmull2  v4.1q, v30.2d, v4.2d
    eor     v4.16b, v4.16b, v5.16b
    ext     v5.16b, v29.16b, v4.16b, #8
    ext     v4.16b, v4.16b, v29.16b, #8
    eor     v2.16b, v2.16b, v5.16b
    eor     v3.16b, v3.16b, v4.16b
    pmull   v4.1q, v3.1d, v28.1d
    pmull2  v5.1q, v3.2d, v28.2d
    eor     v2.16b, v2.16b, v4.16b
    ext     v6.16b, v29.16b, v5.16b, #8
    eor     v2.16b, v2.16b, v6.16b
    ext     v6.16b, v5.16b, v29.16b, #8
    pmull   v6.1q, v6.1d, v28.1d
    eor     v30.16b, v2.16b, v6.16b
    ret

ghash_data:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     x20, x1

ghash_data_loop:
    cmp     x20, #AES_BLOCK_SIZE
    b.lo    ghash_data_partial
    ld1     {v1.16b}, [x19], #16
    bl      ghash_absorb
    sub     x20, x20, #AES_BLOCK_SIZE
    b       ghash_data_loop

ghash_data_partial:
    cbz     x20, ghash_data_done
    add     x0, sp, #32
    mov     w1, #AES_BLOCK_SIZE
    bl      mem_wipe
    mov     x0, x19
    add     x1, sp, #32
    mov     w2, w20
    bl      mem_copy
    add     x0, sp, #32
    ld1     {v1.16b}, [x0]
    bl      ghash_absorb
    add     x0, sp, #32
    mov     w1, #AES_BLOCK_SIZE
    bl      mem_wipe

ghash_data_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

aes_gcm_encrypt:
    mov     w8, #0
    b       aes_gcm_run

aes_gcm_decrypt:
    mov     w8, #1

aes_gcm_run:
    stp     x29, x30, [sp, #-GCM_FRAME_SIZE]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    stp     x27, x28, [sp, #80]
    mov     x19, x0
    mov     x20, x1
    mov     x21, x2
    mov     x22, x3
    mov     x23, x4
    mov     x24, x5
    mov     x25, x6
    mov     x26, x7
    mov     w27, w8
    str     x24, [sp, #GCM_FRAME_LEN]
    str     x25, [sp, #GCM_FRAME_OUT]
    mov     x0, x19
    bl      aes_load_keys
    mov     x0, #GCM_POLY_R
    dup     v28.2d, x0
    movi    v29.16b, #0
    movi    v30.16b, #0
    mov     x0, x20
    add     x1, sp, #GCM_FRAME_J0
    mov     w2, #GCM_IV_SIZE
    bl      mem_copy
    mov     w0, #0x01000000
    str     w0, [sp, #(GCM_FRAME_J0 + GCM_IV_SIZE)]
    add     x0, sp, #GCM_FRAME_J0
    ld1     {v0.16b}, [x0]
    bl      aes_enc_block
    mov     v31.16b, v0.16b
    mov     w28, #1
    mov     x0, x21
    mov     x1, x22
    bl      ghash_data

aes_gcm_run_data:
    cbz     x24, aes_gcm_run_lengths
    add     w28, w28, #1
    add     x0, sp, #GCM_FRAME_J0
    ld1     {v0.16b}, [x0]
    rev     w0, w28
    mov     v0.s[3], w0
    bl      aes_enc_block
    cmp     x24, #AES_BLOCK_SIZE
    b.lo    aes_gcm_run_partial
    ld1     {v1.16b}, [x23], #16
    eor     v2.16b, v1.16b, v0.16b
    st1     {v2.16b}, [x25], #16
    cbnz    w27, aes_gcm_run_absorb
    mov     v1.16b, v2.16b

aes_gcm_run_absorb:
    bl      ghash_absorb
    sub     x24, x24, #AES_BLOCK_SIZE
    b       aes_gcm_run_data

aes_gcm_run_partial:
    add     x0, sp, #GCM_FRAME_TMP
    st1     {v0.16b}, [x0]
    cbz     w27, aes_gcm_run_partial_xor_start
    mov     x0, x23
    mov     x1, x24
    bl      ghash_data

aes_gcm_run_partial_xor_start:
    add     x0, sp, #GCM_FRAME_TMP
    mov     x1, #0

aes_gcm_run_partial_xor:
    ldrb    w2, [x23, x1]
    ldrb    w3, [x0, x1]
    eor     w2, w2, w3
    strb    w2, [x25, x1]
    add     x1, x1, #1
    cmp     x1, x24
    b.lo    aes_gcm_run_partial_xor
    cbnz    w27, aes_gcm_run_partial_done
    mov     x0, x25
    mov     x1, x24
    bl      ghash_data

aes_gcm_run_partial_done:
    mov     x24, #0
    b       aes_gcm_run_data

aes_gcm_run_lengths:
    lsl     x0, x22, #3
    rev     x0, x0
    ldr     x1, [sp, #GCM_FRAME_LEN]
    lsl     x1, x1, #3
    rev     x1, x1
    stp     x0, x1, [sp, #GCM_FRAME_TMP]
    add     x0, sp, #GCM_FRAME_TMP
    ld1     {v1.16b}, [x0]
    bl      ghash_absorb
    mov     v0.16b, v30.16b
    gcm_reflect v0
    eor     v0.16b, v0.16b, v31.16b
    cbnz    w27, aes_gcm_run_verify
    st1     {v0.16b}, [x26]
    mov     w0, #0
    b       aes_gcm_run_done

aes_gcm_run_verify:
    add     x0, sp, #GCM_FRAME_TMP
    st1     {v0.16b}, [x0]
    ldp     x1, x2, [sp, #GCM_FRAME_TMP]
    ldp     x3, x4, [x26]
    eor     x1, x1, x3
    eor     x2, x2, x4
    orr     x1, x1, x2
    cmp     x1, #0
    cset    w19, ne
    cbz     w19, aes_gcm_run_verified
    ldr     x0, [sp, #GCM_FRAME_OUT]
    ldr     x1, [sp, #GCM_FRAME_LEN]
    bl      mem_wipe

aes_gcm_run_verified:
    mov     w0, w19

aes_gcm_run_done:
    mov     w19, w0
    add     x0, sp, #GCM_FRAME_J0
    mov     w1, #(AES_BLOCK_SIZE * 2)
    bl      mem_wipe
    bl      aes_wipe_keys
    mov     w0, w19
    ldp     x27, x28, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #GCM_FRAME_SIZE
    ret

aes_check:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    ladr    x0, aes_ctx
    ldr     x1, [x19]
    bl      aes_gcm_setkey
    ladr    x0, aes_ctx
    ldp     x1, x2, [x19, #8]
    ldp     x3, x4, [x19, #24]
    ldr     x5, [x19, #40]
    ladr    x6, aes_buf
    ladr    x7, aes_tag
    bl      aes_gcm_encrypt
    ladr    x0, aes_buf
    ldr     x1, [x19, #48]
    ldr     w2, [x19, #40]
    bl      mem_equal
    cbz     w0, aes_check_fail
    ladr    x0, aes_tag
    ldr     x1, [x19, #56]
    mov     w2, #GCM_TAG_SIZE
    bl      mem_equal
    cbz     w0, aes_check_fail
    ldr     x0, [x19, #48]
    ladr    x1, aes_buf
    ldr     w2, [x19, #40]
    bl      mem_copy
    ladr    x0, aes_ctx
    ldp     x1, x2, [x19, #8]
    ldr     x3, [x19, #24]
    ladr    x4, aes_buf
    ldr     x5, [x19, #40]
    ladr    x6, aes_buf
    ldr     x7, [x19, #56]
    bl      aes_gcm_decrypt
    cbnz    w0, aes_check_fail
    ladr    x0, aes_buf
    ldr     x1, [x19, #32]
    ldr     w2, [x19, #40]
    bl      mem_equal
    cbz     w0, aes_check_fail
    mov     w0, #0
    b       aes_check_done

aes_check_fail:
    mov     w0, #1

aes_check_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

aes_selftest:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    bl      aes_available
    cbz     w0, aes_selftest_missing
    mov     w19, #1
    ladr    x0, aes_case_1
    bl      aes_check
    cbnz    w0, aes_selftest_fail
    mov     w19, #2
    ladr    x0, aes_case_2
    bl      aes_check
    cbnz    w0, aes_selftest_fail
    mov     w19, #3
    ladr    x0, aes_case_3
    bl      aes_check
    cbnz    w0, aes_selftest_fail
    mov     w19, #4
    ladr    x0, aes_case_4
    bl      aes_check
    cbnz    w0, aes_selftest_fail
    mov     w19, #5
    ladr    x20, aes_case_4
    ldr     x0, [x20, #56]
    ladr    x1, aes_tag
    mov     w2, #GCM_TAG_SIZE
    bl      mem_copy
    ladr    x1, aes_tag
    ldrb    w0, [x1]
    eor     w0, w0, #1
    strb    w0, [x1]
    ladr    x0, aes_ctx
    ldp     x1, x2, [x20, #8]
    ldr     x3, [x20, #24]
    ldr     x4, [x20, #48]
    ldr     x5, [x20, #40]
    ladr    x6, aes_buf
    ladr    x7, aes_tag
    bl      aes_gcm_decrypt
    cmp     w0, #1
    b.ne    aes_selftest_fail
    ladr    x0, aes_buf
    ldr     w1, [x20, #40]
    mov     w2, #0

aes_selftest_wiped:
    ldrb    w3, [x0], #1
    orr     w2, w2, w3
    subs    w1, w1, #1
    b.ne    aes_selftest_wiped
    cbnz    w2, aes_selftest_fail
    ladr    x0, aes_ok_msg
    bl      uart_puts
    b       aes_selftest_done

aes_selftest_fail:
    ladr    x0, aes_fail_msg
    bl      uart_puts
    mov     x0, x19
    bl      uart_putdec
    ladr    x0, uart_newline
    bl      uart_puts
    b       aes_selftest_bad

aes_selftest_missing:
    ladr    x0, aes_missing_msg
    bl      uart_puts

aes_selftest_bad:
    mov     w0, #1
    b       aes_selftest_exit

aes_selftest_done:
    mov     w0, #0

aes_selftest_exit:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret


.macro fe_row a, r0, r1, r2, r3, r4
    mul     x20, \a, x7
    mul     x21, \a, x8
    mul     x22, \a, x9
    mul     x23, \a, x10
    adds    \r0, \r0, x20
    adcs    \r1, \r1, x21
    adcs    \r2, \r2, x22
    adcs    \r3, \r3, x23
    adc     \r4, xzr, xzr
    umulh   x20, \a, x7
    umulh   x21, \a, x8
    umulh   x22, \a, x9
    umulh   x23, \a, x10
    adds    \r1, \r1, x20
    adcs    \r2, \r2, x21
    adcs    \r3, \r3, x22
    adc     \r4, \r4, x23
.endm

.macro fe_call fn, d, a, b
    add     x0, sp, #\d
    add     x1, sp, #\a
    add     x2, sp, #\b
    bl      \fn
.endm

.macro fe_call2 fn, d, a
    add     x0, sp, #\d
    add     x1, sp, #\a
    bl      \fn
.endm

fe_mul:
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    str     x23, [sp, #48]
    ldp     x3, x4, [x1]
    ldp     x5, x6, [x1, #16]
    ldp     x7, x8, [x2]
    ldp     x9, x10, [x2, #16]
    mov     x11, #0
    mov     x12, #0
    mov     x13, #0
    mov     x14, #0
    mov     x15, #0
    mov     x16, #0
    mov     x17, #0
    mov     x19, #0
    fe_row  x3, x11, x12, x13, x14, x15
    fe_row  x4, x12, x13, x14, x15, x16
    fe_row  x5, x13, x14, x15, x16, x17
    fe_row  x6, x14, x15, x16, x17, x19
    mov     x20, #FE_FOLD
    mul     x21, x15, x20
    umulh   x15, x15, x20
    mul     x22, x16, x20
    umulh   x16, x16, x20
    mul     x23, x17, x20
    umulh   x17, x17, x20
    mul     x3, x19, x20
    umulh   x19, x19, x20
    adds    x11, x11, x21
    adcs    x12, x12, x22
    adcs    x13, x13, x23
    adcs    x14, x14, x3
    adc     x4, xzr, xzr
    adds    x12, x12, x15
    adcs    x13, x13, x16
    adcs    x14, x14, x17
    adc     x4, x4, x19
    mul     x4, x4, x20
    adds    x11, x11, x4
    adcs    x12, x12, xzr
    adcs    x13, x13, xzr
    adcs    x14, x14, xzr
    adc     x4, xzr, xzr
    mul     x4, x4, x20
    adds    x11, x11, x4
    adcs    x12, x12, xzr
    adcs    x13, x13, xzr
    adc     x14, x14, xzr
    stp     x11, x12, [x0]
    stp     x13, x14, [x0, #16]
    ldr     x23, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

fe_sqr:
    mov     x2, x1
    b       fe_mul

fe_sqr_n:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     w20, w2
    mov     x2, x1
    bl      fe_mul
    sub     w20, w20, #1

fe_sqr_n_loop:
    cbz     w20, fe_sqr_n_done
    mov     x0, x19
    mov     x1, x19
    mov     x2, x19
    bl      fe_mul
    sub     w20, w20, #1
    b       fe_sqr_n_loop

fe_sqr_n_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

fe_add:
    ldp     x3, x4, [x1]
    ldp     x5, x6, [x1, #16]
    ldp     x7, x8, [x2]
    ldp     x9, x10, [x2, #16]
    adds    x3, x3, x7
    adcs    x4, x4, x8
    adcs    x5, x5, x9
    adcs    x6, x6, x10
    adc     x7, xzr, xzr
    mov     x8, #FE_FOLD
    mul     x7, x7, x8
    adds    x3, x3, x7
    adcs    x4, x4, xzr
    adcs    x5, x5, xzr
    adcs    x6, x6, xzr
    adc     x7, xzr, xzr
    mul     x7, x7, x8
    adds    x3, x3, x7
    adcs    x4, x4, xzr
    adcs    x5, x5, xzr
    adc     x6, x6, xzr
    stp     x3, x4, [x0]
    stp     x5, x6, [x0, #16]
    ret

fe_sub:
    ldp     x3, x4, [x1]
    ldp     x5, x6, [x1, #16]
    ldp     x7, x8, [x2]
    ldp     x9, x10, [x2, #16]
    subs    x3, x3, x7
    sbcs    x4, x4, x8
    sbcs    x5, x5, x9
    sbcs    x6, x6, x10
    sbc     x7, xzr, xzr
    mov     x8, #FE_FOLD
    and     x7, x7, x8
    subs    x3, x3, x7
    sbcs    x4, x4, xzr
    sbcs    x5, x5, xzr
    sbcs    x6, x6, xzr
    sbc     x7, xzr, xzr
    and     x7, x7, x8
    subs    x3, x3, x7
    sbcs    x4, x4, xzr
    sbcs    x5, x5, xzr
    sbc     x6, x6, xzr
    stp     x3, x4, [x0]
    stp     x5, x6, [x0, #16]
    ret

fe_mul_a24:
    ldp     x3, x4, [x1]
    ldp     x5, x6, [x1, #16]
    ldr     x8, =X25519_A24
    mul     x9, x3, x8
    umulh   x10, x3, x8
    mul     x11, x4, x8
    umulh   x12, x4, x8
    mul     x13, x5, x8
    umulh   x14, x5, x8
    mul     x15, x6, x8
    umulh   x16, x6, x8
    adds    x11, x11, x10
    adcs    x13, x13, x12
    adcs    x15, x15, x14
    adc     x16, x16, xzr
    mov     x8, #FE_FOLD
    mul     x16, x16, x8
    adds    x9, x9, x16
    adcs    x11, x11, xzr
    adcs    x13, x13, xzr
    adcs    x15, x15, xzr
    adc     x16, xzr, xzr
    mul     x16, x16, x8
    adds    x9, x9, x16
    adcs    x11, x11, xzr
    adcs    x13, x13, xzr
    adc     x15, x15, xzr
    stp     x9, x11, [x0]
    stp     x13, x15, [x0, #16]
    ret

fe_cswap:
    sub     x2, xzr, x2
    ldp     x3, x4, [x0]
    ldp     x5, x6, [x0, #16]
    ldp     x7, x8, [x1]
    ldp     x9, x10, [x1, #16]
    eor     x11, x3, x7
    and     x11, x11, x2
    eor     x3, x3, x11
    eor     x7, x7, x11
    eor     x11, x4, x8
    and     x11, x11, x2
    eor     x4, x4, x11
    eor     x8, x8, x11
    eor     x11, x5, x9
    and     x11, x11, x2
    eor     x5, x5, x11
    eor     x9, x9, x11
    eor     x11, x6, x10
    and     x11, x11, x2
    eor     x6, x6, x11
    eor     x10, x10, x11
    stp     x3, x4, [x0]
    stp     x5, x6, [x0, #16]
    stp     x7, x8, [x1]
    stp     x9, x10, [x1, #16]
    ret

fe_frombytes:
    ldp     x3, x4, [x1]
    ldp     x5, x6, [x1, #16]
    and     x6, x6, #0x7fffffffffffffff
    stp     x3, x4, [x0]
    stp     x5, x6, [x0, #16]
    ret

fe_tobytes:
    ldp     x3, x4, [x1]
    ldp     x5, x6, [x1, #16]
    mov     x7, #-19
    mov     x8, #-1
    mov     x9, #0x7fffffffffffffff
    subs    x10, x3, x7
    sbcs    x11, x4, x8
    sbcs    x12, x5, x8
    sbcs    x13, x6, x9
    csel    x3, x3, x10, lo
    csel    x4, x4, x11, lo
    csel    x5, x5, x12, lo
    csel    x6, x6, x13, lo
    subs    x10, x3, x7
    sbcs    x11, x4, x8
    sbcs    x12, x5, x8
    sbcs    x13, x6, x9
    csel    x3, x3, x10, lo
    csel    x4, x4, x11, lo
    csel    x5, x5, x12, lo
    csel    x6, x6, x13, lo
    stp     x3, x4, [x0]
    stp     x5, x6, [x0, #16]
    ret

fe_invert:
    stp     x29, x30, [sp, #-FE_INV_FRAME]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     x20, x1
    add     x0, sp, #FE_INV_T0
    mov     x1, x20
    bl      fe_sqr
    fe_call2 fe_sqr, FE_INV_T1, FE_INV_T0
    fe_call2 fe_sqr, FE_INV_T1, FE_INV_T1
    add     x0, sp, #FE_INV_T1
    mov     x1, x20
    add     x2, sp, #FE_INV_T1
    bl      fe_mul
    fe_call fe_mul, FE_INV_T0, FE_INV_T0, FE_INV_T1
    fe_call2 fe_sqr, FE_INV_T2, FE_INV_T0
    fe_call fe_mul, FE_INV_T1, FE_INV_T1, FE_INV_T2
    mov     w2, #5
    fe_call2 fe_sqr_n, FE_INV_T2, FE_INV_T1
    fe_call fe_mul, FE_INV_T1, FE_INV_T2, FE_INV_T1
    mov     w2, #10
    fe_call2 fe_sqr_n, FE_INV_T2, FE_INV_T1
    fe_call fe_mul, FE_INV_T2, FE_INV_T2, FE_INV_T1
    mov     w2, #20
    fe_call2 fe_sqr_n, FE_INV_T3, FE_INV_T2
    fe_call fe_mul, FE_INV_T2, FE_INV_T3, FE_INV_T2
    mov     w2, #10
    fe_call2 fe_sqr_n, FE_INV_T2, FE_INV_T2
    fe_call fe_mul, FE_INV_T1, FE_INV_T2, FE_INV_T1
    mov     w2, #50
    fe_call2 fe_sqr_n, FE_INV_T2, FE_INV_T1
    fe_call fe_mul, FE_INV_T2, FE_INV_T2, FE_INV_T1
    mov     w2, #100
    fe_call2 fe_sqr_n, FE_INV_T3, FE_INV_T2
    fe_call fe_mul, FE_INV_T2, FE_INV_T3, FE_INV_T2
    mov     w2, #50
    fe_call2 fe_sqr_n, FE_INV_T2, FE_INV_T2
    fe_call fe_mul, FE_INV_T1, FE_INV_T2, FE_INV_T1
    mov     w2, #5
    fe_call2 fe_sqr_n, FE_INV_T1, FE_INV_T1
    mov     x0, x19
    add     x1, sp, #FE_INV_T1
    add     x2, sp, #FE_INV_T0
    bl      fe_mul
    add     x0, sp, #FE_INV_T0
    mov     w1, #(FE_SIZE * 4)
    bl      mem_wipe
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #FE_INV_FRAME
    ret

x25519_base:
    stp     x29, x30, [sp, #-48]!
    mov     x2, #9
    stp     x2, xzr, [sp, #16]
    stp     xzr, xzr, [sp, #32]
    add     x2, sp, #16
    bl      x25519
    ldp     x29, x30, [sp], #48
    ret

x25519:
    sub     sp, sp, #X25519_FRAME_SIZE
    stp     x29, x30, [sp]
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    mov     x19, x0
    ldp     x3, x4, [x1]
    ldp     x5, x6, [x1, #16]
    and     x3, x3, #-8
    and     x6, x6, #0x3fffffffffffffff
    orr     x6, x6, #0x4000000000000000
    stp     x3, x4, [sp, #X25519_FRAME_K]
    stp     x5, x6, [sp, #(X25519_FRAME_K + 16)]
    add     x0, sp, #X25519_FRAME_X1
    mov     x1, x2
    bl      fe_frombytes
    ldp     x3, x4, [sp, #X25519_FRAME_X1]
    ldp     x5, x6, [sp, #(X25519_FRAME_X1 + 16)]
    stp     x3, x4, [sp, #X25519_FRAME_X3]
    stp     x5, x6, [sp, #(X25519_FRAME_X3 + 16)]
    mov     x3, #1
    stp     x3, xzr, [sp, #X25519_FRAME_X2]
    stp     xzr, xzr, [sp, #(X25519_FRAME_X2 + 16)]
    stp     xzr, xzr, [sp, #X25519_FRAME_Z2]
    stp     xzr, xzr, [sp, #(X25519_FRAME_Z2 + 16)]
    stp     x3, xzr, [sp, #X25519_FRAME_Z3]
    stp     xzr, xzr, [sp, #(X25519_FRAME_Z3 + 16)]
    mov     x20, #254
    mov     x21, #0

x25519_ladder:
    lsr     x5, x20, #6
    add     x3, sp, #X25519_FRAME_K
    ldr     x4, [x3, x5, lsl #3]
    and     x6, x20, #63
    lsr     x4, x4, x6
    and     x22, x4, #1
    eor     x23, x21, x22
    mov     x21, x22
    add     x0, sp, #X25519_FRAME_X2
    add     x1, sp, #X25519_FRAME_X3
    mov     x2, x23
    bl      fe_cswap
    add     x0, sp, #X25519_FRAME_Z2
    add     x1, sp, #X25519_FRAME_Z3
    mov     x2, x23
    bl      fe_cswap
    fe_call fe_add, X25519_FRAME_A, X25519_FRAME_X2, X25519_FRAME_Z2
    fe_call2 fe_sqr, X25519_FRAME_AA, X25519_FRAME_A
    fe_call fe_sub, X25519_FRAME_B, X25519_FRAME_X2, X25519_FRAME_Z2
    fe_call2 fe_sqr, X25519_FRAME_BB, X25519_FRAME_B
    fe_call fe_sub, X25519_FRAME_E, X25519_FRAME_AA, X25519_FRAME_BB
    fe_call fe_add, X25519_FRAME_C, X25519_FRAME_X3, X25519_FRAME_Z3
    fe_call fe_sub, X25519_FRAME_D, X25519_FRAME_X3, X25519_FRAME_Z3
    fe_call fe_mul, X25519_FRAME_DA, X25519_FRAME_D, X25519_FRAME_A
    fe_call fe_mul, X25519_FRAME_CB, X25519_FRAME_C, X25519_FRAME_B
    fe_call fe_add, X25519_FRAME_T, X25519_FRAME_DA, X25519_FRAME_CB
    fe_call2 fe_sqr, X25519_FRAME_X3, X25519_FRAME_T
    fe_call fe_sub, X25519_FRAME_T, X25519_FRAME_DA, X25519_FRAME_CB
    fe_call2 fe_sqr, X25519_FRAME_T, X25519_FRAME_T
    fe_call fe_mul, X25519_FRAME_Z3, X25519_FRAME_X1, X25519_FRAME_T
    fe_call fe_mul, X25519_FRAME_X2, X25519_FRAME_AA, X25519_FRAME_BB
    fe_call2 fe_mul_a24, X25519_FRAME_T, X25519_FRAME_E
    fe_call fe_add, X25519_FRAME_T, X25519_FRAME_AA, X25519_FRAME_T
    fe_call fe_mul, X25519_FRAME_Z2, X25519_FRAME_E, X25519_FRAME_T
    subs    x20, x20, #1
    b.ge    x25519_ladder
    add     x0, sp, #X25519_FRAME_X2
    add     x1, sp, #X25519_FRAME_X3
    mov     x2, x21
    bl      fe_cswap
    add     x0, sp, #X25519_FRAME_Z2
    add     x1, sp, #X25519_FRAME_Z3
    mov     x2, x21
    bl      fe_cswap
    fe_call2 fe_invert, X25519_FRAME_T, X25519_FRAME_Z2
    fe_call fe_mul, X25519_FRAME_T, X25519_FRAME_X2, X25519_FRAME_T
    mov     x0, x19
    add     x1, sp, #X25519_FRAME_T
    bl      fe_tobytes
    add     x0, sp, #X25519_FRAME_K
    mov     w1, #(X25519_FRAME_SIZE - X25519_FRAME_K)
    bl      mem_wipe
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp]
    add     sp, sp, #X25519_FRAME_SIZE
    ret

x25519_selftest:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     w19, #0
    ladr    x20, x25519_cases

x25519_selftest_loop:
    cmp     w19, #6
    b.hs    x25519_selftest_ok
    ldp     x1, x2, [x20]
    ladr    x0, sha_digest
    cbz     x2, x25519_selftest_base
    bl      x25519
    b       x25519_selftest_compare

x25519_selftest_base:
    bl      x25519_base

x25519_selftest_compare:
    ladr    x0, sha_digest
    ldr     x1, [x20, #16]
    bl      sha_compare
    cbnz    w0, x25519_selftest_fail
    add     w19, w19, #1
    add     x20, x20, #24
    b       x25519_selftest_loop

x25519_selftest_ok:
    ladr    x0, x25519_ok_msg
    bl      uart_puts
    b       x25519_selftest_done

x25519_selftest_fail:
    ladr    x0, x25519_fail_msg
    bl      uart_puts
    add     w0, w19, #1
    bl      uart_putdec
    ladr    x0, uart_newline
    bl      uart_puts
    mov     w0, #1
    b       x25519_selftest_exit

x25519_selftest_done:
    mov     w0, #0

x25519_selftest_exit:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret


tls_fail:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x19, x0
    ladr    x0, tls_fail_msg
    bl      uart_puts
    mov     x0, x19
    bl      uart_puts
    ladr    x0, uart_newline
    bl      uart_puts
    ladr    x9, tls_ctx
    mov     w0, #TLS_STATE_CLOSED
    strb    w0, [x9, #TLS_STATE]
    add     x0, x9, #TLS_PRIV
    mov     w1, #(TLS_CTX_SIZE - TLS_PRIV)
    bl      mem_wipe
    ladr    x9, tls_ctx
    ldr     x0, [x9, #TLS_TCB]
    cbz     x0, tls_fail_done
    bl      tcp_close

tls_fail_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

tls_transcript_update:
    stp     x29, x30, [sp, #-16]!
    mov     x2, x1
    mov     x1, x0
    ladr    x0, tls_ctx
    add     x0, x0, #TLS_TRANSCRIPT
    bl      sha256_update
    ldp     x29, x30, [sp], #16
    ret

tls_transcript_hash:
    stp     x29, x30, [sp, #-144]!
    str     x19, [sp, #16]
    mov     x19, x0
    ladr    x0, tls_ctx
    add     x0, x0, #TLS_TRANSCRIPT
    add     x1, sp, #32
    mov     w2, #SHA_CTX_SIZE
    bl      mem_copy
    add     x0, sp, #32
    mov     x1, x19
    bl      sha256_final
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #144
    ret

tls_expand_label:
    stp     x29, x30, [sp, #-80]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    mov     x19, x0
    mov     x20, x1
    mov     w21, w2
    mov     x22, x3
    mov     w23, w4
    mov     x24, x5
    mov     w25, w6
    ladr    x26, tls_ctx
    add     x26, x26, #TLS_TMP
    lsr     w0, w25, #8
    strb    w0, [x26]
    strb    w25, [x26, #1]
    strb    w21, [x26, #2]
    mov     x0, x20
    add     x1, x26, #3
    mov     w2, w21
    bl      mem_copy
    add     x1, x26, #3
    add     x1, x1, x21
    strb    w23, [x1], #1
    mov     x0, x22
    mov     w2, w23
    bl      mem_copy
    add     w2, w21, w23
    add     w2, w2, #4
    mov     x0, x19
    mov     x1, x26
    mov     x3, x24
    mov     x4, x25
    bl      hkdf_expand
    mov     x0, x26
    mov     w1, #64
    bl      mem_wipe
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #80
    ret

tls_derive_secret:
    mov     x5, x4
    mov     w4, #SHA_DIGEST_SIZE
    mov     w6, #SHA_DIGEST_SIZE
    b       tls_expand_label

tls_set_keys:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x19, x0
    mov     x20, x1
    mov     x21, x2
    mov     x22, x3
    mov     x0, x19
    ladr    x1, tls_label_key
    mov     w2, #(tls_label_key_end - tls_label_key)
    mov     x3, #0
    mov     w4, #0
    mov     x5, x21
    mov     w6, #AES_KEY_SIZE
    bl      tls_expand_label
    mov     x0, x19
    ladr    x1, tls_label_iv
    mov     w2, #(tls_label_iv_end - tls_label_iv)
    mov     x3, #0
    mov     w4, #0
    mov     x5, x22
    mov     w6, #GCM_IV_SIZE
    bl      tls_expand_label
    mov     x0, x20
    mov     x1, x21
    bl      aes_gcm_setkey
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

tls_nonce:
    ldr     w3, [x0]
    ldr     x4, [x0, #4]
    rev     x1, x1
    eor     x4, x4, x1
    str     w3, [x2]
    str     x4, [x2, #4]
    ret

tls_finished_key:
    ladr    x1, tls_label_finished
    mov     w2, #(tls_label_finished_end - tls_label_finished)
    mov     x3, #0
    mov     w4, #0
    mov     w6, #SHA_DIGEST_SIZE
    b       tls_expand_label

tls_connect:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     w20, w0
    mov     w21, w1
    ladr    x19, tls_ctx
    ladr    x0, crypto_ready
    ldrb    w0, [x0]
    cbnz    w0, tls_connect_allowed
    ladr    x0, tls_locked_msg
    bl      uart_puts
    mov     x0, #0
    b       tls_connect_done

tls_connect_entropy:
    ladr    x0, tls_entropy_msg
    bl      uart_puts

tls_connect_wipe:
    add     x0, x19, #TLS_PRIV
    mov     w1, #(TLS_CTX_SIZE - TLS_PRIV)
    bl      mem_wipe
    mov     x0, #0
    b       tls_connect_done

tls_connect_allowed:
    mov     x0, x19
    mov     w1, #TLS_CTX_SIZE
    bl      mem_wipe
    ladr    x0, tls_line
    str     wzr, [x0]
    add     x0, x19, #TLS_PRIV
    mov     w1, #32
    bl      rng_get
    cbnz    w0, tls_connect_entropy
    add     x0, x19, #TLS_RANDOM
    mov     w1, #32
    bl      rng_get
    cbnz    w0, tls_connect_entropy
    add     x0, x19, #TLS_PUB
    add     x1, x19, #TLS_PRIV
    bl      x25519_base
    add     x0, x19, #TLS_TRANSCRIPT
    bl      sha256_init
    mov     w0, w20
    mov     w1, w21
    ladr    x2, tls_on_data
    bl      tcp_open
    cbz     x0, tls_connect_wipe
    str     x0, [x19, #TLS_TCB]
    bl      tls_build_client_hello
    mov     w20, w0
    ladr    x0, tls_out_buf
    add     x0, x0, #5
    sub     w1, w20, #5
    bl      tls_transcript_update
    ldr     x0, [x19, #TLS_TCB]
    ladr    x1, tls_out_buf
    mov     w2, w20
    bl      tcp_write
    mov     w0, #TLS_STATE_HELLO_SENT
    strb    w0, [x19, #TLS_STATE]
    ladr    x0, tls_hello_msg
    bl      uart_puts
    mov     x0, #1

tls_connect_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

tls_configure:
    ladr    x9, tls_params
    mov     w1, w1
    mov     w3, w3
    stp     x0, x1, [x9, #TLSP_HOST]
    stp     x2, x3, [x9, #TLSP_REQ]
    str     x4, [x9, #TLSP_APP]
    ret

tls_build_client_hello:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    ladr    x19, tls_ctx
    ladr    x20, tls_out_buf
    ladr    x9, tls_params
    ldp     x21, x22, [x9, #TLSP_HOST]
    ladr    x0, tls_hello_tpl
    mov     x1, x20
    mov     w2, #(tls_hello_ext - tls_hello_tpl)
    bl      mem_copy
    add     x0, x19, #TLS_RANDOM
    add     x1, x20, #(tls_hello_random - tls_hello_tpl)
    mov     w2, #32
    bl      mem_copy
    add     x1, x20, #(tls_hello_ext - tls_hello_tpl)
    strb    wzr, [x1]
    strb    wzr, [x1, #1]
    add     w2, w22, #5
    lsr     w3, w2, #8
    strb    w3, [x1, #2]
    strb    w2, [x1, #3]
    add     w2, w22, #3
    lsr     w3, w2, #8
    strb    w3, [x1, #4]
    strb    w2, [x1, #5]
    strb    wzr, [x1, #6]
    lsr     w3, w22, #8
    strb    w3, [x1, #7]
    strb    w22, [x1, #8]
    add     x1, x1, #TLS_SNI_HDR
    mov     x0, x21
    mov     w2, w22
    bl      mem_copy
    add     x1, x20, #(tls_hello_ext - tls_hello_tpl + TLS_SNI_HDR)
    add     x1, x1, x22
    ladr    x0, tls_host_end
    mov     w2, #(tls_hello_end - tls_host_end)
    bl      mem_copy
    mov     w9, #(tls_hello_ext - tls_hello_tpl + TLS_SNI_HDR + (tls_hello_end - tls_host_end))
    add     w21, w9, w22
    add     x0, x19, #TLS_PUB
    sub     w1, w21, #32
    add     x1, x20, x1
    mov     w2, #32
    bl      mem_copy
    sub     w0, w21, #5
    lsr     w1, w0, #8
    strb    w1, [x20, #3]
    strb    w0, [x20, #4]
    sub     w0, w21, #9
    lsr     w1, w0, #16
    strb    w1, [x20, #6]
    lsr     w1, w0, #8
    strb    w1, [x20, #7]
    strb    w0, [x20, #8]
    sub     w0, w21, #(tls_hello_ext - tls_hello_tpl)
    lsr     w1, w0, #8
    strb    w1, [x20, #(tls_hello_ext - tls_hello_tpl - 2)]
    strb    w0, [x20, #(tls_hello_ext - tls_hello_tpl - 1)]
    mov     w0, w21
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

tls_demo_app:
    cbz     w2, tls_demo_app_none
    stp     x29, x30, [sp, #-16]!
    ladr    x9, tls_ctx
    ldrb    w0, [x9, #TLS_SEEN]
    cbnz    w0, tls_demo_app_done
    ladr    x0, tls_line
    bl      line_collect
    cbz     w0, tls_demo_app_done
    ladr    x9, tls_ctx
    mov     w0, #1
    strb    w0, [x9, #TLS_SEEN]
    ladr    x0, tls_https_msg
    bl      uart_puts
    ladr    x0, tls_line
    add     x0, x0, #4
    bl      uart_puts
    ladr    x0, uart_newline
    bl      uart_puts

tls_demo_app_done:
    ldp     x29, x30, [sp], #16

tls_demo_app_none:
    ret

tls_send_record:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     w19, w0
    mov     x20, x1
    mov     w21, w2
    ladr    x22, tls_out_buf
    mov     w0, #TLS_REC_APPDATA
    strb    w0, [x22]
    mov     w0, #0x03
    strb    w0, [x22, #1]
    strb    w0, [x22, #2]
    add     w0, w21, #(GCM_TAG_SIZE + 1)
    lsr     w1, w0, #8
    strb    w1, [x22, #3]
    strb    w0, [x22, #4]
    mov     x0, x20
    add     x1, x22, #5
    mov     w2, w21
    bl      mem_copy
    add     x1, x22, #5
    strb    w19, [x1, x21]
    ladr    x9, tls_ctx
    add     x0, x9, #TLS_WIV
    ldr     x1, [x9, #TLS_WSEQ]
    add     x2, x9, #TLS_NONCE
    bl      tls_nonce
    ladr    x9, tls_ctx
    ldr     x1, [x9, #TLS_WSEQ]
    add     x1, x1, #1
    str     x1, [x9, #TLS_WSEQ]
    add     x0, x9, #TLS_AES_W
    add     x1, x9, #TLS_NONCE
    mov     x2, x22
    mov     x3, #5
    add     x4, x22, #5
    add     x5, x21, #1
    add     x6, x22, #5
    add     x7, x6, x5
    bl      aes_gcm_encrypt
    ladr    x9, tls_ctx
    ldr     x0, [x9, #TLS_TCB]
    mov     x1, x22
    add     w2, w21, #(5 + 1 + GCM_TAG_SIZE)
    bl      tcp_write
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

tls_on_data:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    ladr    x19, tls_ctx
    mov     x20, x1
    mov     w21, w2
    ldr     x9, [x19, #TLS_TCB]
    cmp     x0, x9
    b.ne    tls_on_data_done
    cbnz    w21, tls_on_data_append
    ladr    x9, tls_params
    ldr     x9, [x9, #TLSP_APP]
    cbz     x9, tls_on_data_closed
    mov     x1, #0
    mov     w2, #0
    blr     x9

tls_on_data_closed:
    ldrb    w22, [x19, #TLS_STATE]
    cmp     w22, #TLS_STATE_CLOSED
    b.eq    tls_on_data_done
    mov     w0, #TLS_STATE_CLOSED
    strb    w0, [x19, #TLS_STATE]
    str     xzr, [x19, #TLS_TCB]
    add     x0, x19, #TLS_PRIV
    mov     w1, #(TLS_CTX_SIZE - TLS_PRIV)
    bl      mem_wipe
    ladr    x0, tls_closed_msg
    bl      uart_puts
    cmp     w22, #TLS_STATE_IDLE
    b.eq    tls_on_data_done
    ladr    x0, tls_truncated_msg
    bl      uart_puts
    b       tls_on_data_done

tls_on_data_append:
    ldrb    w0, [x19, #TLS_STATE]
    cmp     w0, #TLS_STATE_CLOSED
    b.eq    tls_on_data_done

tls_on_data_take:
    cbz     w21, tls_on_data_done
    ldr     w0, [x19, #TLS_RX_LEN]
    cmp     w0, #5
    b.hs    tls_on_data_body
    mov     w1, #5
    sub     w22, w1, w0
    b       tls_on_data_copy

tls_on_data_body:
    ladr    x1, tls_rx_buf
    ldrb    w2, [x1, #3]
    ldrb    w3, [x1, #4]
    orr     w2, w3, w2, lsl #8
    mov     w3, #TLS_REC_MAX
    cmp     w2, w3
    b.hi    tls_on_data_toolong
    add     w2, w2, #5
    sub     w22, w2, w0

tls_on_data_copy:
    cmp     w22, w21
    csel    w22, w21, w22, hi
    ladr    x1, tls_rx_buf
    add     x1, x1, x0
    mov     x0, x20
    mov     w2, w22
    bl      mem_copy
    add     x20, x20, x22
    sub     w21, w21, w22
    ldr     w0, [x19, #TLS_RX_LEN]
    add     w0, w0, w22
    str     w0, [x19, #TLS_RX_LEN]
    cmp     w0, #5
    b.lo    tls_on_data_take
    ladr    x1, tls_rx_buf
    ldrb    w2, [x1, #3]
    ldrb    w3, [x1, #4]
    orr     w2, w3, w2, lsl #8
    add     w3, w2, #5
    cmp     w0, w3
    b.lo    tls_on_data_take
    mov     x0, x1
    mov     w1, w2
    bl      tls_process_record
    str     wzr, [x19, #TLS_RX_LEN]
    ldrb    w0, [x19, #TLS_STATE]
    cmp     w0, #TLS_STATE_CLOSED
    b.eq    tls_on_data_done
    b       tls_on_data_take

tls_on_data_toolong:
    ladr    x0, tls_toolong_msg
    bl      tls_fail

tls_on_data_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

tls_process_record:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x20, x0
    mov     w21, w1
    ladr    x19, tls_ctx
    ldrb    w0, [x20]
    cmp     w0, #TLS_REC_CCS
    b.eq    tls_process_record_ccs
    cmp     w0, #TLS_REC_ALERT
    b.eq    tls_process_record_alert
    cmp     w0, #TLS_REC_HANDSHAKE
    b.eq    tls_process_record_plain
    cmp     w0, #TLS_REC_APPDATA
    b.eq    tls_process_record_encrypted
    ladr    x0, tls_badtype_msg
    bl      tls_fail
    b       tls_process_record_done

tls_process_record_alert:
    add     x0, x20, #5
    mov     w1, w21
    bl      tls_alert
    b       tls_process_record_done

tls_process_record_plain:
    ldrb    w0, [x19, #TLS_STATE]
    cmp     w0, #TLS_STATE_HELLO_SENT
    b.ne    tls_process_record_unexpected
    add     x0, x20, #5
    mov     w1, w21
    mov     w2, #1
    bl      tls_handshake_append
    b       tls_process_record_done

tls_process_record_encrypted:
    ldrb    w0, [x19, #TLS_STATE]
    cmp     w0, #TLS_STATE_HANDSHAKE
    b.lo    tls_process_record_unexpected
    cmp     w21, #(GCM_TAG_SIZE + 1)
    b.lo    tls_process_record_unexpected
    add     x0, x19, #TLS_RIV
    ldr     x1, [x19, #TLS_RSEQ]
    add     x2, x19, #TLS_NONCE
    bl      tls_nonce
    ldr     x1, [x19, #TLS_RSEQ]
    add     x1, x1, #1
    str     x1, [x19, #TLS_RSEQ]
    sub     w22, w21, #GCM_TAG_SIZE
    add     x0, x19, #TLS_AES_R
    add     x1, x19, #TLS_NONCE
    mov     x2, x20
    mov     x3, #5
    add     x4, x20, #5
    mov     x5, x22
    add     x6, x20, #5
    add     x7, x6, x5
    bl      aes_gcm_decrypt
    cbnz    w0, tls_process_record_badtag
    add     x1, x20, #5

tls_process_record_strip:
    cbz     w22, tls_process_record_empty
    sub     w22, w22, #1
    ldrb    w0, [x1, x22]
    cbz     w0, tls_process_record_strip
    cmp     w0, #TLS_REC_HANDSHAKE
    b.eq    tls_process_record_inner_hs
    cmp     w0, #TLS_REC_APPDATA
    b.eq    tls_process_record_inner_app
    cmp     w0, #TLS_REC_ALERT
    b.eq    tls_process_record_inner_alert
    b       tls_process_record_unexpected

tls_process_record_ccs:
    ldrb    w0, [x19, #TLS_STATE]
    sub     w0, w0, #TLS_STATE_HELLO_SENT
    cmp     w0, #1
    b.hi    tls_process_record_unexpected
    cmp     w21, #1
    b.ne    tls_process_record_unexpected
    ldrb    w0, [x20, #5]
    cmp     w0, #1
    b.ne    tls_process_record_unexpected
    mov     w0, #0x10
    mov     w1, #0
    bl      tls_hs_mark
    cbnz    w0, tls_process_record_unexpected
    b       tls_process_record_done

tls_process_record_inner_hs:
    add     x0, x20, #5
    mov     w1, w22
    mov     w2, #0
    bl      tls_handshake_append
    b       tls_process_record_done

tls_process_record_inner_alert:
    add     x0, x20, #5
    mov     w1, w22
    bl      tls_alert
    b       tls_process_record_done

tls_process_record_inner_app:
    ldrb    w0, [x19, #TLS_STATE]
    cmp     w0, #TLS_STATE_CONNECTED
    b.ne    tls_process_record_done
    cbz     w22, tls_process_record_done
    ladr    x9, tls_params
    ldr     x9, [x9, #TLSP_APP]
    cbz     x9, tls_process_record_done
    add     x1, x20, #5
    mov     w2, w22
    blr     x9
    b       tls_process_record_done

tls_process_record_empty:
    ladr    x0, tls_empty_msg
    bl      tls_fail
    b       tls_process_record_done

tls_process_record_badtag:
    ladr    x0, tls_badtag_msg
    bl      tls_fail
    b       tls_process_record_done

tls_process_record_unexpected:
    ladr    x0, tls_unexpected_msg
    bl      tls_fail

tls_process_record_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

tls_alert:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     x19, x0
    mov     w20, w1
    cmp     w20, #2
    b.ne    tls_alert_bad
    ldrb    w21, [x19, #1]
    cbz     w21, tls_alert_notify
    cmp     w21, #TLS_ALERT_USER_CANCELED
    b.eq    tls_alert_done
    ladr    x0, tls_alert_msg
    bl      uart_puts
    ldrb    w0, [x19]
    bl      uart_putdec
    mov     w0, #0x20
    bl      uart_putc
    mov     w0, w21
    bl      uart_putdec
    ladr    x0, uart_newline
    bl      uart_puts
    ladr    x0, tls_alert_fatal_msg
    bl      tls_fail
    b       tls_alert_done

tls_alert_bad:
    ladr    x0, tls_alert_len_msg
    bl      tls_fail
    b       tls_alert_done

tls_alert_notify:
    ladr    x0, tls_notify_msg
    bl      uart_puts
    ladr    x9, tls_ctx
    ldrb    w0, [x9, #TLS_STATE]
    cmp     w0, #TLS_STATE_HANDSHAKE
    b.lo    tls_alert_close
    mov     w0, #TLS_REC_ALERT
    ladr    x1, tls_close_notify
    mov     w2, #2
    bl      tls_send_record

tls_alert_close:
    ladr    x9, tls_ctx
    mov     w0, #TLS_STATE_CLOSED
    strb    w0, [x9, #TLS_STATE]
    add     x0, x9, #TLS_PRIV
    mov     w1, #(TLS_CTX_SIZE - TLS_PRIV)
    bl      mem_wipe
    ladr    x9, tls_ctx
    ldr     x0, [x9, #TLS_TCB]
    cbz     x0, tls_alert_done
    bl      tcp_close

tls_alert_done:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

tls_handshake_append:
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    str     x23, [sp, #48]
    ladr    x19, tls_ctx
    mov     x20, x0
    mov     w21, w1
    mov     w23, w2

tls_handshake_take:
    cbz     w21, tls_handshake_done
    ldr     w0, [x19, #TLS_HS_LEN]
    cmp     w0, #4
    b.hs    tls_handshake_body
    mov     w1, #4
    sub     w22, w1, w0
    b       tls_handshake_copy

tls_handshake_body:
    ladr    x1, tls_hs_buf
    ldrb    w2, [x1, #1]
    ldrb    w3, [x1, #2]
    ldrb    w4, [x1, #3]
    lsl     w2, w2, #16
    orr     w2, w2, w3, lsl #8
    orr     w2, w2, w4
    add     w2, w2, #4
    mov     w3, #TLS_HS_SIZE
    cmp     w2, w3
    b.hi    tls_handshake_overflow
    sub     w22, w2, w0

tls_handshake_copy:
    cmp     w22, w21
    csel    w22, w21, w22, hi
    ladr    x1, tls_hs_buf
    add     x1, x1, x0
    mov     x0, x20
    mov     w2, w22
    bl      mem_copy
    add     x20, x20, x22
    sub     w21, w21, w22
    ldr     w0, [x19, #TLS_HS_LEN]
    add     w0, w0, w22
    str     w0, [x19, #TLS_HS_LEN]
    cmp     w0, #4
    b.lo    tls_handshake_take
    ladr    x1, tls_hs_buf
    ldrb    w2, [x1, #1]
    ldrb    w3, [x1, #2]
    ldrb    w4, [x1, #3]
    lsl     w2, w2, #16
    orr     w2, w2, w3, lsl #8
    orr     w2, w2, w4
    add     w3, w2, #4
    cmp     w0, w3
    b.lo    tls_handshake_take
    mov     x0, x1
    mov     w1, w2
    bl      tls_handshake_message
    str     wzr, [x19, #TLS_HS_LEN]
    ldrb    w0, [x19, #TLS_STATE]
    cmp     w0, #TLS_STATE_CLOSED
    b.eq    tls_handshake_done
    cbz     w23, tls_handshake_take
    cbz     w21, tls_handshake_done
    ladr    x0, tls_badmsg_msg
    bl      tls_fail
    b       tls_handshake_done

tls_handshake_overflow:
    ladr    x0, tls_overflow_msg
    bl      tls_fail

tls_handshake_done:
    ldr     x23, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

tls_hs_mark:
    ladr    x9, tls_ctx
    ldrb    w2, [x9, #TLS_HS_SEEN]
    and     w3, w2, w1
    cmp     w3, w1
    b.ne    tls_hs_mark_bad
    tst     w2, w0
    b.ne    tls_hs_mark_bad
    orr     w2, w2, w0
    strb    w2, [x9, #TLS_HS_SEEN]
    mov     w0, #0
    ret

tls_hs_mark_bad:
    mov     w0, #1
    ret

tls_handshake_message:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    ladr    x19, tls_ctx
    mov     x20, x0
    mov     w21, w1
    ldrb    w22, [x20]
    ldrb    w0, [x19, #TLS_STATE]
    cmp     w0, #TLS_STATE_CONNECTED
    b.eq    tls_handshake_message_done
    cmp     w22, #TLS_HS_SERVER_HELLO
    b.eq    tls_handshake_message_hello
    cmp     w0, #TLS_STATE_HANDSHAKE
    b.ne    tls_handshake_message_bad
    cmp     w22, #TLS_HS_FINISHED
    b.eq    tls_handshake_message_finished
    cmp     w22, #TLS_HS_CERT_VERIFY
    b.eq    tls_handshake_message_verify
    cmp     w22, #TLS_HS_CERTIFICATE
    b.ne    tls_handshake_message_hash
    mov     w0, #2
    mov     w1, #1
    bl      tls_hs_mark
    cbnz    w0, tls_handshake_message_bad
    add     x0, x20, #4
    mov     w1, w21
    bl      tls_certificate
    cbnz    w0, tls_handshake_message_done

tls_handshake_message_hash:
    cmp     w22, #TLS_HS_ENCRYPTED_EXT
    b.ne    tls_handshake_message_hash_cert
    mov     w0, #1
    mov     w1, #0
    bl      tls_hs_mark
    cbnz    w0, tls_handshake_message_bad
    b       tls_handshake_message_hash_do

tls_handshake_message_hash_cert:
    cmp     w22, #TLS_HS_CERTIFICATE
    b.eq    tls_handshake_message_hash_do
    cmp     w22, #TLS_HS_CERT_VERIFY
    b.eq    tls_handshake_message_hash_do
    ladr    x0, tls_badmsg_msg
    bl      tls_fail
    b       tls_handshake_message_done

tls_handshake_message_hash_do:
    mov     x0, x20
    add     w1, w21, #4
    bl      tls_transcript_update
    b       tls_handshake_message_done

tls_handshake_message_hello:
    ldrb    w0, [x19, #TLS_STATE]
    cmp     w0, #TLS_STATE_HELLO_SENT
    b.ne    tls_handshake_message_bad
    add     x0, x20, #4
    mov     w1, w21
    bl      tls_parse_server_hello
    cbnz    w0, tls_handshake_message_done
    mov     x0, x20
    add     w1, w21, #4
    bl      tls_transcript_update
    bl      tls_keys_handshake
    cbnz    w0, tls_handshake_message_done
    mov     w0, #TLS_STATE_HANDSHAKE
    strb    w0, [x19, #TLS_STATE]
    ladr    x0, tls_server_hello_msg
    bl      uart_puts
    b       tls_handshake_message_done

tls_handshake_message_finished:
    ldrb    w0, [x19, #TLS_STATE]
    cmp     w0, #TLS_STATE_HANDSHAKE
    b.ne    tls_handshake_message_bad
    cmp     w21, #SHA_DIGEST_SIZE
    b.ne    tls_handshake_message_bad
    mov     w0, #8
    mov     w1, #7
    bl      tls_hs_mark
    cbnz    w0, tls_handshake_message_bad
    add     x0, x19, #TLS_HASH
    bl      tls_transcript_hash
    add     x0, x19, #TLS_S_HS
    add     x5, x19, #TLS_FINKEY
    bl      tls_finished_key
    add     x0, x19, #TLS_FINKEY
    mov     x1, #SHA_DIGEST_SIZE
    add     x2, x19, #TLS_HASH
    mov     x3, #SHA_DIGEST_SIZE
    ladr    x4, sha_digest
    bl      hmac_compute
    ladr    x0, sha_digest
    add     x1, x20, #4
    bl      sha_compare
    cbnz    w0, tls_handshake_message_badfin
    mov     x0, x20
    add     w1, w21, #4
    bl      tls_transcript_update
    bl      tls_keys_finish
    b       tls_handshake_message_done

tls_handshake_message_verify:
    ldrb    w0, [x19, #TLS_STATE]
    cmp     w0, #TLS_STATE_HANDSHAKE
    b.ne    tls_handshake_message_bad
    mov     w0, #4
    mov     w1, #3
    bl      tls_hs_mark
    cbnz    w0, tls_handshake_message_bad
    add     x0, x20, #4
    mov     w1, w21
    bl      tls_cert_verify
    cbnz    w0, tls_handshake_message_done
    b       tls_handshake_message_hash_do

tls_handshake_message_badfin:
    ladr    x0, tls_badfin_msg
    bl      tls_fail
    b       tls_handshake_message_done

tls_handshake_message_bad:
    ladr    x0, tls_badmsg_msg
    bl      tls_fail

tls_handshake_message_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

tls_parse_server_hello:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    ladr    x19, tls_ctx
    mov     x20, x0
    add     x21, x20, x1
    mov     w22, #0
    add     x0, x20, #38
    cmp     x0, x21
    b.hi    tls_parse_sh_short
    ldrb    w0, [x20]
    ldrb    w1, [x20, #1]
    orr     w0, w1, w0, lsl #8
    mov     w1, #TLS_VERSION_12
    cmp     w0, w1
    b.ne    tls_parse_sh_bad
    add     x0, x20, #2
    ladr    x1, tls_hrr_random
    mov     w2, #32
    bl      mem_equal
    cbnz    w0, tls_parse_sh_hrr
    ldrb    w0, [x20, #34]
    cbnz    w0, tls_parse_sh_bad
    add     x20, x20, #35
    add     x0, x20, #5
    cmp     x0, x21
    b.hi    tls_parse_sh_short
    ldrb    w0, [x20]
    ldrb    w1, [x20, #1]
    orr     w0, w1, w0, lsl #8
    mov     w1, #TLS_SUITE_AES128_SHA256
    cmp     w0, w1
    b.ne    tls_parse_sh_suite
    ldrb    w0, [x20, #2]
    cbnz    w0, tls_parse_sh_bad
    ldrb    w0, [x20, #3]
    ldrb    w1, [x20, #4]
    orr     w0, w1, w0, lsl #8
    add     x20, x20, #5
    add     x1, x20, x0
    cmp     x1, x21
    b.ne    tls_parse_sh_bad

tls_parse_sh_ext:
    add     x0, x20, #4
    cmp     x0, x21
    b.hi    tls_parse_sh_end
    ldrb    w0, [x20]
    ldrb    w1, [x20, #1]
    orr     w0, w1, w0, lsl #8
    ldrb    w1, [x20, #2]
    ldrb    w2, [x20, #3]
    orr     w1, w2, w1, lsl #8
    add     x20, x20, #4
    add     x2, x20, x1
    cmp     x2, x21
    b.hi    tls_parse_sh_short
    cmp     w0, #TLS_EXT_VERSIONS
    b.eq    tls_parse_sh_versions
    cmp     w0, #TLS_EXT_KEY_SHARE
    b.eq    tls_parse_sh_key_share
    b       tls_parse_sh_bad

tls_parse_sh_versions:
    cmp     w1, #2
    b.ne    tls_parse_sh_short
    ldrb    w0, [x20]
    ldrb    w2, [x20, #1]
    orr     w0, w2, w0, lsl #8
    mov     w2, #TLS_VERSION_13
    cmp     w0, w2
    b.ne    tls_parse_sh_version
    tst     w22, #1
    b.ne    tls_parse_sh_bad
    orr     w22, w22, #1
    b       tls_parse_sh_next

tls_parse_sh_key_share:
    tst     w22, #2
    b.ne    tls_parse_sh_bad
    cmp     w1, #36
    b.ne    tls_parse_sh_short
    ldrb    w0, [x20]
    ldrb    w2, [x20, #1]
    orr     w0, w2, w0, lsl #8
    cmp     w0, #TLS_GROUP_X25519
    b.ne    tls_parse_sh_group
    ldrb    w0, [x20, #2]
    cbnz    w0, tls_parse_sh_bad
    ldrb    w0, [x20, #3]
    cmp     w0, #32
    b.ne    tls_parse_sh_bad
    add     x0, x20, #4
    add     x1, x19, #TLS_SERVER_PUB
    mov     w2, #32
    stp     x1, x20, [sp, #-16]!
    bl      mem_copy
    ldp     x1, x20, [sp], #16
    orr     w22, w22, #2

tls_parse_sh_next:
    ldrb    w1, [x20, #-2]
    ldrb    w2, [x20, #-1]
    orr     w1, w2, w1, lsl #8
    add     x20, x20, x1
    b       tls_parse_sh_ext

tls_parse_sh_end:
    cmp     x20, x21
    b.ne    tls_parse_sh_bad
    cmp     w22, #3
    b.ne    tls_parse_sh_missing
    mov     w0, #0
    b       tls_parse_sh_done

tls_parse_sh_bad:
    ladr    x0, tls_sh_bad_msg
    b       tls_parse_sh_fail

tls_parse_sh_hrr:
    ladr    x0, tls_hrr_msg
    b       tls_parse_sh_fail

tls_parse_sh_suite:
    ladr    x0, tls_suite_msg
    b       tls_parse_sh_fail

tls_parse_sh_version:
    ladr    x0, tls_version_msg
    b       tls_parse_sh_fail

tls_parse_sh_group:
    ladr    x0, tls_group_msg
    b       tls_parse_sh_fail

tls_parse_sh_missing:
    ladr    x0, tls_missing_msg
    b       tls_parse_sh_fail

tls_parse_sh_short:
    ladr    x0, tls_short_msg

tls_parse_sh_fail:
    bl      tls_fail
    mov     w0, #1

tls_parse_sh_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

tls_keys_handshake:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    ladr    x19, tls_ctx
    ladr    x0, tls_zero32
    mov     x1, #SHA_DIGEST_SIZE
    ladr    x2, tls_zero32
    mov     x3, #SHA_DIGEST_SIZE
    add     x4, x19, #TLS_HS_SECRET
    bl      hkdf_extract
    add     x0, x19, #TLS_HS_SECRET
    ladr    x1, tls_label_derived
    mov     w2, #(tls_label_derived_end - tls_label_derived)
    ladr    x3, sha_expect_empty
    add     x4, x19, #TLS_MASTER
    bl      tls_derive_secret
    add     x0, x19, #TLS_SHARED
    add     x1, x19, #TLS_PRIV
    add     x2, x19, #TLS_SERVER_PUB
    bl      x25519
    add     x0, x19, #TLS_SHARED
    ldp     x1, x2, [x0]
    ldp     x3, x4, [x0, #16]
    orr     x1, x1, x2
    orr     x3, x3, x4
    orr     x1, x1, x3
    cbz     x1, tls_keys_handshake_zero
    add     x0, x19, #TLS_MASTER
    mov     x1, #SHA_DIGEST_SIZE
    add     x2, x19, #TLS_SHARED
    mov     x3, #SHA_DIGEST_SIZE
    add     x4, x19, #TLS_HS_SECRET
    bl      hkdf_extract
    add     x0, x19, #TLS_HASH
    bl      tls_transcript_hash
    add     x0, x19, #TLS_HS_SECRET
    ladr    x1, tls_label_c_hs
    mov     w2, #(tls_label_c_hs_end - tls_label_c_hs)
    add     x3, x19, #TLS_HASH
    add     x4, x19, #TLS_C_HS
    bl      tls_derive_secret
    add     x0, x19, #TLS_HS_SECRET
    ladr    x1, tls_label_s_hs
    mov     w2, #(tls_label_s_hs_end - tls_label_s_hs)
    add     x3, x19, #TLS_HASH
    add     x4, x19, #TLS_S_HS
    bl      tls_derive_secret
    add     x0, x19, #TLS_HS_SECRET
    ladr    x1, tls_label_derived
    mov     w2, #(tls_label_derived_end - tls_label_derived)
    ladr    x3, sha_expect_empty
    add     x4, x19, #TLS_MASTER
    bl      tls_derive_secret
    add     x0, x19, #TLS_MASTER
    mov     x1, #SHA_DIGEST_SIZE
    ladr    x2, tls_zero32
    mov     x3, #SHA_DIGEST_SIZE
    add     x4, x19, #TLS_MASTER
    bl      hkdf_extract
    add     x0, x19, #TLS_S_HS
    add     x1, x19, #TLS_AES_R
    add     x2, x19, #TLS_RKEY
    add     x3, x19, #TLS_RIV
    bl      tls_set_keys
    add     x0, x19, #TLS_C_HS
    add     x1, x19, #TLS_AES_W
    add     x2, x19, #TLS_WKEY
    add     x3, x19, #TLS_WIV
    bl      tls_set_keys
    str     xzr, [x19, #TLS_RSEQ]
    str     xzr, [x19, #TLS_WSEQ]
    add     x0, x19, #TLS_SHARED
    mov     w1, #SHA_DIGEST_SIZE
    bl      mem_wipe
    mov     w0, #0
    b       tls_keys_handshake_done

tls_keys_handshake_zero:
    ladr    x0, tls_zero_shared_msg
    bl      tls_fail
    mov     w0, #1

tls_keys_handshake_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

tls_keys_finish:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    ladr    x19, tls_ctx
    add     x0, x19, #TLS_HASH
    bl      tls_transcript_hash
    add     x0, x19, #TLS_MASTER
    ladr    x1, tls_label_c_ap
    mov     w2, #(tls_label_c_ap_end - tls_label_c_ap)
    add     x3, x19, #TLS_HASH
    add     x4, x19, #TLS_C_AP
    bl      tls_derive_secret
    add     x0, x19, #TLS_MASTER
    ladr    x1, tls_label_s_ap
    mov     w2, #(tls_label_s_ap_end - tls_label_s_ap)
    add     x3, x19, #TLS_HASH
    add     x4, x19, #TLS_S_AP
    bl      tls_derive_secret
    add     x0, x19, #TLS_C_HS
    add     x5, x19, #TLS_FINKEY
    bl      tls_finished_key
    add     x0, x19, #TLS_FINKEY
    mov     x1, #SHA_DIGEST_SIZE
    add     x2, x19, #TLS_HASH
    mov     x3, #SHA_DIGEST_SIZE
    ladr    x4, tls_fin_buf
    add     x4, x4, #4
    bl      hmac_compute
    ladr    x0, tls_fin_buf
    mov     w1, #TLS_HS_FINISHED
    strb    w1, [x0]
    strb    wzr, [x0, #1]
    strb    wzr, [x0, #2]
    mov     w1, #SHA_DIGEST_SIZE
    strb    w1, [x0, #3]
    mov     w0, #TLS_REC_HANDSHAKE
    ladr    x1, tls_fin_buf
    mov     w2, #(SHA_DIGEST_SIZE + 4)
    bl      tls_send_record
    add     x0, x19, #TLS_C_AP
    add     x1, x19, #TLS_AES_W
    add     x2, x19, #TLS_WKEY
    add     x3, x19, #TLS_WIV
    bl      tls_set_keys
    add     x0, x19, #TLS_S_AP
    add     x1, x19, #TLS_AES_R
    add     x2, x19, #TLS_RKEY
    add     x3, x19, #TLS_RIV
    bl      tls_set_keys
    str     xzr, [x19, #TLS_RSEQ]
    str     xzr, [x19, #TLS_WSEQ]
    mov     w0, #TLS_STATE_CONNECTED
    strb    w0, [x19, #TLS_STATE]
    ladr    x0, tls_done_msg
    bl      uart_puts
    mov     w0, #TLS_REC_APPDATA
    ladr    x9, tls_params
    ldp     x1, x2, [x9, #TLSP_REQ]
    bl      tls_send_record
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret


gic_init:
    stp     x29, x30, [sp, #-16]!
    ladr    x0, fdt_base
    ldr     x0, [x0]
    ladr    x1, gic_node_name
    mov     w2, #4
    ladr    x3, fdt_compatible_name
    bl      fdt_find_prop
    mov     w1, #2
    cbz     x0, gic_init_store
    ladr    x1, gic_v3_compatible
    bl      string_starts_with
    cmp     w0, #0
    mov     w1, #2
    mov     w2, #GIC_VERSION_3
    csel    w1, w2, w1, ne

gic_init_store:
    ladr    x2, gic_version
    strb    w1, [x2]
    ldp     x29, x30, [sp], #16
    mov     x0, #GICD_BASE
    cmp     w1, #GIC_VERSION_3
    b.eq    gic_init_v3
    mov     w1, #GIC_ENABLE
    str     w1, [x0, #GICD_CTLR]
    mov     x0, #GICC_BASE
    mov     w1, #GIC_PMR_UNMASKED
    str     w1, [x0, #GICC_PMR]
    mov     w1, #GIC_ENABLE
    str     w1, [x0, #GICC_CTLR]
    ret

gic_init_v3:
    mov     w1, #(GICD_CTLR_ARE | GICD_CTLR_EN_GRP1)
    str     w1, [x0, #GICD_CTLR]
    mov     x0, #GICR_BASE
    ldr     w1, [x0, #GICR_WAKER]
    bic     w1, w1, #GICR_WAKER_SLEEP
    str     w1, [x0, #GICR_WAKER]

gic_init_v3_wake:
    ldr     w1, [x0, #GICR_WAKER]
    tst     w1, #GICR_WAKER_ASLEEP
    b.ne    gic_init_v3_wake
    mov     x1, #1
    msr     icc_sre_el1, x1
    isb
    mov     x1, #GIC_PMR_UNMASKED
    msr     icc_pmr_el1, x1
    mov     x1, #1
    msr     icc_igrpen1_el1, x1
    isb
    ret

gic_enable_irq:
    ladr    x1, gic_version
    ldrb    w1, [x1]
    cmp     w1, #GIC_VERSION_3
    b.eq    gic_enable_irq_v3
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

gic_enable_irq_v3:
    cmp     w0, #32
    b.hs    gic_enable_irq_v3_spi
    mov     x1, #GICR_SGI_BASE
    add     x2, x1, #GICR_IPRIORITYR
    strb    wzr, [x2, w0, uxtw]
    mov     w3, #1
    lsl     w3, w3, w0
    ldr     w4, [x1, #GICR_IGROUPR0]
    orr     w4, w4, w3
    str     w4, [x1, #GICR_IGROUPR0]
    str     w3, [x1, #GICR_ISENABLER0]
    dsb     sy
    ret

gic_enable_irq_v3_spi:
    mov     x1, #GICD_BASE
    add     x2, x1, #GICD_IPRIORITYR
    strb    wzr, [x2, w0, uxtw]
    add     x2, x1, #GICD_IROUTER
    str     xzr, [x2, w0, uxtw #3]
    lsr     w2, w0, #5
    and     w3, w0, #31
    mov     w4, #1
    lsl     w4, w4, w3
    add     x2, x1, x2, lsl #2
    ldr     w5, [x2, #GICD_IGROUPR]
    orr     w5, w5, w4
    str     w5, [x2, #GICD_IGROUPR]
    str     w4, [x2, #GICD_ISENABLER]
    dsb     sy
    ret

gic_put_version:
    stp     x29, x30, [sp, #-16]!
    ladr    x0, gic_msg
    bl      uart_puts
    ladr    x0, gic_version
    ldrb    w0, [x0]
    bl      uart_putdec
    ladr    x0, uart_newline
    bl      uart_puts
    ldp     x29, x30, [sp], #16
    ret


mp_copy:
    ldr     x3, [x2, #MP_K]

mp_copy_loop:
    ldr     x4, [x1], #8
    str     x4, [x0], #8
    sub     x3, x3, #1
    cbnz    x3, mp_copy_loop
    ret

mp_zero:
    ldr     x3, [x1, #MP_K]

mp_zero_loop:
    str     xzr, [x0], #8
    sub     x3, x3, #1
    cbnz    x3, mp_zero_loop
    ret

mp_is_zero:
    ldr     x3, [x1, #MP_K]
    mov     x2, #0

mp_is_zero_loop:
    ldr     x4, [x0], #8
    orr     x2, x2, x4
    sub     x3, x3, #1
    cbnz    x3, mp_is_zero_loop
    cmp     x2, #0
    cset    w0, eq
    ret

mp_geq:
    ldr     x3, [x2, #MP_K]
    subs    xzr, xzr, xzr

mp_geq_loop:
    ldr     x4, [x0], #8
    ldr     x5, [x1], #8
    sbcs    xzr, x4, x5
    sub     x3, x3, #1
    cbnz    x3, mp_geq_loop
    cset    w0, hs
    ret

mp_from_bytes:
    ldr     x3, [x2, #MP_K]
    lsl     x4, x3, #3
    add     x1, x1, x4

mp_from_bytes_loop:
    ldr     x4, [x1, #-8]!
    rev     x4, x4
    str     x4, [x0], #8
    sub     x3, x3, #1
    cbnz    x3, mp_from_bytes_loop
    ret

mp_to_bytes:
    ldr     x3, [x2, #MP_K]
    lsl     x4, x3, #3
    add     x0, x0, x4

mp_to_bytes_loop:
    ldr     x4, [x1], #8
    rev     x4, x4
    str     x4, [x0, #-8]!
    sub     x3, x3, #1
    cbnz    x3, mp_to_bytes_loop
    ret

mp_add_mod:
    stp     x29, x30, [sp, #-144]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     x20, x3
    ldr     x4, [x3, #MP_K]
    ldr     x5, [x3, #MP_M]
    add     x6, sp, #32
    mov     x9, x4
    adds    xzr, xzr, xzr

mp_add_mod_sum:
    ldr     x7, [x1], #8
    ldr     x8, [x2], #8
    adcs    x7, x7, x8
    str     x7, [x6], #8
    sub     x9, x9, #1
    cbnz    x9, mp_add_mod_sum
    adc     x10, xzr, xzr
    add     x6, sp, #32
    add     x7, sp, #80
    mov     x9, x4
    subs    xzr, xzr, xzr

mp_add_mod_sub:
    ldr     x8, [x6], #8
    ldr     x11, [x5], #8
    sbcs    x8, x8, x11
    str     x8, [x7], #8
    sub     x9, x9, #1
    cbnz    x9, mp_add_mod_sub
    cset    w11, lo
    orr     x10, x10, x11, lsl #1
    add     x1, sp, #80
    add     x6, sp, #32
    cmp     x10, #2
    csel    x1, x6, x1, eq
    mov     x0, x19
    mov     x2, x20
    bl      mp_copy
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #144
    ret

mp_sub_mod:
    stp     x29, x30, [sp, #-144]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     x20, x3
    ldr     x4, [x3, #MP_K]
    ldr     x5, [x3, #MP_M]
    add     x6, sp, #32
    mov     x9, x4
    cmp     xzr, xzr

mp_sub_mod_diff:
    ldr     x7, [x1], #8
    ldr     x8, [x2], #8
    sbcs    x7, x7, x8
    str     x7, [x6], #8
    sub     x9, x9, #1
    cbnz    x9, mp_sub_mod_diff
    cset    w10, lo
    add     x6, sp, #32
    add     x7, sp, #80
    mov     x9, x4
    adds    xzr, xzr, xzr

mp_sub_mod_fix:
    ldr     x8, [x6], #8
    ldr     x11, [x5], #8
    adcs    x8, x8, x11
    str     x8, [x7], #8
    sub     x9, x9, #1
    cbnz    x9, mp_sub_mod_fix
    add     x1, sp, #32
    add     x6, sp, #80
    cmp     x10, #0
    csel    x1, x6, x1, ne
    mov     x0, x19
    mov     x2, x20
    bl      mp_copy
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #144
    ret

mp_mont_mul:
    stp     x29, x30, [sp, #-160]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    stp     x27, x28, [sp, #80]
    mov     x26, x0
    mov     x21, x1
    mov     x22, x2
    ldr     x25, [x3, #MP_K]
    ldr     x23, [x3, #MP_M]
    ldr     x24, [x3, #MP_MINV]
    mov     x27, x3
    add     x28, sp, #96
    mov     x0, x28
    add     x1, x25, #2

mp_mont_mul_clear:
    str     xzr, [x0], #8
    sub     x1, x1, #1
    cbnz    x1, mp_mont_mul_clear
    mov     x19, #0

mp_mont_mul_outer:
    ldr     x9, [x22, x19, lsl #3]
    mov     x10, #0
    mov     x20, #0

mp_mont_mul_inner1:
    ldr     x11, [x21, x20, lsl #3]
    ldr     x12, [x28, x20, lsl #3]
    mul     x13, x11, x9
    umulh   x14, x11, x9
    adds    x13, x13, x12
    adc     x14, x14, xzr
    adds    x13, x13, x10
    adc     x10, x14, xzr
    str     x13, [x28, x20, lsl #3]
    add     x20, x20, #1
    cmp     x20, x25
    b.lo    mp_mont_mul_inner1
    ldr     x12, [x28, x25, lsl #3]
    adds    x12, x12, x10
    str     x12, [x28, x25, lsl #3]
    adc     x12, xzr, xzr
    add     x0, x25, #1
    str     x12, [x28, x0, lsl #3]
    ldr     x12, [x28]
    mul     x9, x12, x24
    ldr     x11, [x23]
    mul     x13, x9, x11
    umulh   x14, x9, x11
    adds    x13, x13, x12
    adc     x10, x14, xzr
    mov     x20, #1

mp_mont_mul_inner2:
    ldr     x11, [x23, x20, lsl #3]
    ldr     x12, [x28, x20, lsl #3]
    mul     x13, x9, x11
    umulh   x14, x9, x11
    adds    x13, x13, x12
    adc     x14, x14, xzr
    adds    x13, x13, x10
    adc     x10, x14, xzr
    sub     x0, x20, #1
    str     x13, [x28, x0, lsl #3]
    add     x20, x20, #1
    cmp     x20, x25
    b.lo    mp_mont_mul_inner2
    ldr     x12, [x28, x25, lsl #3]
    adds    x12, x12, x10
    sub     x0, x25, #1
    str     x12, [x28, x0, lsl #3]
    adc     x10, xzr, xzr
    add     x0, x25, #1
    ldr     x12, [x28, x0, lsl #3]
    add     x12, x12, x10
    str     x12, [x28, x25, lsl #3]
    add     x19, x19, #1
    cmp     x19, x25
    b.lo    mp_mont_mul_outer
    ldr     x10, [x28, x25, lsl #3]
    mov     x0, x28
    mov     x1, x23
    mov     x2, x27
    bl      mp_geq
    orr     w10, w10, w0
    cbz     w10, mp_mont_mul_store
    mov     x20, x25
    mov     x0, x28
    mov     x1, x23
    subs    xzr, xzr, xzr

mp_mont_mul_reduce:
    ldr     x11, [x0]
    ldr     x12, [x1], #8
    sbcs    x11, x11, x12
    str     x11, [x0], #8
    sub     x20, x20, #1
    cbnz    x20, mp_mont_mul_reduce

mp_mont_mul_store:
    mov     x0, x26
    mov     x1, x28
    mov     x2, x27
    bl      mp_copy
    ldp     x27, x28, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #160
    ret

mp_to_mont:
    ldr     x2, [x3, #MP_R2]
    b       mp_mont_mul

mp_from_mont:
    ladr    x2, mp_plain_one
    b       mp_mont_mul

mp_inv_mod:
    stp     x29, x30, [sp, #-176]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    mov     x19, x0
    mov     x20, x1
    mov     x21, x2
    ldr     x22, [x21, #MP_K]
    ldr     x1, [x21, #MP_M]
    add     x0, sp, #64
    mov     x2, x21
    bl      mp_copy
    ldr     x3, [sp, #64]
    sub     x3, x3, #2
    str     x3, [sp, #64]
    add     x0, sp, #112
    ldr     x1, [x21, #MP_ONE]
    mov     x2, x21
    bl      mp_copy
    lsl     x23, x22, #6
    sub     x23, x23, #1

mp_inv_mod_loop:
    add     x0, sp, #112
    add     x1, sp, #112
    add     x2, sp, #112
    mov     x3, x21
    bl      mp_mont_mul
    lsr     x4, x23, #6
    add     x5, sp, #64
    ldr     x4, [x5, x4, lsl #3]
    and     x6, x23, #63
    lsr     x4, x4, x6
    tbz     x4, #0, mp_inv_mod_next
    add     x0, sp, #112
    add     x1, sp, #112
    mov     x2, x20
    mov     x3, x21
    bl      mp_mont_mul

mp_inv_mod_next:
    subs    x23, x23, #1
    b.ge    mp_inv_mod_loop
    mov     x0, x19
    add     x1, sp, #112
    mov     x2, x21
    bl      mp_copy
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #176
    ret

asn1_next:
    add     x3, x0, #2
    cmp     x3, x1
    b.hi    asn1_next_error
    ldrb    w2, [x0]
    ldrb    w4, [x0, #1]
    mov     x5, #2
    tbz     w4, #7, asn1_next_length
    and     w6, w4, #0x7f
    cbz     w6, asn1_next_error
    cmp     w6, #2
    b.hi    asn1_next_error
    add     x3, x3, x6
    cmp     x3, x1
    b.hi    asn1_next_error
    mov     x4, #0
    add     x7, x0, #2

asn1_next_long:
    ldrb    w8, [x7], #1
    orr     x4, x8, x4, lsl #8
    sub     w6, w6, #1
    cbnz    w6, asn1_next_long
    sub     x5, x7, x0
    mov     x6, #0x80
    mov     x8, #0x100
    cmp     x5, #3
    csel    x6, x6, x8, eq
    cmp     x4, x6
    b.lo    asn1_next_error

asn1_next_length:
    add     x0, x0, x5
    add     x3, x0, x4
    cmp     x3, x1
    b.hi    asn1_next_error
    mov     x1, x4
    ret

asn1_next_error:
    mov     w2, #-1
    ret

asn1_expect:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     w19, w2
    bl      asn1_next
    cmp     w2, w19
    b.eq    asn1_expect_done
    mov     w2, #-1

asn1_expect_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

tls_certificate:
    stp     x29, x30, [sp, #-96]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x20, x0
    mov     w21, w1
    ladr    x19, tls_ctx
    mov     w2, #TLS_CERT_SIZE
    cmp     w21, w2
    b.hi    tls_certificate_big
    cmp     w21, #7
    b.lo    tls_certificate_short
    ladr    x1, tls_cert_buf
    mov     x0, x20
    mov     w2, w21
    bl      mem_copy
    ladr    x20, tls_cert_buf
    ldrb    w0, [x20]
    add     x20, x20, #1
    add     x20, x20, x0
    ladr    x1, tls_cert_buf
    add     x1, x1, x21
    add     x0, x20, #6
    cmp     x0, x1
    b.hi    tls_certificate_short
    ldrb    w2, [x20, #3]
    ldrb    w3, [x20, #4]
    ldrb    w4, [x20, #5]
    lsl     w2, w2, #16
    orr     w2, w2, w3, lsl #8
    orr     w22, w2, w4
    add     x20, x20, #6
    add     x0, x20, x22
    cmp     x0, x1
    b.hi    tls_certificate_short
    ladr    x0, tls_cert_msg
    bl      uart_puts
    mov     x0, x21
    bl      uart_putdec
    ladr    x0, tls_cert_tail
    bl      uart_puts
    mov     x0, x22
    bl      uart_putdec
    ladr    x0, tls_cert_tail2
    bl      uart_puts
    ladr    x0, tls_cert_buf
    mov     w1, w21
    bl      tls_chain_verify
    cbnz    w0, tls_certificate_done
    ladr    x0, tls_chain_infos
    ldr     x1, [x0, #X509_KEY_CURVE]
    cbnz    x1, tls_certificate_bad
    ldr     x0, [x0, #X509_KEY]
    add     x1, x19, #TLS_SERVER_Q
    mov     w2, #64
    bl      mem_copy
    mov     w0, #0
    b       tls_certificate_done

tls_certificate_big:
    ladr    x0, tls_certbig_msg
    b       tls_certificate_fail

tls_certificate_short:
    ladr    x0, tls_short_msg
    b       tls_certificate_fail

tls_certificate_bad:
    ladr    x0, tls_certbad_msg

tls_certificate_fail:
    bl      tls_fail
    mov     w0, #1

tls_certificate_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #96
    ret

tls_cert_verify:
    stp     x29, x30, [sp, #-256]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x20, x0
    mov     w21, w1
    ladr    x19, tls_ctx
    cmp     w21, #4
    b.lo    tls_cert_verify_short
    ldrb    w0, [x20]
    ldrb    w1, [x20, #1]
    orr     w0, w1, w0, lsl #8
    mov     w1, #TLS_SIG_ECDSA_P256
    cmp     w0, w1
    b.ne    tls_cert_verify_scheme
    ldrb    w0, [x20, #2]
    ldrb    w1, [x20, #3]
    orr     w22, w1, w0, lsl #8
    add     w0, w22, #4
    cmp     w0, w21
    b.ne    tls_cert_verify_short
    add     x0, x20, #4
    mov     x1, x22
    add     x2, sp, #48
    add     x3, sp, #80
    mov     w4, #SHA_DIGEST_SIZE
    bl      ecdsa_sig_decode
    cbnz    w0, tls_cert_verify_bad
    add     x0, sp, #112
    mov     w1, #64
    mov     w2, #0x20

tls_cert_verify_spaces:
    strb    w2, [x0], #1
    sub     w1, w1, #1
    cbnz    w1, tls_cert_verify_spaces
    ladr    x0, tls_cv_label
    add     x1, sp, #176
    mov     w2, #(tls_cv_label_end - tls_cv_label)
    bl      mem_copy
    add     x0, sp, #(176 + 34)
    bl      tls_transcript_hash
    ladr    x0, sha_ctx
    bl      sha256_init
    ladr    x0, sha_ctx
    add     x1, sp, #112
    mov     x2, #(64 + 34 + 32)
    bl      sha256_update
    ladr    x0, sha_ctx
    ladr    x1, sha_digest
    bl      sha256_final
    ladr    x0, p256_curve
    add     x1, x19, #TLS_SERVER_Q
    ladr    x2, sha_digest
    mov     w3, #SHA_DIGEST_SIZE
    add     x4, sp, #48
    add     x5, sp, #80
    bl      ecdsa_verify
    cbnz    w0, tls_cert_verify_wrong
    ladr    x0, tls_verified_msg
    bl      uart_puts
    mov     w0, #0
    b       tls_cert_verify_done

tls_cert_verify_scheme:
    ladr    x0, tls_scheme_msg
    b       tls_cert_verify_fail

tls_cert_verify_short:
    ladr    x0, tls_cv_len_msg
    b       tls_cert_verify_fail

tls_cert_verify_bad:
    ladr    x0, tls_sigbad_msg
    b       tls_cert_verify_fail

tls_cert_verify_wrong:
    ladr    x0, tls_sigwrong_msg

tls_cert_verify_fail:
    bl      tls_fail
    mov     w0, #1

tls_cert_verify_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #256
    ret


keyboard_apply:
    cmp     w0, #EV_KEY
    b.ne    keyboard_apply_done
    cmp     w1, #KEY_LEFTSHIFT
    b.eq    keyboard_apply_shift
    cmp     w1, #KEY_RIGHTSHIFT
    b.eq    keyboard_apply_shift
    cbz     w2, keyboard_apply_done
    cmp     w1, #KEY_CODE_MAX
    b.hs    keyboard_apply_done
    ladr    x3, key_shift
    ldrb    w3, [x3]
    ladr    x4, key_table_lower
    ladr    x5, key_table_upper
    cmp     w3, #0
    csel    x4, x4, x5, eq
    ldrb    w0, [x4, w1, uxtw]
    cbz     w0, keyboard_apply_done
    b       key_put

keyboard_apply_shift:
    cmp     w1, #KEY_LEFTSHIFT
    mov     w4, #1
    mov     w5, #2
    csel    w4, w4, w5, eq
    ladr    x3, key_shift
    ldrb    w5, [x3]
    orr     w6, w5, w4
    bic     w7, w5, w4
    cmp     w2, #0
    csel    w5, w7, w6, eq
    strb    w5, [x3]

keyboard_apply_done:
    ret

key_put:
    ladr    x1, key_head
    ldr     w2, [x1]
    ladr    x3, key_tail
    ldr     w3, [x3]
    add     w4, w2, #1
    and     w4, w4, #KEY_RING_MASK
    cmp     w4, w3
    b.eq    key_put_full
    ladr    x5, key_ring
    strb    w0, [x5, w2, uxtw]
    str     w4, [x1]
    ret

key_put_full:
    ladr    x5, key_overflow
    mov     w4, #1
    strb    w4, [x5]
    ret

key_get:
    ladr    x1, key_tail
    ldr     w2, [x1]
    ladr    x3, key_head
    ldr     w3, [x3]
    cmp     w2, w3
    b.eq    key_get_empty
    ladr    x4, key_ring
    ldrb    w0, [x4, w2, uxtw]
    add     w2, w2, #1
    and     w2, w2, #KEY_RING_MASK
    str     w2, [x1]
    ret

key_get_empty:
    mov     w0, #-1
    ret

win_top_index:
    ladr    x9, win_count
    ldr     w0, [x9]
    sub     w0, w0, #1
    ret

win_find_id:
    ladr    x9, win_count
    ldr     w9, [x9]
    ladr    x10, win_list
    mov     w1, #0

win_find_id_loop:
    cmp     w1, w9
    b.hs    win_find_id_none
    ldr     w2, [x10, #WIN_ID]
    cmp     w2, w0
    b.eq    win_find_id_hit
    add     x10, x10, #WIN_SIZE
    add     w1, w1, #1
    b       win_find_id_loop

win_find_id_hit:
    mov     w0, w1
    ret

win_find_id_none:
    mov     w0, #-1
    ret

win_method:
    ladr    x9, win_list
    mov     x10, #WIN_SIZE
    madd    x9, x0, x10, x9
    ldr     x9, [x9, #WIN_CLASS]

win_method_walk:
    cbz     x9, win_method_none
    ldr     x0, [x9, x1]
    cbnz    x0, win_method_done
    ldr     x9, [x9, #CLS_PARENT]
    b       win_method_walk

win_method_none:
    mov     x0, #0

win_method_done:
    ret

win_draw_none:
    ret

win_key_none:
    ret

win_focus_none:
    ret

win_dirty_none:
    mov     w0, #0
    ret

win_mark:
    stp     x29, x30, [sp, #-16]!
    ladr    x10, win_list
    mov     x11, #WIN_SIZE
    madd    x10, x0, x11, x10
    mov     w1, #1
    strb    w1, [x10, #WIN_BUF_DIRTY]
    bl      win_dirty_rect
    ldp     x29, x30, [sp], #16
    ret

win_focus_event:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     w19, w0
    mov     w20, w1
    mov     w1, #CLS_FOCUS
    bl      win_method
    cbz     x0, win_focus_event_done
    mov     x9, x0
    mov     w0, w19
    mov     w1, w20
    blr     x9

win_focus_event_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

win_key_top:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     w19, w0
    bl      win_top_index
    tbnz    w0, #31, win_key_top_done
    mov     w20, w0
    mov     w1, #CLS_KEY
    bl      win_method
    cbz     x0, win_key_top_done
    mov     x9, x0
    mov     w0, w19
    mov     w1, w20
    blr     x9

win_key_top_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

win_close_none:
    ret

win_button_hit:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     w19, w0
    mov     w20, w1
    mov     w1, w2
    bl      win_on_titlebar
    cbz     w0, win_button_hit_none
    ladr    x9, win_list
    mov     x10, #WIN_SIZE
    madd    x9, x19, x10, x9
    ldr     w10, [x9, #WIN_W]
    mov     x0, x9
    bl      win_eff_x
    add     w0, w0, w10
    sub     w0, w0, w20
    sub     w0, w0, #WIN_BORDER
    cmp     w0, #(WIN_BTN_PAD + ICON_SIZE + WIN_BTN_PAD / 2)
    b.lo    win_button_hit_close
    cmp     w0, #(2 * (WIN_BTN_PAD + ICON_SIZE) + WIN_BTN_PAD / 2)
    b.lo    win_button_hit_shade

win_button_hit_none:
    mov     w0, #WIN_BTN_NONE
    b       win_button_hit_done

win_button_hit_close:
    mov     w0, #WIN_BTN_CLOSE
    b       win_button_hit_done

win_button_hit_shade:
    mov     w0, #WIN_BTN_SHADE

win_button_hit_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

win_button_release:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     w19, w0
    mov     w20, w1
    ladr    x0, win_btn_armed
    bl      console_take_flag
    cbz     w0, win_button_release_none
    mov     w21, w0
    mov     w0, w19
    mov     w1, w20
    bl      win_hit
    tbnz    w0, #31, win_button_release_none
    mov     w22, w0
    ladr    x9, win_list
    mov     x10, #WIN_SIZE
    madd    x9, x22, x10, x9
    ldr     w1, [x9, #WIN_ID]
    ladr    x9, win_btn_id
    ldr     w2, [x9]
    cmp     w1, w2
    b.ne    win_button_release_none
    mov     w0, w22
    mov     w1, w19
    mov     w2, w20
    bl      win_button_hit
    cmp     w0, w21
    b.ne    win_button_release_none
    mov     w0, w22
    cmp     w21, #WIN_BTN_CLOSE
    b.eq    win_button_release_close
    bl      win_shade_toggle
    b       win_button_release_hit

win_button_release_close:
    bl      win_close_request

win_button_release_hit:
    mov     w0, #1
    b       win_button_release_done

win_button_release_none:
    mov     w0, #0

win_button_release_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

win_shade_toggle:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     w19, w0
    ladr    x9, win_list
    mov     x10, #WIN_SIZE
    madd    x20, x19, x10, x9
    ldr     w1, [x20, #WIN_FLAGS]
    eor     w1, w1, #WIN_FLAG_SHADED
    str     w1, [x20, #WIN_FLAGS]
    ldr     w21, [x20, #WIN_H_FULL]
    tst     w1, #WIN_FLAG_SHADED
    b.eq    win_shade_toggle_start
    mov     w21, #(WIN_BORDER * 2 + WIN_TITLEBAR_H)

win_shade_toggle_start:
    mov     x0, x19
    mov     w1, #ANIM_PROP_H
    ldr     w2, [x20, #WIN_H]
    lsl     x2, x2, #ANIM_SHIFT
    lsl     x3, x21, #ANIM_SHIFT
    mov     w4, #WIN_SHADE_MS
    mov     w5, #ANIM_EASE_CUBIC_OUT
    bl      anim_start
    cbnz    x0, win_shade_toggle_done
    mov     w0, w19
    bl      win_dirty_rect
    str     w21, [x20, #WIN_H]
    mov     w0, w19
    bl      win_dirty_rect

win_shade_toggle_done:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

win_close_request:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     w19, w0
    ladr    x9, win_list
    mov     x10, #WIN_SIZE
    madd    x9, x19, x10, x9
    ldr     x2, [x9, #WIN_ALPHA]
    mov     x0, x19
    mov     w1, #ANIM_PROP_ALPHA
    mov     x3, #0
    mov     w4, #WIN_CLOSE_MS
    mov     w5, #ANIM_EASE_QUAD_OUT
    bl      anim_start
    cbz     x0, win_close_request_now
    ladr    x1, win_close
    bl      anim_set_done
    b       win_close_request_done

win_close_request_now:
    mov     w0, w19
    bl      win_close

win_close_request_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

win_close:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     w19, w0
    mov     w1, #CLS_CLOSE
    bl      win_method
    cbz     x0, win_close_notified
    mov     x9, x0
    mov     w0, w19
    blr     x9

win_close_notified:
    mov     w0, w19
    bl      win_dirty_rect
    mov     x0, x19
    bl      anim_cancel_target
    ladr    x9, win_count
    ldr     w20, [x9]
    sub     w20, w20, #1
    mov     x0, x19
    mov     x1, x20
    bl      anim_raise_targets
    ladr    x9, win_drag_index
    ldr     w1, [x9]
    cmp     w1, w19
    b.lt    win_close_drag_ok
    mov     w2, #WIN_NONE
    sub     w3, w1, #1
    csel    w1, w2, w3, eq
    str     w1, [x9]

win_close_drag_ok:
    ladr    x21, win_list
    mov     x22, #WIN_SIZE
    madd    x9, x19, x22, x21
    ldr     x1, [x9, #WIN_BUF]
    cbz     x1, win_close_shift
    ldr     w2, [x9, #WIN_W]
    ldr     w3, [x9, #WIN_H_FULL]
    umull   x2, w2, w3
    lsl     x2, x2, #2
    add     x2, x2, #63
    and     x2, x2, #-64
    stp     x1, x2, [sp, #-32]!
    str     xzr, [sp, #16]

win_close_pack_loop:
    ldr     x9, [sp, #16]
    cmp     w9, w20
    b.hi    win_close_pack_done
    madd    x10, x9, x22, x21
    ldr     x11, [x10, #WIN_BUF]
    ldr     x12, [sp]
    cmp     x11, x12
    b.ls    win_close_pack_next
    ldr     w0, [x10, #WIN_W]
    ldr     w1, [x10, #WIN_H_FULL]
    umull   x2, w0, w1
    lsl     x2, x2, #2
    ldr     x13, [sp, #8]
    sub     x1, x11, x13
    str     x1, [x10, #WIN_BUF]
    mov     x0, x11
    bl      mem_copy

win_close_pack_next:
    ldr     x9, [sp, #16]
    add     x9, x9, #1
    str     x9, [sp, #16]
    b       win_close_pack_loop

win_close_pack_done:
    ldr     x2, [sp, #8]
    add     sp, sp, #32
    ladr    x4, win_buf_used
    ldr     x5, [x4]
    sub     x5, x5, x2
    str     x5, [x4]

win_close_shift:
    mov     w1, w19

win_close_shift_loop:
    cmp     w1, w20
    b.hs    win_close_shift_done
    madd    x2, x1, x22, x21
    add     x3, x2, x22
    mov     x4, #0

win_close_copy:
    cmp     x4, #WIN_SIZE
    b.hs    win_close_copy_done
    ldr     x5, [x3, x4]
    str     x5, [x2, x4]
    add     x4, x4, #8
    b       win_close_copy

win_close_copy_done:
    add     w1, w1, #1
    b       win_close_shift_loop

win_close_shift_done:
    ladr    x9, win_count
    str     w20, [x9]
    cmp     w19, w20
    b.ne    win_close_done
    cbz     w20, win_close_done
    bl      win_focus_start

win_close_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

gui_refresh:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     w19, #0
    bl      win_top_index
    mov     w20, w0
    mov     w21, #0
    tbnz    w20, #31, gui_refresh_ids
    ladr    x9, win_list
    mov     x10, #WIN_SIZE
    madd    x9, x20, x10, x9
    ldr     w21, [x9, #WIN_ID]

gui_refresh_ids:
    ladr    x9, gui_top_win
    ldr     w22, [x9]
    cmp     w21, w22
    b.eq    gui_refresh_flags
    str     w21, [x9]
    mov     w0, w22
    bl      win_find_id
    tbnz    w0, #31, gui_refresh_gained
    mov     w1, #0
    bl      win_focus_event

gui_refresh_gained:
    tbnz    w20, #31, gui_refresh_flags
    mov     w0, w20
    mov     w1, #1
    bl      win_focus_event

gui_refresh_flags:
    mov     w20, #0

gui_refresh_loop:
    ladr    x0, win_count
    ldr     w0, [x0]
    cmp     w20, w0
    b.hs    gui_refresh_done
    mov     w0, w20
    mov     w1, #CLS_DIRTY
    bl      win_method
    cbz     x0, gui_refresh_next
    mov     x9, x0
    mov     w0, w20
    blr     x9
    cbz     w0, gui_refresh_next
    cmp     w0, #1
    mov     w0, w20
    mov     w19, #1
    b.ne    gui_refresh_blit
    bl      win_mark
    b       gui_refresh_next

gui_refresh_blit:
    bl      win_dirty_rect

gui_refresh_next:
    add     w20, w20, #1
    b       gui_refresh_loop

gui_refresh_done:
    mov     w0, w19
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

term_init:
    stp     x29, x30, [sp, #-16]!
    ladr    x0, term_buf
    mov     w1, #(TERM_ROWS * TERM_STRIDE)
    bl      mem_wipe
    ladr    x0, term_row
    str     wzr, [x0]
    bl      term_prompt
    ldp     x29, x30, [sp], #16
    ret

term_line:
    ladr    x0, term_row
    ldr     w0, [x0]
    ladr    x1, term_buf
    mov     w2, #TERM_STRIDE
    madd    x0, x0, x2, x1
    ret

term_prompt:
    stp     x29, x30, [sp, #-16]!
    bl      term_line
    mov     x1, x0
    ladr    x0, term_prompt_text
    mov     w2, #TERM_PROMPT_LEN
    bl      mem_copy
    ladr    x0, term_col
    mov     w1, #TERM_PROMPT_LEN
    str     w1, [x0]
    ldp     x29, x30, [sp], #16
    ret

term_focus:
    ladr    x0, term_dirty
    mov     w1, #1
    strb    w1, [x0]
    ret

term_take_dirty:
    ladr    x0, term_dirty
    b       console_take_flag

term_input:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     w19, w0
    ladr    x1, term_busy
    ldrb    w1, [x1]
    cbnz    w1, term_input_done
    cmp     w19, #ASCII_BS
    b.eq    term_input_back
    cmp     w19, #ASCII_DEL
    b.eq    term_input_back
    cmp     w19, #ASCII_LF
    b.eq    term_input_enter
    cmp     w19, #ASCII_CR
    b.eq    term_input_enter
    cmp     w19, #ASCII_SPACE
    b.lo    term_input_done
    cmp     w19, #ASCII_DEL
    b.hs    term_input_done
    ladr    x1, term_col
    ldr     w2, [x1]
    cmp     w2, #(TERM_COLS - 1)
    b.hs    term_input_done
    bl      term_line
    ladr    x1, term_col
    ldr     w2, [x1]
    strb    w19, [x0, x2]
    add     w2, w2, #1
    strb    wzr, [x0, x2]
    str     w2, [x1]
    b       term_input_mark

term_input_back:
    ladr    x1, term_col
    ldr     w2, [x1]
    cmp     w2, #TERM_PROMPT_LEN
    b.ls    term_input_done
    sub     w2, w2, #1
    str     w2, [x1]
    bl      term_line
    ladr    x1, term_col
    ldr     w2, [x1]
    strb    wzr, [x0, x2]
    b       term_input_mark

term_input_enter:
    bl      term_line
    add     x0, x0, #TERM_PROMPT_LEN
    ladr    x1, term_cmd
    mov     w2, #(TERM_STRIDE - TERM_PROMPT_LEN)
    bl      mem_copy
    bl      term_advance
    ladr    x0, term_cmd
    bl      term_command
    ladr    x0, term_busy
    ldrb    w0, [x0]
    cbnz    w0, term_input_mark
    bl      term_prompt

term_input_mark:
    ladr    x0, term_dirty
    mov     w1, #1
    strb    w1, [x0]

term_input_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

term_advance:
    stp     x29, x30, [sp, #-16]!
    ladr    x1, term_row
    ldr     w2, [x1]
    add     w2, w2, #1
    cmp     w2, #TERM_ROWS
    b.lo    term_advance_row
    ladr    x0, term_buf
    add     x0, x0, #TERM_STRIDE
    ladr    x1, term_buf
    mov     w2, #((TERM_ROWS - 1) * TERM_STRIDE)
    bl      mem_copy
    mov     w2, #(TERM_ROWS - 1)
    ladr    x1, term_row

term_advance_row:
    str     w2, [x1]
    bl      term_line
    mov     w1, #TERM_STRIDE
    bl      mem_wipe
    ladr    x0, term_col
    str     wzr, [x0]
    ladr    x0, term_dirty
    mov     w1, #1
    strb    w1, [x0]
    ldp     x29, x30, [sp], #16
    ret

term_print:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0

term_print_row:
    bl      term_line
    mov     x20, x0
    mov     w2, #0

term_print_char:
    ldrb    w3, [x19]
    cbz     w3, term_print_end
    cmp     w2, #TERM_WRAP
    b.hs    term_print_wrap
    strb    w3, [x20, x2]
    add     x19, x19, #1
    add     w2, w2, #1
    b       term_print_char

term_print_wrap:
    strb    wzr, [x20, x2]
    bl      term_advance
    b       term_print_row

term_print_end:
    strb    wzr, [x20, x2]
    bl      term_advance
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

term_command:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x19, x0

term_command_skip:
    ldrb    w0, [x19]
    cmp     w0, #ASCII_SPACE
    b.ne    term_command_word
    add     x19, x19, #1
    b       term_command_skip

term_command_word:
    cbz     w0, term_command_done
    mov     x0, x19
    ladr    x1, term_cmd_curl
    mov     w2, #(term_cmd_help - term_cmd_curl)
    bl      mem_equal
    cbz     w0, term_command_help
    add     x0, x19, #(term_cmd_help - term_cmd_curl)
    bl      curl_start
    b       term_command_done

term_command_help:
    mov     x0, x19
    ladr    x1, term_cmd_help
    mov     w2, #(term_help_1 - term_cmd_help)
    bl      mem_equal
    cbz     w0, term_command_unknown
    ladr    x0, term_help_1
    bl      term_print
    ladr    x0, term_help_2
    bl      term_print
    ladr    x0, term_help_3
    bl      term_print
    b       term_command_done

term_command_unknown:
    ladr    x0, term_unknown_msg
    bl      term_print

term_command_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

term_append:
    ldrb    w2, [x1], #1
    cbz     w2, term_append_done
    strb    w2, [x0], #1
    b       term_append

term_append_done:
    strb    wzr, [x0]
    ret

term_put_dec:
    stp     x29, x30, [sp, #-32]!
    add     x3, sp, #32
    mov     w4, #10
    mov     w5, w1

term_put_dec_digit:
    udiv    w6, w5, w4
    msub    w7, w6, w4, w5
    add     w7, w7, #ASCII_ZERO
    strb    w7, [x3, #-1]!
    mov     w5, w6
    cbnz    w5, term_put_dec_digit
    add     x2, sp, #32

term_put_dec_copy:
    cmp     x3, x2
    b.hs    term_put_dec_done
    ldrb    w7, [x3], #1
    strb    w7, [x0], #1
    b       term_put_dec_copy

term_put_dec_done:
    strb    wzr, [x0]
    ldp     x29, x30, [sp], #32
    ret

term_put_ip:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     w19, w1
    mov     w20, #24

term_put_ip_octet:
    lsr     w1, w19, w20
    and     w1, w1, #0xff
    bl      term_put_dec
    cbz     w20, term_put_ip_done
    mov     w2, #0x2e
    strb    w2, [x0], #1
    sub     w20, w20, #8
    b       term_put_ip_octet

term_put_ip_done:
    strb    wzr, [x0]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

curl_start:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x19, x0
    ladr    x0, net_dns
    ldr     w0, [x0]
    ladr    x1, curl_nonet_msg
    cbz     w0, curl_start_fail
    ladr    x0, dns_state
    ldrb    w0, [x0]
    cmp     w0, #DNS_STATE_SENT
    ladr    x1, curl_dnsbusy_msg
    b.eq    curl_start_fail
    mov     w20, #0
    mov     x0, x19
    ladr    x1, curl_http_prefix
    mov     w2, #(curl_https_prefix - curl_http_prefix)
    bl      mem_equal
    cbz     w0, curl_start_https
    add     x19, x19, #(curl_https_prefix - curl_http_prefix)
    b       curl_start_host

curl_start_https:
    mov     x0, x19
    ladr    x1, curl_https_prefix
    mov     w2, #(curl_req_get - curl_https_prefix)
    bl      mem_equal
    cbz     w0, curl_start_host
    add     x19, x19, #(curl_req_get - curl_https_prefix)
    mov     w20, #1

curl_start_host:
    ladr    x21, curl_host
    mov     w22, #0

curl_start_host_char:
    ldrb    w0, [x19]
    cbz     w0, curl_start_host_end
    cmp     w0, #0x2f
    b.eq    curl_start_host_end
    cmp     w0, #ASCII_SPACE
    b.eq    curl_start_host_end
    sub     w1, w0, #0x41
    cmp     w1, #25
    b.hi    curl_start_host_check
    add     w0, w0, #0x20

curl_start_host_check:
    sub     w1, w0, #0x61
    cmp     w1, #25
    b.ls    curl_start_host_store
    sub     w1, w0, #ASCII_ZERO
    cmp     w1, #9
    b.ls    curl_start_host_store
    cmp     w0, #0x2e
    b.eq    curl_start_host_store
    cmp     w0, #0x2d
    b.ne    curl_start_bad

curl_start_host_store:
    cmp     w22, #CURL_HOST_MAX
    b.hs    curl_start_bad
    strb    w0, [x21, x22]
    add     w22, w22, #1
    add     x19, x19, #1
    b       curl_start_host_char

curl_start_host_end:
    cbz     w22, curl_start_bad
    strb    wzr, [x21, x22]
    ladr    x0, curl_host_len
    str     w22, [x0]
    ladr    x21, curl_request
    mov     x0, x21
    ladr    x1, curl_req_get
    bl      term_append
    ldrb    w1, [x19]
    cmp     w1, #0x2f
    b.eq    curl_start_path
    ladr    x1, curl_req_slash
    bl      term_append

curl_start_path:
    mov     w22, #0

curl_start_path_char:
    ldrb    w1, [x19]
    cbz     w1, curl_start_path_end
    cmp     w1, #ASCII_SPACE
    b.eq    curl_start_path_end
    cmp     w22, #CURL_PATH_MAX
    b.hs    curl_start_bad
    strb    w1, [x0], #1
    add     x19, x19, #1
    add     w22, w22, #1
    b       curl_start_path_char

curl_start_path_end:
    ladr    x1, curl_req_host
    bl      term_append
    ladr    x1, curl_host
    bl      term_append
    ladr    x1, curl_req_tail
    bl      term_append
    sub     x0, x0, x21
    ladr    x1, curl_request_len
    str     w0, [x1]
    ladr    x0, curl_https
    strb    w20, [x0]
    ladr    x0, curl_header
    mov     w1, #1
    strb    w1, [x0]
    ladr    x0, curl_status_seen
    strb    wzr, [x0]
    ladr    x0, curl_line_len
    stp     wzr, wzr, [x0]
    str     wzr, [x0, #8]
    ladr    x0, curl_state
    mov     w1, #1
    strb    w1, [x0]
    ladr    x0, term_busy
    strb    w1, [x0]
    ladr    x0, curl_msg
    ladr    x1, curl_resolve_msg
    bl      term_append
    ladr    x1, curl_host
    bl      term_append
    ladr    x1, curl_resolve_tail
    bl      term_append
    ladr    x0, curl_msg
    bl      term_print
    ladr    x0, curl_host
    ladr    x1, curl_resolved
    bl      dns_resolve
    b       curl_start_done

curl_start_bad:
    ladr    x1, curl_bad_url_msg

curl_start_fail:
    mov     x0, x1
    bl      term_print

curl_start_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

curl_resolved:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     w19, w0
    ladr    x0, curl_state
    ldrb    w0, [x0]
    cbz     w0, curl_resolved_done
    ladr    x1, curl_dnsfail_msg
    cbz     w19, curl_resolved_fail
    ladr    x0, curl_https
    ldrb    w20, [x0]
    cbz     w20, curl_resolved_msg
    ladr    x9, tls_ctx
    ldrb    w0, [x9, #TLS_STATE]
    sub     w0, w0, #TLS_STATE_HELLO_SENT
    cmp     w0, #(TLS_STATE_CONNECTED - TLS_STATE_HELLO_SENT)
    ladr    x1, curl_tlsbusy_msg
    b.ls    curl_resolved_fail

curl_resolved_msg:
    ladr    x0, curl_msg
    ladr    x1, curl_connect_msg
    bl      term_append
    mov     w1, w19
    bl      term_put_ip
    cbz     w20, curl_resolved_print
    ladr    x1, curl_https_tail
    bl      term_append

curl_resolved_print:
    ladr    x0, curl_msg
    bl      term_print
    cbnz    w20, curl_resolved_tls
    mov     w0, w19
    mov     w1, #HTTP_PORT
    ladr    x2, curl_http_on_data
    bl      tcp_open
    ladr    x1, curl_conn_fail_msg
    cbz     x0, curl_resolved_fail
    ladr    x1, curl_request
    ladr    x2, curl_request_len
    ldr     w2, [x2]
    bl      tcp_write
    b       curl_resolved_done

curl_resolved_tls:
    ladr    x0, curl_host
    ladr    x1, curl_host_len
    ldr     w1, [x1]
    ladr    x2, curl_request
    ladr    x3, curl_request_len
    ldr     w3, [x3]
    ladr    x4, curl_tls_app
    bl      tls_configure
    mov     w0, w19
    mov     w1, #HTTPS_PORT
    bl      tls_connect
    ladr    x1, curl_conn_fail_msg
    cbnz    x0, curl_resolved_done

curl_resolved_fail:
    mov     x0, x1
    bl      term_print
    bl      curl_abort

curl_resolved_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

curl_http_on_data:
    cbz     w2, curl_finish
    b       curl_feed

curl_tls_app:
    cbz     w2, curl_finish
    b       curl_feed

curl_feed:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     x19, x1
    mov     w20, w2
    ladr    x0, curl_state
    ldrb    w0, [x0]
    cbz     w0, curl_feed_done

curl_feed_byte:
    cbz     w20, curl_feed_done
    ldrb    w21, [x19], #1
    sub     w20, w20, #1
    ladr    x9, curl_header
    ldrb    w9, [x9]
    cbnz    w9, curl_feed_char
    ladr    x9, curl_bytes
    ldr     w10, [x9]
    add     w10, w10, #1
    str     w10, [x9]

curl_feed_char:
    cmp     w21, #ASCII_CR
    b.eq    curl_feed_byte
    cmp     w21, #ASCII_LF
    b.eq    curl_feed_eol
    cmp     w21, #0x09
    mov     w9, #ASCII_SPACE
    csel    w21, w9, w21, eq
    sub     w9, w21, #ASCII_SPACE
    cmp     w9, #(ASCII_DEL - ASCII_SPACE)
    mov     w9, #0x3f
    csel    w21, w9, w21, hs
    ladr    x9, curl_line_len
    ldr     w10, [x9]
    cmp     w10, #TERM_WRAP
    b.hs    curl_feed_wrap
    ladr    x11, curl_line
    strb    w21, [x11, x10]
    add     w10, w10, #1
    str     w10, [x9]
    b       curl_feed_byte

curl_feed_wrap:
    bl      curl_line_end
    ladr    x11, curl_line
    strb    w21, [x11]
    ladr    x9, curl_line_len
    mov     w10, #1
    str     w10, [x9]
    b       curl_feed_byte

curl_feed_eol:
    bl      curl_line_end
    b       curl_feed_byte

curl_feed_done:
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

curl_line_end:
    stp     x29, x30, [sp, #-16]!
    ladr    x9, curl_line_len
    ldr     w10, [x9]
    str     wzr, [x9]
    ladr    x11, curl_line
    strb    wzr, [x11, x10]
    ladr    x0, curl_header
    ldrb    w1, [x0]
    cbz     w1, curl_line_end_print
    cbnz    w10, curl_line_end_header
    strb    wzr, [x0]
    b       curl_line_end_done

curl_line_end_header:
    ladr    x0, curl_status_seen
    ldrb    w1, [x0]
    cbnz    w1, curl_line_end_done
    mov     w1, #1
    strb    w1, [x0]

curl_line_end_print:
    ladr    x0, curl_lines
    ldr     w1, [x0]
    add     w2, w1, #1
    str     w2, [x0]
    cmp     w1, #CURL_MAX_LINES
    b.hi    curl_line_end_done
    ladr    x0, curl_cut_msg
    b.eq    curl_line_end_out
    ladr    x0, curl_line

curl_line_end_out:
    bl      term_print

curl_line_end_done:
    ldp     x29, x30, [sp], #16
    ret

curl_abort:
    stp     x29, x30, [sp, #-16]!
    ladr    x0, curl_state
    strb    wzr, [x0]
    b       curl_finish_prompt

curl_finish:
    stp     x29, x30, [sp, #-16]!
    ladr    x0, curl_state
    ldrb    w1, [x0]
    cbz     w1, curl_finish_done
    ladr    x0, curl_line_len
    ldr     w1, [x0]
    cbz     w1, curl_finish_report
    bl      curl_line_end

curl_finish_report:
    ladr    x0, curl_state
    strb    wzr, [x0]
    ladr    x0, curl_status_seen
    ldrb    w0, [x0]
    cbnz    w0, curl_finish_bytes
    ladr    x0, curl_noanswer_msg
    bl      term_print
    b       curl_finish_prompt

curl_finish_bytes:
    ladr    x0, curl_msg
    ladr    x1, curl_done_msg
    bl      term_append
    ladr    x1, curl_bytes
    ldr     w1, [x1]
    bl      term_put_dec
    ladr    x1, curl_done_tail
    bl      term_append
    ladr    x0, curl_msg
    bl      term_print

curl_finish_prompt:
    ladr    x0, term_busy
    strb    wzr, [x0]
    bl      term_prompt
    ladr    x0, term_dirty
    mov     w1, #1
    strb    w1, [x0]

curl_finish_done:
    ldp     x29, x30, [sp], #16
    ret

term_draw:
    stp     x29, x30, [sp, #-192]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    mov     w19, w0
    mov     w20, w1
    mov     w21, w2
    mov     x22, x3
    mov     w26, w4
    bl      win_top_index
    cmp     w0, w26
    cset    w23, eq
    ladr    x0, term_row
    ldr     w25, [x0]
    mov     w24, #0

term_draw_loop:
    cmp     w24, #TERM_ROWS
    b.hs    term_draw_done
    mov     w9, #FILES_LINE_H
    madd    w0, w24, w9, w20
    add     w0, w0, #FILES_PAD_Y
    add     w9, w20, w21
    cmp     w0, w9
    b.gt    term_draw_done
    mov     w1, w0
    ladr    x2, term_buf
    mov     w9, #TERM_STRIDE
    madd    x2, x24, x9, x2
    cmp     w24, w25
    b.ne    term_draw_text
    cbz     w23, term_draw_text
    mov     x0, x2
    add     x1, sp, #80
    mov     w2, #TERM_STRIDE
    stp     x1, x1, [sp, #-16]!
    bl      mem_copy
    ldp     x1, x2, [sp], #16
    ladr    x0, term_col
    ldr     w0, [x0]
    mov     w3, #ASCII_UNDERSCORE
    strb    w3, [x2, x0]
    add     w0, w0, #1
    strb    wzr, [x2, x0]
    mov     w9, #FILES_LINE_H
    madd    w1, w24, w9, w20
    add     w1, w1, #FILES_PAD_Y

term_draw_text:
    add     w0, w19, #FILES_PAD_X
    mov     w3, #FILES_TEXT_SIZE
    mov     x4, x22
    bl      font_text
    add     w24, w24, #1
    b       term_draw_loop

term_draw_done:
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #192
    ret

netlog_init:
    stp     x29, x30, [sp, #-16]!
    ladr    x0, netlog_count
    str     wzr, [x0]
    ladr    x0, netlog_intro_1
    bl      netlog_add
    ladr    x0, netlog_intro_2
    bl      netlog_add
    ladr    x0, netlog_dirty
    strb    wzr, [x0]
    ladr    x0, netlog_new
    stp     wzr, wzr, [x0]
    ldp     x29, x30, [sp], #16
    ret

netlog_refresh:
    stp     x29, x30, [sp, #-96]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    str     x27, [sp, #80]
    mov     w19, w0
    ladr    x0, netlog_dirty
    bl      console_take_flag
    cbz     w0, netlog_refresh_done
    ladr    x9, netlog_new
    ldp     w21, w22, [x9]
    stp     wzr, wzr, [x9]
    ladr    x20, win_list
    mov     x9, #WIN_SIZE
    madd    x20, x19, x9, x20
    mov     w0, #1
    ldr     x23, [x20, #WIN_BUF]
    cbz     x23, netlog_refresh_done
    ldrb    w9, [x20, #WIN_BUF_DIRTY]
    cbnz    w9, netlog_refresh_done
    cmp     w21, #NETLOG_ROWS
    b.hs    netlog_refresh_done
    mov     w0, #0
    cbz     w21, netlog_refresh_done
    ladr    x0, fb_clip
    ldp     x24, x25, [x0]
    mov     x0, x23
    ldr     w1, [x20, #WIN_W]
    lsl     x1, x1, #2
    bl      fb_target_set
    mov     w0, #WIN_BORDER
    mov     w1, #(WIN_BORDER + WIN_TITLEBAR_H)
    ldr     w2, [x20, #WIN_W]
    sub     w2, w2, #(WIN_BORDER * 2)
    ldr     w3, [x20, #WIN_H_FULL]
    sub     w3, w3, #(WIN_BORDER * 2 + WIN_TITLEBAR_H)
    bl      fb_clip_set
    ladr    x0, win_color_fade
    strb    wzr, [x0]
    ladr    x0, netlog_count
    ldr     w26, [x0]
    sub     w27, w26, w21
    cbz     w22, netlog_refresh_fill
    cbz     w27, netlog_refresh_fill
    ldr     w4, [x20, #WIN_W]
    lsl     x4, x4, #2
    mov     x9, #NETLOG_BAND_Y
    mul     x9, x9, x4
    add     x0, x23, x9
    add     x0, x0, #(WIN_BORDER * FB_BPP)
    mov     w9, #FILES_LINE_H
    mul     w10, w22, w9
    mul     x10, x10, x4
    add     x1, x0, x10
    ldr     w2, [x20, #WIN_W]
    sub     w2, w2, #(WIN_BORDER * 2)
    mul     w3, w27, w9
    mov     x5, x4
    bl      fb_copy

netlog_refresh_fill:
    ldr     x0, =COLOR_WIN_BODY
    bl      win_fade_color
    mov     x4, x0
    mov     w9, #FILES_LINE_H
    mul     w1, w27, w9
    add     w1, w1, #NETLOG_BAND_Y
    mov     w0, #WIN_BORDER
    ldr     w2, [x20, #WIN_W]
    sub     w2, w2, #(WIN_BORDER * 2)
    mul     w3, w21, w9
    bl      fb_fill_rect
    ldr     x0, =COLOR_FILES_TEXT
    bl      win_fade_color
    mov     x21, x0

netlog_refresh_row:
    cmp     w27, w26
    b.hs    netlog_refresh_drawn
    mov     w9, #FILES_LINE_H
    mul     w1, w27, w9
    add     w1, w1, #(WIN_BORDER + WIN_TITLEBAR_H + FILES_PAD_Y)
    mov     w0, #(WIN_BORDER + FILES_PAD_X)
    ladr    x2, netlog_buf
    mov     w9, #TERM_STRIDE
    madd    x2, x27, x9, x2
    mov     w3, #FILES_TEXT_SIZE
    mov     x4, x21
    bl      font_text
    add     w27, w27, #1
    b       netlog_refresh_row

netlog_refresh_drawn:
    bl      fb_target_screen
    mov     x0, x24
    mov     x1, x25
    bl      fb_clip_restore
    mov     w0, #2

netlog_refresh_done:
    ldr     x27, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #96
    ret

netlog_add:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x19, x0
    ladr    x0, netlog_count
    ldr     w1, [x0]
    cmp     w1, #NETLOG_ROWS
    b.lo    netlog_add_row
    ladr    x0, netlog_buf
    add     x0, x0, #TERM_STRIDE
    ladr    x1, netlog_buf
    mov     w2, #((NETLOG_ROWS - 1) * TERM_STRIDE)
    bl      mem_copy
    ladr    x0, netlog_new
    ldr     w2, [x0, #4]
    add     w2, w2, #1
    str     w2, [x0, #4]
    mov     w1, #(NETLOG_ROWS - 1)

netlog_add_row:
    ladr    x0, netlog_new
    ldr     w2, [x0]
    add     w2, w2, #1
    str     w2, [x0]
    ladr    x0, netlog_count
    add     w2, w1, #1
    str     w2, [x0]
    ladr    x0, netlog_buf
    mov     w2, #TERM_STRIDE
    madd    x0, x1, x2, x0
    mov     w1, #TERM_STRIDE
    str     x0, [sp, #-16]!
    bl      mem_wipe
    ldr     x1, [sp], #16
    mov     x0, x19
    mov     w2, #(TERM_COLS - 1)
    bl      string_copy_bounded
    ladr    x0, netlog_dirty
    mov     w1, #1
    strb    w1, [x0]
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

string_copy_bounded:
    cbz     w2, string_copy_bounded_done
    ldrb    w3, [x0], #1
    cbz     w3, string_copy_bounded_done
    strb    w3, [x1], #1
    sub     w2, w2, #1
    b       string_copy_bounded

string_copy_bounded_done:
    strb    wzr, [x1]
    ret

netlog_draw:
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    mov     w19, w0
    mov     w20, w1
    mov     w21, w2
    mov     x22, x3
    ladr    x0, netlog_count
    ldr     w23, [x0]
    mov     w24, #0

netlog_draw_loop:
    cmp     w24, w23
    b.hs    netlog_draw_done
    mov     w9, #FILES_LINE_H
    madd    w1, w24, w9, w20
    add     w1, w1, #FILES_PAD_Y
    add     w9, w20, w21
    cmp     w1, w9
    b.gt    netlog_draw_done
    add     w0, w19, #FILES_PAD_X
    ladr    x2, netlog_buf
    mov     w9, #TERM_STRIDE
    madd    x2, x24, x9, x2
    mov     w3, #FILES_TEXT_SIZE
    mov     x4, x22
    bl      font_text
    add     w24, w24, #1
    b       netlog_draw_loop

netlog_draw_done:
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

gui_line_end:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    ladr    x19, gui_line
    ladr    x0, gui_line_len
    ldr     w1, [x0]
    str     wzr, [x0]
    cmp     w1, #GUI_LINE_MAX
    b.hs    gui_line_end_done
    strb    wzr, [x19, x1]
    cmp     w1, #4
    b.lo    gui_line_end_done
    ladr    x20, gui_prefixes
    ldr     w2, [x19]

gui_line_end_loop:
    ldr     w3, [x20], #4
    cbz     w3, gui_line_end_done
    cmp     w2, w3
    b.ne    gui_line_end_loop
    mov     x0, x19
    bl      netlog_add

gui_line_end_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret


.equ ECOP_MUL,      0
.equ ECOP_ADD,      1
.equ ECOP_SUB,      2
.equ ECOP_TOMONT,   3
.equ ECOP_FROMMONT, 4
.equ ECOP_END,      5

.macro ecop op, d, a, b=0
    .byte   \op, (\d) >> 4, (\a) >> 4, (\b) >> 4
.endm

ec_run:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     x20, x1

ec_run_loop:
    ldrb    w9, [x19]
    cmp     w9, #ECOP_END
    b.eq    ec_run_done
    ldrb    w0, [x19, #1]
    ldrb    w1, [x19, #2]
    ldrb    w2, [x19, #3]
    add     x0, x20, x0, lsl #4
    add     x1, x20, x1, lsl #4
    add     x2, x20, x2, lsl #4
    mov     x3, x28
    add     x19, x19, #4
    ladr    x4, ec_run_fns
    ldr     x4, [x4, x9, lsl #3]
    blr     x4
    b       ec_run_loop

ec_run_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

.equ ECD_X1,    48
.equ ECD_Y1,    96
.equ ECD_Z1,    144
.equ ECD_DELTA, 192
.equ ECD_GAMMA, 240
.equ ECD_BETA,  288
.equ ECD_ALPHA, 336
.equ ECD_T1,    384
.equ ECD_T2,    432
.equ ECD_X3,    480
.equ ECD_Y3,    528
.equ ECD_Z3,    576
.equ ECD_FRAME, 624

ec_dbl:
    sub     sp, sp, #ECD_FRAME
    stp     x29, x30, [sp]
    stp     x19, x20, [sp, #16]
    str     x28, [sp, #32]
    ldr     x28, [x27, #EC_PCTX]
    mov     x19, x0
    mov     x0, x1
    add     x1, sp, #ECD_X1
    mov     w2, #EC_POINT_SIZE
    bl      mem_copy
    ladr    x0, ec_dbl_ops
    mov     x1, sp
    bl      ec_run
    add     x0, sp, #ECD_X3
    mov     x1, x19
    mov     w2, #EC_POINT_SIZE
    bl      mem_copy
    ldr     x28, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp]
    add     sp, sp, #ECD_FRAME
    ret

.equ ECA_X1,    48
.equ ECA_Y1,    96
.equ ECA_Z1,    144
.equ ECA_X2,    192
.equ ECA_Y2,    240
.equ ECA_Z2,    288
.equ ECA_Z1Z1,  336
.equ ECA_Z2Z2,  384
.equ ECA_U1,    432
.equ ECA_U2,    480
.equ ECA_S1,    528
.equ ECA_S2,    576
.equ ECA_H,     624
.equ ECA_I,     672
.equ ECA_J,     720
.equ ECA_R,     768
.equ ECA_V,     816
.equ ECA_T1,    864
.equ ECA_X3,    912
.equ ECA_Y3,    960
.equ ECA_Z3,    1008
.equ ECA_FRAME, 1056

ec_add:
    sub     sp, sp, #ECA_FRAME
    stp     x29, x30, [sp]
    stp     x19, x20, [sp, #16]
    str     x28, [sp, #32]
    ldr     x28, [x27, #EC_PCTX]
    mov     x19, x0
    mov     x20, x2
    mov     x0, x1
    add     x1, sp, #ECA_X1
    mov     w2, #EC_POINT_SIZE
    bl      mem_copy
    mov     x0, x20
    add     x1, sp, #ECA_X2
    mov     w2, #EC_POINT_SIZE
    bl      mem_copy
    add     x0, sp, #ECA_Z1
    mov     x1, x28
    bl      mp_is_zero
    cbnz    w0, ec_add_return_q
    add     x0, sp, #ECA_Z2
    mov     x1, x28
    bl      mp_is_zero
    cbnz    w0, ec_add_return_p
    ladr    x0, ec_add_ops
    mov     x1, sp
    bl      ec_run
    add     x0, sp, #ECA_H
    mov     x1, x28
    bl      mp_is_zero
    cbz     w0, ec_add_general
    add     x0, sp, #ECA_R
    mov     x1, x28
    bl      mp_is_zero
    cbz     w0, ec_add_infinity
    mov     x0, x19
    add     x1, sp, #ECA_X1
    bl      ec_dbl
    b       ec_add_done

ec_add_infinity:
    mov     x0, x19
    mov     w1, #EC_POINT_SIZE
    bl      mem_wipe
    b       ec_add_done

ec_add_return_q:
    add     x0, sp, #ECA_X2
    mov     x1, x19
    mov     w2, #EC_POINT_SIZE
    bl      mem_copy
    b       ec_add_done

ec_add_return_p:
    add     x0, sp, #ECA_X1
    mov     x1, x19
    mov     w2, #EC_POINT_SIZE
    bl      mem_copy
    b       ec_add_done

ec_add_general:
    ladr    x0, ec_add_general_ops
    mov     x1, sp
    bl      ec_run
    add     x0, sp, #ECA_X3
    mov     x1, x19
    mov     w2, #EC_POINT_SIZE
    bl      mem_copy

ec_add_done:
    ldr     x28, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp]
    add     sp, sp, #ECA_FRAME
    ret

.equ ECM_R,     48
.equ ECM_P,     192
.equ ECM_BIT,   336
.equ ECM_FRAME, 352

ec_mul:
    sub     sp, sp, #ECM_FRAME
    stp     x29, x30, [sp]
    stp     x19, x20, [sp, #16]
    str     x28, [sp, #32]
    ldr     x28, [x27, #EC_PCTX]
    mov     x19, x0
    mov     x20, x1
    mov     x0, x2
    add     x1, sp, #ECM_P
    mov     w2, #(EC_SLOT * 2)
    bl      mem_copy
    add     x0, sp, #(ECM_P + EC_Z)
    mov     w1, #EC_SLOT
    bl      mem_wipe
    add     x0, sp, #(ECM_P + EC_Z)
    ldr     x1, [x28, #MP_ONE]
    mov     x2, x28
    bl      mp_copy
    add     x0, sp, #ECM_R
    mov     w1, #EC_POINT_SIZE
    bl      mem_wipe
    add     x0, sp, #(ECM_R + EC_X)
    ldr     x1, [x28, #MP_ONE]
    mov     x2, x28
    bl      mp_copy
    add     x0, sp, #(ECM_R + EC_Y)
    ldr     x1, [x28, #MP_ONE]
    mov     x2, x28
    bl      mp_copy
    ldr     x1, [x28, #MP_K]
    lsl     x1, x1, #6
    sub     x1, x1, #1
    str     x1, [sp, #ECM_BIT]

ec_mul_loop:
    add     x0, sp, #ECM_R
    add     x1, sp, #ECM_R
    bl      ec_dbl
    ldr     x1, [sp, #ECM_BIT]
    lsr     x4, x1, #6
    ldr     x4, [x20, x4, lsl #3]
    and     x6, x1, #63
    lsr     x4, x4, x6
    tbz     x4, #0, ec_mul_next
    add     x0, sp, #ECM_R
    add     x1, sp, #ECM_R
    add     x2, sp, #ECM_P
    bl      ec_add

ec_mul_next:
    ldr     x1, [sp, #ECM_BIT]
    subs    x1, x1, #1
    str     x1, [sp, #ECM_BIT]
    b.ge    ec_mul_loop
    add     x0, sp, #ECM_R
    mov     x1, x19
    mov     w2, #EC_POINT_SIZE
    bl      mem_copy
    ldr     x28, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp]
    add     sp, sp, #ECM_FRAME
    ret

.equ ECV_QX,    80
.equ ECV_QY,    128
.equ ECV_R,     176
.equ ECV_S,     224
.equ ECV_H,     272
.equ ECV_W,     320
.equ ECV_U1,    368
.equ ECV_U2,    416
.equ ECV_P1,    464
.equ ECV_P2,    608
.equ ECV_T1,    752
.equ ECV_T2,    800
.equ ECV_HT,    848
.equ ECV_FRAME, 896

ecdsa_verify:
    sub     sp, sp, #ECV_FRAME
    stp     x29, x30, [sp]
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x27, x28, [sp, #64]
    mov     x27, x0
    ldr     x28, [x27, #EC_PCTX]
    ldr     x21, [x27, #EC_NCTX]
    ldr     x22, [x27, #EC_BYTES]
    mov     x19, x1
    mov     x20, x2
    mov     w23, w3
    mov     x24, x4
    add     x0, sp, #ECV_R
    mov     x1, x24
    mov     x2, x21
    bl      mp_from_bytes
    add     x0, sp, #ECV_S
    mov     x1, x5
    mov     x2, x21
    bl      mp_from_bytes
    add     x0, sp, #ECV_HT
    mov     w1, #EC_SLOT
    bl      mem_wipe
    cmp     w23, w22
    csel    w2, w22, w23, hs
    mov     x0, x20
    add     x1, sp, #(ECV_HT + EC_SLOT)
    sub     x1, x1, x2
    bl      mem_copy
    add     x0, sp, #ECV_H
    add     x1, sp, #(ECV_HT + EC_SLOT)
    sub     x1, x1, x22
    mov     x2, x21
    bl      mp_from_bytes
    add     x0, sp, #ECV_R
    mov     x1, x21
    bl      mp_is_zero
    cbnz    w0, ecdsa_verify_fail
    add     x0, sp, #ECV_S
    mov     x1, x21
    bl      mp_is_zero
    cbnz    w0, ecdsa_verify_fail
    add     x0, sp, #ECV_R
    ldr     x1, [x21, #MP_M]
    mov     x2, x21
    bl      mp_geq
    cbnz    w0, ecdsa_verify_fail
    add     x0, sp, #ECV_S
    ldr     x1, [x21, #MP_M]
    mov     x2, x21
    bl      mp_geq
    cbnz    w0, ecdsa_verify_fail
    add     x0, sp, #ECV_W
    add     x1, sp, #ECV_S
    mov     x3, x21
    bl      mp_to_mont
    add     x0, sp, #ECV_W
    add     x1, sp, #ECV_W
    mov     x2, x21
    bl      mp_inv_mod
    add     x0, sp, #ECV_U1
    add     x1, sp, #ECV_H
    mov     x3, x21
    bl      mp_to_mont
    add     x0, sp, #ECV_U1
    add     x1, sp, #ECV_U1
    add     x2, sp, #ECV_W
    mov     x3, x21
    bl      mp_mont_mul
    add     x0, sp, #ECV_U1
    add     x1, sp, #ECV_U1
    mov     x3, x21
    bl      mp_from_mont
    add     x0, sp, #ECV_U2
    add     x1, sp, #ECV_R
    mov     x3, x21
    bl      mp_to_mont
    add     x0, sp, #ECV_U2
    add     x1, sp, #ECV_U2
    add     x2, sp, #ECV_W
    mov     x3, x21
    bl      mp_mont_mul
    add     x0, sp, #ECV_U2
    add     x1, sp, #ECV_U2
    mov     x3, x21
    bl      mp_from_mont
    add     x0, sp, #ECV_QX
    mov     x1, x19
    mov     x2, x28
    bl      mp_from_bytes
    add     x0, sp, #ECV_QY
    add     x1, x19, x22
    mov     x2, x28
    bl      mp_from_bytes
    add     x0, sp, #ECV_QX
    ldr     x1, [x28, #MP_M]
    mov     x2, x28
    bl      mp_geq
    cbnz    w0, ecdsa_verify_fail
    add     x0, sp, #ECV_QY
    ldr     x1, [x28, #MP_M]
    mov     x2, x28
    bl      mp_geq
    cbnz    w0, ecdsa_verify_fail
    ladr    x0, ecdsa_curve_ops
    mov     x1, sp
    bl      ec_run
    add     x0, sp, #ECV_T1
    add     x1, sp, #ECV_T1
    ldr     x2, [x27, #EC_B]
    mov     x3, x28
    bl      mp_add_mod
    ladr    x0, ecdsa_curve_y_ops
    mov     x1, sp
    bl      ec_run
    add     x0, sp, #ECV_T1
    mov     x1, x28
    bl      mp_is_zero
    cbz     w0, ecdsa_verify_fail
    add     x0, sp, #ECV_P1
    add     x1, sp, #ECV_U1
    ldr     x2, [x27, #EC_G]
    bl      ec_mul
    add     x0, sp, #ECV_P2
    add     x1, sp, #ECV_U2
    add     x2, sp, #ECV_QX
    bl      ec_mul
    add     x0, sp, #ECV_P1
    add     x1, sp, #ECV_P1
    add     x2, sp, #ECV_P2
    bl      ec_add
    add     x0, sp, #(ECV_P1 + EC_Z)
    mov     x1, x28
    bl      mp_is_zero
    cbnz    w0, ecdsa_verify_fail
    add     x0, sp, #ECV_T1
    add     x1, sp, #(ECV_P1 + EC_Z)
    mov     x2, x28
    bl      mp_inv_mod
    ladr    x0, ecdsa_affine_ops
    mov     x1, sp
    bl      ec_run
    add     x0, sp, #ECV_T1
    ldr     x1, [x21, #MP_M]
    mov     x2, x21
    bl      mp_geq
    cbz     w0, ecdsa_verify_compare
    add     x0, sp, #ECV_T1
    add     x1, sp, #ECV_T1
    ldr     x2, [x21, #MP_M]
    mov     x3, x21
    bl      mp_sub_mod

ecdsa_verify_compare:
    add     x0, sp, #ECV_T1
    add     x1, sp, #ECV_R
    mov     w2, w22
    bl      mem_equal
    cmp     w0, #1
    cset    w0, ne
    b       ecdsa_verify_done

ecdsa_verify_fail:
    mov     w0, #1

ecdsa_verify_done:
    ldp     x27, x28, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp]
    add     sp, sp, #ECV_FRAME
    ret

ecdsa_sig_decode:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x19, x2
    mov     x20, x3
    str     x4, [sp, #-16]!
    add     x1, x0, x1
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, ecdsa_sig_decode_fail
    add     x21, x0, x1
    mov     x1, x21
    mov     w2, #ASN1_INTEGER
    bl      asn1_expect
    tbnz    w2, #31, ecdsa_sig_decode_fail
    mov     x22, x3
    mov     x2, x19
    ldr     x3, [sp]
    bl      ecdsa_sig_int
    cbnz    w0, ecdsa_sig_decode_fail
    mov     x0, x22
    mov     x1, x21
    mov     w2, #ASN1_INTEGER
    bl      asn1_expect
    tbnz    w2, #31, ecdsa_sig_decode_fail
    mov     x2, x20
    ldr     x3, [sp]
    bl      ecdsa_sig_int
    b       ecdsa_sig_decode_done

ecdsa_sig_decode_fail:
    mov     w0, #1

ecdsa_sig_decode_done:
    add     sp, sp, #16
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

ecdsa_sig_int:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x19, x0
    mov     x20, x1
    mov     x21, x2
    mov     w22, w3

ecdsa_sig_int_strip:
    cbz     x20, ecdsa_sig_int_fail
    ldrb    w3, [x19]
    cbnz    w3, ecdsa_sig_int_copy
    add     x19, x19, #1
    sub     x20, x20, #1
    b       ecdsa_sig_int_strip

ecdsa_sig_int_copy:
    cmp     x20, x22
    b.hi    ecdsa_sig_int_fail
    mov     x0, x21
    mov     w1, w22
    bl      mem_wipe
    add     x1, x21, x22
    sub     x1, x1, x20
    mov     x0, x19
    mov     w2, w20
    bl      mem_copy
    mov     w0, #0
    b       ecdsa_sig_int_done

ecdsa_sig_int_fail:
    mov     w0, #1

ecdsa_sig_int_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

sha512_block:
    sub     sp, sp, #752
    stp     x29, x30, [sp]
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    stp     x25, x26, [sp, #64]
    stp     x27, x28, [sp, #80]
    str     x0, [sp, #96]
    add     x28, sp, #112
    mov     x9, #0

sha512_block_load:
    ldr     x10, [x1, x9, lsl #3]
    rev     x10, x10
    str     x10, [x28, x9, lsl #3]
    add     x9, x9, #1
    cmp     x9, #16
    b.lo    sha512_block_load

sha512_block_schedule:
    sub     x10, x9, #2
    ldr     x10, [x28, x10, lsl #3]
    ror     x11, x10, #19
    ror     x12, x10, #61
    eor     x11, x11, x12
    eor     x11, x11, x10, lsr #6
    sub     x10, x9, #7
    ldr     x12, [x28, x10, lsl #3]
    add     x11, x11, x12
    sub     x10, x9, #15
    ldr     x10, [x28, x10, lsl #3]
    ror     x12, x10, #1
    ror     x13, x10, #8
    eor     x12, x12, x13
    eor     x12, x12, x10, lsr #7
    add     x11, x11, x12
    sub     x10, x9, #16
    ldr     x12, [x28, x10, lsl #3]
    add     x11, x11, x12
    str     x11, [x28, x9, lsl #3]
    add     x9, x9, #1
    cmp     x9, #80
    b.lo    sha512_block_schedule
    ldp     x19, x20, [x0]
    ldp     x21, x22, [x0, #16]
    ldp     x23, x24, [x0, #32]
    ldp     x25, x26, [x0, #48]
    ladr    x27, sha512_k
    mov     x9, #0

sha512_block_rounds:
    ldr     x10, [x28, x9, lsl #3]
    ldr     x11, [x27, x9, lsl #3]
    ror     x12, x23, #14
    ror     x13, x23, #18
    eor     x12, x12, x13
    ror     x13, x23, #41
    eor     x12, x12, x13
    and     x13, x23, x24
    bic     x14, x25, x23
    eor     x13, x13, x14
    add     x10, x10, x11
    add     x10, x10, x26
    add     x10, x10, x12
    add     x10, x10, x13
    ror     x12, x19, #28
    ror     x13, x19, #34
    eor     x12, x12, x13
    ror     x13, x19, #39
    eor     x12, x12, x13
    and     x13, x19, x20
    and     x14, x19, x21
    eor     x13, x13, x14
    and     x14, x20, x21
    eor     x13, x13, x14
    add     x12, x12, x13
    mov     x26, x25
    mov     x25, x24
    mov     x24, x23
    add     x23, x22, x10
    mov     x22, x21
    mov     x21, x20
    mov     x20, x19
    add     x19, x10, x12
    add     x9, x9, #1
    cmp     x9, #80
    b.lo    sha512_block_rounds
    ldr     x0, [sp, #96]
    ldp     x10, x11, [x0]
    add     x19, x19, x10
    add     x20, x20, x11
    ldp     x10, x11, [x0, #16]
    add     x21, x21, x10
    add     x22, x22, x11
    ldp     x10, x11, [x0, #32]
    add     x23, x23, x10
    add     x24, x24, x11
    ldp     x10, x11, [x0, #48]
    add     x25, x25, x10
    add     x26, x26, x11
    stp     x19, x20, [x0]
    stp     x21, x22, [x0, #16]
    stp     x23, x24, [x0, #32]
    stp     x25, x26, [x0, #48]
    ldp     x27, x28, [sp, #80]
    ldp     x25, x26, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp]
    add     sp, sp, #752
    ret

sha384_init:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x19, x0
    ladr    x0, sha384_iv
    mov     x1, x19
    mov     w2, #64
    bl      mem_copy
    str     xzr, [x19, #SHA512_CTX_COUNT]
    str     xzr, [x19, #SHA512_CTX_FILL]
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

sha384_update:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x19, x0
    mov     x20, x1
    mov     x21, x2
    ldr     x3, [x19, #SHA512_CTX_COUNT]
    add     x3, x3, x21
    str     x3, [x19, #SHA512_CTX_COUNT]

sha384_update_loop:
    cbz     x21, sha384_update_done
    ldr     w22, [x19, #SHA512_CTX_FILL]
    cbnz    w22, sha384_update_buffer
    cmp     x21, #SHA512_BLOCK_SIZE
    b.lo    sha384_update_buffer
    mov     x0, x19
    mov     x1, x20
    bl      sha512_block
    add     x20, x20, #SHA512_BLOCK_SIZE
    sub     x21, x21, #SHA512_BLOCK_SIZE
    b       sha384_update_loop

sha384_update_buffer:
    mov     w3, #SHA512_BLOCK_SIZE
    sub     w3, w3, w22
    cmp     x21, x3
    csel    x3, x21, x3, lo
    add     x4, x19, #SHA512_CTX_BUF
    add     x4, x4, x22
    mov     x5, x3

sha384_update_copy:
    ldrb    w6, [x20], #1
    strb    w6, [x4], #1
    subs    x5, x5, #1
    b.ne    sha384_update_copy
    add     w22, w22, w3
    sub     x21, x21, x3
    cmp     w22, #SHA512_BLOCK_SIZE
    b.ne    sha384_update_store
    mov     x0, x19
    add     x1, x19, #SHA512_CTX_BUF
    bl      sha512_block
    mov     w22, #0

sha384_update_store:
    str     w22, [x19, #SHA512_CTX_FILL]
    b       sha384_update_loop

sha384_update_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

sha384_final:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x19, x0
    mov     x20, x1
    ldr     x21, [x19, #SHA512_CTX_COUNT]
    ldr     w22, [x19, #SHA512_CTX_FILL]
    add     x4, x19, #SHA512_CTX_BUF
    mov     w0, #0x80
    strb    w0, [x4, x22]
    add     w22, w22, #1

sha384_final_pad:
    cmp     w22, #(SHA512_BLOCK_SIZE - 16)
    b.eq    sha384_final_length
    cmp     w22, #SHA512_BLOCK_SIZE
    b.ne    sha384_final_zero
    mov     x0, x19
    mov     x1, x4
    bl      sha512_block
    add     x4, x19, #SHA512_CTX_BUF
    mov     w22, #0
    b       sha384_final_pad

sha384_final_zero:
    strb    wzr, [x4, x22]
    add     w22, w22, #1
    b       sha384_final_pad

sha384_final_length:
    str     xzr, [x4, #(SHA512_BLOCK_SIZE - 16)]
    lsl     x21, x21, #3
    rev     x21, x21
    str     x21, [x4, #(SHA512_BLOCK_SIZE - 8)]
    mov     x0, x19
    mov     x1, x4
    bl      sha512_block
    mov     x2, #0

sha384_final_out:
    ldr     x3, [x19, x2]
    rev     x3, x3
    str     x3, [x20, x2]
    add     x2, x2, #8
    cmp     x2, #SHA384_DIGEST_SIZE
    b.lo    sha384_final_out
    mov     x0, x19
    mov     w1, #SHA512_CTX_SIZE
    bl      mem_wipe
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

sha384_check:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    mov     x19, x0
    mov     x20, x1
    mov     x21, x2
    ladr    x0, sha512_ctx
    bl      sha384_init
    ladr    x0, sha512_ctx
    mov     x1, x19
    mov     x2, x20
    bl      sha384_update
    ladr    x0, sha512_ctx
    ladr    x1, sha384_digest
    bl      sha384_final
    ladr    x0, sha384_digest
    mov     x1, x21
    mov     w2, #SHA384_DIGEST_SIZE
    bl      mem_equal
    cmp     w0, #1
    cset    w0, ne
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

sha384_selftest:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     w19, #1
    ladr    x0, sha_test_abc
    mov     x1, #3
    ladr    x2, sha384_expect_abc
    bl      sha384_check
    cbnz    w0, sha384_selftest_fail
    mov     w19, #2
    ladr    x0, sha_test_abc
    mov     x1, #0
    ladr    x2, sha384_expect_empty
    bl      sha384_check
    cbnz    w0, sha384_selftest_fail
    mov     w19, #3
    ladr    x0, sha384_test_two
    mov     x1, #(sha384_test_two_end - sha384_test_two)
    ladr    x2, sha384_expect_two
    bl      sha384_check
    cbnz    w0, sha384_selftest_fail
    ladr    x0, sha384_ok_msg
    bl      uart_puts
    b       sha384_selftest_done

sha384_selftest_fail:
    ladr    x0, sha384_fail_msg
    bl      uart_puts
    mov     x0, x19
    bl      uart_putdec
    ladr    x0, uart_newline
    bl      uart_puts
    mov     w0, #1
    b       sha384_selftest_exit

sha384_selftest_done:
    mov     w0, #0

sha384_selftest_exit:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

ecdsa_selftest:
    stp     x29, x30, [sp, #-176]!
    stp     x19, x20, [sp, #16]
    mov     w19, #1
    ladr    x0, p256_curve
    ladr    x1, ecdsa_test_q
    ladr    x2, ecdsa_test_h
    mov     w3, #SHA_DIGEST_SIZE
    ladr    x4, ecdsa_test_r
    ladr    x5, ecdsa_test_s
    bl      ecdsa_verify
    cbnz    w0, ecdsa_selftest_fail
    mov     w19, #2
    ladr    x0, p256_curve
    ladr    x1, ecdsa_test_q
    ladr    x2, ecdsa_test_h
    mov     w3, #SHA_DIGEST_SIZE
    ladr    x4, ecdsa_test_r
    ladr    x5, ecdsa_test_s_bad
    bl      ecdsa_verify
    cmp     w0, #1
    b.ne    ecdsa_selftest_fail
    mov     w19, #3
    ladr    x0, x509_test_cert
    mov     x1, #(x509_test_cert_end - x509_test_cert)
    add     x2, sp, #32
    bl      x509_parse
    cbnz    w0, ecdsa_selftest_fail
    ldr     x0, [sp, #(32 + X509_KEY)]
    ladr    x1, x509_test_leaf_key
    mov     w2, #64
    bl      mem_equal
    cbz     w0, ecdsa_selftest_fail
    ldr     x0, [sp, #(32 + X509_SIG)]
    ldr     x1, [sp, #(32 + X509_SIG_LEN)]
    add     x2, sp, #80
    add     x3, sp, #128
    mov     w4, #SHA_DIGEST_SIZE
    bl      ecdsa_sig_decode
    cbnz    w0, ecdsa_selftest_fail
    ladr    x0, sha_ctx
    bl      sha256_init
    ladr    x0, sha_ctx
    ldr     x1, [sp, #(32 + X509_TBS)]
    ldr     x2, [sp, #(32 + X509_TBS_LEN)]
    bl      sha256_update
    ladr    x0, sha_ctx
    ladr    x1, sha_digest
    bl      sha256_final
    ladr    x0, p256_curve
    ladr    x1, x509_test_ca_key
    ladr    x2, sha_digest
    mov     w3, #SHA_DIGEST_SIZE
    add     x4, sp, #80
    add     x5, sp, #128
    bl      ecdsa_verify
    cbnz    w0, ecdsa_selftest_fail
    mov     w19, #4
    ladr    x0, p384_curve
    ladr    x1, ecdsa384_test_q
    ladr    x2, ecdsa384_test_h
    mov     w3, #SHA384_DIGEST_SIZE
    ladr    x4, ecdsa384_test_r
    ladr    x5, ecdsa384_test_s
    bl      ecdsa_verify
    cbnz    w0, ecdsa_selftest_fail
    mov     w19, #5
    ladr    x0, p384_curve
    ladr    x1, ecdsa384_test_q
    ladr    x2, ecdsa384_test_h
    mov     w3, #SHA384_DIGEST_SIZE
    ladr    x4, ecdsa384_test_r
    ladr    x5, ecdsa384_test_s_bad
    bl      ecdsa_verify
    cmp     w0, #1
    b.ne    ecdsa_selftest_fail
    ladr    x0, ecdsa_ok_msg
    bl      uart_puts
    b       ecdsa_selftest_done

ecdsa_selftest_fail:
    ladr    x0, ecdsa_fail_msg
    bl      uart_puts
    mov     x0, x19
    bl      uart_putdec
    ladr    x0, uart_newline
    bl      uart_puts
    mov     w0, #1
    b       ecdsa_selftest_exit

ecdsa_selftest_done:
    mov     w0, #0

ecdsa_selftest_exit:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #176
    ret


x509_parse:
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    mov     x19, x2
    stp     x0, x1, [sp, #-16]!
    mov     x0, x2
    mov     w1, #X509_INFO_SIZE
    bl      mem_wipe
    ldp     x0, x1, [sp], #16
    add     x1, x0, x1
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, x509_parse_fail
    mov     x23, x3
    mov     x20, x0
    add     x1, x0, x1
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, x509_parse_fail
    sub     x4, x0, x20
    add     x4, x4, x1
    str     x20, [x19, #X509_TBS]
    str     x4, [x19, #X509_TBS_LEN]
    mov     x22, x3
    add     x21, x0, x1
    mov     x1, x21
    bl      asn1_next
    tbnz    w2, #31, x509_parse_fail
    cmp     w2, #ASN1_CONTEXT_0
    b.ne    x509_parse_serial
    mov     x0, x3
    mov     x1, x21
    bl      asn1_next
    tbnz    w2, #31, x509_parse_fail

x509_parse_serial:
    mov     x0, x3
    mov     x1, x21
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, x509_parse_fail
    mov     x24, x3
    str     x0, [x19, #X509_SIGALG]
    str     x1, [x19, #X509_SIGALG_LEN]
    add     x1, x0, x1
    mov     w2, #ASN1_OID
    bl      asn1_expect
    tbnz    w2, #31, x509_parse_fail
    bl      x509_sig_hash
    tbnz    w0, #31, x509_parse_fail
    str     x0, [x19, #X509_SIG_HASH]
    mov     x20, x24
    mov     x0, x24
    mov     x1, x21
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, x509_parse_fail
    str     x20, [x19, #X509_ISSUER]
    sub     x4, x3, x20
    str     x4, [x19, #X509_ISSUER_LEN]
    mov     x0, x3
    mov     x1, x21
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, x509_parse_fail
    mov     x20, x3
    add     x22, x0, x1
    mov     x1, x22
    bl      asn1_next
    tbnz    w2, #31, x509_parse_fail
    mov     x24, x3
    bl      asn1_time
    tbnz    w1, #31, x509_parse_fail
    str     x0, [x19, #X509_NOT_BEFORE]
    mov     x0, x24
    mov     x1, x22
    bl      asn1_next
    tbnz    w2, #31, x509_parse_fail
    bl      asn1_time
    tbnz    w1, #31, x509_parse_fail
    str     x0, [x19, #X509_NOT_AFTER]
    mov     x0, x20
    mov     x1, x21
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, x509_parse_fail
    str     x20, [x19, #X509_SUBJECT]
    sub     x4, x3, x20
    str     x4, [x19, #X509_SUBJECT_LEN]
    mov     x0, x3
    mov     x1, x21
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, x509_parse_fail
    mov     x24, x3
    mov     x1, x21
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, x509_parse_fail
    mov     x20, x3
    mov     x1, x21
    mov     w2, #ASN1_OID
    bl      asn1_expect
    tbnz    w2, #31, x509_parse_fail
    cmp     x1, #7
    b.ne    x509_parse_fail
    mov     x22, x3
    ladr    x1, oid_ec_public_key
    mov     w2, #7
    bl      mem_equal
    cbz     w0, x509_parse_fail
    mov     x0, x22
    mov     x1, x21
    mov     w2, #ASN1_OID
    bl      asn1_expect
    tbnz    w2, #31, x509_parse_fail
    bl      x509_curve_oid
    tbnz    w0, #31, x509_parse_fail
    str     x0, [x19, #X509_KEY_CURVE]
    mov     w22, #66
    cbz     w0, x509_parse_keylen
    mov     w22, #98

x509_parse_keylen:
    mov     x0, x20
    mov     x1, x21
    mov     w2, #ASN1_BIT_STRING
    bl      asn1_expect
    tbnz    w2, #31, x509_parse_fail
    cmp     x1, x22
    b.ne    x509_parse_fail
    ldrb    w4, [x0]
    cbnz    w4, x509_parse_fail
    ldrb    w4, [x0, #1]
    cmp     w4, #4
    b.ne    x509_parse_fail
    add     x0, x0, #2
    str     x0, [x19, #X509_KEY]
    mov     x3, x24

x509_parse_tail:
    cmp     x3, x21
    b.hs    x509_parse_sig
    mov     x0, x3
    mov     x1, x21
    bl      asn1_next
    tbnz    w2, #31, x509_parse_fail
    cmp     w2, #ASN1_CONTEXT_3
    b.ne    x509_parse_tail
    str     x0, [x19, #X509_EXT]
    str     x1, [x19, #X509_EXT_LEN]
    b       x509_parse_tail

x509_parse_sig:
    mov     x0, x19
    bl      x509_ext_scan
    cbnz    w0, x509_parse_fail
    ldr     x0, [x19, #X509_TBS]
    ldr     x1, [x19, #X509_TBS_LEN]
    add     x0, x0, x1
    mov     x1, x23
    bl      asn1_next
    tbnz    w2, #31, x509_parse_fail
    cmp     w2, #ASN1_SEQUENCE
    b.ne    x509_parse_fail
    ldr     x2, [x19, #X509_SIGALG_LEN]
    cmp     x1, x2
    b.ne    x509_parse_fail
    mov     x24, x3
    ldr     x1, [x19, #X509_SIGALG]
    bl      mem_equal
    cbz     w0, x509_parse_fail
    mov     x0, x24
    mov     x1, x23
    mov     w2, #ASN1_BIT_STRING
    bl      asn1_expect
    tbnz    w2, #31, x509_parse_fail
    cmp     x1, #2
    b.lo    x509_parse_fail
    ldrb    w4, [x0]
    cbnz    w4, x509_parse_fail
    add     x0, x0, #1
    sub     x1, x1, #1
    str     x0, [x19, #X509_SIG]
    str     x1, [x19, #X509_SIG_LEN]
    mov     w0, #0
    b       x509_parse_done

x509_parse_fail:
    mov     w0, #1

x509_parse_done:
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

x509_ext_scan:
    stp     x29, x30, [sp, #-80]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    str     x25, [sp, #64]
    mov     x19, x0
    str     wzr, [x19, #X509_FLAGS]
    str     wzr, [x19, #X509_PATHLEN]
    ldr     x0, [x19, #X509_EXT]
    cbz     x0, x509_ext_ok
    ldr     x1, [x19, #X509_EXT_LEN]
    add     x1, x0, x1
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, x509_ext_bad
    add     x22, x0, x1
    mov     x3, x0

x509_ext_loop:
    cmp     x3, x22
    b.hs    x509_ext_ok
    mov     x0, x3
    mov     x1, x22
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, x509_ext_bad
    mov     x23, x3
    add     x24, x0, x1
    mov     x1, x24
    mov     w2, #ASN1_OID
    bl      asn1_expect
    tbnz    w2, #31, x509_ext_bad
    mov     x20, x0
    mov     w21, w1
    str     x3, [sp, #72]
    mov     x0, x23
    mov     x1, x22
    mov     x2, x20
    mov     w3, w21
    bl      x509_ext_duplicate
    cbnz    w0, x509_ext_bad
    ldr     x0, [sp, #72]
    mov     x1, x24
    bl      asn1_next
    tbnz    w2, #31, x509_ext_bad
    mov     w25, #0
    cmp     w2, #ASN1_BOOLEAN
    b.ne    x509_ext_value
    cmp     x1, #1
    b.ne    x509_ext_bad
    ldrb    w25, [x0]
    add     w5, w25, #1
    tst     w5, #0xfe
    b.ne    x509_ext_bad
    mov     x0, x3
    mov     x1, x24
    bl      asn1_next
    tbnz    w2, #31, x509_ext_bad

x509_ext_value:
    cmp     w2, #ASN1_OCTET_STRING
    b.ne    x509_ext_bad
    cmp     w21, #3
    b.ne    x509_ext_unknown
    ldrb    w5, [x20]
    cmp     w5, #0x55
    b.ne    x509_ext_unknown
    ldrb    w5, [x20, #1]
    cmp     w5, #0x1d
    b.ne    x509_ext_unknown
    ldrb    w5, [x20, #2]
    cmp     w5, #0x13
    b.eq    x509_ext_bc
    cmp     w5, #0x0f
    b.eq    x509_ext_ku
    cmp     w5, #0x25
    b.eq    x509_ext_eku
    cmp     w5, #0x11
    b.eq    x509_ext_next

x509_ext_unknown:
    cbnz    w25, x509_ext_bad
    b       x509_ext_next

x509_ext_bc:
    add     x1, x0, x1
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, x509_ext_bad
    add     x21, x0, x1
    mov     x3, x0
    cmp     x3, x21
    b.hs    x509_ext_next
    mov     x0, x3
    mov     x1, x21
    bl      asn1_next
    tbnz    w2, #31, x509_ext_bad
    cmp     w2, #ASN1_BOOLEAN
    b.ne    x509_ext_bc_len
    cmp     x1, #1
    b.ne    x509_ext_bad
    ldrb    w5, [x0]
    add     w6, w5, #1
    tst     w6, #0xfe
    b.ne    x509_ext_bad
    cbz     w5, x509_ext_bc_after
    ldr     w5, [x19, #X509_FLAGS]
    orr     w5, w5, #X509_F_CA
    str     w5, [x19, #X509_FLAGS]

x509_ext_bc_after:
    cmp     x3, x21
    b.hs    x509_ext_next
    mov     x0, x3
    mov     x1, x21
    bl      asn1_next
    tbnz    w2, #31, x509_ext_bad

x509_ext_bc_len:
    cmp     w2, #ASN1_INTEGER
    b.ne    x509_ext_bad
    cmp     x1, #1
    b.eq    x509_ext_bc_byte
    cmp     x1, #2
    b.ne    x509_ext_bad
    ldrb    w5, [x0]
    cbnz    w5, x509_ext_bad
    add     x0, x0, #1

x509_ext_bc_byte:
    ldrb    w5, [x0]
    str     w5, [x19, #X509_PATHLEN]
    ldr     w5, [x19, #X509_FLAGS]
    orr     w5, w5, #X509_F_PATHLEN
    str     w5, [x19, #X509_FLAGS]
    b       x509_ext_next

x509_ext_ku:
    add     x1, x0, x1
    mov     w2, #ASN1_BIT_STRING
    bl      asn1_expect
    tbnz    w2, #31, x509_ext_bad
    cmp     x1, #2
    b.lo    x509_ext_bad
    ldrb    w5, [x0, #1]
    ldr     w6, [x19, #X509_FLAGS]
    orr     w6, w6, #X509_F_KU
    tst     w5, #0x04
    b.eq    x509_ext_ku_sig
    orr     w6, w6, #X509_F_CERTSIGN

x509_ext_ku_sig:
    tst     w5, #0x80
    b.eq    x509_ext_ku_store
    orr     w6, w6, #X509_F_DIGSIG

x509_ext_ku_store:
    str     w6, [x19, #X509_FLAGS]
    b       x509_ext_next

x509_ext_eku:
    add     x1, x0, x1
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, x509_ext_bad
    add     x21, x0, x1
    mov     x3, x0
    ldr     w6, [x19, #X509_FLAGS]
    orr     w6, w6, #X509_F_EKU
    str     w6, [x19, #X509_FLAGS]

x509_ext_eku_loop:
    cmp     x3, x21
    b.hs    x509_ext_next
    mov     x0, x3
    mov     x1, x21
    mov     w2, #ASN1_OID
    bl      asn1_expect
    tbnz    w2, #31, x509_ext_bad
    cmp     x1, #8
    b.ne    x509_ext_eku_loop
    str     x3, [sp, #-16]!
    ladr    x1, oid_server_auth
    mov     w2, #8
    bl      mem_equal
    ldr     x3, [sp], #16
    cbz     w0, x509_ext_eku_loop
    ldr     w6, [x19, #X509_FLAGS]
    orr     w6, w6, #X509_F_SERVERAUTH
    str     w6, [x19, #X509_FLAGS]
    b       x509_ext_eku_loop

x509_ext_next:
    mov     x3, x23
    b       x509_ext_loop

x509_ext_ok:
    mov     w0, #0
    b       x509_ext_done

x509_ext_bad:
    mov     w0, #1

x509_ext_done:
    ldr     x25, [sp, #64]
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #80
    ret

x509_ext_duplicate:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x19, x0
    mov     x20, x1
    mov     x21, x2
    mov     w22, w3

x509_ext_duplicate_loop:
    cmp     x19, x20
    b.hs    x509_ext_duplicate_no
    mov     x0, x19
    mov     x1, x20
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, x509_ext_duplicate_no
    mov     x19, x3
    add     x1, x0, x1
    mov     w2, #ASN1_OID
    bl      asn1_expect
    tbnz    w2, #31, x509_ext_duplicate_no
    cmp     x1, x22
    b.ne    x509_ext_duplicate_loop
    mov     x1, x21
    mov     w2, w22
    bl      mem_equal
    cbz     w0, x509_ext_duplicate_loop
    mov     w0, #1
    b       x509_ext_duplicate_done

x509_ext_duplicate_no:
    mov     w0, #0

x509_ext_duplicate_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

x509_issuer_ok:
    ldr     w2, [x0, #X509_FLAGS]
    tst     w2, #X509_F_CA
    b.eq    x509_issuer_bad
    tst     w2, #X509_F_KU
    b.eq    x509_issuer_pathlen
    tst     w2, #X509_F_CERTSIGN
    b.eq    x509_issuer_bad

x509_issuer_pathlen:
    tst     w2, #X509_F_PATHLEN
    b.eq    x509_issuer_good
    ldr     w3, [x0, #X509_PATHLEN]
    cmp     w1, w3
    b.hi    x509_issuer_bad

x509_issuer_good:
    mov     w0, #0
    ret

x509_issuer_bad:
    mov     w0, #1
    ret

x509_leaf_ok:
    ldr     w2, [x0, #X509_FLAGS]
    tst     w2, #X509_F_EKU
    b.eq    x509_leaf_ku
    tst     w2, #X509_F_SERVERAUTH
    b.eq    x509_leaf_bad

x509_leaf_ku:
    tst     w2, #X509_F_KU
    b.eq    x509_leaf_good
    tst     w2, #X509_F_DIGSIG
    b.eq    x509_leaf_bad

x509_leaf_good:
    mov     w0, #0
    ret

x509_leaf_bad:
    mov     w0, #1
    ret

x509_sig_hash:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     x20, x1
    cmp     x20, #8
    b.ne    x509_sig_hash_none
    mov     x0, x19
    ladr    x1, oid_ecdsa_sha256
    mov     w2, #8
    bl      mem_equal
    cbz     w0, x509_sig_hash_384
    mov     w0, #X509_HASH_SHA256
    b       x509_sig_hash_done

x509_sig_hash_384:
    mov     x0, x19
    ladr    x1, oid_ecdsa_sha384
    mov     w2, #8
    bl      mem_equal
    cbz     w0, x509_sig_hash_none
    mov     w0, #X509_HASH_SHA384
    b       x509_sig_hash_done

x509_sig_hash_none:
    mov     w0, #-1

x509_sig_hash_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

x509_curve_oid:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     x20, x1
    cmp     x20, #8
    b.ne    x509_curve_oid_384
    mov     x0, x19
    ladr    x1, oid_prime256v1
    mov     w2, #8
    bl      mem_equal
    cbz     w0, x509_curve_oid_none
    mov     w0, #X509_CURVE_P256
    b       x509_curve_oid_done

x509_curve_oid_384:
    cmp     x20, #5
    b.ne    x509_curve_oid_none
    mov     x0, x19
    ladr    x1, oid_secp384r1
    mov     w2, #5
    bl      mem_equal
    cbz     w0, x509_curve_oid_none
    mov     w0, #X509_CURVE_P384
    b       x509_curve_oid_done

x509_curve_oid_none:
    mov     w0, #-1

x509_curve_oid_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

x509_san_match:
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    mov     x19, x0
    mov     x20, x1
    mov     w21, w2
    ldr     x0, [x19, #X509_EXT]
    cbz     x0, x509_san_no
    ldr     x1, [x19, #X509_EXT_LEN]
    add     x1, x0, x1
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, x509_san_no
    add     x22, x0, x1
    mov     x3, x0

x509_san_ext:
    cmp     x3, x22
    b.hs    x509_san_no
    mov     x0, x3
    mov     x1, x22
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, x509_san_no
    mov     x23, x3
    add     x24, x0, x1
    mov     x1, x24
    mov     w2, #ASN1_OID
    bl      asn1_expect
    tbnz    w2, #31, x509_san_no
    cmp     x1, #3
    b.ne    x509_san_ext_next
    ldrb    w4, [x0]
    ldrb    w5, [x0, #1]
    ldrb    w6, [x0, #2]
    cmp     w4, #0x55
    b.ne    x509_san_ext_next
    cmp     w5, #0x1d
    b.ne    x509_san_ext_next
    cmp     w6, #0x11
    b.ne    x509_san_ext_next
    mov     x0, x3
    mov     x1, x24
    bl      asn1_next
    tbnz    w2, #31, x509_san_no
    cmp     w2, #ASN1_BOOLEAN
    b.ne    x509_san_value
    mov     x0, x3
    mov     x1, x24
    bl      asn1_next
    tbnz    w2, #31, x509_san_no

x509_san_value:
    cmp     w2, #ASN1_OCTET_STRING
    b.ne    x509_san_no
    add     x1, x0, x1
    mov     w2, #ASN1_SEQUENCE
    bl      asn1_expect
    tbnz    w2, #31, x509_san_no
    add     x22, x0, x1
    mov     x3, x0

x509_san_names:
    cmp     x3, x22
    b.hs    x509_san_no
    mov     x0, x3
    mov     x1, x22
    bl      asn1_next
    tbnz    w2, #31, x509_san_no
    cmp     w2, #ASN1_DNS_NAME
    b.ne    x509_san_names
    str     x3, [sp, #-16]!
    mov     x2, x20
    mov     w3, w21
    bl      x509_name_match
    ldr     x3, [sp], #16
    cbz     w0, x509_san_names
    mov     w0, #1
    b       x509_san_done

x509_san_ext_next:
    mov     x3, x23
    b       x509_san_ext

x509_san_no:
    mov     w0, #0

x509_san_done:
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

x509_name_match:
    cmp     x1, #2
    b.lo    x509_name_exact
    ldrb    w4, [x0]
    cmp     w4, #0x2a
    b.ne    x509_name_exact
    ldrb    w4, [x0, #1]
    cmp     w4, #0x2e
    b.ne    x509_name_exact
    add     x0, x0, #2
    sub     x1, x1, #2

x509_name_wild:
    cbz     w3, x509_name_no
    ldrb    w4, [x2], #1
    sub     w3, w3, #1
    cmp     w4, #0x2e
    b.ne    x509_name_wild
    cbz     w3, x509_name_no

x509_name_exact:
    cmp     x1, x3
    b.ne    x509_name_no

x509_name_loop:
    cbz     x1, x509_name_yes
    ldrb    w4, [x0], #1
    ldrb    w5, [x2], #1
    orr     w4, w4, #0x20
    orr     w5, w5, #0x20
    cmp     w4, w5
    b.ne    x509_name_no
    sub     x1, x1, #1
    b       x509_name_loop

x509_name_yes:
    mov     w0, #1
    ret

x509_name_no:
    mov     w0, #0
    ret

x509_hash_tbs:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     x19, x0
    mov     x20, x1
    ldr     x0, [x19, #X509_SIG_HASH]
    cbnz    x0, x509_hash_tbs_384
    ladr    x0, sha_ctx
    bl      sha256_init
    ladr    x0, sha_ctx
    ldr     x1, [x19, #X509_TBS]
    ldr     x2, [x19, #X509_TBS_LEN]
    bl      sha256_update
    ladr    x0, sha_ctx
    mov     x1, x20
    bl      sha256_final
    mov     w0, #SHA_DIGEST_SIZE
    b       x509_hash_tbs_done

x509_hash_tbs_384:
    ladr    x0, sha512_ctx
    bl      sha384_init
    ladr    x0, sha512_ctx
    ldr     x1, [x19, #X509_TBS]
    ldr     x2, [x19, #X509_TBS_LEN]
    bl      sha384_update
    ladr    x0, sha512_ctx
    mov     x1, x20
    bl      sha384_final
    mov     w0, #SHA384_DIGEST_SIZE

x509_hash_tbs_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

x509_verify_with:
    stp     x29, x30, [sp, #-192]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    mov     x19, x0
    mov     x20, x1
    add     x0, sp, #48
    mov     w1, #144
    bl      mem_wipe
    mov     x0, x19
    add     x1, sp, #144
    bl      x509_hash_tbs
    mov     w21, w0
    ladr    x22, p256_curve
    ldr     x0, [x20, #X509_KEY_CURVE]
    cbz     x0, x509_verify_with_curve
    ladr    x22, p384_curve

x509_verify_with_curve:
    ldr     x4, [x22, #EC_BYTES]
    ldr     x0, [x19, #X509_SIG]
    ldr     x1, [x19, #X509_SIG_LEN]
    add     x2, sp, #48
    add     x3, sp, #96
    bl      ecdsa_sig_decode
    cbnz    w0, x509_verify_with_fail
    mov     x0, x22
    ldr     x1, [x20, #X509_KEY]
    add     x2, sp, #144
    mov     w3, w21
    add     x4, sp, #48
    add     x5, sp, #96
    bl      ecdsa_verify
    b       x509_verify_with_done

x509_verify_with_fail:
    mov     w0, #1

x509_verify_with_done:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #192
    ret

x509_names_equal:
    ldr     x2, [x0, #X509_ISSUER_LEN]
    ldr     x3, [x1, #X509_SUBJECT_LEN]
    cmp     x2, x3
    b.ne    x509_names_equal_no
    ldr     x0, [x0, #X509_ISSUER]
    ldr     x1, [x1, #X509_SUBJECT]
    b       mem_equal

x509_names_equal_no:
    mov     w0, #0
    ret

tls_root_init:
    stp     x29, x30, [sp, #-16]!
    ladr    x0, tls_root_name
    ladr    x1, tls_root_buf
    mov     w2, #TLS_ROOT_SIZE
    bl      fat_load
    cmp     w0, #64
    b.lo    tls_root_init_missing
    str     x0, [sp, #-16]!
    mov     x1, x0
    ladr    x0, tls_root_buf
    ladr    x2, tls_root_info
    bl      x509_parse
    ldr     x1, [sp], #16
    cbnz    w0, tls_root_init_missing
    str     x1, [sp, #-16]!
    ladr    x0, tls_root_msg
    bl      uart_puts
    ldr     x0, [sp], #16
    bl      uart_putdec
    ladr    x0, tls_root_tail
    bl      uart_puts
    ladr    x0, tls_root_info
    ldr     x0, [x0, #X509_KEY_CURVE]
    bl      tls_put_curve
    ladr    x0, tls_root_ok
    mov     w1, #1
    strb    w1, [x0]
    b       tls_root_init_done

tls_root_init_missing:
    ladr    x0, tls_root_missing_msg
    bl      uart_puts

tls_root_init_done:
    ldp     x29, x30, [sp], #16
    ret

tls_put_curve:
    ladr    x1, tls_curve_p256
    ladr    x2, tls_curve_p384
    cmp     x0, #0
    csel    x0, x1, x2, eq
    b       uart_puts

tls_chain_verify:
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    mov     x20, x0
    mov     w21, w1
    ladr    x0, tls_root_ok
    ldrb    w0, [x0]
    cbz     w0, tls_chain_no_root
    ldrb    w0, [x20]
    add     x20, x20, #1
    add     x20, x20, x0
    ladr    x22, tls_cert_buf
    add     x22, x22, x21
    add     x0, x20, #3
    cmp     x0, x22
    b.hi    tls_chain_short
    add     x20, x20, #3
    mov     w23, #0

tls_chain_parse:
    add     x0, x20, #3
    cmp     x0, x22
    b.hi    tls_chain_parsed
    cmp     w23, #TLS_CHAIN_MAX
    b.hs    tls_chain_parsed
    ldrb    w2, [x20]
    ldrb    w3, [x20, #1]
    ldrb    w4, [x20, #2]
    lsl     w2, w2, #16
    orr     w2, w2, w3, lsl #8
    orr     w24, w2, w4
    add     x20, x20, #3
    add     x0, x20, x24
    cmp     x0, x22
    b.hi    tls_chain_short
    mov     x0, x20
    mov     x1, x24
    ladr    x2, tls_chain_infos
    mov     x3, #X509_INFO_SIZE
    madd    x2, x23, x3, x2
    bl      x509_parse
    cbnz    w0, tls_chain_unsupported
    add     x20, x20, x24
    add     x0, x20, #2
    cmp     x0, x22
    b.hi    tls_chain_short
    ldrb    w2, [x20]
    ldrb    w3, [x20, #1]
    orr     w2, w3, w2, lsl #8
    add     x20, x20, #2
    add     x20, x20, x2
    add     w23, w23, #1
    b       tls_chain_parse

tls_chain_unsupported:
    cbz     w23, tls_chain_bad_cert

tls_chain_parsed:
    cbz     w23, tls_chain_short
    ladr    x0, tls_chain_infos
    ladr    x9, tls_params
    ldp     x1, x2, [x9, #TLSP_HOST]
    bl      x509_san_match
    cbz     w0, tls_chain_name
    ladr    x0, tls_chain_infos
    bl      x509_leaf_ok
    cbnz    w0, tls_chain_badleaf
    bl      rtc_now
    cbz     x0, tls_chain_no_clock
    mov     x24, x0
    mov     w19, #0

tls_chain_loop:
    ladr    x0, tls_chain_infos
    mov     x3, #X509_INFO_SIZE
    madd    x21, x19, x3, x0
    mov     x0, x21
    mov     x1, x24
    bl      x509_time_valid
    cmp     w0, #1
    b.eq    tls_chain_early
    cmp     w0, #2
    b.eq    tls_chain_expired
    mov     x0, x21
    ladr    x1, tls_root_info
    bl      x509_names_equal
    cbnz    w0, tls_chain_root
    add     w2, w19, #1
    cmp     w2, w23
    b.hs    tls_chain_orphan
    mov     x0, x21
    add     x1, x21, #X509_INFO_SIZE
    bl      x509_names_equal
    cbz     w0, tls_chain_orphan
    add     x0, x21, #X509_INFO_SIZE
    mov     w1, w19
    bl      x509_issuer_ok
    cbnz    w0, tls_chain_badca
    mov     x0, x21
    add     x1, x21, #X509_INFO_SIZE
    bl      x509_verify_with
    cbnz    w0, tls_chain_invalid
    add     w19, w19, #1
    b       tls_chain_loop

tls_chain_root:
    ladr    x0, tls_root_info
    mov     x1, x24
    bl      x509_time_valid
    cmp     w0, #1
    b.eq    tls_chain_early
    cmp     w0, #2
    b.eq    tls_chain_expired
    ladr    x0, tls_root_info
    mov     w1, w19
    bl      x509_issuer_ok
    cbnz    w0, tls_chain_badca
    mov     x0, x21
    ladr    x1, tls_root_info
    bl      x509_verify_with
    cbnz    w0, tls_chain_invalid
    ladr    x0, tls_chain_ok_msg
    bl      uart_puts
    add     w0, w19, #1
    bl      uart_putdec
    ladr    x0, tls_chain_ok_tail
    bl      uart_puts
    mov     x0, x24
    bl      rtc_put_date
    ladr    x0, uart_newline
    bl      uart_puts
    mov     w0, #0
    b       tls_chain_done

tls_chain_no_root:
    ladr    x0, tls_chain_noroot_msg
    b       tls_chain_fail

tls_chain_no_clock:
    ladr    x0, tls_chain_noclock_msg
    b       tls_chain_fail

tls_chain_early:
    ladr    x0, tls_chain_early_msg
    b       tls_chain_fail

tls_chain_expired:
    ladr    x0, tls_chain_expired_msg
    b       tls_chain_fail

tls_chain_short:
    ladr    x0, tls_short_msg
    b       tls_chain_fail

tls_chain_bad_cert:
    ladr    x0, tls_certbad_msg
    b       tls_chain_fail

tls_chain_name:
    ladr    x0, tls_chain_name_msg
    b       tls_chain_fail

tls_chain_orphan:
    ladr    x0, tls_chain_orphan_msg
    b       tls_chain_fail

tls_chain_badca:
    ladr    x0, tls_chain_badca_msg
    b       tls_chain_fail

tls_chain_badleaf:
    ladr    x0, tls_chain_badleaf_msg
    b       tls_chain_fail

tls_chain_invalid:
    ladr    x0, tls_chain_invalid_msg

tls_chain_fail:
    bl      tls_fail
    mov     w0, #1

tls_chain_done:
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

x509_selftest:
    stp     x29, x30, [sp, #-176]!
    str     x19, [sp, #16]
    mov     w19, #1
    ladr    x0, x509_test_cert
    mov     x1, #(x509_test_cert_end - x509_test_cert)
    add     x2, sp, #32
    bl      x509_parse
    cbnz    w0, x509_selftest_fail
    mov     w19, #2
    add     x0, sp, #32
    ladr    x1, tls_host
    mov     w2, #(tls_host_end - tls_host)
    bl      x509_san_match
    cbz     w0, x509_selftest_fail
    mov     w19, #3
    add     x0, sp, #32
    ladr    x1, x509_test_host_wild
    mov     w2, #(x509_test_host_wild_end - x509_test_host_wild)
    bl      x509_san_match
    cbz     w0, x509_selftest_fail
    mov     w19, #4
    add     x0, sp, #32
    ladr    x1, x509_test_host_bad
    mov     w2, #(x509_test_host_bad_end - x509_test_host_bad)
    bl      x509_san_match
    cbnz    w0, x509_selftest_fail
    mov     w19, #5
    ldr     x0, [sp, #(32 + X509_NOT_BEFORE)]
    ldr     x1, =1785363008
    cmp     x0, x1
    b.ne    x509_selftest_fail
    ldr     x0, [sp, #(32 + X509_NOT_AFTER)]
    ldr     x1, =1793139441
    cmp     x0, x1
    b.ne    x509_selftest_fail
    mov     w19, #6
    add     x0, sp, #32
    ldr     x1, =1785363007
    bl      x509_time_valid
    cmp     w0, #1
    b.ne    x509_selftest_fail
    add     x0, sp, #32
    ldr     x1, =1793139442
    bl      x509_time_valid
    cmp     w0, #2
    b.ne    x509_selftest_fail
    add     x0, sp, #32
    ldr     x1, =1789446896
    bl      x509_time_valid
    cbnz    w0, x509_selftest_fail
    ladr    x0, x509_ok_msg
    bl      uart_puts
    b       x509_selftest_done

x509_selftest_fail:
    ladr    x0, x509_fail_msg
    bl      uart_puts
    mov     x0, x19
    bl      uart_putdec
    ladr    x0, uart_newline
    bl      uart_puts
    mov     w0, #1
    b       x509_selftest_exit

x509_selftest_done:
    mov     w0, #0

x509_selftest_exit:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #176
    ret


x509_time_valid:
    ldr     x2, [x0, #X509_NOT_BEFORE]
    cmp     x1, x2
    b.lt    x509_time_valid_early
    ldr     x2, [x0, #X509_NOT_AFTER]
    cmp     x1, x2
    b.gt    x509_time_valid_late
    mov     w0, #0
    ret

x509_time_valid_early:
    mov     w0, #1
    ret

x509_time_valid_late:
    mov     w0, #2
    ret

asn1_time_digits:
    mov     x10, #0
    mov     w14, w11

asn1_time_digits_loop:
    ldrb    w12, [x9], #1
    sub     w12, w12, #ASCII_ZERO
    cmp     w12, #9
    b.hi    asn1_time_digits_ret
    mov     w13, #10
    madd    x10, x10, x13, x12
    sub     w14, w14, #1
    cbnz    w14, asn1_time_digits_loop

asn1_time_digits_ret:
    ret

asn1_time:
    stp     x29, x30, [sp, #-16]!
    mov     x9, x0
    cmp     w2, #ASN1_UTC_TIME
    b.eq    asn1_time_utc
    cmp     w2, #ASN1_GENERAL_TIME
    b.ne    asn1_time_fail
    cmp     x1, #15
    b.ne    asn1_time_fail
    mov     w11, #4
    b       asn1_time_year

asn1_time_utc:
    cmp     x1, #13
    b.ne    asn1_time_fail
    mov     w11, #2

asn1_time_year:
    bl      asn1_time_digits
    b.hi    asn1_time_fail
    cmp     w2, #ASN1_UTC_TIME
    b.ne    asn1_time_fields
    cmp     x10, #50
    b.lo    asn1_time_2000
    add     x10, x10, #1900
    b       asn1_time_fields

asn1_time_2000:
    add     x10, x10, #2000

asn1_time_fields:
    mov     x0, x10
    mov     w11, #2
    bl      asn1_time_digits
    b.hi    asn1_time_fail
    mov     x1, x10
    bl      asn1_time_digits
    b.hi    asn1_time_fail
    mov     x2, x10
    bl      asn1_time_digits
    b.hi    asn1_time_fail
    mov     x3, x10
    bl      asn1_time_digits
    b.hi    asn1_time_fail
    mov     x4, x10
    bl      asn1_time_digits
    b.hi    asn1_time_fail
    mov     x5, x10
    ldrb    w12, [x9]
    cmp     w12, #0x5a
    b.ne    asn1_time_fail
    sub     x12, x1, #1
    cmp     x12, #11
    b.hi    asn1_time_fail
    sub     x12, x2, #1
    cmp     x12, #30
    b.hi    asn1_time_fail
    ladr    x12, time_month_days
    ldrb    w12, [x12, x1]
    cmp     x1, #2
    b.ne    asn1_time_daycheck
    and     x13, x0, #3
    cbnz    x13, asn1_time_daycheck
    mov     x13, #100
    udiv    x14, x0, x13
    msub    x14, x14, x13, x0
    cbnz    x14, asn1_time_leap
    mov     x13, #400
    udiv    x14, x0, x13
    msub    x14, x14, x13, x0
    cbnz    x14, asn1_time_daycheck

asn1_time_leap:
    add     w12, w12, #1

asn1_time_daycheck:
    cmp     x2, x12
    b.hi    asn1_time_fail
    cmp     x3, #23
    b.hi    asn1_time_fail
    cmp     x4, #59
    b.hi    asn1_time_fail
    cmp     x5, #59
    b.hi    asn1_time_fail
    bl      time_from_civil
    mov     w1, #0
    b       asn1_time_done

asn1_time_fail:
    mov     w1, #-1

asn1_time_done:
    ldp     x29, x30, [sp], #16
    ret

time_from_civil:
    cmp     x1, #2
    b.gt    time_from_civil_era
    sub     x0, x0, #1

time_from_civil_era:
    mov     x6, #400
    sdiv    x7, x0, x6
    msub    x8, x7, x6, x0
    cmp     x1, #2
    b.gt    time_from_civil_month
    add     x9, x1, #9
    b       time_from_civil_doy

time_from_civil_month:
    sub     x9, x1, #3

time_from_civil_doy:
    mov     x6, #153
    mul     x9, x9, x6
    add     x9, x9, #2
    mov     x6, #5
    udiv    x9, x9, x6
    add     x9, x9, x2
    sub     x9, x9, #1
    mov     x6, #365
    mul     x10, x8, x6
    lsr     x11, x8, #2
    add     x10, x10, x11
    mov     x6, #100
    udiv    x11, x8, x6
    sub     x10, x10, x11
    add     x10, x10, x9
    ldr     x6, =146097
    mul     x7, x7, x6
    add     x10, x10, x7
    ldr     x6, =719468
    sub     x10, x10, x6
    ldr     x6, =86400
    mul     x0, x10, x6
    mov     x6, #3600
    madd    x0, x3, x6, x0
    mov     x6, #60
    madd    x0, x4, x6, x0
    add     x0, x0, x5
    ret

civil_from_time:
    ldr     x6, =86400
    udiv    x7, x0, x6
    msub    x8, x7, x6, x0
    mov     x6, #3600
    udiv    x3, x8, x6
    msub    x8, x3, x6, x8
    mov     x6, #60
    udiv    x4, x8, x6
    msub    x5, x4, x6, x8
    ldr     x6, =719468
    add     x7, x7, x6
    ldr     x6, =146097
    udiv    x9, x7, x6
    msub    x10, x9, x6, x7
    mov     x6, #1460
    udiv    x11, x10, x6
    sub     x12, x10, x11
    mov     x6, #36524
    udiv    x11, x10, x6
    add     x12, x12, x11
    ldr     x6, =146096
    udiv    x11, x10, x6
    sub     x12, x12, x11
    mov     x6, #365
    udiv    x12, x12, x6
    mov     x6, #400
    madd    x0, x9, x6, x12
    mov     x6, #365
    mul     x11, x12, x6
    lsr     x13, x12, #2
    add     x11, x11, x13
    mov     x6, #100
    udiv    x13, x12, x6
    sub     x11, x11, x13
    sub     x11, x10, x11
    mov     x6, #5
    mul     x13, x11, x6
    add     x13, x13, #2
    mov     x6, #153
    udiv    x13, x13, x6
    mul     x2, x13, x6
    add     x2, x2, #2
    mov     x6, #5
    udiv    x2, x2, x6
    sub     x2, x11, x2
    add     x2, x2, #1
    cmp     x13, #10
    b.lo    civil_from_time_month
    sub     x1, x13, #9
    b       civil_from_time_year

civil_from_time_month:
    add     x1, x13, #3

civil_from_time_year:
    cmp     x1, #2
    b.gt    civil_from_time_done
    add     x0, x0, #1

civil_from_time_done:
    ret

rtc_init:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    ladr    x0, fdt_base
    ldr     x0, [x0]
    ladr    x1, rtc_node_name
    mov     w2, #5
    ladr    x3, fdt_reg_name
    bl      fdt_find_prop
    cbz     x0, rtc_init_missing
    cmp     w1, #16
    b.lo    rtc_init_missing
    ldr     w1, [x0]
    rev     w1, w1
    ldr     w2, [x0, #4]
    rev     w2, w2
    orr     x19, x2, x1, lsl #32
    ladr    x0, rtc_base
    str     x19, [x0]
    ladr    x0, rtc_msg
    bl      uart_puts
    mov     x0, x19
    bl      uart_puthex
    ladr    x0, rtc_msg_tail
    bl      uart_puts
    bl      rtc_now
    bl      rtc_put_time
    ladr    x0, rtc_utc_msg
    bl      uart_puts
    b       rtc_init_done

rtc_init_missing:
    ladr    x0, rtc_missing_msg
    bl      uart_puts

rtc_init_done:
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

rtc_now:
    ladr    x1, rtc_base
    ldr     x1, [x1]
    cbz     x1, rtc_now_none
    ldr     w0, [x1, #RTC_DR]
    ret

rtc_now_none:
    mov     x0, #0
    ret

rtc_put_time:
    stp     x29, x30, [sp, #-64]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    stp     x23, x24, [sp, #48]
    bl      civil_from_time
    mov     x19, x0
    mov     x20, x1
    mov     x21, x2
    mov     x22, x3
    mov     x23, x4
    mov     x24, x5
    bl      rtc_put_ymd
    mov     w0, #0x20
    bl      uart_putc
    mov     x0, x22
    bl      rtc_put_two
    mov     w0, #0x3a
    bl      uart_putc
    mov     x0, x23
    bl      rtc_put_two
    mov     w0, #0x3a
    bl      uart_putc
    mov     x0, x24
    bl      rtc_put_two
    ldp     x23, x24, [sp, #48]
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #64
    ret

rtc_put_date:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    str     x21, [sp, #32]
    bl      civil_from_time
    mov     x19, x0
    mov     x20, x1
    mov     x21, x2
    bl      rtc_put_ymd
    ldr     x21, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

rtc_put_ymd:
    stp     x29, x30, [sp, #-16]!
    mov     x0, x19
    bl      uart_putdec
    mov     w0, #0x2d
    bl      uart_putc
    mov     x0, x20
    bl      rtc_put_two
    mov     w0, #0x2d
    bl      uart_putc
    mov     x0, x21
    bl      rtc_put_two
    ldp     x29, x30, [sp], #16
    ret

rtc_put_two:
    stp     x29, x30, [sp, #-32]!
    str     x19, [sp, #16]
    mov     x19, x0
    cmp     x19, #10
    b.hs    rtc_put_two_digits
    mov     w0, #ASCII_ZERO
    bl      uart_putc

rtc_put_two_digits:
    mov     x0, x19
    bl      uart_putdec
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

time_selftest:
    stp     x29, x30, [sp, #-48]!
    stp     x19, x20, [sp, #16]
    stp     x21, x22, [sp, #32]
    ladr    x19, time_test_vectors
    mov     w20, #TIME_VECTORS
    mov     w21, #1

time_selftest_loop:
    ldp     x0, x1, [x19]
    ldp     x2, x3, [x19, #16]
    ldp     x4, x5, [x19, #32]
    bl      time_from_civil
    ldr     x6, [x19, #48]
    cmp     x0, x6
    b.ne    time_selftest_fail
    mov     x0, x6
    bl      civil_from_time
    ldp     x6, x7, [x19]
    cmp     x0, x6
    b.ne    time_selftest_fail
    cmp     x1, x7
    b.ne    time_selftest_fail
    ldp     x6, x7, [x19, #16]
    cmp     x2, x6
    b.ne    time_selftest_fail
    cmp     x3, x7
    b.ne    time_selftest_fail
    ldp     x6, x7, [x19, #32]
    cmp     x4, x6
    b.ne    time_selftest_fail
    cmp     x5, x7
    b.ne    time_selftest_fail
    add     x19, x19, #TIME_VECTOR_SIZE
    add     w21, w21, #1
    subs    w20, w20, #1
    b.ne    time_selftest_loop
    mov     w21, #10
    ladr    x0, time_test_utc
    mov     x1, #13
    mov     w2, #ASN1_UTC_TIME
    bl      asn1_time
    tbnz    w1, #31, time_selftest_fail
    ldr     x1, =1785363008
    cmp     x0, x1
    b.ne    time_selftest_fail
    mov     w21, #11
    ladr    x0, time_test_general
    mov     x1, #15
    mov     w2, #ASN1_GENERAL_TIME
    bl      asn1_time
    tbnz    w1, #31, time_selftest_fail
    ldr     x1, =2418309227
    cmp     x0, x1
    b.ne    time_selftest_fail
    mov     w21, #12
    ladr    x0, time_test_utc
    mov     x1, #12
    mov     w2, #ASN1_UTC_TIME
    bl      asn1_time
    tbz     w1, #31, time_selftest_fail
    mov     w21, #13
    ladr    x0, time_test_bad
    mov     x1, #13
    mov     w2, #ASN1_UTC_TIME
    bl      asn1_time
    tbz     w1, #31, time_selftest_fail
    mov     w21, #14
    ladr    x0, time_test_feb31
    mov     x1, #13
    mov     w2, #ASN1_UTC_TIME
    bl      asn1_time
    tbz     w1, #31, time_selftest_fail
    mov     w21, #15
    ladr    x0, time_test_feb29
    mov     x1, #13
    mov     w2, #ASN1_UTC_TIME
    bl      asn1_time
    tbnz    w1, #31, time_selftest_fail
    ldr     x1, =1709208000
    cmp     x0, x1
    b.ne    time_selftest_fail
    mov     w21, #16
    ladr    x0, time_test_feb29_2100
    mov     x1, #15
    mov     w2, #ASN1_GENERAL_TIME
    bl      asn1_time
    tbz     w1, #31, time_selftest_fail
    ladr    x0, time_ok_msg
    bl      uart_puts
    b       time_selftest_done

time_selftest_fail:
    ladr    x0, time_fail_msg
    bl      uart_puts
    mov     x0, x21
    bl      uart_putdec
    ladr    x0, uart_newline
    bl      uart_puts
    mov     w0, #1
    b       time_selftest_exit

time_selftest_done:
    mov     w0, #0

time_selftest_exit:
    ldp     x21, x22, [sp, #32]
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #48
    ret

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
    ladr    x0, fdt_base
    ldr     x0, [x0]
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
    cmp     w0, #FAT_MIN_CLUSTER
    b.lo    fat_next_cluster_end
    ladr    x1, fat_state
    ldr     w2, [x1, #FAT_CLUSTER_END]
    cmp     w0, w2
    b.hs    fat_next_cluster_end
    lsl     w0, w0, #2
    ldr     w2, [x1, #FAT_START]
    and     w19, w0, #(BLK_SECTOR_SIZE - 1)
    add     w0, w2, w0, lsr #9
    ladr    x1, fat_buffer
    bl      blk_read
    cbnz    w0, fat_next_cluster_end
    ladr    x0, fat_buffer
    mov     x1, x19
    bl      mem_read32
    and     w0, w0, #FAT_ENTRY_MASK
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

fat_next_cluster_end:
    mov     w0, #0
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp], #32
    ret

    vec_entry 3, panic_entry
net_timer_arm:
    ladr    x0, net_timer_armed
    mov     w1, #1
    strb    w1, [x0]
    ret

net_put_ip:
    stp     x29, x30, [sp, #-32]!
    stp     x19, x20, [sp, #16]
    mov     w19, w0
    mov     w20, #24

net_put_ip_loop:
    lsr     w0, w19, w20
    and     x0, x0, #0xff
    bl      uart_putdec
    cbz     w20, net_put_ip_done
    ladr    x0, net_dot
    bl      uart_puts
    sub     w20, w20, #8
    b       net_put_ip_loop

net_put_ip_done:
    ldp     x19, x20, [sp, #16]
    ldp     x29, x30, [sp], #32
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
    .asciz  "Terminal"
win_title_2:
    .asciz  "Dateien"
win_title_3:
    .asciz  "Netzwerk"

    vec_entry 15, panic_entry

.section .rodata

files_error_msg:
    .asciz  "FILES SCAN FAIL\r\n"
files_full_msg:
    .asciz  "FILES LIST FULL, weitere Eintraege nicht erfasst\r\n"
files_count_label:
    .asciz  "FILES n="

virtio_baddesc_msg:
    .asciz  "VIRTIO UNGUELTIGE DESKRIPTOR-ID\r\n"

virtio_oldver_msg:
    .asciz  "VIRTIO ALTE VERSION, Geraet uebersprungen\r\n"

anim_noclock_msg:
    .asciz  "ANIM OHNE ZEITQUELLE, Endzustand direkt\r\n"

virtio_reset_msg:
    .asciz  "VIRTIO RESET FEHLER, STOP\r\n"

anim_invalid_msg:
    .asciz  "ANIM UNGUELTIG\r\n"

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
win_buffer_msg:
    .asciz  "WIN PUFFERBUDGET ERSCHOEPFT, Fenster zeichnet direkt\r\n"
net_missing_msg:
    .asciz  "NET UNAVAILABLE\r\n"
net_fail_msg:
    .asciz  "NET SETUP FAILED\r\n"
gic_msg:
    .asciz  "GIC v"
net_ready_msg:
    .asciz  "NET MAC "
net_arp_msg:
    .asciz  "ARP 10.0.2.2 = "
net_fragment_msg:
    .asciz  "NET FRAGMENT VERWORFEN\r\n"
net_sum_msg:
    .asciz  "NET PRUEFSUMME "
net_sum_ip_name:
    .asciz  "IP\r\n"
net_sum_udp_name:
    .asciz  "UDP\r\n"
net_sum_tcp_name:
    .asciz  "TCP\r\n"
net_sum_icmp_name:
    .asciz  "ICMP\r\n"
net_ping_msg:
    .asciz  "PING 10.0.2.2 ok\r\n"
net_tx_timeout_msg:
    .asciz  "NET TX TIMEOUT\r\n"
dhcp_msg:
    .asciz  "DHCP ip "
dhcp_gw_label:
    .asciz  " gw "
dhcp_dns_label:
    .asciz  " dns "
dhcp_mask_label:
    .asciz  " mask "
dhcp_timeout_msg:
    .asciz  "DHCP KEINE ANTWORT, Netz ohne Adresse\r\n"
dhcp_renew_msg:
    .asciz  "DHCP ERNEUERE LEASE\r\n"
dhcp_renewed_msg:
    .asciz  "DHCP LEASE ERNEUERT\r\n"
dhcp_renew_fail_msg:
    .asciz  "DHCP ERNEUERUNG OHNE ANTWORT, Lease laeuft weiter\r\n"
dhcp_expired_msg:
    .asciz  "DHCP LEASE ABGELAUFEN, neue Anfrage\r\n"
dhcp_nak_msg:
    .asciz  "DHCP NAK vom Server, neue Anfrage\r\n"
net_dot:
    .asciz  "."
dns_msg:
    .asciz  "DNS "
dns_equals:
    .asciz  " = "
dns_fail_msg:
    .asciz  "DNS KEINE ANTWORT\r\n"
dns_rcode_msg:
    .asciz  "DNS FEHLER rcode="
dns_noanswer_msg:
    .asciz  "DNS OHNE A-RECORD\r\n"
dns_test_name:
    .asciz  "example.com"
tcp_syn_msg:
    .asciz  "TCP SYN an "
tcp_open_msg:
    .asciz  "TCP VERBUNDEN, sende GET\r\n"
tcp_data_msg:
    .asciz  "HTTP "
tcp_close_msg:
    .asciz  "TCP GESCHLOSSEN\r\n"
tcp_rst_msg:
    .asciz  "TCP RST VOM SERVER\r\n"
tcp_timeout_msg:
    .asciz  "TCP KEINE ANTWORT\r\n"
tcp_colon:
    .asciz  ":"
tcp_full_msg:
    .asciz  "TCP TABELLE VOLL\r\n"
tcp_txfull_msg:
    .asciz  "TCP SENDEPUFFER VOLL\r\n"
http_request:
    .ascii  "GET / HTTP/1.0\r\nHost: example.com\r\n\r\n"
http_request_end:
net_mac_broadcast:
    .byte   0xff, 0xff, 0xff, 0xff, 0xff, 0xff

























font_table_tags:
    .ascii  "headmaxplocaglyfcmaphmtxhhea"
font_table_min:
    .byte   54, 6, 2, 0, 4, 4, 36

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

icon_cursor_body:
    .byte   1, 18, 146, 1, 151, 142, 2, 195, 130, 3, 201, 128
    .byte   203, 123, 3, 205, 119, 204, 114, 3, 202, 109, 197, 106
    .byte   2, 69, 53, 3, 64, 51, 59, 53, 3, 55, 55, 53
    .byte   59, 3, 51, 64, 53, 69, 2, 106, 197, 3, 109, 202
    .byte   114, 204, 3, 119, 205, 123, 203, 3, 128, 201, 130, 195
    .byte   2, 142, 151, 3, 142, 148, 144, 147, 3, 145, 145, 147
    .byte   144, 3, 148, 142, 151, 142, 2, 151, 142
icon_cursor_ring:
    .byte   2, 18, 158, 1, 64, 55, 3, 63, 55, 62, 56, 3
    .byte   61, 56, 60, 57, 3, 59, 57, 58, 58, 3, 57, 59
    .byte   56, 60, 3, 55, 62, 55, 64, 3, 55, 66, 56, 68
    .byte   2, 109, 195, 3, 110, 197, 112, 199, 3, 113, 200, 115
    .byte   200, 3, 117, 201, 118, 201, 3, 120, 201, 122, 200, 3
    .byte   123, 199, 125, 198, 3, 126, 196, 127, 194, 2, 138, 150
    .byte   3, 139, 147, 141, 145, 3, 142, 142, 145, 141, 3, 147
    .byte   139, 150, 138, 2, 194, 127, 3, 196, 126, 198, 125, 3
    .byte   199, 123, 200, 122, 3, 201, 120, 201, 118, 3, 201, 117
    .byte   200, 115, 3, 200, 113, 199, 112, 3, 197, 110, 195, 109
    .byte   2, 68, 56, 3, 67, 56, 67, 56, 3, 66, 55, 65
    .byte   55, 3, 65, 55, 64, 55, 2, 64, 55, 158, 1, 118
    .byte   208, 3, 114, 208, 112, 207, 3, 109, 205, 106, 203, 3
    .byte   104, 201, 103, 198, 2, 49, 71, 3, 48, 67, 48, 64
    .byte   3, 48, 61, 49, 58, 3, 51, 55, 53, 53, 3, 55
    .byte   51, 58, 49, 3, 61, 48, 64, 48, 3, 67, 48, 71
    .byte   49, 2, 198, 103, 3, 201, 104, 203, 107, 3, 206, 109
    .byte   207, 112, 3, 208, 115, 208, 119, 3, 207, 122, 206, 125
    .byte   3, 204, 128, 202, 130, 3, 199, 132, 196, 133, 2, 152
    .byte   145, 3, 150, 146, 149, 146, 3, 147, 147, 146, 149, 3
    .byte   146, 150, 145, 152, 2, 133, 196, 3, 132, 199, 130, 202
    .byte   3, 128, 204, 125, 206, 3, 122, 207, 119, 208, 3, 119
    .byte   208, 118, 208, 3, 118, 208, 118, 208, 3, 118, 208, 118
    .byte   208, 2, 118, 208

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


sha_ok_msg:
    .asciz  "SHA256 OK, 5 Testvektoren\r\n"
sha_fail_msg:
    .asciz  "SHA256 FEHLER Test "
sha_missing_msg:
    .asciz  "SHA256 FEHLT, keine SHA2-Erweiterung\r\n"
sha_abc_msg:
    .asciz  "SHA256 abc = "
sha_test_abc:
    .ascii  "abc"
sha_test_two:
    .ascii  "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
sha_test_two_end:

.balign 16
sha_k256:
    .word   0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5
    .word   0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5
    .word   0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3
    .word   0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174
    .word   0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc
    .word   0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da
    .word   0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7
    .word   0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967
    .word   0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13
    .word   0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85
    .word   0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3
    .word   0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070
    .word   0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5
    .word   0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3
    .word   0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208
    .word   0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
sha_iv:
    .word   0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a
    .word   0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19
sha_expect_abc:
    .byte   0xba,0x78,0x16,0xbf,0x8f,0x01,0xcf,0xea,0x41,0x41,0x40,0xde,0x5d,0xae,0x22,0x23
    .byte   0xb0,0x03,0x61,0xa3,0x96,0x17,0x7a,0x9c,0xb4,0x10,0xff,0x61,0xf2,0x00,0x15,0xad
sha_expect_empty:
    .byte   0xe3,0xb0,0xc4,0x42,0x98,0xfc,0x1c,0x14,0x9a,0xfb,0xf4,0xc8,0x99,0x6f,0xb9,0x24
    .byte   0x27,0xae,0x41,0xe4,0x64,0x9b,0x93,0x4c,0xa4,0x95,0x99,0x1b,0x78,0x52,0xb8,0x55
sha_expect_two:
    .byte   0x24,0x8d,0x6a,0x61,0xd2,0x06,0x38,0xb8,0xe5,0xc0,0x26,0x93,0x0c,0x3e,0x60,0x39
    .byte   0xa3,0x3c,0xe4,0x59,0x64,0xff,0x21,0x67,0xf6,0xec,0xed,0xd4,0x19,0xdb,0x06,0xc1
sha_expect_55:
    .byte   0xaa,0x35,0x3e,0x00,0x9e,0xdb,0xae,0xbf,0xc6,0xe4,0x94,0xc8,0xd8,0x47,0x69,0x68
    .byte   0x96,0xcb,0x8b,0x39,0x8e,0x01,0x73,0xa4,0xb5,0xc1,0xb6,0x36,0x29,0x2d,0x87,0xc7
sha_expect_million:
    .byte   0xcd,0xc7,0x6e,0x5c,0x99,0x14,0xfb,0x92,0x81,0xa1,0xc7,0xe2,0x84,0xd7,0x3e,0x67
    .byte   0xf1,0x80,0x9a,0x48,0xa4,0x97,0x20,0x0e,0x04,0x6d,0x39,0xcc,0xc7,0x11,0x2c,0xd0

hmac_ok_msg:
    .asciz  "HMAC OK, 4 Testvektoren\r\n"
hmac_fail_msg:
    .asciz  "HMAC FEHLER Test "
hkdf_ok_msg:
    .asciz  "HKDF OK, 3 Testvektoren\r\n"
hkdf_fail_msg:
    .asciz  "HKDF FEHLER Test "
hmac_key_jefe:
    .ascii  "Jefe"
hmac_data_1:
    .ascii  "Hi There"
hmac_data_1_end:
hmac_data_2:
    .ascii  "what do ya want for nothing?"
hmac_data_2_end:
hmac_data_6:
    .ascii  "Test Using Larger Than Block-Size Key - Hash Key First"
hmac_data_6_end:
hmac_data_7:
    .ascii  "This is a test using a larger than block-size key and a larger than block-size data. The key needs to be hashed before being used by the HMAC algorithm."
hmac_data_7_end:
hmac_key_0b:
    .fill   20, 1, 0x0b
hmac_key_aa:
    .fill   131, 1, 0xaa
hmac_expect_1:
    .byte   0xb0,0x34,0x4c,0x61,0xd8,0xdb,0x38,0x53,0x5c,0xa8,0xaf,0xce,0xaf,0x0b,0xf1,0x2b
    .byte   0x88,0x1d,0xc2,0x00,0xc9,0x83,0x3d,0xa7,0x26,0xe9,0x37,0x6c,0x2e,0x32,0xcf,0xf7
hmac_expect_2:
    .byte   0x5b,0xdc,0xc1,0x46,0xbf,0x60,0x75,0x4e,0x6a,0x04,0x24,0x26,0x08,0x95,0x75,0xc7
    .byte   0x5a,0x00,0x3f,0x08,0x9d,0x27,0x39,0x83,0x9d,0xec,0x58,0xb9,0x64,0xec,0x38,0x43
hmac_expect_6:
    .byte   0x60,0xe4,0x31,0x59,0x1e,0xe0,0xb6,0x7f,0x0d,0x8a,0x26,0xaa,0xcb,0xf5,0xb7,0x7f
    .byte   0x8e,0x0b,0xc6,0x21,0x37,0x28,0xc5,0x14,0x05,0x46,0x04,0x0f,0x0e,0xe3,0x7f,0x54
hmac_expect_7:
    .byte   0x9b,0x09,0xff,0xa7,0x1b,0x94,0x2f,0xcb,0x27,0x63,0x5f,0xbc,0xd5,0xb0,0xe9,0x44
    .byte   0xbf,0xdc,0x63,0x64,0x4f,0x07,0x13,0x93,0x8a,0x7f,0x51,0x53,0x5c,0x3a,0x35,0xe2
.balign 8
hkdf_case_1:
    .quad   hkdf_case_1_salt, 13, hkdf_case_1_ikm, 22, hkdf_case_1_info, 10, hkdf_okm, 42, hkdf_case_1_prk, hkdf_case_1_okm
hkdf_case_1_salt:
    .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0a,0x0b,0x0c
hkdf_case_1_ikm:
    .byte   0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b
    .byte   0x0b,0x0b,0x0b,0x0b,0x0b,0x0b
hkdf_case_1_info:
    .byte   0xf0,0xf1,0xf2,0xf3,0xf4,0xf5,0xf6,0xf7,0xf8,0xf9
hkdf_case_1_prk:
    .byte   0x07,0x77,0x09,0x36,0x2c,0x2e,0x32,0xdf,0x0d,0xdc,0x3f,0x0d,0xc4,0x7b,0xba,0x63
    .byte   0x90,0xb6,0xc7,0x3b,0xb5,0x0f,0x9c,0x31,0x22,0xec,0x84,0x4a,0xd7,0xc2,0xb3,0xe5
hkdf_case_1_okm:
    .byte   0x3c,0xb2,0x5f,0x25,0xfa,0xac,0xd5,0x7a,0x90,0x43,0x4f,0x64,0xd0,0x36,0x2f,0x2a
    .byte   0x2d,0x2d,0x0a,0x90,0xcf,0x1a,0x5a,0x4c,0x5d,0xb0,0x2d,0x56,0xec,0xc4,0xc5,0xbf
    .byte   0x34,0x00,0x72,0x08,0xd5,0xb8,0x87,0x18,0x58,0x65
.balign 8
hkdf_case_2:
    .quad   hkdf_case_2_salt, 80, hkdf_case_2_ikm, 80, hkdf_case_2_info, 80, hkdf_okm, 82, hkdf_case_2_prk, hkdf_case_2_okm
hkdf_case_2_salt:
    .byte   0x60,0x61,0x62,0x63,0x64,0x65,0x66,0x67,0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f
    .byte   0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77,0x78,0x79,0x7a,0x7b,0x7c,0x7d,0x7e,0x7f
    .byte   0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8a,0x8b,0x8c,0x8d,0x8e,0x8f
    .byte   0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9a,0x9b,0x9c,0x9d,0x9e,0x9f
    .byte   0xa0,0xa1,0xa2,0xa3,0xa4,0xa5,0xa6,0xa7,0xa8,0xa9,0xaa,0xab,0xac,0xad,0xae,0xaf
hkdf_case_2_ikm:
    .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0a,0x0b,0x0c,0x0d,0x0e,0x0f
    .byte   0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1a,0x1b,0x1c,0x1d,0x1e,0x1f
    .byte   0x20,0x21,0x22,0x23,0x24,0x25,0x26,0x27,0x28,0x29,0x2a,0x2b,0x2c,0x2d,0x2e,0x2f
    .byte   0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39,0x3a,0x3b,0x3c,0x3d,0x3e,0x3f
    .byte   0x40,0x41,0x42,0x43,0x44,0x45,0x46,0x47,0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f
hkdf_case_2_info:
    .byte   0xb0,0xb1,0xb2,0xb3,0xb4,0xb5,0xb6,0xb7,0xb8,0xb9,0xba,0xbb,0xbc,0xbd,0xbe,0xbf
    .byte   0xc0,0xc1,0xc2,0xc3,0xc4,0xc5,0xc6,0xc7,0xc8,0xc9,0xca,0xcb,0xcc,0xcd,0xce,0xcf
    .byte   0xd0,0xd1,0xd2,0xd3,0xd4,0xd5,0xd6,0xd7,0xd8,0xd9,0xda,0xdb,0xdc,0xdd,0xde,0xdf
    .byte   0xe0,0xe1,0xe2,0xe3,0xe4,0xe5,0xe6,0xe7,0xe8,0xe9,0xea,0xeb,0xec,0xed,0xee,0xef
    .byte   0xf0,0xf1,0xf2,0xf3,0xf4,0xf5,0xf6,0xf7,0xf8,0xf9,0xfa,0xfb,0xfc,0xfd,0xfe,0xff
hkdf_case_2_prk:
    .byte   0x06,0xa6,0xb8,0x8c,0x58,0x53,0x36,0x1a,0x06,0x10,0x4c,0x9c,0xeb,0x35,0xb4,0x5c
    .byte   0xef,0x76,0x00,0x14,0x90,0x46,0x71,0x01,0x4a,0x19,0x3f,0x40,0xc1,0x5f,0xc2,0x44
hkdf_case_2_okm:
    .byte   0xb1,0x1e,0x39,0x8d,0xc8,0x03,0x27,0xa1,0xc8,0xe7,0xf7,0x8c,0x59,0x6a,0x49,0x34
    .byte   0x4f,0x01,0x2e,0xda,0x2d,0x4e,0xfa,0xd8,0xa0,0x50,0xcc,0x4c,0x19,0xaf,0xa9,0x7c
    .byte   0x59,0x04,0x5a,0x99,0xca,0xc7,0x82,0x72,0x71,0xcb,0x41,0xc6,0x5e,0x59,0x0e,0x09
    .byte   0xda,0x32,0x75,0x60,0x0c,0x2f,0x09,0xb8,0x36,0x77,0x93,0xa9,0xac,0xa3,0xdb,0x71
    .byte   0xcc,0x30,0xc5,0x81,0x79,0xec,0x3e,0x87,0xc1,0x4c,0x01,0xd5,0xc1,0xf3,0x43,0x4f
    .byte   0x1d,0x87
.balign 8
hkdf_case_3:
    .quad   hkdf_case_3_salt, 0, hkdf_case_3_ikm, 22, hkdf_case_3_info, 0, hkdf_okm, 42, hkdf_case_3_prk, hkdf_case_3_okm
hkdf_case_3_salt:
hkdf_case_3_ikm:
    .byte   0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b
    .byte   0x0b,0x0b,0x0b,0x0b,0x0b,0x0b
hkdf_case_3_info:
hkdf_case_3_prk:
    .byte   0x19,0xef,0x24,0xa3,0x2c,0x71,0x7b,0x16,0x7f,0x33,0xa9,0x1d,0x6f,0x64,0x8b,0xdf
    .byte   0x96,0x59,0x67,0x76,0xaf,0xdb,0x63,0x77,0xac,0x43,0x4c,0x1c,0x29,0x3c,0xcb,0x04
hkdf_case_3_okm:
    .byte   0x8d,0xa4,0xe7,0x75,0xa5,0x63,0xc1,0x8f,0x71,0x5f,0x80,0x2a,0x06,0x3c,0x5a,0x31
    .byte   0xb8,0xa1,0x1f,0x5c,0x5e,0xe1,0x87,0x9e,0xc3,0x45,0x4e,0x5f,0x3c,0x73,0x8d,0x2d
    .byte   0x9d,0x20,0x13,0x95,0xfa,0xa4,0xb6,0x1a,0x96,0xc8

aes_ok_msg:
    .asciz  "AES-GCM OK, 4 Testvektoren, Manipulation erkannt\r\n"
aes_fail_msg:
    .asciz  "AES-GCM FEHLER Test "
aes_missing_msg:
    .asciz  "AES-GCM FEHLT, keine AES- oder PMULL-Erweiterung\r\n"
aes_rcon:
    .byte   0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36
.balign 8
aes_case_1:
    .quad   aes_case_1_key, aes_case_1_iv, aes_case_1_aad, 0, aes_case_1_pt, 0, aes_case_1_ct, aes_case_1_tag
aes_case_1_key:
    .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
aes_case_1_iv:
    .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
aes_case_1_aad:
aes_case_1_pt:
aes_case_1_ct:
aes_case_1_tag:
    .byte   0x58,0xe2,0xfc,0xce,0xfa,0x7e,0x30,0x61,0x36,0x7f,0x1d,0x57,0xa4,0xe7,0x45,0x5a
.balign 8
aes_case_2:
    .quad   aes_case_2_key, aes_case_2_iv, aes_case_2_aad, 0, aes_case_2_pt, 16, aes_case_2_ct, aes_case_2_tag
aes_case_2_key:
    .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
aes_case_2_iv:
    .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
aes_case_2_aad:
aes_case_2_pt:
    .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
aes_case_2_ct:
    .byte   0x03,0x88,0xda,0xce,0x60,0xb6,0xa3,0x92,0xf3,0x28,0xc2,0xb9,0x71,0xb2,0xfe,0x78
aes_case_2_tag:
    .byte   0xab,0x6e,0x47,0xd4,0x2c,0xec,0x13,0xbd,0xf5,0x3a,0x67,0xb2,0x12,0x57,0xbd,0xdf
.balign 8
aes_case_3:
    .quad   aes_case_3_key, aes_case_3_iv, aes_case_3_aad, 0, aes_case_3_pt, 64, aes_case_3_ct, aes_case_3_tag
aes_case_3_key:
    .byte   0xfe,0xff,0xe9,0x92,0x86,0x65,0x73,0x1c,0x6d,0x6a,0x8f,0x94,0x67,0x30,0x83,0x08
aes_case_3_iv:
    .byte   0xca,0xfe,0xba,0xbe,0xfa,0xce,0xdb,0xad,0xde,0xca,0xf8,0x88
aes_case_3_aad:
aes_case_3_pt:
    .byte   0xd9,0x31,0x32,0x25,0xf8,0x84,0x06,0xe5,0xa5,0x59,0x09,0xc5,0xaf,0xf5,0x26,0x9a
    .byte   0x86,0xa7,0xa9,0x53,0x15,0x34,0xf7,0xda,0x2e,0x4c,0x30,0x3d,0x8a,0x31,0x8a,0x72
    .byte   0x1c,0x3c,0x0c,0x95,0x95,0x68,0x09,0x53,0x2f,0xcf,0x0e,0x24,0x49,0xa6,0xb5,0x25
    .byte   0xb1,0x6a,0xed,0xf5,0xaa,0x0d,0xe6,0x57,0xba,0x63,0x7b,0x39,0x1a,0xaf,0xd2,0x55
aes_case_3_ct:
    .byte   0x42,0x83,0x1e,0xc2,0x21,0x77,0x74,0x24,0x4b,0x72,0x21,0xb7,0x84,0xd0,0xd4,0x9c
    .byte   0xe3,0xaa,0x21,0x2f,0x2c,0x02,0xa4,0xe0,0x35,0xc1,0x7e,0x23,0x29,0xac,0xa1,0x2e
    .byte   0x21,0xd5,0x14,0xb2,0x54,0x66,0x93,0x1c,0x7d,0x8f,0x6a,0x5a,0xac,0x84,0xaa,0x05
    .byte   0x1b,0xa3,0x0b,0x39,0x6a,0x0a,0xac,0x97,0x3d,0x58,0xe0,0x91,0x47,0x3f,0x59,0x85
aes_case_3_tag:
    .byte   0x4d,0x5c,0x2a,0xf3,0x27,0xcd,0x64,0xa6,0x2c,0xf3,0x5a,0xbd,0x2b,0xa6,0xfa,0xb4
.balign 8
aes_case_4:
    .quad   aes_case_4_key, aes_case_4_iv, aes_case_4_aad, 20, aes_case_4_pt, 60, aes_case_4_ct, aes_case_4_tag
aes_case_4_key:
    .byte   0xfe,0xff,0xe9,0x92,0x86,0x65,0x73,0x1c,0x6d,0x6a,0x8f,0x94,0x67,0x30,0x83,0x08
aes_case_4_iv:
    .byte   0xca,0xfe,0xba,0xbe,0xfa,0xce,0xdb,0xad,0xde,0xca,0xf8,0x88
aes_case_4_aad:
    .byte   0xfe,0xed,0xfa,0xce,0xde,0xad,0xbe,0xef,0xfe,0xed,0xfa,0xce,0xde,0xad,0xbe,0xef
    .byte   0xab,0xad,0xda,0xd2
aes_case_4_pt:
    .byte   0xd9,0x31,0x32,0x25,0xf8,0x84,0x06,0xe5,0xa5,0x59,0x09,0xc5,0xaf,0xf5,0x26,0x9a
    .byte   0x86,0xa7,0xa9,0x53,0x15,0x34,0xf7,0xda,0x2e,0x4c,0x30,0x3d,0x8a,0x31,0x8a,0x72
    .byte   0x1c,0x3c,0x0c,0x95,0x95,0x68,0x09,0x53,0x2f,0xcf,0x0e,0x24,0x49,0xa6,0xb5,0x25
    .byte   0xb1,0x6a,0xed,0xf5,0xaa,0x0d,0xe6,0x57,0xba,0x63,0x7b,0x39
aes_case_4_ct:
    .byte   0x42,0x83,0x1e,0xc2,0x21,0x77,0x74,0x24,0x4b,0x72,0x21,0xb7,0x84,0xd0,0xd4,0x9c
    .byte   0xe3,0xaa,0x21,0x2f,0x2c,0x02,0xa4,0xe0,0x35,0xc1,0x7e,0x23,0x29,0xac,0xa1,0x2e
    .byte   0x21,0xd5,0x14,0xb2,0x54,0x66,0x93,0x1c,0x7d,0x8f,0x6a,0x5a,0xac,0x84,0xaa,0x05
    .byte   0x1b,0xa3,0x0b,0x39,0x6a,0x0a,0xac,0x97,0x3d,0x58,0xe0,0x91
aes_case_4_tag:
    .byte   0x5b,0xc9,0x4f,0xbc,0x32,0x21,0xa5,0xdb,0x94,0xfa,0xe9,0x5a,0xe7,0x12,0x1a,0x47
x25519_ok_msg:
    .asciz  "X25519 OK, 6 Testvektoren\r\n"
x25519_fail_msg:
    .asciz  "X25519 FEHLER Test "
.balign 8
x25519_cases:
    .quad   x25519_k_1, x25519_u_1, x25519_e_1
    .quad   x25519_k_2, x25519_u_2, x25519_e_2
    .quad   x25519_k_3, 0, x25519_e_3
    .quad   x25519_k_4, 0, x25519_e_4
    .quad   x25519_k_5, x25519_u_5, x25519_e_5
    .quad   x25519_k_6, x25519_u_6, x25519_e_6
x25519_k_1:
    .byte   0xa5,0x46,0xe3,0x6b,0xf0,0x52,0x7c,0x9d,0x3b,0x16,0x15,0x4b,0x82,0x46,0x5e,0xdd
    .byte   0x62,0x14,0x4c,0x0a,0xc1,0xfc,0x5a,0x18,0x50,0x6a,0x22,0x44,0xba,0x44,0x9a,0xc4
x25519_u_1:
    .byte   0xe6,0xdb,0x68,0x67,0x58,0x30,0x30,0xdb,0x35,0x94,0xc1,0xa4,0x24,0xb1,0x5f,0x7c
    .byte   0x72,0x66,0x24,0xec,0x26,0xb3,0x35,0x3b,0x10,0xa9,0x03,0xa6,0xd0,0xab,0x1c,0x4c
x25519_e_1:
    .byte   0xc3,0xda,0x55,0x37,0x9d,0xe9,0xc6,0x90,0x8e,0x94,0xea,0x4d,0xf2,0x8d,0x08,0x4f
    .byte   0x32,0xec,0xcf,0x03,0x49,0x1c,0x71,0xf7,0x54,0xb4,0x07,0x55,0x77,0xa2,0x85,0x52
x25519_k_2:
    .byte   0x4b,0x66,0xe9,0xd4,0xd1,0xb4,0x67,0x3c,0x5a,0xd2,0x26,0x91,0x95,0x7d,0x6a,0xf5
    .byte   0xc1,0x1b,0x64,0x21,0xe0,0xea,0x01,0xd4,0x2c,0xa4,0x16,0x9e,0x79,0x18,0xba,0x0d
x25519_u_2:
    .byte   0xe5,0x21,0x0f,0x12,0x78,0x68,0x11,0xd3,0xf4,0xb7,0x95,0x9d,0x05,0x38,0xae,0x2c
    .byte   0x31,0xdb,0xe7,0x10,0x6f,0xc0,0x3c,0x3e,0xfc,0x4c,0xd5,0x49,0xc7,0x15,0xa4,0x93
x25519_e_2:
    .byte   0x95,0xcb,0xde,0x94,0x76,0xe8,0x90,0x7d,0x7a,0xad,0xe4,0x5c,0xb4,0xb8,0x73,0xf8
    .byte   0x8b,0x59,0x5a,0x68,0x79,0x9f,0xa1,0x52,0xe6,0xf8,0xf7,0x64,0x7a,0xac,0x79,0x57
x25519_k_3:
    .byte   0x77,0x07,0x6d,0x0a,0x73,0x18,0xa5,0x7d,0x3c,0x16,0xc1,0x72,0x51,0xb2,0x66,0x45
    .byte   0xdf,0x4c,0x2f,0x87,0xeb,0xc0,0x99,0x2a,0xb1,0x77,0xfb,0xa5,0x1d,0xb9,0x2c,0x2a
x25519_e_3:
    .byte   0x85,0x20,0xf0,0x09,0x89,0x30,0xa7,0x54,0x74,0x8b,0x7d,0xdc,0xb4,0x3e,0xf7,0x5a
    .byte   0x0d,0xbf,0x3a,0x0d,0x26,0x38,0x1a,0xf4,0xeb,0xa4,0xa9,0x8e,0xaa,0x9b,0x4e,0x6a
x25519_k_4:
    .byte   0x5d,0xab,0x08,0x7e,0x62,0x4a,0x8a,0x4b,0x79,0xe1,0x7f,0x8b,0x83,0x80,0x0e,0xe6
    .byte   0x6f,0x3b,0xb1,0x29,0x26,0x18,0xb6,0xfd,0x1c,0x2f,0x8b,0x27,0xff,0x88,0xe0,0xeb
x25519_e_4:
    .byte   0xde,0x9e,0xdb,0x7d,0x7b,0x7d,0xc1,0xb4,0xd3,0x5b,0x61,0xc2,0xec,0xe4,0x35,0x37
    .byte   0x3f,0x83,0x43,0xc8,0x5b,0x78,0x67,0x4d,0xad,0xfc,0x7e,0x14,0x6f,0x88,0x2b,0x4f
x25519_k_5:
    .byte   0x77,0x07,0x6d,0x0a,0x73,0x18,0xa5,0x7d,0x3c,0x16,0xc1,0x72,0x51,0xb2,0x66,0x45
    .byte   0xdf,0x4c,0x2f,0x87,0xeb,0xc0,0x99,0x2a,0xb1,0x77,0xfb,0xa5,0x1d,0xb9,0x2c,0x2a
x25519_u_5:
    .byte   0xde,0x9e,0xdb,0x7d,0x7b,0x7d,0xc1,0xb4,0xd3,0x5b,0x61,0xc2,0xec,0xe4,0x35,0x37
    .byte   0x3f,0x83,0x43,0xc8,0x5b,0x78,0x67,0x4d,0xad,0xfc,0x7e,0x14,0x6f,0x88,0x2b,0x4f
x25519_e_5:
    .byte   0x4a,0x5d,0x9d,0x5b,0xa4,0xce,0x2d,0xe1,0x72,0x8e,0x3b,0xf4,0x80,0x35,0x0f,0x25
    .byte   0xe0,0x7e,0x21,0xc9,0x47,0xd1,0x9e,0x33,0x76,0xf0,0x9b,0x3c,0x1e,0x16,0x17,0x42
x25519_k_6:
    .byte   0x09,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
    .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
x25519_u_6:
    .byte   0x09,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
    .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
x25519_e_6:
    .byte   0x42,0x2c,0x8e,0x7a,0x62,0x27,0xd7,0xbc,0xa1,0x35,0x0b,0x3e,0x2b,0xb7,0x27,0x9f
    .byte   0x78,0x97,0xb8,0x7b,0xb6,0x85,0x4b,0x78,0x3c,0x60,0xe8,0x03,0x11,0xae,0x30,0x79
tls_hello_tpl:
    .byte   TLS_REC_HANDSHAKE, 0x03, 0x01
    .byte   (tls_hello_end - tls_hello_tpl - 5) >> 8, (tls_hello_end - tls_hello_tpl - 5) & 0xff
    .byte   TLS_HS_CLIENT_HELLO
    .byte   0, (tls_hello_end - tls_hello_tpl - 9) >> 8, (tls_hello_end - tls_hello_tpl - 9) & 0xff
    .byte   TLS_VERSION_12 >> 8, TLS_VERSION_12 & 0xff
tls_hello_random:
    .space  32
    .byte   0, 0, 2, TLS_SUITE_AES128_SHA256 >> 8, TLS_SUITE_AES128_SHA256 & 0xff, 1, 0
    .byte   (tls_hello_end - tls_hello_ext) >> 8, (tls_hello_end - tls_hello_ext) & 0xff
tls_hello_ext:
    .byte   TLS_EXT_SERVER_NAME >> 8, TLS_EXT_SERVER_NAME & 0xff
    .byte   0, tls_host_end - tls_host + 5, 0, tls_host_end - tls_host + 3, 0, 0, tls_host_end - tls_host
tls_host:
    .ascii  "example.com"
tls_host_end:
    .byte   TLS_EXT_GROUPS >> 8, TLS_EXT_GROUPS & 0xff, 0, 4, 0, 2, TLS_GROUP_X25519 >> 8, TLS_GROUP_X25519 & 0xff
    .byte   TLS_EXT_SIG_ALGS >> 8, TLS_EXT_SIG_ALGS & 0xff, 0, 4, 0, 2, TLS_SIG_ECDSA_P256 >> 8, TLS_SIG_ECDSA_P256 & 0xff
    .byte   TLS_EXT_VERSIONS >> 8, TLS_EXT_VERSIONS & 0xff, 0, 3, 2, TLS_VERSION_13 >> 8, TLS_VERSION_13 & 0xff
    .byte   TLS_EXT_KEY_SHARE >> 8, TLS_EXT_KEY_SHARE & 0xff, 0, 38, 0, 36, TLS_GROUP_X25519 >> 8, TLS_GROUP_X25519 & 0xff, 0, 32
tls_hello_pub:
    .space  32
tls_hello_end:
tls_label_derived:
    .ascii  "tls13 derived"
tls_label_derived_end:
tls_label_c_hs:
    .ascii  "tls13 c hs traffic"
tls_label_c_hs_end:
tls_label_s_hs:
    .ascii  "tls13 s hs traffic"
tls_label_s_hs_end:
tls_label_c_ap:
    .ascii  "tls13 c ap traffic"
tls_label_c_ap_end:
tls_label_s_ap:
    .ascii  "tls13 s ap traffic"
tls_label_s_ap_end:
tls_label_key:
    .ascii  "tls13 key"
tls_label_key_end:
tls_label_iv:
    .ascii  "tls13 iv"
tls_label_iv_end:
tls_label_finished:
    .ascii  "tls13 finished"
tls_label_finished_end:
tls_hello_msg:
    .asciz  "TLS CLIENT HELLO an Port 443\r\n"
tls_server_hello_msg:
    .asciz  "TLS SERVER HELLO, TLS 1.3, AES-128-GCM, X25519\r\n"
tls_cert_msg:
    .asciz  "TLS ZERTIFIKAT "
tls_cert_tail:
    .asciz  " Byte, Blatt "
tls_done_msg:
    .asciz  "TLS HANDSHAKE FERTIG, sende GET\r\n"
tls_https_msg:
    .asciz  "HTTPS "
tls_closed_msg:
    .asciz  "TLS GESCHLOSSEN\r\n"
tls_alert_msg:
    .asciz  "TLS ALERT "
tls_fail_msg:
    .asciz  "TLS FEHLER: "
tls_overflow_msg:
    .asciz  "Puffer voll"
tls_toolong_msg:
    .asciz  "Record zu lang"
tls_badtype_msg:
    .asciz  "unbekannter Record-Typ"
tls_unexpected_msg:
    .asciz  "Record im falschen Zustand"
tls_badtag_msg:
    .asciz  "Tag falsch"
tls_empty_msg:
    .asciz  "leerer Record"
tls_badmsg_msg:
    .asciz  "unerwartete Handshake-Nachricht"
tls_badfin_msg:
    .asciz  "Finished des Servers falsch"
tls_hrr_msg:
    .asciz  "Hello Retry Request"
tls_suite_msg:
    .asciz  "Cipher Suite abgelehnt"
tls_version_msg:
    .asciz  "keine TLS 1.3"
tls_group_msg:
    .asciz  "Key Share nicht X25519"
tls_missing_msg:
    .asciz  "Server Hello ohne Version oder Key Share"
tls_short_msg:
    .asciz  "Server Hello zu kurz"
tls_hrr_random:
    .byte   0xcf,0x21,0xad,0x74,0xe5,0x9a,0x61,0x11,0xbe,0x1d,0x8c,0x02,0x1e,0x65,0xb8,0x91
    .byte   0xc2,0xa2,0x11,0x16,0x7a,0xbb,0x8c,0x5e,0x07,0x9e,0x09,0xe2,0xc8,0xa8,0x33,0x9c
tls_zero32:
    .space  32
fdt_compatible_name:
    .asciz  "compatible"
gic_node_name:
    .asciz  "intc"
gic_v3_compatible:
    .asciz  "arm,gic-v3"
.balign 8
p256_ctx:
    .quad   4, p256_p, 0x1, p256_r2, p256_one
p256_n_ctx:
    .quad   4, p256_n, 0xccd1c8aaee00bc4f, p256_n_r2, p256_n_one
p256_p:
    .quad   0xffffffffffffffff, 0x00000000ffffffff, 0x0000000000000000, 0xffffffff00000001
p256_r2:
    .quad   0x0000000000000003, 0xfffffffbffffffff, 0xfffffffffffffffe, 0x00000004fffffffd
p256_one:
    .quad   0x0000000000000001, 0xffffffff00000000, 0xffffffffffffffff, 0x00000000fffffffe
p256_n:
    .quad   0xf3b9cac2fc632551, 0xbce6faada7179e84, 0xffffffffffffffff, 0xffffffff00000000
p256_n_r2:
    .quad   0x83244c95be79eea2, 0x4699799c49bd6fa6, 0x2845b2392b6bec59, 0x66e12d94f3d95620
p256_n_one:
    .quad   0x0c46353d039cdaaf, 0x4319055258e8617b, 0x0000000000000000, 0x00000000ffffffff
mp_plain_one:
    .quad   1, 0, 0, 0, 0, 0
oid_ec_public_key:
    .byte   0x2a, 0x86, 0x48, 0xce, 0x3d, 0x02, 0x01
oid_prime256v1:
    .byte   0x2a, 0x86, 0x48, 0xce, 0x3d, 0x03, 0x01, 0x07
tls_cv_label:
    .ascii  "TLS 1.3, server CertificateVerify"
    .byte   0
tls_cv_label_end:
ecdsa_ok_msg:
    .asciz  "ECDSA OK, P-256 und P-384, RFC 6979 und echtes Zertifikat\r\n"
ecdsa_fail_msg:
    .asciz  "ECDSA FEHLER Test "
tls_cert_tail2:
    .asciz  " Byte\r\n"
tls_root_name:
    .ascii  "ROOT    DER"
tls_root_msg:
    .asciz  "TLS WURZEL ROOT.DER geladen, "
tls_root_tail:
    .asciz  " Byte, "
tls_root_missing_msg:
    .asciz  "TLS WURZEL FEHLT (ROOT.DER), keine Kettenpruefung moeglich\r\n"
tls_curve_p256:
    .asciz  "ECDSA P-256\r\n"
tls_curve_p384:
    .asciz  "ECDSA P-384\r\n"
tls_chain_ok_msg:
    .asciz  "TLS KETTE GEPRUEFT: "
tls_chain_ok_tail:
    .asciz  " Zertifikate bis zur Wurzel, Name example.com, gueltig am "
tls_chain_noclock_msg:
    .asciz  "keine Uhr, Gueltigkeit nicht pruefbar"
tls_chain_early_msg:
    .asciz  "ZERTIFIKAT NOCH NICHT GUELTIG"
tls_chain_expired_msg:
    .asciz  "ZERTIFIKAT ABGELAUFEN"
rtc_node_name:
    .asciz  "pl031"
rtc_msg:
    .asciz  "RTC pl031 an 0x"
rtc_msg_tail:
    .asciz  ", Zeit "
rtc_utc_msg:
    .asciz  " UTC\r\n"
rtc_missing_msg:
    .asciz  "RTC FEHLT, kein pl031 im Device Tree, Gueltigkeit nicht pruefbar\r\n"
time_ok_msg:
    .asciz  "ZEIT OK, 6 Datumsvektoren, UTCTime und GeneralizedTime\r\n"
time_fail_msg:
    .asciz  "ZEIT FEHLER Test "
time_test_utc:
    .ascii  "260729221008Z"
time_test_general:
    .ascii  "20460819163347Z"
time_test_bad:
    .ascii  "261329221008Z"
.balign 8
time_test_vectors:
    .quad   1970, 1, 1, 0, 0, 0, 0
    .quad   2000, 2, 29, 0, 0, 0, 951782400
    .quad   2026, 9, 15, 4, 34, 56, 1789446896
    .quad   2038, 1, 19, 3, 14, 8, 2147483648
    .quad   2100, 3, 1, 0, 0, 0, 4107542400
    .quad   1999, 12, 31, 23, 59, 59, 946684799
tls_chain_noroot_msg:
    .asciz  "keine Wurzel geladen, Kette nicht pruefbar"
tls_chain_name_msg:
    .asciz  "NAME PASST NICHT ZUM ZERTIFIKAT"
tls_chain_orphan_msg:
    .asciz  "AUSSTELLER UNBEKANNT, keine Verbindung zur Wurzel"
tls_chain_invalid_msg:
    .asciz  "ZERTIFIKATSKETTE UNGUELTIG"
x509_ok_msg:
    .asciz  "X509 OK, Kette und Namen geparst, SAN mit Platzhalter\r\n"
x509_fail_msg:
    .asciz  "X509 FEHLER Test "
x509_test_host_wild:
    .ascii  "www.EXAMPLE.com"
x509_test_host_wild_end:
x509_test_host_bad:
    .ascii  "example.org"
x509_test_host_bad_end:
oid_ecdsa_sha256:
    .byte   0x2a, 0x86, 0x48, 0xce, 0x3d, 0x04, 0x03, 0x02
oid_ecdsa_sha384:
    .byte   0x2a, 0x86, 0x48, 0xce, 0x3d, 0x04, 0x03, 0x03
oid_secp384r1:
    .byte   0x2b, 0x81, 0x04, 0x00, 0x22
tls_certbig_msg:
    .asciz  "Zertifikat zu gross"
tls_certbad_msg:
    .asciz  "Zertifikat nicht lesbar oder nicht ECDSA P-256"
tls_scheme_msg:
    .asciz  "Signaturverfahren nicht ECDSA P-256"
tls_sigbad_msg:
    .asciz  "Signatur nicht lesbar"
tls_sigwrong_msg:
    .asciz  "SIGNATUR DES SERVERS FALSCH"
tls_verified_msg:
    .asciz  "TLS SIGNATUR GEPRUEFT, ECDSA P-256, Sitzung an Zertifikat gebunden\r\n"
ecdsa_test_q:
    .byte   0x60,0xfe,0xd4,0xba,0x25,0x5a,0x9d,0x31,0xc9,0x61,0xeb,0x74,0xc6,0x35,0x6d,0x68
    .byte   0xc0,0x49,0xb8,0x92,0x3b,0x61,0xfa,0x6c,0xe6,0x69,0x62,0x2e,0x60,0xf2,0x9f,0xb6
    .byte   0x79,0x03,0xfe,0x10,0x08,0xb8,0xbc,0x99,0xa4,0x1a,0xe9,0xe9,0x56,0x28,0xbc,0x64
    .byte   0xf2,0xf1,0xb2,0x0c,0x2d,0x7e,0x9f,0x51,0x77,0xa3,0xc2,0x94,0xd4,0x46,0x22,0x99
ecdsa_test_h:
    .byte   0xaf,0x2b,0xdb,0xe1,0xaa,0x9b,0x6e,0xc1,0xe2,0xad,0xe1,0xd6,0x94,0xf4,0x1f,0xc7
    .byte   0x1a,0x83,0x1d,0x02,0x68,0xe9,0x89,0x15,0x62,0x11,0x3d,0x8a,0x62,0xad,0xd1,0xbf
ecdsa_test_r:
    .byte   0xef,0xd4,0x8b,0x2a,0xac,0xb6,0xa8,0xfd,0x11,0x40,0xdd,0x9c,0xd4,0x5e,0x81,0xd6
    .byte   0x9d,0x2c,0x87,0x7b,0x56,0xaa,0xf9,0x91,0xc3,0x4d,0x0e,0xa8,0x4e,0xaf,0x37,0x16
ecdsa_test_s:
    .byte   0xf7,0xcb,0x1c,0x94,0x2d,0x65,0x7c,0x41,0xd4,0x36,0xc7,0xa1,0xb6,0xe2,0x9f,0x65
    .byte   0xf3,0xe9,0x00,0xdb,0xb9,0xaf,0xf4,0x06,0x4d,0xc4,0xab,0x2f,0x84,0x3a,0xcd,0xa8
ecdsa_test_s_bad:
    .byte   0xf7,0xcb,0x1c,0x94,0x2d,0x65,0x7c,0x41,0xd4,0x36,0xc7,0xa1,0xb6,0xe2,0x9f,0x65
    .byte   0xf3,0xe9,0x00,0xdb,0xb9,0xaf,0xf4,0x06,0x4d,0xc4,0xab,0x2f,0x84,0x3a,0xcd,0xa9
x509_test_ca_key:
    .byte   0xfd,0x1d,0x14,0x14,0x8e,0x23,0x42,0x93,0x26,0xcf,0x70,0xd0,0x89,0xd7,0xb1,0x1e
    .byte   0x72,0xac,0x3e,0x5d,0x59,0x52,0x81,0xdf,0x1c,0xf5,0xd6,0x25,0xb9,0xd6,0x77,0x07
    .byte   0x85,0x0b,0x8d,0x12,0xb1,0x2b,0x3f,0x40,0xb9,0x1f,0x72,0x06,0xe0,0xff,0x40,0x52
    .byte   0x0a,0x93,0x49,0xf8,0xc9,0x71,0xb0,0x7e,0xee,0xe0,0xa3,0x45,0x51,0x18,0x44,0x74
x509_test_leaf_key:
    .byte   0x76,0x4e,0x09,0xa3,0xdd,0xb2,0xcf,0x45,0xa5,0x4d,0xd1,0x5b,0x9d,0xf0,0x51,0x00
    .byte   0x52,0x23,0x33,0xdd,0x9d,0x81,0x77,0x99,0x6d,0x8b,0x7f,0x6e,0x86,0xeb,0xc1,0x01
    .byte   0x1c,0xa7,0xf9,0x1e,0x89,0x26,0x40,0x42,0xbf,0x9e,0x1d,0x95,0x38,0xb3,0xcd,0xa5
    .byte   0x01,0xcc,0xb9,0xeb,0x89,0xa3,0xd5,0x5b,0xdb,0xb2,0xb1,0x82,0x09,0x5d,0x35,0x62
x509_test_cert:
    .byte   0x30,0x82,0x03,0xe6,0x30,0x82,0x03,0x8d,0xa0,0x03,0x02,0x01,0x02,0x02,0x10,0x06
    .byte   0x24,0xd0,0xab,0x31,0x15,0x58,0x78,0x0b,0x7d,0x52,0x13,0xb9,0x63,0x18,0x31,0x30
    .byte   0x0a,0x06,0x08,0x2a,0x86,0x48,0xce,0x3d,0x04,0x03,0x02,0x30,0x51,0x31,0x0b,0x30
    .byte   0x09,0x06,0x03,0x55,0x04,0x06,0x13,0x02,0x55,0x53,0x31,0x18,0x30,0x16,0x06,0x03
    .byte   0x55,0x04,0x0a,0x0c,0x0f,0x53,0x53,0x4c,0x20,0x43,0x6f,0x72,0x70,0x6f,0x72,0x61
    .byte   0x74,0x69,0x6f,0x6e,0x31,0x28,0x30,0x26,0x06,0x03,0x55,0x04,0x03,0x0c,0x1f,0x43
    .byte   0x6c,0x6f,0x75,0x64,0x66,0x6c,0x61,0x72,0x65,0x20,0x54,0x4c,0x53,0x20,0x49,0x73
    .byte   0x73,0x75,0x69,0x6e,0x67,0x20,0x45,0x43,0x43,0x20,0x43,0x41,0x20,0x33,0x30,0x1e
    .byte   0x17,0x0d,0x32,0x36,0x30,0x37,0x32,0x39,0x32,0x32,0x31,0x30,0x30,0x38,0x5a,0x17
    .byte   0x0d,0x32,0x36,0x31,0x30,0x32,0x37,0x32,0x32,0x31,0x37,0x32,0x31,0x5a,0x30,0x16
    .byte   0x31,0x14,0x30,0x12,0x06,0x03,0x55,0x04,0x03,0x0c,0x0b,0x65,0x78,0x61,0x6d,0x70
    .byte   0x6c,0x65,0x2e,0x63,0x6f,0x6d,0x30,0x59,0x30,0x13,0x06,0x07,0x2a,0x86,0x48,0xce
    .byte   0x3d,0x02,0x01,0x06,0x08,0x2a,0x86,0x48,0xce,0x3d,0x03,0x01,0x07,0x03,0x42,0x00
    .byte   0x04,0x76,0x4e,0x09,0xa3,0xdd,0xb2,0xcf,0x45,0xa5,0x4d,0xd1,0x5b,0x9d,0xf0,0x51
    .byte   0x00,0x52,0x23,0x33,0xdd,0x9d,0x81,0x77,0x99,0x6d,0x8b,0x7f,0x6e,0x86,0xeb,0xc1
    .byte   0x01,0x1c,0xa7,0xf9,0x1e,0x89,0x26,0x40,0x42,0xbf,0x9e,0x1d,0x95,0x38,0xb3,0xcd
    .byte   0xa5,0x01,0xcc,0xb9,0xeb,0x89,0xa3,0xd5,0x5b,0xdb,0xb2,0xb1,0x82,0x09,0x5d,0x35
    .byte   0x62,0xa3,0x82,0x02,0x80,0x30,0x82,0x02,0x7c,0x30,0x0c,0x06,0x03,0x55,0x1d,0x13
    .byte   0x01,0x01,0xff,0x04,0x02,0x30,0x00,0x30,0x1f,0x06,0x03,0x55,0x1d,0x23,0x04,0x18
    .byte   0x30,0x16,0x80,0x14,0x83,0x03,0xfd,0xe7,0xf6,0xf5,0x4a,0x4d,0x15,0x41,0xf4,0xed
    .byte   0x22,0x16,0xd3,0x32,0x0a,0x3e,0xca,0x66,0x30,0x6c,0x06,0x08,0x2b,0x06,0x01,0x05
    .byte   0x05,0x07,0x01,0x01,0x04,0x60,0x30,0x5e,0x30,0x39,0x06,0x08,0x2b,0x06,0x01,0x05
    .byte   0x05,0x07,0x30,0x02,0x86,0x2d,0x68,0x74,0x74,0x70,0x3a,0x2f,0x2f,0x69,0x2e,0x63
    .byte   0x66,0x2d,0x69,0x2e,0x73,0x73,0x6c,0x2e,0x63,0x6f,0x6d,0x2f,0x43,0x6c,0x6f,0x75
    .byte   0x64,0x66,0x6c,0x61,0x72,0x65,0x2d,0x54,0x4c,0x53,0x2d,0x49,0x2d,0x45,0x33,0x2e
    .byte   0x63,0x65,0x72,0x30,0x21,0x06,0x08,0x2b,0x06,0x01,0x05,0x05,0x07,0x30,0x01,0x86
    .byte   0x15,0x68,0x74,0x74,0x70,0x3a,0x2f,0x2f,0x6f,0x2e,0x63,0x66,0x2d,0x69,0x2e,0x73
    .byte   0x73,0x6c,0x2e,0x63,0x6f,0x6d,0x30,0x25,0x06,0x03,0x55,0x1d,0x11,0x04,0x1e,0x30
    .byte   0x1c,0x82,0x0b,0x65,0x78,0x61,0x6d,0x70,0x6c,0x65,0x2e,0x63,0x6f,0x6d,0x82,0x0d
    .byte   0x2a,0x2e,0x65,0x78,0x61,0x6d,0x70,0x6c,0x65,0x2e,0x63,0x6f,0x6d,0x30,0x23,0x06
    .byte   0x03,0x55,0x1d,0x20,0x04,0x1c,0x30,0x1a,0x30,0x08,0x06,0x06,0x67,0x81,0x0c,0x01
    .byte   0x02,0x01,0x30,0x0e,0x06,0x0c,0x2b,0x06,0x01,0x04,0x01,0x82,0xa9,0x30,0x01,0x03
    .byte   0x01,0x01,0x30,0x13,0x06,0x03,0x55,0x1d,0x25,0x04,0x0c,0x30,0x0a,0x06,0x08,0x2b
    .byte   0x06,0x01,0x05,0x05,0x07,0x03,0x01,0x30,0x53,0x06,0x03,0x55,0x1d,0x1f,0x04,0x4c
    .byte   0x30,0x4a,0x30,0x48,0xa0,0x46,0xa0,0x44,0x86,0x42,0x68,0x74,0x74,0x70,0x3a,0x2f
    .byte   0x2f,0x63,0x2e,0x63,0x66,0x2d,0x69,0x2e,0x73,0x73,0x6c,0x2e,0x63,0x6f,0x6d,0x2f
    .byte   0x61,0x65,0x38,0x30,0x31,0x65,0x64,0x31,0x63,0x35,0x35,0x62,0x62,0x35,0x37,0x39
    .byte   0x64,0x37,0x39,0x32,0x30,0x38,0x62,0x30,0x64,0x37,0x37,0x32,0x61,0x63,0x66,0x62
    .byte   0x38,0x63,0x63,0x33,0x61,0x32,0x30,0x38,0x2e,0x63,0x72,0x6c,0x30,0x0e,0x06,0x03
    .byte   0x55,0x1d,0x0f,0x01,0x01,0xff,0x04,0x04,0x03,0x02,0x07,0x80,0x30,0x0f,0x06,0x09
    .byte   0x2b,0x06,0x01,0x04,0x01,0x82,0xda,0x4b,0x2c,0x04,0x02,0x05,0x00,0x30,0x82,0x01
    .byte   0x04,0x06,0x0a,0x2b,0x06,0x01,0x04,0x01,0xd6,0x79,0x02,0x04,0x02,0x04,0x81,0xf5
    .byte   0x04,0x81,0xf2,0x00,0xf0,0x00,0x77,0x00,0x94,0x4e,0x43,0x87,0xfa,0xec,0xc1,0xef
    .byte   0x81,0xf3,0x19,0x24,0x26,0xa8,0x18,0x65,0x01,0xc7,0xd3,0x5f,0x38,0x02,0x01,0x3f
    .byte   0x72,0x67,0x7d,0x55,0x37,0x2e,0x19,0xd8,0x00,0x00,0x01,0x9f,0xaf,0xf6,0xc3,0x36
    .byte   0x00,0x00,0x04,0x03,0x00,0x48,0x30,0x46,0x02,0x21,0x00,0xfd,0x58,0x5a,0x2d,0x44
    .byte   0x6c,0xd6,0x46,0x32,0xd4,0xa4,0xab,0xb9,0x52,0x01,0x55,0x10,0x85,0xb6,0x24,0x1e
    .byte   0xcc,0xb6,0xf6,0x5e,0xfa,0xda,0x1c,0x48,0xd8,0x1c,0xc9,0x02,0x21,0x00,0x90,0x85
    .byte   0x74,0x3a,0x02,0x58,0x4f,0x7d,0x26,0x31,0x4a,0x4a,0x6c,0xe3,0x79,0x18,0x5b,0x88
    .byte   0x7d,0x0c,0xdc,0x0c,0x3e,0x87,0x8d,0x78,0xcb,0xd6,0xc6,0xc5,0x3f,0x8f,0x00,0x75
    .byte   0x00,0xc8,0xa3,0xc4,0x7f,0xc7,0xb3,0xad,0xb9,0x35,0x6b,0x01,0x3f,0x6a,0x7a,0x12
    .byte   0x6d,0xe3,0x3a,0x4e,0x43,0xa5,0xc6,0x46,0xf9,0x97,0xad,0x39,0x75,0x99,0x1d,0xcf
    .byte   0x9a,0x00,0x00,0x01,0x9f,0xaf,0xf6,0xc3,0x4c,0x00,0x00,0x04,0x03,0x00,0x46,0x30
    .byte   0x44,0x02,0x20,0x0a,0xa6,0xb3,0xed,0x8c,0xc4,0x0b,0x94,0xba,0xd2,0x92,0xce,0x1e
    .byte   0x08,0x3a,0x09,0x67,0xa5,0xaa,0x7a,0x44,0x4b,0x1f,0xa0,0x16,0x1d,0x21,0xdc,0xa3
    .byte   0xd2,0xd7,0xb5,0x02,0x20,0x32,0xc4,0x61,0x36,0xd6,0xf0,0xd0,0x6a,0x7d,0x43,0x42
    .byte   0x2d,0x64,0x1e,0x43,0xff,0x4a,0x93,0xce,0xb3,0xca,0x30,0x10,0xdb,0x25,0x9a,0x2b
    .byte   0xf8,0xd6,0x64,0x71,0xee,0x30,0x0a,0x06,0x08,0x2a,0x86,0x48,0xce,0x3d,0x04,0x03
    .byte   0x02,0x03,0x47,0x00,0x30,0x44,0x02,0x20,0x10,0xb8,0x7d,0x44,0x4a,0x83,0xb0,0x80
    .byte   0x4c,0x04,0x09,0x00,0x0d,0x6b,0x1c,0xde,0x2b,0xa1,0x6e,0x4c,0x07,0xc9,0xf7,0x2f
    .byte   0xeb,0x0f,0x87,0xb2,0x38,0x5d,0x3d,0xcc,0x02,0x20,0x3c,0xdd,0x6b,0x6d,0xdf,0x67
    .byte   0x32,0x80,0xdb,0xea,0x86,0xe4,0xbf,0xe4,0xd6,0xd8,0xb9,0x83,0x8a,0xe4,0xdd,0x68
    .byte   0x89,0x53,0x45,0x1b,0xbe,0x95,0x06,0x2c,0xa2,0xaf
x509_test_cert_end:
term_prompt_text:
    .ascii  "asmOS> "
term_cmd_curl:
    .ascii  "curl "
term_cmd_help:
    .asciz  "hilfe"
term_help_1:
    .asciz  "curl http://host/pfad    Seite ueber HTTP holen"
term_help_2:
    .asciz  "curl https://host/pfad   Seite ueber TLS 1.3 holen, Kette bis ROOT.DER"
term_help_3:
    .asciz  "hilfe                    diese Liste"
term_unknown_msg:
    .asciz  "unbekannter Befehl, hilfe zeigt die Befehle"
curl_http_prefix:
    .ascii  "http://"
curl_https_prefix:
    .ascii  "https://"
curl_req_get:
    .asciz  "GET "
curl_req_slash:
    .asciz  "/"
curl_req_host:
    .asciz  " HTTP/1.0\r\nHost: "
curl_req_tail:
    .asciz  "\r\nUser-Agent: asmOS\r\nConnection: close\r\n\r\n"
curl_resolve_msg:
    .asciz  "curl: loese "
curl_resolve_tail:
    .asciz  " auf"
curl_connect_msg:
    .asciz  "curl: verbinde mit "
curl_https_tail:
    .asciz  ", TLS 1.3"
curl_done_msg:
    .asciz  "curl: fertig, "
curl_done_tail:
    .asciz  " Byte Inhalt"
curl_cut_msg:
    .asciz  "curl: Ausgabe gekuerzt"
curl_noanswer_msg:
    .asciz  "curl: Verbindung ohne Antwort beendet, Details im Netzwerkfenster"
curl_bad_url_msg:
    .asciz  "curl: Adresse ungueltig, erlaubt sind a-z 0-9 . - und ein Pfad ohne Leerzeichen"
curl_nonet_msg:
    .asciz  "curl: Netz ohne Adresse"
curl_dnsbusy_msg:
    .asciz  "curl: Namensaufloesung laeuft noch, bitte gleich erneut"
curl_dnsfail_msg:
    .asciz  "curl: Name nicht aufgeloest"
curl_conn_fail_msg:
    .asciz  "curl: Verbindung nicht moeglich, Details im Netzwerkfenster"
curl_tlsbusy_msg:
    .asciz  "curl: TLS-Sitzung belegt, bitte gleich erneut"
netlog_intro_1:
    .asciz  "Schnittstelle virtio-net, Kabel (kein WLAN unter QEMU)"
netlog_intro_2:
    .asciz  "Netztest beim Start gegen example.com, Port 80 und 443:"
virtio_keyboard_msg:
    .asciz  "VIRTIO KEYBOARD OK\r\n"
.balign 4
gui_prefixes:
    .ascii  "NET "
    .ascii  "DHCP"
    .ascii  "ARP "
    .ascii  "PING"
    .ascii  "DNS "
    .ascii  "TCP "
    .ascii  "HTTP"
    .ascii  "TLS "
    .word   0
key_table_lower:
    .byte   0x00,0x00,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39,0x30,0x2d,0x3d,0x08,0x09
    .byte   0x71,0x77,0x65,0x72,0x74,0x79,0x75,0x69,0x6f,0x70,0x5b,0x5d,0x0a,0x00,0x61,0x73
    .byte   0x64,0x66,0x67,0x68,0x6a,0x6b,0x6c,0x3b,0x27,0x60,0x00,0x5c,0x7a,0x78,0x63,0x76
    .byte   0x62,0x6e,0x6d,0x2c,0x2e,0x2f,0x00,0x2a,0x00,0x20
key_table_upper:
    .byte   0x00,0x00,0x21,0x40,0x23,0x24,0x25,0x5e,0x26,0x2a,0x28,0x29,0x5f,0x2b,0x08,0x09
    .byte   0x51,0x57,0x45,0x52,0x54,0x59,0x55,0x49,0x4f,0x50,0x7b,0x7d,0x0a,0x00,0x41,0x53
    .byte   0x44,0x46,0x47,0x48,0x4a,0x4b,0x4c,0x3a,0x22,0x7e,0x00,0x7c,0x5a,0x58,0x43,0x56
    .byte   0x42,0x4e,0x4d,0x3c,0x3e,0x3f,0x00,0x2a,0x00,0x20
.balign 8
p256_curve:
    .quad   p256_ctx, p256_n_ctx, p256_b_mont, p256_g_mont, 32
p384_curve:
    .quad   p384_ctx, p384_n_ctx, p384_b_mont, p384_g_mont, 48
p384_ctx:
    .quad   6, p384_p, 0x100000001, p384_r2, p384_one
p384_n_ctx:
    .quad   6, p384_n, 0x6ed46089e88fdc45, p384_n_r2, p384_n_one
p384_p:
    .quad   0x00000000ffffffff, 0xffffffff00000000, 0xfffffffffffffffe, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff
p384_r2:
    .quad   0xfffffffe00000001, 0x0000000200000000, 0xfffffffe00000000, 0x0000000200000000, 0x0000000000000001, 0x0000000000000000
p384_one:
    .quad   0xffffffff00000001, 0x00000000ffffffff, 0x0000000000000001, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
p384_n:
    .quad   0xecec196accc52973, 0x581a0db248b0a77a, 0xc7634d81f4372ddf, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff
p384_n_r2:
    .quad   0x2d319b2419b409a9, 0xff3d81e5df1aa419, 0xbc3e483afcb82947, 0xd40d49174aab1cc5, 0x3fb05b7a28266895, 0x0c84ee012b39bf21
p384_n_one:
    .quad   0x1313e695333ad68d, 0xa7e5f24db74f5885, 0x389cb27e0bc8d220, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
p384_b_mont:
    .quad   0x081188719d412dcc, 0xf729add87a4c32ec, 0x77f2209b1920022e, 0xe3374bee94938ae2, 0xb62b21f41f022094, 0xcd08114b604fbff9
p384_g_mont:
p384_gx_mont:
    .quad   0x3dd0756649c0b528, 0x20e378e2a0d6ce38, 0x879c3afc541b4d6e, 0x6454868459a30eff, 0x812ff723614ede2b, 0x4d3aadc2299e1513
p384_gy_mont:
    .quad   0x23043dad4b03a4fe, 0xa1bfa8bf7bb4a9ac, 0x8bade7562e83b050, 0xc6c3521968f4ffd9, 0xdd8002263969a840, 0x2b78abc25a15c5e9
p256_b_mont:
    .quad   0xd89cdf6229c4bddf, 0xacf005cd78843090, 0xe5a220abf7212ed6, 0xdc30061d04874834, 0x0000000000000000, 0x0000000000000000
p256_g_mont:
p256_gx_mont:
    .quad   0x79e730d418a9143c, 0x75ba95fc5fedb601, 0x79fb732b77622510, 0x18905f76a53755c6, 0x0000000000000000, 0x0000000000000000
p256_gy_mont:
    .quad   0xddf25357ce95560a, 0x8b4ab8e4ba19e45c, 0xd2e88688dd21f325, 0x8571ff1825885d85, 0x0000000000000000, 0x0000000000000000
ecdsa384_test_q:
    .byte   0xec,0x3a,0x4e,0x41,0x5b,0x4e,0x19,0xa4,0x56,0x86,0x18,0x02,0x9f,0x42,0x7f,0xa5
    .byte   0xda,0x9a,0x8b,0xc4,0xae,0x92,0xe0,0x2e,0x06,0xaa,0xe5,0x28,0x6b,0x30,0x0c,0x64
    .byte   0xde,0xf8,0xf0,0xea,0x90,0x55,0x86,0x60,0x64,0xa2,0x54,0x51,0x54,0x80,0xbc,0x13
    .byte   0x80,0x15,0xd9,0xb7,0x2d,0x7d,0x57,0x24,0x4e,0xa8,0xef,0x9a,0xc0,0xc6,0x21,0x89
    .byte   0x67,0x08,0xa5,0x93,0x67,0xf9,0xdf,0xb9,0xf5,0x4c,0xa8,0x4b,0x3f,0x1c,0x9d,0xb1
    .byte   0x28,0x8b,0x23,0x1c,0x3a,0xe0,0xd4,0xfe,0x73,0x44,0xfd,0x25,0x33,0x26,0x47,0x20
ecdsa384_test_h:
    .byte   0x9a,0x90,0x83,0x50,0x5b,0xc9,0x22,0x76,0xae,0xc4,0xbe,0x31,0x26,0x96,0xef,0x7b
    .byte   0xf3,0xbf,0x60,0x3f,0x4b,0xbd,0x38,0x11,0x96,0xa0,0x29,0xf3,0x40,0x58,0x53,0x12
    .byte   0x31,0x3b,0xca,0x4a,0x9b,0x5b,0x89,0x0e,0xfe,0xe4,0x2c,0x77,0xb1,0xee,0x25,0xfe
ecdsa384_test_r:
    .byte   0x94,0xed,0xbb,0x92,0xa5,0xec,0xb8,0xaa,0xd4,0x73,0x6e,0x56,0xc6,0x91,0x91,0x6b
    .byte   0x3f,0x88,0x14,0x06,0x66,0xce,0x9f,0xa7,0x3d,0x64,0xc4,0xea,0x95,0xad,0x13,0x3c
    .byte   0x81,0xa6,0x48,0x15,0x2e,0x44,0xac,0xf9,0x6e,0x36,0xdd,0x1e,0x80,0xfa,0xbe,0x46
ecdsa384_test_s:
    .byte   0x99,0xef,0x4a,0xeb,0x15,0xf1,0x78,0xce,0xa1,0xfe,0x40,0xdb,0x26,0x03,0x13,0x8f
    .byte   0x13,0x0e,0x74,0x0a,0x19,0x62,0x45,0x26,0x20,0x3b,0x63,0x51,0xd0,0xa3,0xa9,0x4f
    .byte   0xa3,0x29,0xc1,0x45,0x78,0x6e,0x67,0x9e,0x7b,0x82,0xc7,0x1a,0x38,0x62,0x8a,0xc8
ecdsa384_test_s_bad:
    .byte   0x99,0xef,0x4a,0xeb,0x15,0xf1,0x78,0xce,0xa1,0xfe,0x40,0xdb,0x26,0x03,0x13,0x8f
    .byte   0x13,0x0e,0x74,0x0a,0x19,0x62,0x45,0x26,0x20,0x3b,0x63,0x51,0xd0,0xa3,0xa9,0x4f
    .byte   0xa3,0x29,0xc1,0x45,0x78,0x6e,0x67,0x9e,0x7b,0x82,0xc7,0x1a,0x38,0x62,0x8a,0xc9
sha384_ok_msg:
    .asciz  "SHA384 OK, 3 Testvektoren\r\n"
sha384_fail_msg:
    .asciz  "SHA384 FEHLER Test "
sha384_test_two:
    .ascii  "abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu"
sha384_test_two_end:
sha384_expect_abc:
    .byte   0xcb,0x00,0x75,0x3f,0x45,0xa3,0x5e,0x8b,0xb5,0xa0,0x3d,0x69,0x9a,0xc6,0x50,0x07
    .byte   0x27,0x2c,0x32,0xab,0x0e,0xde,0xd1,0x63,0x1a,0x8b,0x60,0x5a,0x43,0xff,0x5b,0xed
    .byte   0x80,0x86,0x07,0x2b,0xa1,0xe7,0xcc,0x23,0x58,0xba,0xec,0xa1,0x34,0xc8,0x25,0xa7
sha384_expect_empty:
    .byte   0x38,0xb0,0x60,0xa7,0x51,0xac,0x96,0x38,0x4c,0xd9,0x32,0x7e,0xb1,0xb1,0xe3,0x6a
    .byte   0x21,0xfd,0xb7,0x11,0x14,0xbe,0x07,0x43,0x4c,0x0c,0xc7,0xbf,0x63,0xf6,0xe1,0xda
    .byte   0x27,0x4e,0xde,0xbf,0xe7,0x6f,0x65,0xfb,0xd5,0x1a,0xd2,0xf1,0x48,0x98,0xb9,0x5b
sha384_expect_two:
    .byte   0x09,0x33,0x0c,0x33,0xf7,0x11,0x47,0xe8,0x3d,0x19,0x2f,0xc7,0x82,0xcd,0x1b,0x47
    .byte   0x53,0x11,0x1b,0x17,0x3b,0x3b,0x05,0xd2,0x2f,0xa0,0x80,0x86,0xe3,0xb0,0xf7,0x12
    .byte   0xfc,0xc7,0xc7,0x1a,0x55,0x7e,0x2d,0xb9,0x66,0xc3,0xe9,0xfa,0x91,0x74,0x60,0x39
.balign 8
sha384_iv:
    .quad   0xcbbb9d5dc1059ed8, 0x629a292a367cd507, 0x9159015a3070dd17, 0x152fecd8f70e5939, 0x67332667ffc00b31, 0x8eb44a8768581511, 0xdb0c2e0d64f98fa7, 0x47b5481dbefa4fa4
sha512_k:
    .quad   0x428a2f98d728ae22, 0x7137449123ef65cd, 0xb5c0fbcfec4d3b2f, 0xe9b5dba58189dbbc
    .quad   0x3956c25bf348b538, 0x59f111f1b605d019, 0x923f82a4af194f9b, 0xab1c5ed5da6d8118
    .quad   0xd807aa98a3030242, 0x12835b0145706fbe, 0x243185be4ee4b28c, 0x550c7dc3d5ffb4e2
    .quad   0x72be5d74f27b896f, 0x80deb1fe3b1696b1, 0x9bdc06a725c71235, 0xc19bf174cf692694
    .quad   0xe49b69c19ef14ad2, 0xefbe4786384f25e3, 0x0fc19dc68b8cd5b5, 0x240ca1cc77ac9c65
    .quad   0x2de92c6f592b0275, 0x4a7484aa6ea6e483, 0x5cb0a9dcbd41fbd4, 0x76f988da831153b5
    .quad   0x983e5152ee66dfab, 0xa831c66d2db43210, 0xb00327c898fb213f, 0xbf597fc7beef0ee4
    .quad   0xc6e00bf33da88fc2, 0xd5a79147930aa725, 0x06ca6351e003826f, 0x142929670a0e6e70
    .quad   0x27b70a8546d22ffc, 0x2e1b21385c26c926, 0x4d2c6dfc5ac42aed, 0x53380d139d95b3df
    .quad   0x650a73548baf63de, 0x766a0abb3c77b2a8, 0x81c2c92e47edaee6, 0x92722c851482353b
    .quad   0xa2bfe8a14cf10364, 0xa81a664bbc423001, 0xc24b8b70d0f89791, 0xc76c51a30654be30
    .quad   0xd192e819d6ef5218, 0xd69906245565a910, 0xf40e35855771202a, 0x106aa07032bbd1b8
    .quad   0x19a4c116b8d2d0c8, 0x1e376c085141ab53, 0x2748774cdf8eeb99, 0x34b0bcb5e19b48a8
    .quad   0x391c0cb3c5c95a63, 0x4ed8aa4ae3418acb, 0x5b9cca4f7763e373, 0x682e6ff3d6b2b8a3
    .quad   0x748f82ee5defb2fc, 0x78a5636f43172f60, 0x84c87814a1f0ab72, 0x8cc702081a6439ec
    .quad   0x90befffa23631e28, 0xa4506cebde82bde9, 0xbef9a3f7b2c67915, 0xc67178f2e372532b
    .quad   0xca273eceea26619c, 0xd186b8c721c0c207, 0xeada7dd6cde0eb1e, 0xf57d4f7fee6ed178
    .quad   0x06f067aa72176fba, 0x0a637dc5a2c898a6, 0x113f9804bef90dae, 0x1b710b35131c471b
    .quad   0x28db77f523047d84, 0x32caab7b40c72493, 0x3c9ebe0a15c9bebc, 0x431d67c49c100d4c
    .quad   0x4cc5d4becb3e42b6, 0x597f299cfc657e2a, 0x5fcb6fab3ad6faec, 0x6c44198c4a475817
net_tx_busy_msg:
    .asciz  "NET SENDEPUFFER BELEGT, Rahmen verworfen\n"
tls_chain_badca_msg:
    .asciz  "AUSSTELLER OHNE CA-BERECHTIGUNG"
tls_chain_badleaf_msg:
    .asciz  "BLATTZERTIFIKAT NICHT FUER SERVER"
tls_entropy_msg:
    .asciz  "TLS GESPERRT, keine Entropie\n"
rng_ready_msg:
    .asciz  "RNG READY\r\n"
rng_fail_msg:
    .asciz  "RNG UNAVAILABLE\r\n"
oid_server_auth:
    .byte   0x2b, 0x06, 0x01, 0x05, 0x05, 0x07, 0x03, 0x01
tls_zero_shared_msg:
    .asciz  "NULLGEHEIMNIS VOM SERVER"
tls_truncated_msg:
    .asciz  "TLS ABBRUCH OHNE CLOSE_NOTIFY\n"
tls_locked_msg:
    .asciz  "TLS GESPERRT, Kryptografie nicht bereit\n"
tls_notify_msg:
    .asciz  "TLS CLOSE_NOTIFY EMPFANGEN, sende close_notify\n"
tls_alert_fatal_msg:
    .asciz  "Alert vom Server"
tls_alert_len_msg:
    .asciz  "Alert mit falscher Laenge"
tls_close_notify:
    .byte   1, 0
tls_sh_bad_msg:
    .asciz  "ServerHello-Felder ungueltig"
tls_cv_len_msg:
    .asciz  "CertificateVerify-Laenge ungueltig"
pmm_stack_msg:
    .asciz  "PANIC STACK UEBERLAUF, Waechter am Stackboden ueberschrieben\n"
key_overflow_msg:
    .asciz  "TASTENPUFFER VOLL, Tasten verworfen\n"
net_rx_badlen_msg:
    .asciz  "NET EMPFANGSLAENGE UNGUELTIG, Puffer neu eingereiht\n"
crypto_ready_msg:
    .asciz  "KRYPTO BEREIT\n"
crypto_blocked_msg:
    .asciz  "KRYPTO GESPERRT, Selbsttest fehlgeschlagen\n"
time_month_days:
    .byte   0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
time_test_feb31:
    .ascii  "260231120000Z"
time_test_feb29:
    .ascii  "240229120000Z"
time_test_feb29_2100:
    .ascii  "21000229120000Z"
.balign 8
ec_run_fns:
    .quad   mp_mont_mul, mp_add_mod, mp_sub_mod, mp_to_mont, mp_from_mont
ec_dbl_ops:
    ecop ECOP_MUL, ECD_DELTA, ECD_Z1, ECD_Z1
    ecop ECOP_MUL, ECD_GAMMA, ECD_Y1, ECD_Y1
    ecop ECOP_MUL, ECD_BETA, ECD_X1, ECD_GAMMA
    ecop ECOP_SUB, ECD_T1, ECD_X1, ECD_DELTA
    ecop ECOP_ADD, ECD_T2, ECD_X1, ECD_DELTA
    ecop ECOP_MUL, ECD_ALPHA, ECD_T1, ECD_T2
    ecop ECOP_ADD, ECD_T1, ECD_ALPHA, ECD_ALPHA
    ecop ECOP_ADD, ECD_ALPHA, ECD_T1, ECD_ALPHA
    ecop ECOP_MUL, ECD_X3, ECD_ALPHA, ECD_ALPHA
    ecop ECOP_ADD, ECD_T1, ECD_BETA, ECD_BETA
    ecop ECOP_ADD, ECD_T1, ECD_T1, ECD_T1
    ecop ECOP_ADD, ECD_T2, ECD_T1, ECD_T1
    ecop ECOP_SUB, ECD_X3, ECD_X3, ECD_T2
    ecop ECOP_ADD, ECD_Z3, ECD_Y1, ECD_Z1
    ecop ECOP_MUL, ECD_Z3, ECD_Z3, ECD_Z3
    ecop ECOP_SUB, ECD_Z3, ECD_Z3, ECD_GAMMA
    ecop ECOP_SUB, ECD_Z3, ECD_Z3, ECD_DELTA
    ecop ECOP_SUB, ECD_T1, ECD_T1, ECD_X3
    ecop ECOP_MUL, ECD_Y3, ECD_ALPHA, ECD_T1
    ecop ECOP_MUL, ECD_T2, ECD_GAMMA, ECD_GAMMA
    ecop ECOP_ADD, ECD_T2, ECD_T2, ECD_T2
    ecop ECOP_ADD, ECD_T2, ECD_T2, ECD_T2
    ecop ECOP_ADD, ECD_T2, ECD_T2, ECD_T2
    ecop ECOP_SUB, ECD_Y3, ECD_Y3, ECD_T2
    .byte   ECOP_END
ec_add_ops:
    ecop ECOP_MUL, ECA_Z1Z1, ECA_Z1, ECA_Z1
    ecop ECOP_MUL, ECA_Z2Z2, ECA_Z2, ECA_Z2
    ecop ECOP_MUL, ECA_U1, ECA_X1, ECA_Z2Z2
    ecop ECOP_MUL, ECA_U2, ECA_X2, ECA_Z1Z1
    ecop ECOP_MUL, ECA_S1, ECA_Y1, ECA_Z2
    ecop ECOP_MUL, ECA_S1, ECA_S1, ECA_Z2Z2
    ecop ECOP_MUL, ECA_S2, ECA_Y2, ECA_Z1
    ecop ECOP_MUL, ECA_S2, ECA_S2, ECA_Z1Z1
    ecop ECOP_SUB, ECA_H, ECA_U2, ECA_U1
    ecop ECOP_SUB, ECA_R, ECA_S2, ECA_S1
    .byte   ECOP_END
ec_add_general_ops:
    ecop ECOP_ADD, ECA_R, ECA_R, ECA_R
    ecop ECOP_ADD, ECA_I, ECA_H, ECA_H
    ecop ECOP_MUL, ECA_I, ECA_I, ECA_I
    ecop ECOP_MUL, ECA_J, ECA_H, ECA_I
    ecop ECOP_MUL, ECA_V, ECA_U1, ECA_I
    ecop ECOP_MUL, ECA_X3, ECA_R, ECA_R
    ecop ECOP_SUB, ECA_X3, ECA_X3, ECA_J
    ecop ECOP_SUB, ECA_X3, ECA_X3, ECA_V
    ecop ECOP_SUB, ECA_X3, ECA_X3, ECA_V
    ecop ECOP_SUB, ECA_T1, ECA_V, ECA_X3
    ecop ECOP_MUL, ECA_Y3, ECA_R, ECA_T1
    ecop ECOP_MUL, ECA_T1, ECA_S1, ECA_J
    ecop ECOP_ADD, ECA_T1, ECA_T1, ECA_T1
    ecop ECOP_SUB, ECA_Y3, ECA_Y3, ECA_T1
    ecop ECOP_ADD, ECA_Z3, ECA_Z1, ECA_Z2
    ecop ECOP_MUL, ECA_Z3, ECA_Z3, ECA_Z3
    ecop ECOP_SUB, ECA_Z3, ECA_Z3, ECA_Z1Z1
    ecop ECOP_SUB, ECA_Z3, ECA_Z3, ECA_Z2Z2
    ecop ECOP_MUL, ECA_Z3, ECA_Z3, ECA_H
    .byte   ECOP_END
ecdsa_curve_ops:
    ecop ECOP_TOMONT, ECV_QX, ECV_QX
    ecop ECOP_TOMONT, ECV_QY, ECV_QY
    ecop ECOP_MUL, ECV_T1, ECV_QX, ECV_QX
    ecop ECOP_MUL, ECV_T1, ECV_T1, ECV_QX
    ecop ECOP_SUB, ECV_T1, ECV_T1, ECV_QX
    ecop ECOP_SUB, ECV_T1, ECV_T1, ECV_QX
    ecop ECOP_SUB, ECV_T1, ECV_T1, ECV_QX
    .byte   ECOP_END
ecdsa_curve_y_ops:
    ecop ECOP_MUL, ECV_T2, ECV_QY, ECV_QY
    ecop ECOP_SUB, ECV_T1, ECV_T1, ECV_T2
    .byte   ECOP_END
ecdsa_affine_ops:
    ecop ECOP_MUL, ECV_T1, ECV_T1, ECV_T1
    ecop ECOP_MUL, ECV_T1, ECV_T1, ECV_P1
    ecop ECOP_FROMMONT, ECV_T1, ECV_T1
    .byte   ECOP_END

.balign 8
win_class_base:
    .quad   0, win_draw_none, win_key_none, win_focus_none, win_dirty_none, win_close_none
win_class_term:
    .quad   win_class_base, term_draw, term_input, term_focus, term_take_dirty, 0
win_class_net:
    .quad   win_class_base, netlog_draw, 0, 0, netlog_refresh, 0
win_class_files:
    .quad   win_class_base, files_draw, 0, 0, 0, 0
icon_x:
    .byte   2, 16, 2, 1, 176, 80, 2, 80, 176, 2, 1, 80, 80, 2, 176, 176
icon_minus:
    .byte   1, 16, 2, 1, 72, 128, 2, 184, 128

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
fb_target:
    .space  FB_TARGET_SIZE

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
win_buf_used:
    .space  8
win_color_fade:
    .space  1

.balign 8
files_count:
    .space  4

.balign 8
files_table:
    .space  (FILES_ENTRY * FILES_MAX)

.balign 8
dirty_count:
    .space  4
dirty_flag_all:
    .space  1

.balign 8
dirty_list:
    .space  (DIRTY_SIZE * DIRTY_MAX)

.balign 16

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

.balign 16

.balign 16

.balign 16

.balign 16
blk_base:
    .space  8

.balign 16
net_base:
    .space  8
net_mac:
    .space  6
net_gw_mac:
    .space  6
net_state:
    .space  1
dhcp_state:
    .space  1
dhcp_tries:
    .space  1
.balign 2
net_rx_last:
    .space  2
net_ip_id:
    .space  2
.balign 4
net_ip:
    .space  4
net_gw:
    .space  4
net_dns:
    .space  4
net_mask:
    .space  4
dhcp_server:
    .space  4
dhcp_offer:
    .space  4
dhcp_xid:
    .space  4
dhcp_timer:
    .space  4
dhcp_lease_new:
    .space  4
dhcp_renewing:
    .space  1
.balign 8
dhcp_renew_at:
    .space  16
dns_timer:
    .space  4
dns_result:
    .space  4
dns_state:
    .space  1
dns_tries:
    .space  1
.balign 4
net_last_src:
    .space  4
net_last_dst:
    .space  4
net_intid:
    .space  4
net_pending:
    .space  1
net_tick_pending:
    .space  1
net_timer_armed:
    .space  1
gic_version:
    .space  1
.balign 8
net_rand_state:
    .space  8
.balign 16
sha_ctx:
    .space  SHA_CTX_SIZE
sha_digest:
    .space  SHA_DIGEST_SIZE
sha_buf:
    .space  SHA_TEST_CHUNK
hkdf_prk:
    .space  SHA_DIGEST_SIZE
hkdf_okm:
    .space  96
.balign 16
sha512_ctx:
    .space  SHA512_CTX_SIZE
sha384_digest:
    .space  SHA384_DIGEST_SIZE
.balign 16
aes_ctx:
    .space  AES_CTX_SIZE
aes_buf:
    .space  AES_TEST_MAX
aes_tag:
    .space  GCM_TAG_SIZE
.balign 16
tls_ctx:
    .space  TLS_CTX_SIZE
tls_out_buf:
    .space  TLS_OUT_SIZE
tls_fin_buf:
    .space  48
tls_rx_buf:
    .space  TLS_RX_SIZE
tls_hs_buf:
    .space  TLS_HS_SIZE
tls_cert_buf:
    .space  TLS_CERT_SIZE
tls_root_buf:
    .space  TLS_ROOT_SIZE
.balign 8
tls_root_info:
    .space  X509_INFO_SIZE
tls_chain_infos:
    .space  (X509_INFO_SIZE * TLS_CHAIN_MAX)
tls_root_ok:
    .space  1
.balign 8
rtc_base:
    .space  8
.balign 16
vin_tablet:
    .space  VIN_SIZE
vin_keyboard:
    .space  VIN_SIZE
key_ring:
    .space  KEY_RING_SIZE
key_head:
    .space  4
key_tail:
    .space  4
key_shift:
    .space  1
key_overflow:
    .space  1
vin_baddesc_pending:
    .space  1
irq_unexpected_pending:
    .space  1
.balign 4
irq_unexpected_id:
    .space  4
term_dirty:
    .space  1
netlog_dirty:
    .space  1
.balign 4
gui_top_win:
    .space  4
win_next_id:
    .space  4
win_btn_id:
    .space  4
net_last_sport:
    .space  4
dns_local_port:
    .space  4
dns_question_len:
    .space  4
dns_question:
    .space  DNS_QUESTION_MAX
.balign 8
dns_target:
    .space  24
dns_name:
    .space  8
dns_handler:
    .space  8
.balign 16
rng_base:
    .space  8
rng_seed:
    .space  8
.balign 16
rng_desc:
    .space  (VRING_DESC_SIZE * RNG_QUEUE_SIZE)
.balign 16
rng_avail:
    .space  (VRING_AVAIL_RING + RNG_QUEUE_SIZE * 2 + 2)
.balign 16
rng_used:
    .space  (VRING_USED_RING + RNG_QUEUE_SIZE * VRING_USED_ELEM_SIZE + 2)
.balign 16
rng_buf:
    .space  RNG_BUF_SIZE
.balign 4
http_line:
    .space  (4 + TCP_LINE_MAX)
.balign 4
tls_line:
    .space  (4 + TCP_LINE_MAX)
.balign 8
tls_params:
    .space  TLSP_SIZE
term_busy:
    .space  1
curl_state:
    .space  1
curl_https:
    .space  1
curl_header:
    .space  1
curl_status_seen:
    .space  1
.balign 4
curl_host_len:
    .space  4
curl_request_len:
    .space  4
curl_line_len:
    .space  4
curl_bytes:
    .space  4
curl_lines:
    .space  4
term_cmd:
    .space  TERM_STRIDE
curl_host:
    .space  (CURL_HOST_MAX + 1)
curl_request:
    .space  CURL_REQ_MAX
curl_line:
    .space  TERM_STRIDE
curl_msg:
    .space  TERM_STRIDE
win_btn_armed:
    .space  1
crypto_ready:
    .space  1
.balign 4
term_row:
    .space  4
term_col:
    .space  4
netlog_count:
    .space  4
.balign 4
netlog_new:
    .space  8
gui_line_len:
    .space  4
gui_line:
    .space  GUI_LINE_MAX
term_buf:
    .space  (TERM_ROWS * TERM_STRIDE)
netlog_buf:
    .space  (NETLOG_ROWS * TERM_STRIDE)
dns_id:
    .space  2

.balign 16
net_rx_desc:
    .space  (VRING_DESC_SIZE * NET_QUEUE_SIZE)
.balign 16
net_rx_avail:
    .space  (VRING_AVAIL_RING + NET_QUEUE_SIZE * 2 + 2)
.balign 16
net_rx_used:
    .space  (VRING_USED_RING + NET_QUEUE_SIZE * VRING_USED_ELEM_SIZE + 2)
.balign 16
net_tx_desc:
    .space  (VRING_DESC_SIZE * NET_QUEUE_SIZE)
.balign 16
net_tx_avail:
    .space  (VRING_AVAIL_RING + NET_QUEUE_SIZE * 2 + 2)
.balign 16
net_tx_used:
    .space  (VRING_USED_RING + NET_QUEUE_SIZE * VRING_USED_ELEM_SIZE + 2)
.balign 16
tcp_table:
    .space  (TCB_SIZE * TCP_MAX)

.balign 16
net_rx_buf:
    .space  (NET_BUF_SIZE * NET_QUEUE_SIZE)
.balign 16
net_tx_buf:
    .space  NET_BUF_SIZE

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
vg_cov_xmax:
    .space  4

.balign 8
vg_cov_buffer:
    .space  (VG_COV_MAX * 4)

.balign 512
fat_buffer:
    .space  BLK_SECTOR_SIZE

.balign 4

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
.balign 4
click_record:
    .space  CLICK_RECORD_SIZE
release_record:
    .space  CLICK_RECORD_SIZE
power_armed:
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
cursor_sprite:
    .space  CURSOR_SPRITE_SIZE
cursor_sprite_pressed:
    .space  CURSOR_SPRITE_SIZE

.section .render, "aw", %nobits
.balign 64
fb_render:
    .space  FB_SIZE
.balign 64
win_buf_arena:
    .space  WIN_BUF_BUDGET

.section .framebuffer, "aw", %nobits
.balign BLOCK_SIZE
fb_output:
    .space  OUT_SIZE
