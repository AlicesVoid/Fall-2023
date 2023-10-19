; Amelia Rotondo - Quiz 2

; ====== PSEUDOCODE: ==================================
;signed char num[10] = {-12, 23, 34, 45, -56, 67, -78, 89, 100, 0};
;			//8-bit numeric array
;signed char nEven[10];	//8-bit non-initial array
;register long rsi = 0	//64-bit register
;register long rdi = 0	//64-bit register
;while (num[rsi] != 0) {	//while num[rsi] != 0 continue
;	if(num[rsi] < 0 && num[rsi]%2 == 0) {	//if negative even number
;		nEven[rdi] = num[rsi];	//copy to nEven[rdi]
;		rdi++;	//rdi = rdi + 1
;	}
;	rsi++;	//rsi = rsi + 1
;}

; ===== ASSEMBLY: ======================================

section .data
num     db  -12, 23, 34, 45, -56, 67, -78, 89, 100, 0   ; 8-bit numeric array
nEven   resb 10                                         ; 8-bit non-initialized array

section .text
global _start

_start:
    ; Initialization
    xor rsi, rsi   ; rsi = 0, 64-bit register
    xor rdi, rdi   ; rdi = 0, 64-bit register

loopStart:
    ; Load value from num[rsi] into al
    movsx rax, byte [num + rsi]  ; Load 8-bit signed value to 64-bit rax with sign extension

    ; Check if num[rsi] is zero
    test al, al
    je exitLoop

    ; Check if num[rsi] is negative. If it's positive or zero, skip to end of loop.
    test al, al
    jns incrementRsi

    ; Check if even by taking modulo 2
    ; Using "test" instruction for checking even/odd
    test al, 1
    jnz incrementRsi ; Jump if odd

    ; If the number meets the criteria (negative and even), store in nEven[]
    mov [nEven + rdi], al
    inc rdi

incrementRsi:
    ; Increment rsi
    inc rsi
    jmp loopStart

exitLoop:
    ; Exit the program
    mov rax, 60    ; syscall: exit
    xor rdi, rdi   ; status 0
    syscall
