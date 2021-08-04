;[bits 32]

global asm_add
global _start

section .text
_start:
asm_add:

   
    xchg bx, bx 

    push ebp ;create new stack
    mov ebp, esp
    xchg bx, bx
    mov eax, [ebp + 8] ;fetch paramenters
    xchg bx, bx
    mov ebx, [ebp + 12]
    xchg bx, bx
    add eax, ebx
    
    mov [fnReturn], eax

    mov esp, ebp
    pop ebp ;restore pre fn call stack

    xchg bx, bx
    mov eax, [fnReturn]
    xchg bx, bx
    ret

section .data
base_pointer_store: dw 0
fnReturn: dw 0
