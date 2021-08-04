[bits 16]
[org 0x7c00]
kernelLocation equ 0x1000
    
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov bx, 0x9000
    cli

    mov ss, bx
    mov sp, ax
    mov bp, sp 
    sti
    cld
    ;mov bp, 0x9000 ;set the stack
    
    mov sp, bp
    mov [bootDrive], dl ;store boot drive for readDisk function 
    mov bx, bootString ;store bootString for print function
    call print
    call newLine

    mov cx, 0fh ;time delay
    mov dx, 4240h
    mov ah, 86h
    int 15h 

    mov bx, license ;store kernelLoadString for print function
    call print
    call newLine


    mov cx, 0fh ;time delay
    mov dx, 4240h
    mov ah, 86h
    int 15h

    mov bx, kernelLoadString ;store kernelLoadString for print function
    call print
    call newLine

    mov cx, 0fh ;time delay
    mov dx, 4240h
    mov ah, 86h
    int 15h 

    call loader ;call loader function
    call hyperjump ;begin hyperjump

    jmp $

[bits 16]
loader:
    mov bx, kernelLocation ;store read data into this address
    mov dh, 16 ;sectors to read
    mov dl, [bootDrive] ;disk where image is present
    call readDisk ;call readDisk funciton
    ret


[bits 32]
protectedMode:
    mov ebx, pmString 
    call Print32
    call kernelLocation ;control handoff to kernel
    jmp $


bootString db "VX Bifrost ver 1.0.0", 0
license db "Bifrost is licensed under MPL v2.0", 0
kernelLoadString db "Reading Disk", 0
pmString db "Protection enabled", 0
bootDrive db 0


%include "./bootloader/printer.asm"
%include "./bootloader/readDisk.asm"
%include "./bootloader/hyperjump.asm"
%include "./bootloader/gdt.asm"
%include "./bootloader/32Printer.asm"

times 510 - ($-$$) db 0
dw 0xaa55
