.model tiny
.data

    ARRAY   db  3, 7, 2, 5, 3, 7, 6, 4, 8, 1, 5, 2, 7, 4, 6, 9, 8, 3, 1, 7
    COUNT   db  20
    CODE1   db  7
    RESULT  db  ?   

.code
.startup

    lea si,ARRAY
    lea bp,COUNT
    mov cl,[bp]
    mov ch,00
    lea bp,CODE1
    mov al,[bp]
    lea di,RESULT
    mov ah,0

compare:
    cmp [si],al
    jnz not_equal
    inc ah

not_equal:
    inc si
    loop compare

store:
    mov [di],ah

.exit
end