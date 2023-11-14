section .data
num1	dw	7
num2	dw	3
num3	dw	0


section .text
	global	_start
_start:
	mov	ax, word[num1]
	mov	bx, word[num2]
	mul	bx
	mov	word[num3], ax