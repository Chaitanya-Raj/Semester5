.MODEL small
.STACK 100H

.DATA

V1 DB 10,"Input size of array : $"
v2 DB 10,"Input elements : $"
v3 DB 10,"Sorted array : $"
s Db,00H

Arr1 Dw 10 DUP(?)
Arr DW 10 DUP(?)


.CODE
.STARTUP

MOV AX,@data
MOV Ds,AX

LEA DX,v1       
MOV AH,9H
INT 21H

MOV AH,1H   
INT 21H
mov s,al
SUB s,30H
mov cl,s      


Lea BX,Arr1     
MOv si,0

LEA DX,v2         
MOV AH,9H
INT 21H

INPUT:
    
    
    MOV Ah,01H
    int 21H
    MOV [BX+SI],al
    inc SI
    Mov DL,32
    Mov AH,02H
    INT 21H
    loop INPUT
 
  Mov DI,cx
  lea BX,Arr1
  again:
  mov cl,s
  Mov SI,0 
  
  sort:
  Mov Al,[BX+SI]
  cmp Al,[BX+SI+1]
  jl l3
  xchg al,[BX+SI+1]
  Mov [Bx+SI],Al
  
  l3:
  inc SI
  loop sort
  dec DI
  JNZ again
  
  Mov cl,s
  lea BX,Arr1
  mov SI,1
  LEA DX,v3
  MOV AH,9H
  INT 21H
OUTPUT:
    mov dx,[BX+SI]
   
    MOV AH,02H
    INT 21H
    inc SI
     Mov DL,32
    Mov AH,02H
    INT 21H
    loop OUTPUT
    
    
.EXIT 
end
    
    
    