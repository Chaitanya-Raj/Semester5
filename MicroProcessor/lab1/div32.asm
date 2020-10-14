.model small       
.386
.data

var1 db 10,"Enter Dividend: $"
var2 db 10,"Enter Divisor: $"
var3 db 10,"Quotient is: $"
var4 db 10,"Remainder is: $"
var dd 0

.code
m proc
    mov AX, @data
    mov DS, AX
    
    mov DX, OFFSET var1
    mov AH,9h
    int 21H
    
    mov CX,8       
    mov ebx,0
    input1:
   
       
    
    mov ah,01h
    int 21h
    
    cmp al,39h
    
    jg lab1
    sub al,30h
    jmp lab2
    lab1:
    sub al,37h
    lab2:
    shl ebx,4 
    add bl,al
    loop input1
   
    lea dx,var2
    mov ah,09h
    int 21h
    
    mov cx,8
    mov var,ebx
    mov ebx,0
    
    input2:
    
   
    mov ah,01h
    int 21h
    
    cmp al,39h
    jg l1
    sub al,30h
    jmp l2
    l1:
    sub al,37h
    l2:
    shl ebx,4
    add bl,al 
    loop input2
    
    lea dx,var3
    mov ah,09
    int 21h
    
    mov edx,0
    mov eax,var
    div ebx
    mov ebx,eax
    mov var,edx
    mov cx,8
    
    disp:
    rol ebx,4
    mov dl,bl
    and dl,0fh
    cmp dl,09
    jg g
    add dl,30h
    jmp s
    g: add dl,37h
    s:
    mov ah,2h
    int 21h
    loop disp
    
    lea dx,var4
    mov ah,09
    int 21h
    
    mov cx,8
    mov ebx,var
    disp2:
    rol ebx,4
    mov dl,bl
    and dl,0fh
    cmp dl,09
    jg g2
    add dl,30h
    jmp s2
    g2: add dl,37h
    s2:
    mov ah,2h
    int 21h
    loop disp2
    
    mov ah,4ch
    int 21h

m endp
end m