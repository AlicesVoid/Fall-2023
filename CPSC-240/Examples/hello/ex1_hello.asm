; ex_hello.asm
; char text[] = "Hello, World!\n"
; cout << text;

section .data
    text db "Hello, World!", 10   ; Define a string "Hello, World!" with a newline character (10) at the end

section .text
    global _start

_start:
    mov rax, 1         ; Move the value 1 into the rax register (syscall number for sys_write)
    mov rdi, 1         ; Move the value 1 into the rdi register (file descriptor for stdout)
    mov rsi, text      ; Move the address of the 'text' string into the rsi register (pointer to the data to be written)
    mov rdx, 14        ; Move the value 14 into the rdx register (length of the string)
    syscall            ; Invoke the syscall to write the string to stdout

    mov rax, 60        ; Move the value 60 into the rax register (syscall number for sys_exit)
    mov rdi, 0         ; Move the value 0 into the rdi register (exit code)
    syscall            ; Invoke the syscall to exit the program
