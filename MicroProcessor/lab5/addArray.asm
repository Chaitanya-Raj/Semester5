.model small

.DATA
arr1 db 10 dup(?)
arr2 db 10 dup(?)
var1 db 10,"Enter the size of the array(max-10):$"
var2 db 10,"Enter the elements of array:$"
var3 db 10,"Elements of array:$"
var4 db 10,"After adding:$"
size db 

.code

m proc
    mov ax,@DATA
    mov ds,ax
    
    lea dx,var1
    mov ah,9h
    int 21h
    
    mov ah,1
    int 21h
    
    mov size,al
    sub size,30h
    mov cl,size
    lea si,arr1
    
    lea dx,var2
    mov ah,9h
    int 21h
    
    input:
    mov ah,1
    int 21h
    
    mov dl,al
    mov [si],dl
    inc si
    
    loop input
    
    mov cl,size
    lea bp,arr2
    
    lea dx,var2
    mov ah,9h
    int 21h
    
    input1:
    mov ah,1
    int 21h
    
    mov dl,al
    mov [bp],dl
    inc bp
    
    loop input1
    
    lea dx,var4
    mov ah,9h
    int 21h
    
    ;adding
    lea si,arr1
    lea bp,arr2
    mov cl,size
    mov dx,0
    
    adding:
    mov bl,[si]
    mov dl,[bp]
    add dl,bl
    
    cmp dl,69h
    jg double
    
    single:
    sub dl,30h
    mov ah,2h
    int 21h
    jmp always
    
    double:
    mov ax,0
    mov al,dl
    aaa
    add ax,3030h
    mov bx,ax
    
    mov dl,bh
    mov ah,2h
    int 21h
    
    mov dl,bl
    mov ah,2h
    int 21h
    
    always:
    inc si
    inc bp
    
    loop adding
    
    mov ah,4ch
    int 21h
    
m endp
end m