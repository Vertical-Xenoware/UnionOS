[bits 16]

section .text

print:
    pusha

printStart:
    
    mov al, [bx]
    cmp al, 0
    je printDone

    mov ah, 0x0e
    int 0x10
    add bx, 1
    jmp printStart

printDone:
    popa
    ret

newLine:
    pusha

newLineStart:
    mov ah, 0x0e
    mov al, 0x0a ; newline char
    int 0x10
    mov al, 0x0d ; carriage return
    int 0x10

newLineDone:    
    popa
    ret

printSingle:
    pusha
    mov ah, 0x0e

singleStart:

    mov al, bl
    int 0x10
    
    popa
    ret


