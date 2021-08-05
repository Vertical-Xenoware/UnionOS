

readDisk:
    pusha ;store all register values
    ;mov [diskParameters], dx
    push dx ;store dx register

readDiskStart:
    mov ah, 0x02 ;disk config
    

    mov al, dh
    mov cl, 0x02
    mov ch, 0x00
    mov dh, 0x00

    int 0x13
    ;xchg bx, bx
    jc error

    ;mov dx, [diskParameters]
    pop dx
    cmp al, dh    ; BIOS also sets 'al' to the # of sectors read. Compare it.
    jne sectors_error
    popa
    ret

sectors_error:
    mov bx, SECTORS_ERROR
    call print

error:
    mov bx, errorStr
    call print

diskParameters: dd 0    
SECTORS_ERROR: db "Incorrect number of sectors read", 0
errorStr: db "Uh oh", 0