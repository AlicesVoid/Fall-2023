; Amelia Rotondo - Lab 7 
; == PSEUDOCODE =======================
;char num;
;char buffer;
;char msg1[] = "Input a number (1~9): ";
;char msg2[] = " is multiple of 3.";
;
;register int r10 = 0;
;do {
;	cout << msg1;
;	cin >> buffer;
;	num = atoi(buffer);
;	if(num%3 == 0) {
;		cout << buffer << msg2;
;	}
;	r10++;
;} while(r10 < 9);
; == ASSEMBLY =========================
section .bss
        num     resb    1                    ; Reserve 1-byte for num
        buffer  resb    2                    ; Reserve 2-byte for buffer to store the input character and newline
        counter resd    1                    ; Counter for the loop

section .data
        msg1    db      "Input a number (1~9): ", 0   ; Input message
        msg2    db      " is a multiple of 3.", 0     ; Message for numbers that are multiples of 3
        newline db      10                             ; Newline character

section .text
        global _start
_start:
        ; Initialize counter to 0
        mov     dword [counter], 0
        
loop_start:
        ; cout << msg1
        mov     eax, 4                     
        mov     ebx, 1                     
        mov     ecx, msg1                  
        mov     edx, 23                    
        int     0x80                       

        ; cin >> buffer
        mov     eax, 3                     
        mov     ebx, 0                     
        mov     ecx, buffer                
        mov     edx, 2                     
        int     0x80                       

        ; num = atoi(buffer)
        movzx   eax, byte [buffer]         
        sub     eax, '0'                   
        mov     [num], al                  

        ; if(num%3 == 0) 
        mov     al, [num]                  
        mov     ah, 0                      
        mov     bl, 3                      
        div     bl                         
        cmp     ah, 0                      
        jnz     not_multiple               

        ; cout << buffer
        mov     eax, 4                     
        mov     ebx, 1                     
        mov     ecx, buffer                
        mov     edx, 1                     
        int     0x80                       

        ; cout << msg2
        mov     eax, 4                     
        mov     ebx, 1                     
        mov     ecx, msg2                  
        mov     edx, 18                    
        int     0x80                       

        ; cout << newline
        mov     eax, 4                     
        mov     ebx, 1                     
        mov     ecx, newline               
        mov     edx, 1                     
        int     0x80                       

not_multiple:
        ; Increment counter and check if it is 9
        add     dword [counter], 1
        cmp     dword [counter], 9
        jne     loop_start                 ; If not 9, jump back to the start of the loop

        ; Exit program
        mov     eax, 1                     ; SYS_exit
        xor     ebx, ebx                   ; Exit code 0
        int     0x80                       ; Call kernel
