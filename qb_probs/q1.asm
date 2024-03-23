.model tiny
.data

    alph1  db   'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    vcnt   db   ?   

.code
.startup

    lea si,alph1
    lea di,vcnt
    mov cx,26
    mov bx,0
    mov ax,0

compare:
    mov ah,[si]
    cmp ah,'a'
    jz increment
    cmp ah,'e'
    jz increment
    cmp ah,'i'
    jz increment
    cmp ah,'o'
    jz increment
    cmp ah,'u'
    jz increment
    inc si
    dec cx
    jz store
    jmp compare

increment:
    inc bx
    inc si  
    dec cx
    jz store
    jmp compare

store:
    mov [di],bx

.exit
end