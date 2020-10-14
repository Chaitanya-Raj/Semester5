.model small
.DATA
.386
var1 DB 10,"Enter the first 8 digit number : $"
var2 DB 10,"Enter the second 8 digit number : $"
var3 DB 10,"Sum : $"

.code
m proc

    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,var1
    MOV AH,9H
    INT 21H
    
    MOV EBX,0
    MOV Cl,08H
    
    Input1:
    
    MOV AH,1H
    INT 21H
        
    cmp AL,39H       
    JG l1
    
    SUB AL,30H
    jmp l2
    l1:
    SUB AL,37H
        
    l2:    
    shl EBX,4
    ADD BL,AL
    loop Input1
            
    LEA DX,var2
    MOV AH,9H
    INT 21H
    
    
    MOV EDX,0
    MOV CL,08H
    
    Input2:
    
    MOV AH,1H
    INT 21H
        
    cmp AL,39H
    JG l3
    SUB AL,30H
    jmp l4
    l3:
    SUB AL,37H
        
    l4:
        
    shl EDX,4
    ADD DL,AL
    loop Input2
            
    ADD EBX,EDX
    
    LEA DX,var3
    MOV AH,9H
    INT 21H
    
    
    jnc output
    MOV Dl,31H
    MOV AH,2H
    INT 21H
    
         
    output: MOV EDX,0
    MOV CL,08H
    
    out1:
        
    ROL EBX,4
    MOV DL,BL
    AND DL,00fH
            
    CMP DL,9H
    jg l5
    ADD DL,30H
    jmp l6
            
    l5:
    ADD DL,37H
            
    l6:
    MOV AH,2H
    INT 21H
    loop out1       
            
    MOV AH,4ch
    INT 21H
            
m endp
end m