; multiplication_debug.asm
; unsigned int num1 = 300000;
; unsigned int num2 = 400000;
; unsigned long long product = 0;
; product = (unsigned long long)num1 * num2;

section .data
    num1    dd 300000       ; 32-bit unsigned int num1
    num2    dd 400000       ; 32-bit unsigned int num2
    product dq 0            ; 64-bit unsigned long long product

section .text
    global _start

_start:
    ; Load the value of num1 into a separate register (ecx)
    mov     ecx, [num1]    ; Load num1 into ecx (32-bit)

    ; Load the value of num2 into a separate register (ebx)
    mov     ebx, [num2]    ; Load num2 into ebx (32-bit)

    ; Perform the unsigned multiplication and store the result in rax
    mov     rax, rcx       ; Copy num1 from ecx to rax (64-bit)
    mul     rbx            ; Unsigned multiply rax by ebx (32-bit)

    ; Store the result in product
    mov     [product], rax ; Store the 64-bit result in product

    ; Exit the program
    mov     rax, 60        ; syscall number for sys_exit
    xor     rdi, rdi       ; Exit code 0
    syscall
