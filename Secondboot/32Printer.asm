[bits 32]

videoMemory equ 0xb8000
whiteBlack equ 0x0f

Print32:
    pusha
    mov edx, videoMemory
    
Print32loop:
    mov al, [ebx]
    mov ah, whiteBlack

    cmp al, 0
    je print32Done

    mov [edx], ax
    add ebx, 1
    add edx, 2

    jmp Print32loop

print32Done:
    popa
    ret

