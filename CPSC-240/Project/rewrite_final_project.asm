; CPSC-240 FINAL PROJECT: ASM CALCULATOR 
; Amelia Rotondo - CWID: 887925113

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
buffer resb 10 ; 10-digit array 
output resb 18 ; 18-digit array at-most
total  resw 1  ; values are 0 to 7000
sign   resb 1  ; values are +, -, *, or /
num    resb 1  ; values are 0 to 9
count  resb 1  ; values are 0 to 8

; Constant Value Declarations
section .data
msg1    db  "Enter Operation String: "
msg2    db  " = "

; Start the Program 
section .text
        global _start

_start:
        ; Print msg1
        print msg1, 22

        ; Scan the Input String (store it in buffer) 
        scan buffer, 10

        ; Store the Input String with msg2 at the end of it as Output 
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
        call printResult
        ret

processSign:
        ; Compare the sign to '+', '-', '*', and '/'
        cmp byte [sign], '+'
        je addNumber
        cmp byte [sign], '-'
        je subtractNumber
        cmp byte [sign], '*'
        je multiplyNumber
        cmp byte [sign], '/'
        je divideNumber
        ret ; return if the sign is not recognized

addNumber:
        ; Add num to total
        add word [total], [num]
        ret

subtractNumber:
        ; Subtract num from total
        sub word [total], [num]
        ret

multiplyNumber:
        ; Multiply total by num
        imul word [total], [num]
        ret

divideNumber:
        ; Divide total by num (check for divide by zero is omitted)
        idiv word [total], [num]
        ret

totalToASCII:
    ; Assume the total is in AX
    ; Convert AX to ASCII and store in 'output'

    ; Reset RCX and RDI for string manipulation
    mov rcx, 0
    mov rdi, output

convertLoop:
    ; Check if AX is zero
    cmp ax, 0
    je finishedConversion

    ; Divide AX by 10, remainder in DX
    xor dx, dx
    mov bx, 10
    div bx

    ; Convert DX to ASCII and store at the end of 'output'
    add dl, '0'
    mov [rdi + rcx], dl
    inc rcx

    ; Loop back
    jmp convertLoop

finishedConversion:
    ; Reverse the string in 'output'
    ; Assume RCX contains the length of the number string
    dec rcx ; Adjust length for zero-based index
    mov rsi, output ; Source start index
    mov rdi, output ; Destination start index
    add rdi, rcx    ; Destination end index

reverseLoop:
    cmp rsi, rdi    ; Check if pointers have crossed
    jge endReverse  ; If they have, end the loop

    mov al, [rsi]   ; Load from the beginning of the string
    mov bl, [rdi]   ; Load from the end of the string
    mov [rsi], bl   ; Swap the characters
    mov [rdi], al

    inc rsi         ; Move to next character from start
    dec rdi         ; Move to next character from end

    jmp reverseLoop ; Repeat the loop

endReverse:

printResult:
        ; Call totalToASCII to convert the total
        call totalToASCII

        ; Print a New Line
        print 10, 1

        ; Print the Output String
        print output, 18

        ; jump to endProgram
        jmp endProgram

endProgram:
        ; End the Program 
        mov rax, 60
        mov rdi, 0
        syscall
