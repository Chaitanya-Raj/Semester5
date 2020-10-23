.MODEL SMALL
.386 

.DATA

Msg0 DB 10,"Input first 8 digit number : $"
Msg1 DB 10,"Input second 8 digit number : $"
Msg2 DB 10,"Difference : $" 
var1 dd 

.CODE
    m proc
        MOV AX, @DATA
        MOV DS, AX
        
        LEA DX, Msg0                           
        MOV AH,01
        INT 21h
        
        MOV BX, 0
        MOV CL, 8
        
        
        
        rendir1 :
        
        MOV AH, 1h
        INT 21h
        
        SUB AL,30h                                                                                    
               
        SHL EBX, 4                                  
        ADD BL,AL
        LOOP rendir1
        MOV var1, EBX                                
        
        LEA DX, Msg1                                
        MOV AH, 9
        INT 21h
        MOV BX, 0
        MOV CL,8
        
        rendir2:
        
        MOV AH, 1h
        INT 21h
        
        SUB AL,30h
         
        SHL EBX, 4                                    
        ADD BL, AL
        LOOP rendir2
       
        LEA DX,  Msg2                                
        MOV AH,9
        INT 21h
        
        MOV EDX, EBX
        MOV EBX, var1
        
        MOV CL,4 
        PUSHF 
        
        dir:
        POPF                                          
        MOV AL, BL                                    
        SBB AL, DL                                    
        DAS                                            
        MOV BL, AL
        
        PUSHF                                          
        ROR EBX, 8                                     
        ROR EDX, 8                                     
        LOOP dir
        
        POPF                                            
        
        zethrs:
        MOV CL, 8
        yothirs:
        ROL EBX, 4
        MOV DL, BL
        AND DL, 00fh
        
        ADD DL, 30h
        
        MOV AH, 2h
        INT 21h
        LOOP yothirs
       
        MOV AH, 4ch
        INT 21h
        
        
m endp
end m   





     
        