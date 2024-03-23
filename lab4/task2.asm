.model tiny
.data
string1 db 'BITSIOTLAB'
string2 db 'qwq'
string1length db 0ah

.code
.startup

    lea si,string1
    lea di,string2
    lea bx,string1length
    mov cl,[bx]
    mov bx,03
    cld

traversing:
    cmpsb 
    jz storing
    dec di
    dec cx
    jz end_program
    jmp traversing 

resetting:
    mov si,ax
    lea di,string2
    mov bx,03
    mov cx,dx
    jmp traversing

storing:
    mov ax,si
    mov dx,cx
    dec dx

comparing:
   dec cx
   dec bx
   jz inserting
   cmpsb
   jnz resetting
   jmp comparing


inserting:
   mov bh,2ah
   mov di,ax
   dec di
   mov [di],bh

replacing:
   inc di
   mov dh,[si]
   mov [di],dh
   inc si
   dec cx
   jnz replacing

end_program:

    

.exit
end