
OBJ=app.out
SRCNAS=entry.o
SRCMAIN=main.o

$(OBJ): $(SRCNAS) $(SRCMAIN)
	ld -m elf_i386 $^ -o $(OBJ)
$(SRCNAS):entry.asm
	nasm -f elf $^ -o $@
$(SRCMAIN):main.c
	gcc -m32 -c $^ -o $@
clean:
	rm $(OBJ) $(SRCNAS) $(SRCMAIN)
