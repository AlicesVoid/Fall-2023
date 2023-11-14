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

%macro	print 	2
        mov     rax, 1					;SYS_write
        mov     rdi, 1					;standard output device
        mov     rsi, %1					;output string address
        mov     rdx, %2					;number of characters
        syscall						;calling system services
%endmacro

%macro	scan 	2
        mov     rax, 0					;SYS_read
        mov     rdi, 0					;standard input device
        mov     rsi, %1					;input buffer address
        mov     rdx, %2					;number of characters
        syscall						;calling system services
%endmacro

e
section .bss
buffer  resb    4
n       resw    1
sumN    resd    1       ; sumN as double-word (32-bit)
ascii   resb    10
ascii2  resb    3       ; 3 characters for n (up to 999)

section .data
msg1    db  "Input a number (000~999): ", 0
msg2    db  "1 + 2 + 3 +...+ ", 0
msg3    db  " = ", 0

section .text
        global _start
_start:
    print   msg1, 26                ; Print message 1
    scan    buffer, 4               ; Scan buffer

    ; Convert buffer to integer and store in n
    mov     ax, 0                   ; Clear ax
    mov     bx, 10                  ; Set bx = 10 for multiplication
    mov     rsi, 0                  ; Counter = 0
inputLoop:
    and     byte[buffer+rsi], 0fh   ; Convert ASCII to number
    add     al, byte[buffer+rsi]    ; al = number
    adc     ah, 0                   ; Adjust carry for ah
    cmp     rsi, 2                  ; Compare rsi with 2
    je      skipMul                 ; Skip multiplication if rsi = 2
    mul     bx                      ; Multiply for conversion
skipMul:
    inc     rsi                     ; Increment rsi
    cmp     rsi, 3                  ; Compare rsi with 3
    jl      inputLoop               ; Loop if rsi < 3
    mov     word[n], ax             ; Store converted number in n

    ; Calculate the arithmetic series sum (1+2+3+...+n)
    movsx     eax, word[n]            ; Get n into eax
    mov     ebx, eax                ; Copy n to ebx
    add     eax, 1                  ; Increment n by 1 (n+1)
    imul    ebx                     ; Multiply eax (n+1) by ebx (n), result in eax
    shr     eax, 1                  ; eax = (n * (n + 1)) / 2
    mov     dword[sumN], eax        ; Store the result in sumN

; converts sumN into ASCII
; Part A - Successive division
mov     eax, dword[sumN]           ; Get integer (32-bit from sumN)
xor     ecx, ecx                   ; digitCount = 0 (clear ecx)
mov     ebx, 10                    ; Set for dividing by 10

divideLoop:
    xor     edx, edx               ; Clear edx (high part of dividend)
    div     ebx                    ; Divide edx:eax by ebx, quotient in eax, remainder in edx
    push    rdx                    ; Push remainder (use rdx for 64-bit push)
    inc     ecx                    ; Increment digitCount
    test    eax, eax               ; Check if quotient is non-zero
    jnz     divideLoop             ; If quotient is non-zero, continue loop

; Part B - Convert remainders and store
mov     rbx, ascii                 ; Get addr of ascii
xor     rdi, rdi                   ; rdi = 0 (clear rdi)

popLoop:
    pop     rax                    ; Pop intDigit (use rax for 64-bit pop)
    add     al, '0'                ; Convert digit to ASCII
    mov     byte [rbx+rdi], al     ; Store ASCII character
    inc     rdi                    ; Increment rdi
    loop    popLoop                ; If (digitCount > 0) goto popLoop
mov     byte [rbx+rdi], 10         ; Null-terminate the string


; Initialize ascii2 with '0's
mov     byte [ascii2], '0'
mov     byte [ascii2+1], '0'
mov     byte [ascii2+2], '0'

; converts n into ASCII
mov 	ax, word[n] 				;get integer n
mov 	rcx, 0 					;digitCount = 0
mov 	bx, 10 					;set for dividing by 10
cmp     ax, 0                   ;check if n is zero
je      zeroCase                ;if n is zero, handle separately
divideLoopN:
	mov 	dx, 0
	div 	bx 					;divide n by 10
	push 	rdx 					;push remainder
	inc 	rcx 					;increment digitCount
	test    ax, ax              ;check if quotient is zero
	jnz     divideLoopN          ;if not zero, continue
jmp     checkPadding
zeroCase:
    push    0                   ; Push zero (for n=0 case)
    inc     rcx
checkPadding:
    cmp     rcx, 3              ; Check if we have less than 3 digits
    jge     popDigits           ; If 3 or more, start popping
    push    0                   ; Pad with zero
    inc     rcx
    jmp     checkPadding
popDigits:
; Convert remainders and store in ASCII format
mov 	rbx, ascii2 				;get addr of ascii2
mov 	rdi, 0 					;rdi = 0
popLoopN:
	pop 	rax 					;pop intDigit
	add 	al, "0" 				;al = al + 0x30
	mov 	byte [rbx+rdi], al 			;ascii2[rdi] = al
	inc 	rdi 					;increment rdi
	loop 	popLoopN 				;if (digitCount > 0) goto popLoopN

noNConversion:

	print	msg2, 16				;cout << msg2
    print   ascii2, 3               ; Print the scanned number
    print   msg3, 3                 ;cout << msg3
	print	ascii, 7				;cout << ascii

        mov     rax, 60					;terminate program
        mov     rdi, 0					;exit status
        syscall						;calling system services