.model small
.386
.DATA
var1 DB 10,"Input first 8 digit number : $"
var2 DB 10,"Input second 8 digit number : $"
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
    
    SUB AL,30H                                          
 
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

    SUB AL,30H
        
    shl EDX,4                                          
    ADD DL,AL
    loop Input2
    
    MOV CL,04H
    
    PUSHF                                                  
    addition:
    POPF                                                  
    MOV AL,DL                                             
    ADC AL,BL                                             
    
    DAA                                                   
    MOV BL,AL
    
    PUSHF                                                 
    ROR EDX,8                                             
    ROR EBX,8                                               
    loop addition
    
    LEA DX,var3
    MOV AH,9H
    INT 21H
    
    POPF                                                 
    jnc output
    MOV DL,31H
    MOV AH,2H
    INT 21H
    
         
    output: MOV EDX,0
    MOV CL,08H
   
    out1:
        
    ROL EBX,4
    MOV DL,BL
    AND DL,00fH

    ADD DL,30H            
    
    MOV AH,2H
    INT 21H
    loop out1       
            
    MOV AH,4ch
    INT 21H
            
m endp
end m


