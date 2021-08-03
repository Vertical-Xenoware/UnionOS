[bits 32]

global asm_add
global _start

section .text
_start:
asm_add:
    mov [base_pointer_store], ebp ;create new stack
    mov ebp, esp
    mov eax, [esp + 8] ;fetch paramenters
    mov ebx, [esp + 12]
    add eax, ebx
    mov ebp, [base_pointer_store] ;restore pre fn call stack
    ret


base_pointer_store: dw 0