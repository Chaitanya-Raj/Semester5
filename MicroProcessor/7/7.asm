;Addtion of two 16 bit numbers using ADC

.MODEL small

.DATA

    var1 DB 10, "Input first value : $"
    var2 DB 10, "Input second value : $", 10
    sum DB 10, "Sum : $", 10

.CODE

m proc

    MOV AX, @DATA                                       
    MOV DS, AX
    
    MOV DX, OFFSET var1                             
    MOV AH, 09h
    INT 21h
    
    MOV AH, 01
    INT 21h                                             
    MOV BH, AL                                          
    
    MOV AH, 01h                                      
    INT 21h
    MOV BL, AL
    
    SUB BX, 3030h                                       
    
    MOV DX, OFFSET var2                             
    MOV AH, 09h
    INT 21h
    
    MOV AH, 01h                                        
    INT 21h
    MOV CH, AL
    
    MOV AH, 01h                                   
    INT 21h
    MOV CL, AL
   
    SUB CX, 3030h                                      
    
    MOV DX, OFFSET sum                           
    MOV AH, 09h
    INT 21h
    
    MOV AH, 0                                       
    MOV AL, BL
    ADD AL, CL                                     
    AAA                                       
    
    MOV BL, AL                                         
    
    MOV AH, 0                                        
    MOV AL, BH                                    
    ADC AL, CH
    AAA                                             
    
    MOV CX, AX
    ADD CX, 3030h
    
    MOV AH, 02                                    
    MOV DL, CH                                      
    INT 21h
    
    MOV AH, 02                                       
    MOV DL, CL                                                                               
    INT 21h    
    
    ADD BL, 30h
    MOV AH, 02
    MOV DL, BL
    INT 21h
    
    MOV AH, 4ch
    INT 21H
    
m endp
end m