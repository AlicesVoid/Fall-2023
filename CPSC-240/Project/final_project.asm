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

; Convert ASCII character to integer
%macro atoi 2
    sub %1, '0'      ; Subtract ASCII value of '0' (48) from the ASCII character
    mov %2, %1       ; Store the result in the destination register
%endmacro

; Convert integer to ASCII character
%macro itoa 2
    add %1, '0'      ; Add ASCII value of '0' (48) to the integer
    mov %2, %1       ; Store the result in the destination register
%endmacro


; Variable Declarations 
section .bss
buffer resb 10
output resb 18
total  resw 1
sign   resw 1
num    resw 1
count  resw 1

; Constant Value Declarations
section .data
msg1	db	"Enter Operation String: "
msg2    db  " = "

; Start the Program 
section .text
        global _start

_start:

        ; Print msg1
        print msg1, 22

        ; Scan the Input String (store it in buffer) 
        scan buffer, 10

        ; Store the Input String with msg2 at the end of it as the variable Output 
        mov rsi, buffer
        mov rdi, output
        mov rcx, 10
        rep movsb

        ; Append msg2 to the end of the Output String
        mov rsi, msg2
        mov rcx, 3
        add rdi, 10
        rep movsb

        ; Set the Total to Zero 
        mov word [total], 0

        ; Determine First Character of Buffer and Add it to Total 
        mov rsi, buffer     ; Load address of buffer into rsi
        mov al, byte [rsi]  ; Load first character from buffer into al
        atoi al, ax         ; Convert ASCII character to integer and store in ax
        add word [total], ax ; Add the converted integer to total

        ; Go Through Input Parsing Loop (jump to parseLoop)
        jmp parseLoop



parseLoop:
        ; If the Buffer doesn't have two more characters or count >= 8, stop the parseLoop
        cmp byte [buffer+2], 0 ; Check if the next two characters are null
        jz endParseLoop
        cmp byte [count], 8 ; Check if count >= 8
        jge endParseLoop

        ; Grab the Next Two Characters of the Buffer (stored as sign and num), using Count as the index
        inc byte [count]                    ; Add 1 to the count variable
        movzx eax, byte [buffer + count]    ; Load the character at buffer + count into AL
        mov [sign], al                      ; Store the character in sign
        inc byte [count]                    ; Add 1 to the count variable
        movzx eax, byte [buffer + count]    ; Load the next character at buffer + count + 1 into AL
        mov [num], al                       ; Store the character in num

        ; Determine the Digit of the num (atoi)
        atoi num, [num]

        ; Determine if sign is '+' or '-' or '*' or '/' 
        call processSign

         

        ; Jump back to the beginning of the parseLoop
        jmp parseLoop 

endParseLoop:
        ; Code to execute after the parseLoop ends

processSign:

        ; If the sign is '+', add the num to the total

        ; If the sign is '-', subtract the num from the total

        ; If the sign is '*', multiply the total by the num

        ; If the sign is '/', divide the total by the num

        ; Store the New Total as the Total        

        ret

totalToASCII:: 

        ; While the total is not zero, continue converting

        ; Divide the Total by 10 and get the Integer Value 

        ; Convert that Integer Value to ASCII 

        ; Add the ASCII Value to the end of the Output String

printResult:
        ; Convert the Total to ASCII (jump to totalToASCII)

        ; Print a New Line 

        ; Print the Output String 

        ; jump to endProgram
        jmp endProgram

endProgram:
        ; End the Program 
        mov rax, 60
        mov rdi, 0
        syscall