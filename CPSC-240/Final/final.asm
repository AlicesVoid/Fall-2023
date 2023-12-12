; ===== PSEUDOCODE : ====================

; #begin define print(addr, n)
; rax = 1;
; rdi = 1;
; rsi = addr of string;
; rdx = n;
; syscall;
; #end
; #begin define scan(&addr, n)
; rax = 1;
; rdi = 1;
; rsi = &addr;
; rdx = n;
; syscall;
; #end
; char num1, num2, num3, result;
; char buffer[2];
; char ascii[3];
; char msg1[24] = "Input 1st number (0~9): ";
; char msg2[24] = "Input 2nd number (0~9): ";
; char msg3[24] = "Input 3rd number (0~9): ";
; char msg4[9] = "result = ";
; void main() {
; print msg1, 24;
; scan buffer, 2
; num1 = atoi(buf);
; print msg2, 24;
; scan buffer, 2
; num2 = atoi(buf)
; print msg3, 24;
; scan buffer, 2
; num3 = atoi(buf)
; call calculate(num1, num2, num3, &result);
; call toString(&result, &ascii)
; print msg4, 10;
; print ascii, 4;
; }
; void calculate(num1, num2, num3, &result) {
; result = num1 * num2 + num3;
; }
; void toString(&result, &ascii) {
; ascii = itoa(result);
; }

; === ASSEMBLY CODE : ====================

; printing macro 
%macro  print   2
        mov     rax, 1                 ;SYS_write
        mov     rdi, 1                 ;standard output device
        mov     rsi, %1                ;output string address
        mov     rdx, %2                ;number of character
        syscall                        ;calling system services
%endmacro

; scanning macro 
%macro  scan   2
        mov     rax, 0                 ;SYS_read
        mov     rdi, 0                 ;standard input device
        mov     rsi, %1                ;input buffer address
        mov     rdx, %2                ;number of character
        syscall                        ;calling system services
%endmacro

; Convert ASCII character to integer
%macro atoi 1
    sub al, '0'        ; Subtract ASCII value of '0' (48) from the ASCII character in AL
    movzx %1, al       ; Zero-extend AL to AX (or the provided register)
%endmacro


; Convert integer to ASCII character
%macro itoa 2
    add %1, '0'      ; Add ASCII value of '0' (48) to the integer
    mov %2, %1       ; Store the result in the destination register
%endmacro

section .bss
    num1 resb 1
    num2 resb 1
    num3 resb 1
    result resb 1
    buffer resb 2
    ascii resb 4

section .data
    msg1 db "Input 1st number (0~9): ", 0
    msg2 db "Input 2nd number (0~9): ", 0
    msg3 db "Input 3rd number (0~9): ", 0
    msg4 db "result = ", 0

section .text
    global _start 

_start: 

    ; initialize result to 1 (Not doing This Any More)
    ; mov byte [result], 1
    ; movzx r8, byte [result]

    ; print msg1 
    print msg1, 24

    ; recieve input and store it as an integer (atoi)
    scan buffer, 2

    ; store the input in num1
    movzx ax, byte [buffer]
    atoi ax
    mov byte [num1], al

    ; print msg2
    print msg2, 24

    ; recieve input and store it as an integer (atoi)
    scan buffer, 2

    ; store the input in num2
    movzx ax, byte [buffer]
    atoi ax
    mov byte [num2], al

    ; print msg3
    print msg3, 24

    ; recieve input and store it as an integer (atoi)
    scan buffer, 2

    ; store the input in num3
    movzx ax, byte [buffer]
    atoi ax
    mov byte [num3], al

    ; call calculateTotal
    call calculateResult

    ; call toString
    mov bx, 0
    call toString

    ; print msg4
    print msg4, 9

    ; print ascii
    print ascii, 4

    ; exit
    mov rax, 60
    mov rdi, 0
    syscall

calculateResult: 
    ; Load num1 and num2 into 16-bit registers for multiplication
    movzx ax, byte [num1]    ; Load num1 into AX
    movzx bx, byte [num2]    ; Load num2 into BX
    imul bx                  ; Multiply AX (num1) by BX (num2), result in AX:DX

    ; Load num3 and add it to the result of the multiplication
    movzx bx, byte [num3]    ; Load num3 into BX
    add ax, bx               ; Add num3 to the lower word of the multiplication result in AX

    ; Store the lower byte of the result back into 'result'
    ; Assuming the result will not exceed 255
    mov [result], al

    ret

toString:
    movzx ax, byte [result]  ; Load the result into AX for division
    xor rcx, rcx             ; RCX will count the number of digits
    mov rdi, ascii           ; RDI points to the start of the ASCII buffer

    ; Check if the result is 0
    test ax, ax
    jnz convertLoop
    ; Handle result = 0
    mov byte [ascii], '0'
    mov byte [ascii+1], 0x0A  ; Newline character
    mov byte [ascii+2], 0     ; Null terminator
    jmp endToString

convertLoop:
    ; Prepare DX:AX for division
    xor dx, dx
    mov bx, 10
    div bx

    ; Convert DX to ASCII and store at the end of 'ascii'
    add dl, '0'
    mov [rdi + rcx], dl
    inc rcx

    ; Loop back if AX is not zero
    test ax, ax
    jnz convertLoop

    ; Append newline and reverse the string
    ; mov [rdi + rcx], dl
    inc rcx
    mov byte [rdi + rcx], 0x0A     ; Newline character
    call reverseString

endToString:
    ret

reverseString:
    ; Reverse the string in 'ascii', excluding newline and null terminator
    dec rcx                  ; Exclude the newline and null terminator
    mov rsi, ascii           ; RSI points to the first character
    lea rdi, [rsi + rcx - 1] ; RDI points to the last character before newline

reverseLoop:
    cmp rsi, rdi
    jge endReverse

    mov al, [rsi]
    mov bl, [rdi]
    mov [rsi], bl
    mov [rdi], al

    inc rsi
    dec rdi

    jmp reverseLoop

endReverse:
    ret
