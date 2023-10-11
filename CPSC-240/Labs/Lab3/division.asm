; division.asm
; unsigned long num1 = 50,000,000,000;
; unsigned int num2 = 3,333,333;
; unsigned int quotient = 0, remainder = 0;
; quotient = num1 / num2;
; remainder = num1 % num2;

section .data
    num1        dq 50000000000    ; 64-bit unsigned long num1
    num2        dd 3333333        ; 32-bit unsigned int num2
    quotient    dd 0              ; 32-bit unsigned int quotient
    remainder   dd 0              ; 32-bit unsigned int remainder

section .text
    global _start

_start:
    ; Load the value of num1 into rbx
    mov     rbx, [num1]       ; Load num1 into rbx (64-bit)

    ; Load the value of num2 into ecx
    mov     ecx, [num2]      ; Load num2 into ecx (32-bit)

    ; Perform the unsigned division and store the quotient in rax
    add     rax, rbx
    div     rcx              ; Unsigned divide rbx by ecx

    ; Store the quotient in quotient
    mov     [quotient], rax  ; Store the 32-bit quotient in quotient

    ; Store the remainder in remainder
    mov     [remainder], rdx ; Store the 32-bit remainder in remainder

    ; Exit the program
    mov     rax, 60          ; syscall number for sys_exit
    xor     rdi, rdi         ; Exit code 0
    syscall
