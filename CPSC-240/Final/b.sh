yasm -f elf64 -g dwarf2 -l final.lst final.asm
ld -o final final.o
# ./final.o

