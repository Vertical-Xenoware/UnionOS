
default:
	nasm ./Secondboot/kernelEntry.asm -f elf -o kernel_entry.o
	nasm ./kernel/asmExtern.asm -f elf -o extern.o
	/usr/local/i386elfgcc/bin/i386-elf-gcc -ffreestanding -c ./kernel/main.c -o kernel.o
	/usr/local/i386elfgcc/bin/i386-elf-ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o extern.o --oformat binary
	nasm ./Secondboot/bootsect.asm -f bin -o bootsect.bin
	cat bootsect.bin kernel.bin > ./bochsemu/os-image.bin

grub:
	nasm ./Secondboot/kernelEntry.asm -f elf -o kernel_entry.o
	nasm ./kernel/asmExtern.asm -f elf -o extern.o
	/usr/local/i386elfgcc/bin/i386-elf-gcc -ffreestanding -c ./kernel/main.c -o kernel.o
	/usr/local/i386elfgcc/bin/i386-elf-ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o extern.o --oformat binary
	nasm ./Secondboot/bootsect.asm -f bin -o bootsect.bin
	cat bootsect.bin kernel.bin > ./isodir/boot/os-image.bin
	grub-mkrescue -o ./bochsemu/union.iso isodir
