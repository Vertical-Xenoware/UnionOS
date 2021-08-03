[bits 32]

global asm_add
global _start

section .text
_start:
asm_add:

    xchg bx, bx

    pusha
   
    xchg bx, bx 
 
    mov [base_pointer_store], ebp ;create new stack
    mov ebp, esp
    mov eax, [esp + 8] ;fetch paramenters
    mov ebx, [esp + 12]
    add eax, ebx
    mov ebp, [base_pointer_store] ;restore pre fn call stack
    
    mov [fnReturn], eax
    xchg bx, bx 
    popa
    xchg bx, bx
    mov eax, [fnReturn]
    xchg bx, bx
    ret


base_pointer_store: dw 0
fnReturn: dw 0
