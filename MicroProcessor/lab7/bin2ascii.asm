.model small
.data
   msg1 DB 10,"Input binary : $"
   msg2 DB 10,"ASCII Equivalent : $"
   
.code
.STARTUP
    MOV dx,@data
    MOV ds,dx
    
    lea dx,msg1
    MOV ah,09h
    INT 21h
    
    MOV bl,00h
    MOV cl,08h
    
    input:
        MOV ah,01h
        INT 21h
        sub al,30h
        SHL bl,1
        add bl,al
        loop input
        
        lea dx,msg2
        MOV ah,09h
        INT 21h
        MOV ah,02h
        MOV dl,bl
        INT 21h
        
        MOV ah,4ch
        INT 21h
        
        .EXIT
        end
    