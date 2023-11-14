section .data
mul3	db	0


section .text
	global	_start
_start:
	mov	cl, 3
next:
	mov	ah, 0
	mov	al, cl
	mov	bl, 3
	div	bl
	cmp	ah, 0
	jne	skip	;if(ah != 0) goto skip
	inc	byte[mul3]
skip:
	inc	cl
	cmp	cl, 7
	jne	next	;if(cl != 7) goto next