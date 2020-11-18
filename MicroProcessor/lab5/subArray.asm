.model small

.DATA
arr1 db 10 dup(?)
arr2 db 10 dup(?)
var1 db 10,"Enter the size of the array(max-10):$"
var2 db 10,"Enter the elements of array:$"
var3 db 10,"Elements of array:$"
var4 db 10,"After subtracting:$"
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
    mov bl,al
    
    mov dl,32
    mov ah,2h
    int 21h
    
    mov [si],bl
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
    
    mov bl,al
       
    mov dl,32
    mov ah,2h
    int 21h
 
    mov [bp],bl
    inc bp
    
    loop input1
    
    lea dx,var4
    mov ah,9h
    int 21h
    
    ;subtraction
    lea si,arr1
    lea bp,arr2
    mov cl,size
    mov dx,0
    
    subtract:
    mov dl,32
    mov ah,2h
    int 21h
    
    mov bl,[si]
    mov dl,[bp]
    cmp bl,dl
    jb minus
    sub bl,dl
    mov dl,bl
    jmp single
    
    minus:
    sub dl,bl
    mov bl,dl
    mov dl,02dh
    mov ah,2h
    int 21h
    mov dl,bl
    
    single:
    add dl,30h
    mov ah,2h
    int 21h
    
    inc si
    inc bp
    
    loop subtract
    
    mov ah,4ch
    int 21h
    
m endp
end m