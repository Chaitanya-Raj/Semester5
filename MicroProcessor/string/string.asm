.MODEL small

.DATA
var1 DB "CHAITANYA $"

.CODE

.STARTUP
mov AX, @data
mov DX, AX
mov DX, OFFSET var1
mov AH, 9
int 21H

.EXIT
end