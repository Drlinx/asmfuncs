KassidyMaberryfunctions: KassidyMaberryfunctions.o
	gcc -o KassidyMaberryfunctions KassidyMaberryfunctions.o -no-pie
KassidyMaberryfunctions.o:
	nasm -f elf64 -g -F dwarf KassidyMaberryfunctions.asm -l KassidyMaberryfunctions.lst -o KassidyMaberryfunctions.o
clean:
	rm ./KassidyMaberryfunctions ./KassidyMaberryfunctions.lst ./KassidyMaberryfunctions.o
