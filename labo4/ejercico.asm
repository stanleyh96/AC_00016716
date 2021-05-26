org	100h


section .data


data	db	2,2,3,4,5,6,7,8,9,1


len     equ  $-data


section .text


call verificar


exit: int	20h
verificar:
    xor AX, AX
    xor SI, SI
	xor CX, CX
    mov AL,2d


recorrido: 

	xor BX, BX
	mov	BL, [data+SI]
	cmp	BL, 0xA
	je	exit
	div	AL
	cmp	BH, 0d
	je	par
	jmp	nopar


nopar:

	mov	BL, [data+SI]
    mov [SI+420h],BL
    inc SI
    jmp recorrido  


par:	

	mov	BL, [data+SI]
    mov [SI+400h],BL
    inc SI
    jmp recorrido

