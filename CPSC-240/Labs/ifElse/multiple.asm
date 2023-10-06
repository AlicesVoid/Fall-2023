section .data
    num db 225          ; 8-bit variable to store the value of num
    mul_15 db 0         ; 8-bit variable to store mul_15
    other db 0          ; 8-bit variable to store other

section .text
global _start

_start:
    mov al, [num]       ; Load the value of num into AL (8 bits)
    xor ah, ah           ; Clear AH

    mov cl, 3            ; Load 3 into CL
    xor ch, ch           ; Clear CH

    div cl               ; Divide AL by 3
    test ah, ah          ; Check if remainder is non-zero
    jnz not_divisible    ; Jump if not divisible

    mov cl, 5            ; Load 5 into CL
    xor ch, ch           ; Clear CH

    mov al, [num]       ; Reload the value of num into AL
    div cl               ; Divide AL by 5
    test ah, ah          ; Check if remainder is non-zero
    jnz not_divisible    ; Jump if not divisible

    inc byte [mul_15]   ; Increment mul_15
    jmp end_program

not_divisible:
    inc byte [other]    ; Increment other

end_program:
    ; Exit the program
    mov eax, 1           ; syscall number for exit (1)
    xor ebx, ebx          ; exit code 0
    int 0x80             ; make the syscall

section .bss
    ; Define uninitialized variables
