.MODEL small

.DATA

.CODE

.STARTUP
MOV DX, 'a'
MOV AH, 2
int 21H

.EXIT
end