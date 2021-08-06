
@echo off
echo Begin kernel process
echo ++++++++++++++++++++++++++++++++++++++
nasm ./bootloader/kernelEntry.asm -f elf32 -o kernel_entry.o
nasm ./kernel/asmExtern.asm -f elf32 -o extern.o
nasm ./kernel/drivers/port.asm -f elf32 -o portasm.o
/usr/local/i386elfgcc/bin/i386-elf-gcc -ffreestanding -masm=intel -c ./kernel/main.c -o kernel.o
/usr/local/i386elfgcc/bin/i386-elf-gcc -ffreestanding -masm=intel -c ./kernel/drivers/port.c -o portc.o
/usr/local/i386elfgcc/bin/i386-elf-ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o extern.o portc.o portasm.o --oformat binary

echo Begin bootloader process
nasm ./bootloader/bootsect.asm -f bin -o bootsect.bin
cat bootsect.bin kernel.bin > ./bochsemu/os-image.bin
