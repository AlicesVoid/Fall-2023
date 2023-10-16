; Lab 5: parity.asm

;-- PSEUDOCODE -------------------------------

;unsigned short array[7] = {12, 1003, 6543, 24680, 789, 30123, 32766};
;unsigned short even[7];
;register long rsi = 0, rdi = 0;
;do {
;	if(array[rsi] % 2 == 0) {
;		even[rdi] = array[rsi];
;		rdi++;
;	}
;	rsi++;
;} while(rsi < 7);
;----------------------------------------------

section .data
array   dw  12, 1003, 6543, 24680, 789, 30123, 32766
even    resw 7

section .text
global _start

_start:
    ; Initialization
    mov rsi, 0        ; rsi is the index for the array[]

parityLoop:
    ; Load array[rsi] into ax
    mov ax, [array + rsi*2]

    ; Check if even by taking modulo 2
    ; Using "test" instruction for checking even/odd as it checks the least significant bit
    test ax, 1
    jnz storeZero     ; Jump if odd

    ; If even, store into even[]
    mov [even + rsi*2], ax
    jmp next

storeZero:
    ; Store 0 in even[]
    mov word [even + rsi*2], 0

next:
    ; Increment rsi
    inc rsi

    ; Check if we've processed all elements of array
    cmp rsi, 7
    jb parityLoop

    ; Exit the program
    mov rax, 60       ; syscall: exit
    xor rdi, rdi      ; status 0
    syscall

