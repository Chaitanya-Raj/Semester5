.MODEL small

.DATA

.CODE

.STARTUP
mov DX, 'c'
mov AH, 2
int 21H

.EXIT
end