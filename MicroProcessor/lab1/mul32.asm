.model small
.386
.data
var1 DB 10,"Enter the first 8 digit number : $"
var2 DB 10,"Enter the second 8 digit number : $"
var3 DB 10,"Result : $"
n1 DD 0000

.code
m proc

    mov ax,@data
    mov ds,ax
    
    lea dx,var1
    mov ah,9h
    int 21h
    
    mov ebx,0
    mov cl,08h
    
    inp1: 
    mov ah,1h
    int 21h
    
    cmp AL,39h
    jg l1
    
    sub AL,30h
    jmp l2
    
    l1:
    sub AL,37h
    
    l2:    
    shl ebx,4
    add BL,AL
    loop inp1
    
    lea dx,var2
    mov ah,9h
    int 21h
    
    mov edx,0
    mov cl,08h
    
    inp2:
    mov ah,1h
    int 21h
    
    cmp AL,39h
    jg l3
    sub AL,30h
    jmp l4
    
    l3:
    sub AL,37h
    
    l4:   
    shl edx,4
    add DL,AL
    loop inp2
    
    mov eax,ebx
    MUL edx
    
    mov n1,eax
    mov ebx,edx
    
    lea dx,var3
    mov ah,9h
    int 21h
    
    mov edx,0
    mov cl,08h
    
    out1:
    ROL ebx,4
    mov DL,BL
    AND DL,00fh
    
    CMP DL,9h
    jg l5
    add DL,30h
    jmp l6
    
    l5:
    add DL,37h
    
    l6:
    mov ah,2h
    int 21h
    loop out1    
 
    mov ebx,n1
    
    mov edx,0
    mov cl,08h
    
    out2:
    
    ROL ebx,4
    mov DL,BL
    AND DL,00fh
    
    CMP DL,9h
    jg l7
    add DL,30h
    jmp l8
    
    l7:
    add DL,37h
    
    l8:
    mov ah,2h
    int 21h
    loop out2          
    
    mov ah,4ch
    int 21h
    
m endp
end m