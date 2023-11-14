%macro	print	2
	mov	rax, 1
	mov	rdi, 1
	mov	rsi, %1
	mov	rdx, %2
	syscall
%endmacro


section .data
str1	db	"abc", 10
str2	db	"123"


section .text
	global	_start
_start:
	print	str1, 4
	print	str2, 3