;[bits 32]

global asm_add
global _start

section .text
_start:
asm_add:

    

    push ebp ;create new stack
    mov ebp, esp
    mov eax, [ebp + 8] ;fetch paramenters
    mov ebx, [ebp + 12]
    add eax, ebx
    
    mov [fnReturn], eax

    mov esp, ebp
    pop ebp ;restore pre fn call stack

    mov eax, [fnReturn]
    ret

section .data
base_pointer_store: dw 0
fnReturn: dw 0
