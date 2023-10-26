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
str1    db  "1+2+3+...+99=", 0
ascii   resb 5              ; Reserve 5 bytes for the ASCII representation of the sum

section .bss
sum     resw 1              ; Reserve a word (2 bytes) for the sum

section .text
global _start
_start:
    ; Initialize cx to 1
    mov     cx, 1
    
    ; Initialize sum to 0
    xor     ax, ax
    mov     [sum], ax
    
    ; Calculate 1+2+3+...+99
calculate_sum:
    add     [sum], cx        ; sum += cx
    inc     cx               ; cx++
    cmp     cx, 100          ; Compare cx with 100
    jb      calculate_sum    ; If cx < 100, repeat the loop
    
    ; Convert sum to ASCII
    mov     ax, [sum]        ; Move sum into ax
    mov     rdi, ascii+4     ; Start filling the ASCII buffer from the end
    add_terminator:
        mov     byte [rdi], 10 ; Add a newline at the end of the ASCII buffer
        dec     rdi             ; Move to the previous position
    convert_to_ascii:
        xor     dx, dx         ; Clear any previous remainder
        div     byte [10]      ; Divide ax by 10, result in al, remainder in ah
        add     dl, '0'        ; Convert the remainder to ASCII
        mov     [rdi], dl      ; Store the ASCII character
        dec     rdi            ; Move to the previous position in the ASCII buffer
        test    ax, ax         ; Check if ax is 0
        jnz     convert_to_ascii ; If not, continue converting
    
    ; Print the expression
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, str1
    mov     rdx, 14
    syscall
    
    ; Print the sum
    mov     rax, 1
    mov     rdi, 1
    lea     rsi, [rdi + 1]   ; rsi points to the first non-zero character in ascii
    mov     rdx, 5
    syscall
    
    ; Exit the program
    mov     rax, 60
    xor     rdi, rdi
    syscall
