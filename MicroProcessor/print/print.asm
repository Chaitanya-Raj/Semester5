.MODEL small

.DATA
var1 DB "HELLO $"

.CODE

m proc
mov AX, @data
mov DS, AX
mov DX, OFFSET var1
mov AH, 9
int 21H

mov AH, 4ch
int 21H

m endp
end