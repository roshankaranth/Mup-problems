.model tiny
.data
    max1 db 32
    Act1 db ?
    str1 db 32 dup(?)
   
    
.code
.startup

input:
    lea dx,max1
    mov ah,0ah
    int 21h

    lea bx,Act1
    mov cx,[bx]
    mov ch,00
    lea si,str1
    mov al,20h

conversion: 
    sub [si],al
    inc si
    loopnz conversion
    mov bx,'$'
    mov [si],bx

output:
    lea dx,str1
    mov ah,09h
    int 21h

.exit
end
