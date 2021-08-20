
default:
	nasm ./bootloader/kernelEntry.asm -f elf32 -o kernel_entry.o
	nasm ./kernel/asmExtern.asm -f elf32 -o extern.o
	nasm ./kernel/drivers/port.asm -f elf32 -o portasm.o
	/usr/local/i386elfgcc/bin/i386-elf-gcc -ffreestanding -masm=intel -c ./kernel/main.c -o kernel.o
	/usr/local/i386elfgcc/bin/i386-elf-gcc -ffreestanding -masm=intel -c ./kernel/drivers/port.c -o portc.o
	/usr/local/i386elfgcc/bin/i386-elf-ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o extern.o portc.o portasm.o --oformat binary
	nasm ./bootloader/bootsect.asm -f bin -o bootsect.bin
	cat bootsect.bin kernel.bin > ./bochsemu/os-image.bin

grub:
	nasm ./bootloader/kernelEntry.asm -f elf32 -o kernel_entry.o
	nasm ./kernel/asmExtern.asm -f elf32 -o extern.o
	/usr/local/i386elfgcc/bin/i386-elf-gcc -ffreestanding -c ./kernel/main.c -o kernel.o
	/usr/local/i386elfgcc/bin/i386-elf-ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o extern.o --oformat binary
	nasm ./bootloader/bootsect.asm -f bin -o bootsect.bin
	cat bootsect.bin kernel.bin > ./isodir/boot/os-image.bin
	grub-mkrescue -o ./bochsemu/union.iso isodir

debug:
	nasm ./bootloader/kernelEntry.asm -f elf32 -o kernel_entry.o
	nasm ./kernel/asmExtern.asm -f elf32 -o extern.o
	nasm ./kernel/drivers/port.asm -f elf32 -o portasm.o
	/usr/local/i386elfgcc/bin/i386-elf-gcc -g -ffreestanding -masm=intel -c ./kernel/main.c -o kernel.o
	/usr/local/i386elfgcc/bin/i386-elf-gcc -g -ffreestanding -masm=intel -c ./kernel/drivers/port.c -o portc.o
	/usr/local/i386elfgcc/bin/i386-elf-ld -o ./bochsemu/kernel.elf -Ttext 0x1000 kernel_entry.o kernel.o extern.o portc.o portasm.o

diskclavier:
	nasm ./bootloader/kernelEntry.asm -f elf32 -o kernel_entry.o
	nasm ./kernel/asmExtern.asm -f elf32 -o extern.o
	nasm ./kernel/drivers/port.asm -f elf32 -o portasm.o
	/usr/local/i386elfgcc/bin/i386-elf-gcc -ffreestanding -masm=intel -c ./kernel/main.c -o kernel.o
	/usr/local/i386elfgcc/bin/i386-elf-gcc -ffreestanding -masm=intel -c ./kernel/drivers/port.c -o portc.o
	/usr/local/i386elfgcc/bin/i386-elf-ld -o kernel.bin -Ttext 0x0000 kernel_entry.o kernel.o extern.o portc.o portasm.o --oformat binary
	dd if=/dev/zero of=../diskclavier/floppy3.img bs=1024 count=1440
	dd if=kernel.bin of=../diskclavier/floppy3.img seek=0 conv=notrunc