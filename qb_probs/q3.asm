.model tiny
.data

    istr1   db  'hmeilclroo' 
    cnt1    db  10
    str1    db  5 dup(?)
    str2    db  5 dup(?)

.code
.startup

    lea si,istr1
    lea di,str1
    lea bx,str2
    lea bp,cnt1
    mov cx,[bp]
    
looping:
    mov al,[si]
    mov [di],al
    dec cx
    inc si
    inc di
    mov al,[si]
    mov [bx],al
    inc si
    inc bx
    dec cx
    jnz looping
 
.exit
end