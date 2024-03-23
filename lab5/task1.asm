.model tiny
.data

    strA db "The character entered is a$"
    char1 db ?
    strNotA db "not a$"
    char2 db ?

.code
.startup

checking_inputs:
    mov ah,08h
    int 21h
    cmp al,61h
    je  x1

not_a:
    lea bx,char2
    mov [bx],al
    lea dx,strNotA
    mov ah,09h
    int 21h
    jmp end_program


Is_a:
    lea bx,char1
    mov[bx],al
    lea dx,strA
    mov ah,09h
    int 21h

end_program:

.exit
end