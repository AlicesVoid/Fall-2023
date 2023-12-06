; CPSC-240 FINAL PROJECT: ASM CALCULATOR 
; Amelia Rotondo - CWID: 887925113

; printing macro 
%macro	print 	2
        mov     rax, 1					;SYS_write
        mov     rdi, 1					;standard output device
        mov     rsi, %1					;output string address
        mov     rdx, %2					;number of character
        syscall						;calling system services
%endmacro


; scanning macro 
%macro	scan 	2
        mov     rax, 0					;SYS_read
        mov     rdi, 0					;standard input device
        mov     rsi, %1					;input buffer address
        mov     rdx, %2					;number of character
        syscall						;calling system services
%endmacro

; single-character ascii to unsigned integer macro
%macro atoi
%endmacro

; single-character unsigned integer to ascii macro
%macro itoa
%endmacro

; Variable Declarations 
section .bss
buffer resb 10
output resb 18
total  resw 1
sign   resw 1
num    resw 1

; Constant Value Declarations
section .data
msg1	db	"Enter Operation String: "
msg2    db  " = "

; Start the Program 
section .text
        global _start
_start:

; Print msg1

; Scan the Input String (store it in buffer) 

; Store the Input String with msg2 at the end of it as Output String

; Set the Total to Zero 

; Determine First Character and Add it to Total 

; Go Through Input Parsing Loop (jump to parseLoop)

; Convert the Total to ASCII (jump to totalToASCII)

; Print a New Line 

; Print the Output String 

; End the Program 

parseLoop:
; If the Buffer doesn't have two more characters, stop the parseLoop

; Grab the Next Two Characters of the Buffer (stored as sign and num)

; Determine if sign is '+' or '-' or '*' or '/' 

; Determine the Digit of the num (atoi)

; Do the sign operation with the num digit onto the Total 

; Store the New Total as the Total 

totalToASCII:: 

; While the total is not zero, continue converting

; Divide the Total by 10 and get the Integer Value 

; Convert that Integer Value to ASCII 

; Add the ASCII Value to the end of the Output String

processSign:
; If the sign is not a valid sign, stop the processSign

; If the sign is '+', add the num to the total

; If the sign is '-', subtract the num from the total

; If the sign is '*', multiply the total by the num

; If the sign is '/', divide the total by the num
