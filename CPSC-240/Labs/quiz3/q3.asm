section .data
num	db	9, 5, 3, 6, 8
sum	db	0


section .text
	global	_start
_start:
	mov	al, 0
	mov	rsi, 0
next:
	add	al, byte[num+rsi]
	inc	rsi
	cmp	rsi, 5
	jne	next	;if(rsi != 5) goto next
	mov	byte[sum], al