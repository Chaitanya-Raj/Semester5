.MODEL small

.DATA

msg DB 'A-Z using loop instruction : $'

.CODE

m proc

MOV AX, @DATA
MOV DS, AX

LEA DX, msg
MOV AH, 9
INT 21h

MOV CX, 26

MOV AH, 2
MOV DL, 41h

l:
    INT 21h
    INC DL
    LOOP l
 
MOV AH, 4ch
INT 21h

m endp
end m