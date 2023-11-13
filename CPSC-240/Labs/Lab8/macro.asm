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

; Printing Macro
%macro	print 	2
        mov     rax, 1					
        mov     rdi, 1					
        mov     rsi, %1					
        mov     rdx, %2					
        syscall
%endmacro

; Scanning Macro
%macro	scan 	2
        mov     rax, 0					
        mov     rdi, 0					
        mov     rsi, %1					
        mov     rdx, %2					
        syscall
%endmacro

section .bss
buffer	resb	4
n	resd	1
sumN	resd    1
ascii	resb    10

section .data
msg1	db	"Input a number (001~999): ", 0
msg2	db	"1 + 2 + 3 +...+ ", 0
msg3	db	" = ", 0

section .text
        global _start
_start:
	print	msg1, 26				
	scan	buffer, 4				
	
	mov	rax, 0					
	mov	rsi, buffer				
	call	atoi				
	mov	[n], eax				

	mov	rsi, 1					
	mov	[sumN], 0				
sumLoop:
	add	[sumN], rsi				
	inc	rsi					
	cmp	rsi, [n]				
	jle	sumLoop					

	mov	eax, [sumN]				
	mov	rsi, ascii				
	call	itoa				

	print	msg2, 16			
	print	buffer, 3			
	print	msg3, 3				
	print	ascii, 7			

        mov     rax, 60			
        mov     rdi, 0			
        syscall


atoi:
	ret

itoa:
	ret
