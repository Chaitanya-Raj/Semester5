.MODEL small

.STACK 100

.DATA

var1 db, "Input first Value : $"
var2 db 10, "Input second value : $"
sum db 10, "Sum : $"

.CODE

m proc

MOV AX, @DATA
MOV DS, AX
MOV AH, 9        
           
lea DX, var1
INT 21h

MOV AH, 1 
INT 21h
MOV BL, AL
sub BL, 30h

MOV AH, 9
lea DX, var2
INT 21h

MOV AH, 1
INT 21h    
sub AL, 30h

MOV AH, 9
lea DX, sum
INT 21h

add AL, BL
            
xor AH, AH
aaa
add AX, 3030h

MOV BX, AX
   
MOV DL, BH
MOV AH, 2                   
INT 21h  

MOV DL, BL
MOV AH, 02h
INT 21h

MOV AH, 4ch
INT 21h

m endp
end m
 