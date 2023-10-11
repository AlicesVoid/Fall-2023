section .data
    dividend dd 10000   ; 32-bit dividend
    divisor  dd 25      ; 32-bit divisor
    quotient dd 0       ; 32-bit quotient
    remainder dd 0      ; 32-bit remainder

section .text
global _start

_start:
    ; Load the dividend into edx:eax
    mov     eax, [dividend]
    xor     edx, edx     ; Clear edx (upper bits)

    ; Load the divisor into ecx
    mov     ecx, [divisor]

    ; Perform division
    div     ecx

    ; Store the quotient and remainder
    mov     [quotient], eax
    mov     [remainder], edx

    ; Exit the program
    mov     eax, 1        ; syscall number for sys_exit
    xor     ebx, ebx      ; Exit code 0
    int     0x80          ; Invoke the syscall
