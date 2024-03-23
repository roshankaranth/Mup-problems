.model tiny
.data

    ARRAY   db  3, 7, 2, 5, 3, 7, 6, 4, 8, 1, 5, 2, 7, 4, 6, 9, 8, 3, 1, 7
    COUNT   db  20
    SECMAX  db  ?

.code
.startup

    lea bp,COUNT
    mov cx,[bp]

loop1:
    mov dx,cx
    dec dx
    jz sec_max_store
    lea si,ARRAY
loop2:
    mov al,[si]
    cmp al,[si+1]
    jbe  no_swap

swap:
    mov bl,[si+1]
    mov [si+1],al
    mov [si],bl

no_swap:
    inc si
    dec dx
    jnz loop2
    dec cx
    jnz  loop1

sec_max_store:
    lea di,SECMAX
    lea si,ARRAY
    lea bp,COUNT
    mov cx,[bp]
    sub cx,2
find_sec_max: 
    inc si
    loop find_sec_max

store:
    mov al,[si]
    mov [di],al



.exit
end