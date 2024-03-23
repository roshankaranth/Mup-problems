.model tiny
.data

array1 db 91h,02h,083h,0Ah,047h,012h,076h,61h

.code
.startup

    mov cl,0Ah
    mov al,0Ah
    mov ah,69
    lea si,array1 
x1: cmp [si],al
    jnz x2 
    mov [si],ah
x2: inc si
    dec cl
    jnz x1

.exit
end
