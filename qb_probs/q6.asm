.model tiny
.data

    ARRAY   db  82, 45, 17, 63, 92, 10, 55, 29, 78, 36, 51, 68, 24, 87, 39, 59, 72, 14, 98, 20
    COUNT   db  20
    MAX     db  ?
    MAXADDR dw  ?

.code
.startup

    lea si,ARRAY
    lea bp,COUNT
    mov cx,[bp]
    lea di,MAX
    lea bx,MAXADDR

    mov al,[si]
    inc si
    dec cx

compare:
    cmp al,[si]
    jae no_update
    mov al,[si]
    mov bp,si
no_update:
    inc si
    loop compare

storing:
    mov [di],al
    mov [bx],bp



.exit
end