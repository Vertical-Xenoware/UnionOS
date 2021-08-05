[bits 32]

global pBIAsm
global pBOAsm
global pWIAsm
global pWOAsm

pBIAsm:
    push ebp
    mov ebp, esp

    mov dx, [ebp + 8]
    in al, dx

    mov esp, ebp
    pop ebp
    ret 

pBOAsm:
    push ebp
    mov ebp, esp
    
    mov dx, [ebp + 8]
    mov al, [ebp + 12]
    out dx, al

    mov esp, ebp
    pop ebp
    ret

pWIAsm:
    push ebp
    mov ebp, esp

    mov dx, [ebp + 8]
    in ax, dx

    mov esp, ebp
    pop ebp
    ret

pWOAsm:
    push ebp
    mov ebp, esp
    
    mov dx, [ebp + 8]
    mov al, [ebp + 12]
    out dx, ax

    mov esp, ebp
    pop ebp
    ret