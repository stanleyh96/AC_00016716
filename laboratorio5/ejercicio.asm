org 100h
    

    section .text
     ;apellido
    MOV byte[202h],25d

     ;nombre
    MOV byte [200h],7d
    MOV byte [201h],16d

    xor AX, AX
    xor BX, BX
    xor CX, CX
    xor DX, DX
    xor DI, DI
    xor SI, SI

    MOV DL, 20
    MOV DH, 10
    

    MOV BL, 1d
    MOV SI, 0d
    MOV DI, 0d
   
    

    call modotexto


    Iteracion:
    
        call cursor 
        MOV CL, [datos+SI] 
        call caracter
        INC SI 
        INC DL
        CMP BL,[200h+DI]
        je saltodefila
        INC BL
        JMP Iteracion 


    caracter:
        MOV AH, 0Ah 
        MOV AL, CL 
        MOV BH, 0h 
        MOV CX, 1h 
        INT 10h
        RET    
        

    cursor:
        MOV AH, 02h 
        MOV BH, 0h 
        INT 10h
        RET

    modotexto: 
        MOV AH, 0h 
        MOV AL, 03h 
        INT 10h
        RET    
    
    saltodefila:
        CMP BL, 25d
        je  teclado
        INC DH
        INC SI
        INC DI
        INC BL
        MOV DL,20
        jmp Iteracion


    teclado:
        MOV AH, 00h
        INT 16h

    int 20h
    section .data


    datos DB 'stanley alexander hurtado'

    