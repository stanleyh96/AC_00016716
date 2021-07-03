org     100h

	section	.text
    
    call mododetexto

    call vermensajeinicio

    call vercadena

    call Validarcontra

   
   

    int 20h


;FUNCIONES:
Cursor:
    MOV AH, 01h 
    MOV BH, 0h 
    INT 10h
    ret


mostrarcadena:
    mov     AH, 09
    int     21h
    ret

Validarcontra:
    xor     SI,SI
    for:
    cmp     SI, 5d
    je      passcorrecto
    mov     CL, [contraseña+SI]
    cmp     CL, [300h+SI]
    je      iteracion
    jmp     passincorrecto    

vercadena:
    xor     SI,SI
    while: 
    call    tecla
    cmp     AL, 0X0D
    je      Exit
    mov     [300h+SI], AL 
    inc     SI
    jmp     while

    Exit:  
    ret 

mododetexto:
    mov     AH, 00h         
    mov     AL, 03h         
    int     10h 
    ret


tecla: 
    mov     AH, 00h         
    int     16h 
    ret


passincorrecto:
    mov     DX, errorlogin
    call    Cursor
    call    mostrarcadena
    ret


passcorrecto:
    mov     DX, login
    call    Cursor
    call    mostrarcadena
    ret


iteracion:
    inc     SI
    jmp     for


vermensajeinicio:
    mov DX, mensajeinicio
    call mostrarcadena
    ret    

;DATOS
section .data
errorlogin     db  'Contrasena Incorrecta', "$"
contraseña        db  '00016716'
mensajeinicio  db  'Ingrese Contrasena : ', "$"
login           db  'Bienvenido amigo', "$"