[bits 16]

hyperjump:    
    
    mov bx, hyperString
    call print
    call newLine

    in al, 0x92
    test al, 2
    jnz after
    or al, 2
    and al, 0xFE
    out 0x92, al
    after:

    cli
    lgdt [gdt_descriptor] ;load gdt
    mov eax, cr0
    or eax, 0x1
    mov cr0, eax
    jmp CODE_SEG:rainbowBridge ;flush any remaining 16 bit code



[bits 32]
rainbowBridge:
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x8000 ;reset stack
    mov esp, ebp

    call protectedMode ;begin protection

hyperString: db "Hyperdrive Engaged", 0
