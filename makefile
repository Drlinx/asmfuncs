functions: functions.o
	gcc -o functions functions.o -no-pie
functions.o:
	nasm -f elf64 -g -F dwarf functions.asm -l functions.lst -o functions.o
clean:
	rm ./functions ./functions.lst ./functions.o
