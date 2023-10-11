; ex2_addition.asm
; unsigned char num1 = 50000, num2 = 40000;
; unsigned short sum = 0;
; sum = short(num1 + num2);

section .data
    num1    dw 50000     ; Unsigned short num1
    num2    dw 40000     ; Unsigned short num2
    sum     dd 0         ; Unsigned int sum

section .text
    global _start

_start:
    ; Load the values of num1 and num2 into registers
    movzx rax, word [num1]   ; Load num1 (16-bit) zero-extended to rax (64-bit)
    movzx rbx, word [num2]   ; Load num2 (16-bit) zero-extended to rbx (64-bit)

    ; Add num1 and num2
    add r8, rbx             ; Perform the addition
    add r8, rax

    ; Store the result in sum
    mov [sum], r8           ; Store the value in r8 (the sum) into [sum]

    ; Exit the program
    mov rax, 60             ; syscall number for sys_exit
    xor rdi, rdi            ; Exit code 0
    syscall
