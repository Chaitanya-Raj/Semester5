.model small
    
.data
    MSG0 DB 10,13,"Input the ASCII character : $"
    MSG1 DB 10,13,"Its binary equivalent is $"
    a db ?

.code
.startup
    lea dx,MSG0
    mov ah,09
    int 21H

    mov ah,01
    int 21H

    lea dx,MSG1
    mov ah,09
    int 21H

    mov cl , 08H
    mov ah, 00h

    up :  shl al, 01h  
        
    mov bl, al  
    mov  al, 00H
    adc al, 30h
    mov dl, al
    mov ah, 02h
    int 21h
    mov al,bl
    dec cl
    jnz up
    mov ah, 4cH  
    int 21H

end