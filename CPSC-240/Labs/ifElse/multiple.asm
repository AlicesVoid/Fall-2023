section .data
    num     dw 225       ; Unsigned short num
    mul_15  dw 0         ; Unsigned short mul_15
    other   dw 0         ; Unsigned short other

section .text
    global _start

_start:
    ; Load the value of num into a register (ax)
    mov     ax, [num]

    ; Check if num is divisible by 3 (num % 3 == 0)
    test    ax, 3        ; Check if the two least significant bits are both 0
    jnz     not_divisible_by_3

    ; Check if num is divisible by 5 (num % 5 == 0)
    test    ax, 5        ; Check if the least significant bit is 0
    jnz     not_divisible_by_5

    ; If both conditions are met, increment mul_15
    inc     word [mul_15]
    jmp     done

not_divisible_by_3:
    ; If num is not divisible by 3, increment other
    inc     word [other]

not_divisible_by_5:
    ; If num is not divisible by 5, increment other
    inc     word [other]

done:
    ; Exit the program
    mov     rax, 60      ; syscall number for sys_exit
    xor     rdi, rdi     ; Exit code 0
    syscall
