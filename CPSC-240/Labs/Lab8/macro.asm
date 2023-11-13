; Amelia Rotondo, CWID: 887925113, Lab 8 

;== PSEUDOCODE====================================

; #begin define print(string, numOfChar)
; 	rax = 1;
; 	rdi = 1;
; 	rsi = &string;
; 	rdx = numOfChar;
; 	syscall;
; #end
; #begin define scan(buffer, numOfChar)
; 	rax = 0;
; 	rdi = 0;
; 	rsi = &buffer;
; 	rdx = numOfChar;
; 	syscall;
; #end

; char buffer[4];
; int n;
; int sumN;
; char msg1[26] = "Input a number (001~999): ";
; char msg2[16] = "1 + 2 + 3 +...+ ";
; char msg3[4] = " = ";
; char ascii[10];

; print(msg1, 26);
; scan(buffer, 4);
; n = atoi(buffer);
; rsi = 0;
; do {
;     sumN += rsi;
; } while(rsi >= 0);
; ascii = itoa(sumN);
; print(msg2, 20);
; print(buffer, 3);
; print(msg3, 3);
; print(ascii, 7);

;== ASSEMBLY =====================================

section .data
buffer      resb    4
n           resd    1           ; 4 bytes for an integer
sumN        resd    1
msg1        db      "Input a number (001~999): ", 0
msg2        db      "1 + 2 + 3 +...+ ", 0
msg3        db      " = ", 0
ascii       resb    10
newline     db      10          ; Newline character


section .bss
temp        resb    10          ; Temporary buffer for conversion

section .text
    global _start

_start:
    ; Print msg1
    mov     rsi, msg1
    mov     rdx, 26
    call    print

    ; Scan buffer
    lea     rsi, [buffer]
    mov     rdx, 4
    call    scan

    ; Convert buffer to integer (atoi)
    lea     rsi, [buffer]
    call    atoi
    mov     [n], rax            ; Store converted integer in n

    ; Initialize sumN to 0
    mov     dword [sumN], 0

    ; Start counter from 1 for sum calculation
    mov     ecx, 1

sum_loop:
    cmp     ecx, [n]           ; Compare counter with n
    jg      end_sum_loop       ; If counter > n, end loop
    add     [sumN], ecx        ; Add counter to sumN
    inc     ecx                ; Increment counter
    jmp     sum_loop

end_sum_loop:
    ; sumN now contains the sum of numbers from 1 to n

    ; Convert sumN to ASCII (itoa)
    lea     rsi, [sumN]
    lea     rdi, [ascii]
    call    itoa

    ; Print msg2
    mov     rsi, msg2
    mov     rdx, 16
    call    print

    ; Print buffer (n)
    mov     rsi, buffer
    mov     rdx, 3
    call    print

    ; Print msg3 (including equals sign)
    mov     rsi, msg3
    mov     rdx, 3
    call    print

    ; Print ascii (sumN)
    mov     rsi, ascii
    mov     rdx, 7
    call    print

    ; Print newline
    mov     rsi, newline
    mov     rdx, 1
    call    print

    ; Exit program
    mov     rax, 60
    xor     rdi, rdi
    syscall

; Function: print
print:
    mov     rax, 1              ; SYS_write
    mov     rdi, 1              ; File descriptor for stdout
    syscall
    ret

; Function: scan
scan:
    mov     rax, 0              ; SYS_read
    mov     rdi, 0              ; File descriptor for stdin
    syscall
    ret

atoi:
    xor     rax, rax            ; Clear rax (result)
    xor     rcx, rcx            ; Clear rcx (index)

atoi_loop:
    movzx   rdi, byte [rsi+rcx] ; Load a byte from the string
    cmp     rdi, '0'
    jl      atoi_done           ; If less than '0', it's a non-numeric character
    cmp     rdi, '9'
    jg      atoi_done           ; If greater than '9', it's a non-numeric character
    sub     rdi, '0'            ; Convert from ASCII to integer
    imul    rax, rax, 10        ; Multiply the current result by 10
    add     rax, rdi            ; Add the new digit
    inc     rcx                 ; Move to the next character
    jmp     atoi_loop

atoi_done:
    ret                         ; Return with the result in rax

itoa:
    mov     rax, rsi            ; Move the integer to rax
    mov     rcx, 10             ; Set divisor to 10
    lea     rdi, [rdi+9]        ; Point rdi to the end of the buffer

reverse_loop:
    mov     rsi, rdi            ; Save current buffer position

itoa_loop:
    xor     rdx, rdx            ; Clear rdx
    div     rcx                 ; Divide rax by 10, result in rax, remainder in rdx
    add     dl, '0'             ; Convert remainder to ASCII
    dec     rdi                 ; Move back in the buffer
    mov     [rdi], dl           ; Store ASCII character
    test    rax, rax            ; Check if the quotient is zero
    jnz     itoa_loop           ; If not, continue loop

    ; Adjust the start of the string if necessary
    cmp     rsi, rdi            ; Compare start and end buffer positions
    je      itoa_done           ; If equal, the string is at the buffer start
    movsb                       ; Move string to the start of the buffer
    jmp     reverse_loop

itoa_done:
    mov     byte [rsi], 0       ; Null-terminate the string
    ret

