        org 	100h

        section 	.data

        ;limpiamos AX, BX
        xor	    AX,AX
        xor	    BX,BX

        ;asignando valores
        mov	    AX,7d
        mov 	BX,1d

        ;factorial
        Fact: 
        cmp     BX,7d
        je      Exit
        mul     BX
        inc     BX
        jmp     Fact

        Exit:
        mov     [20Bh],AL

        int	20h

