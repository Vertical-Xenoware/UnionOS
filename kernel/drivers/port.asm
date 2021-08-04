[bits 32]

global pBIAsm

pBIAsm:
    push ebp
    mov ebp, esp

    xchg bx, bx
    mov dx, [ebp + 8]
    xchg bx, bx
    in al, dx
    xchg bx, bx

    mov esp, ebp
    pop ebp
    ret 