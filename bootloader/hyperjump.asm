[bits 16]

hyperjump:    
    
    mov bx, hyperString
    call print
    call newLine

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

    mov ebp, 0x9000 ;reset stack
    mov esp, ebp

    call protectedMode ;begin protection

hyperString: db "Hyperdrive Engaged", 0
