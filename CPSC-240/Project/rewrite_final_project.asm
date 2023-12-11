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
%macro atoi 1
    sub al, '0'        ; Subtract ASCII value of '0' (48) from the ASCII character in AL
    movzx %1, al       ; Zero-extend AL to AX (or the provided register)
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
ascii resb 5  ; 5-byte array for ASCII representation of total

; Constant Value Declarations
section .data
msg1    db  "Enter Operation String: "
msg2    db  " = "

; Start the Program 
section .text
        global _start

_start:
        ; Print msg1
        print msg1, 24

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

        ; Set the Total to Zero (as a word)
        mov word [total], 0
        mov byte [count], 0  ; Initialize count to 0

        ; Initialize variables
        xor r8, r8             ; Initialize count to 0 in r8
        movzx r9, word [total] ; Load total into r9 (assuming total is word-sized)
        
        ; Determine First Character of Buffer and Add it to Total 
        mov rsi, buffer         ; Load address of buffer into rsi
        movzx eax, byte [rsi]   ; Load first character from buffer into EAX
        atoi ax                 ; Convert ASCII character in AL to integer in AX


        add word [total], ax ; Add the converted integer to total
        movzx r9, word [total] ; Load total into r9 (assuming total is word-sized)

        ; Go Through Input Parsing Loop (jump to parseLoop)
        jmp parseLoop

parseLoop:
    cmp r8b, 8             ; Check if count (r8) >= 8
    jge endParseLoop

    ; Increment count and load next characters
    inc r8b
    movzx eax, byte [buffer + r8]
    mov [sign], al
    inc r8b
    movzx eax, byte [buffer + r8]
    mov [num], al

    ; Convert num to integer
    movzx eax, byte [num]
    atoi ax
    mov [num], ax

    ; Determine the operation and execute
    call processSign

    ; Loop back
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
    movzx eax, word [num]  ; Load num into EAX
    add r9w, ax            ; Add num to total in r9
    mov [total], r9w       ; Store the result back to total
    ret

subtractNumber:
    movzx eax, word [num]  ; Load num into EAX
    sub r9w, ax            ; Subtract num from total in r9
    mov [total], r9w       ; Store the result back to total
    ret


multiplyNumber:
    movzx eax, word [num]  ; Load num into EAX
    imul r9w, ax           ; Multiply total in r9 by num
    mov [total], r9w       ; Store the result back to total
    ret


divideNumber:
    movzx eax, word [num]  ; Load num into EAX
    mov ax, r9w            ; Move total from r9 into AX
    cwd                    ; Convert word to doubleword, preparing for division
    idiv word [num]        ; Divide total by num
    mov r9w, ax            ; Move the quotient back to r9
    mov [total], r9w       ; Store the result back to total
    ret

totalToASCII:
    mov ax, [total]     ; Ensure AX contains the total value

    ; Reset RCX and RDI for string manipulation
    mov rcx, 0
    mov rdi, ascii      ; Point RDI to the ascii buffer

convertLoop:
    ; Check if AX is zero
    cmp ax, 0
    je finishedConversion

    ; Prepare DX:AX for division
    xor dx, dx          ; Clear DX to avoid division overflow
    mov bx, 10
    div bx              ; Divide AX by 10, quotient in AX, remainder in DX

    ; Convert DX to ASCII and store at the end of 'ascii'
    add dl, '0'
    mov [rdi + rcx], dl
    inc rcx

    ; Loop back
    jmp convertLoop

finishedConversion:
    ; Reverse the string in 'ascii'
    ; Ensure RCX contains the length of the number string
    dec rcx             ; Adjust length for zero-based index
    mov rsi, ascii      ; Source start index
    mov rdi, ascii      ; Destination start index
    add rdi, rcx        ; Destination end index

reverseLoop:
    cmp rsi, rdi        ; Check if pointers have crossed
    jge endReverse      ; If they have, end the loop

    mov al, [rsi]       ; Load from the beginning of the string
    mov bl, [rdi]       ; Load from the end of the string
    mov [rsi], bl       ; Swap the characters
    mov [rdi], al

    inc rsi             ; Move to next character from start
    dec rdi             ; Move to next character from end

    jmp reverseLoop     ; Repeat the loop

endReverse:
    ret


printResult:
        ; Call totalToASCII to convert the total
        call totalToASCII

        ; Print a New Line
        print 10, 1

        ; Print the Output String
        print output, 9

        ; Print msg2 
        print msg2, 4

        ; print the total as Ascii
        print ascii, 5

        ; print another New Line 
        print 10, 1

        ; jump to endProgram
        jmp endProgram

endProgram:
        ; End the Program 
        mov rax, 60
        mov rdi, 0
        syscall
