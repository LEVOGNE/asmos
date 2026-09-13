ENTRY(_start)

SECTIONS
{
    . = 0x40080000;

    .text : ALIGN(16) {
        KEEP(*(.text.boot))
        *(.text)
        *(.text.[^v]*)
        . = ALIGN(0x800);
        KEEP(*(.text.vectors))
    }

    .rodata : ALIGN(16) {
        *(.rodata*)
    }

    .data : ALIGN(16) {
        *(.data*)
    }

    .bss (NOLOAD) : ALIGN(16) {
        __bss_start = .;
        *(.bss*)
        *(COMMON)
        . = ALIGN(16);
    }

    . = ALIGN(16);
    . += 0x4000;
    __stack_top = .;

    __bss_end = .;

    .render (NOLOAD) : ALIGN(64) {
        *(.render)
    }

    .framebuffer (NOLOAD) : ALIGN(0x200000) {
        __fb_out_start = .;
        *(.framebuffer)
        . = ALIGN(0x200000);
        __fb_out_end = .;
    }
    __image_end = .;

    /DISCARD/ : {
        *(.comment)
        *(.note*)
    }

    ASSERT(vec_at_0  - vec_table ==    0, "Vektoreintrag 0 verschoben")
    ASSERT(vec_at_1  - vec_table ==  128, "Vektoreintrag 1 verschoben")
    ASSERT(vec_at_2  - vec_table ==  256, "Vektoreintrag 2 verschoben")
    ASSERT(vec_at_3  - vec_table ==  384, "Vektoreintrag 3 verschoben")
    ASSERT(vec_at_4  - vec_table ==  512, "Vektoreintrag 4 verschoben")
    ASSERT(vec_at_5  - vec_table ==  640, "Vektoreintrag 5 verschoben")
    ASSERT(vec_at_6  - vec_table ==  768, "Vektoreintrag 6 verschoben")
    ASSERT(vec_at_7  - vec_table ==  896, "Vektoreintrag 7 verschoben")
    ASSERT(vec_at_8  - vec_table == 1024, "Vektoreintrag 8 verschoben")
    ASSERT(vec_at_9  - vec_table == 1152, "Vektoreintrag 9 verschoben")
    ASSERT(vec_at_10 - vec_table == 1280, "Vektoreintrag 10 verschoben")
    ASSERT(vec_at_11 - vec_table == 1408, "Vektoreintrag 11 verschoben")
    ASSERT(vec_at_12 - vec_table == 1536, "Vektoreintrag 12 verschoben")
    ASSERT(vec_at_13 - vec_table == 1664, "Vektoreintrag 13 verschoben")
    ASSERT(vec_at_14 - vec_table == 1792, "Vektoreintrag 14 verschoben")
    ASSERT(vec_at_15 - vec_table == 1920, "Vektoreintrag 15 verschoben")
    ASSERT((vec_table & 2047) == 0, "Vektortabelle nicht auf 2048 ausgerichtet")
}
