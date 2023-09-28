;unsigned char num1 = 215;	//unsigned 8-bit variable
;unsigned char num2 = 65;	//unsigned 8-bit variable
;unsigned char num3 = 115;	//unsigned 8-bit variable
;unsigned short diff = 0;	//unsigned 16-bit variable
;unsigned int product = 0;	//unsigned 32-bit variable
;diff = short(num1 - num2);
;product = diff * short(num3);

section .data
    num1 db 215
    num2 db 65
    num3 db 115
    diff dw 0
    product dd 0

section .text
    global _start

_start:
    
    movzx ax, byte [num1]   ; Load num1 into ax (16-bit)
    movzx bx, byte [num2]   ; Load num2 into bx (16-bit)
    movzx cx, byte [num3]   ; Load num3 into cx (16-bit)

    mov r8w, ax             ; r8w = num1
    sub r8w, bx             ; r8w = (num1 - num2)
    mov word[diff], r8w     ; diff = short(num1 - num2)

    movsx eax, r8w          ; eax = diff
    mul cx                  ; eax = diff * short(num3)
    mov dword[product], eax ; product = diff * short(num3)

    ; Exit the program
    mov     rax, 60         ; syscall number for sys_exit
    xor     rdi, rdi        ; Exit code 0
    syscall                 ; Calling system services
