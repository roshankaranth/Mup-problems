.model tiny
.386
.data

    inp1    db  'Roshan Karanth'
    cnt     dw  14  ;made dw rather than db so that doesn't give an error at (1)
    index   db  ?

.code
.startup

    ;setting display mode
    mov ah,0
    mov al,03h
    int 10h
    ;initializing data
    lea si,inp1
    mov cx,cnt  ;(1)
    add si,cx
    dec si
    mov index,0
    ;setting cursor position
x1: mov ah,02h
    mov dh,index
    mov dl,index
    mov bh,0
    int 10h
    ;writing character at cursor position
    push cx
    mov ah,09h
    mov al,[si]
    mov bl,0Fh
    mov cx,1h
    int 10h
    ;updating data
    pop cx
    inc index
    dec si
    dec cx
    jnz x1
    ;blocking function
;     mov ah,07h
; x2: int 21h
;     cmp al,'%'
;     jnz x2





.exit
end
