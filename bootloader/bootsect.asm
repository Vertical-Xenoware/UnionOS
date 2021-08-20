[bits 16]
[org 0x7c00]
kernelLocation equ 0x1000
    
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov bx, 0x8000
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


inputLoop:
    mov di, inputString
    mov ah, 0x00
    int 16h

    mov bl, al
    call printSingle

    cmp al, 13
    je inputProcessor

    mov [di], al

    jmp inputLoop

inputProcessor:
    call newLine
    cmp [di], byte 0x62
    je sectorInputLoopStart
    jne inputLoop

sectorInputLoopStart:
    mov bx, sectorString
    call print
    call newLine

sectorInputLoop:
    mov di, inputString
    mov ah, 0x00
    int 16h

    mov bl, al
    call printSingle

    cmp al, 13
    je sectorinputProcessor

    mov [di], al

    jmp sectorInputLoop

sectorinputProcessor:
    call newLine
    cmp [di], byte 0x6c
    je continue
    jne sectorInputLoop

continue:


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
    mov dh, 32 ;sectors to read
    mov dl, [bootDrive] ;disk where image is present
    call readDisk ;call readDisk funciton
    ret


[bits 32]
protectedMode:
    mov ebx, pmString 
    call Print32
    
    call kernelLocation ;control handoff to kernel
    jmp $


bootString db "DiskCl Real", 0
license db "h = help b = boot", 0
sectorString db "l, 32. h, 64", 0
kernelLoadString db "Reading Disk", 0
pmString db "Protection", 0
bootDrive db 0
userInput db 0
inputString db 0


%include "./bootloader/printer.asm"
%include "./bootloader/readDisk.asm"
%include "./bootloader/hyperjump.asm"
%include "./bootloader/gdt.asm"
%include "./bootloader/32Printer.asm"

times 510 - ($-$$) db 0
dw 0xaa55
