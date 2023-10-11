; subtraction.asm
; signed short num1 = 20000;
; signed short num2 = 30000;
; signed int dif = 0;
; dif = int(num1 - num2);

section .data
    num1    dw 20000     ; Signed short num1
    num2    dw 30000     ; Signed short num2
    dif     dd 0         ; Signed int dif

section .text
    global _start

_start:
    ; Load the values of num1 and num2 into registers
    movsx rax, word [num1]   ; Load num1 (16-bit) sign-extended to rax (64-bit)
    movsx rbx, word [num2]   ; Load num2 (16-bit) sign-extended to rbx (64-bit)

    ; Subtract num2 from num1
    add r8, rax             ; Set-Up Difference using Addition
    sub r8, rbx             ; Perform the subtraction

    ; Store only the last 32 bits of r8 in dif
    mov [dif], r8d          ; Store the lower 32 bits of r8 in dif

    ; Exit the program
    mov rax, 60              ; syscall number for sys_exit
    xor rdi, rdi             ; Exit code 0
    syscall
