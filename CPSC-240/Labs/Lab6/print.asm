; Amelia Rotondo: Lab 6 

; == PSEUDOCODE ===============================
;Calculates  1+2+3+...+99 and displays the result in a terminal window
;char str1[] = "1+2+3+...+99=";
;register short cx = 1;
;short sum = 0;
;char ascii[5] = "0000\n";
;for(cx=1; cx<=99; cx++)
;    sum += cx;
;ascii = itoa(sum);
;cout << str1 << ascii;

; == ASSEMBLY =================================

section .data
str1    db      "1 + 2 + 3 +...+ 99 = ", 0

section .bss
sum     resw    1
ascii   resb    5

section .text
        global _start
_start:
    ; calculates 1+2+3+...+99
    mov     cx, 1
next1:
    add     word[sum], cx          ; sum += cx
    inc     cx                     ; cx++
    cmp     cx, 100                ; compare cx with 100
    jb      next1                  ; if(cx<100) goto next1

    ; convert sum to ASCII
    mov     rsi, 3                 ; Index for ascii buffer, starting from the end
    mov     ax, word[sum]          ; Load sum
    mov     bx, 10                 ; Set divisor
next2:
    xor     dx, dx                 ; Clear any previous remainder
    div     bx                     ; Divide by 10, result in AX, remainder in DX
    add     dl, '0'                ; Convert to ASCII
    mov     [ascii+rsi], dl        ; Store ASCII character
    dec     rsi                    ; Move to next position
    test    ax, ax                 ; Check if quotient is zero
    jnz     next2                  ; If not, continue loop

    ; add newline at the end
    mov     byte [ascii+4], 10     ; Store newline character

    ; cout << str1
    mov     rax, 1                 ; SYS_write
    mov     rdi, 1                 ; where to write
    mov     rsi, str1              ; address of str1
    mov     rdx, 21                ; characters to write
    syscall

    ; cout << ascii
    mov     rax, 1             ; SYS_write
    mov     rdi, 1             ; where to write
    lea     rsi, [ascii]       ; address of ascii
    mov     rdx, 5             ; characters to write (including newline)
    syscall



    ; exit program
    mov     rax, 60                ; terminate executing process
    xor     rdi, rdi               ; exit status
    syscall                        ; calling system services
