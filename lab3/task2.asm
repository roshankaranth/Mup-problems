.model tiny
.data

array1 db   0c0h,5ch,0f3h,4dh,9ch,2ah,37h,0e4h,06h,0abh
count  db   10
NEG1   db   ?

.code
.startup

    lea si,array1 
    lea di,NEG1  
    mov cl,count 
    mov ch,00
    mov ah,00
x1: cmp [si],ah
    jge x2
    inc ch
x2: inc si
    dec cl
    jnz x1
    mov [di],ch

.exit
end