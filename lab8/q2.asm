.model tiny
.386
.data

    row     db  0
    cnt     db  8
    num1    db  0
    num2    db  1
    char    db  64

.code
.startup

    ;setting video display
    mov ah,0
    mov al,03h
    int 10h
    ;initializing row number
    mov cx,0
    ;finding sum
x1: mov al,num2
    add al,num1
    mov ah,num2
    mov num1,ah
    mov num2,al
    ;setting cursor position before printing each row
    mov ah,02h
    mov dh,cl
    mov dl,0
    mov bh,0
    int 10h
    push cx     ;pushing to stack
    ;printing row num1 times
    mov cl,num1
    mov ch,00
    ;printing character
x2: push cx
    mov ah,09h
    mov al,char
    add al,num1
    mov bl,0Fh
    mov cx,1h
    int 10h
    ;updating cursor column position 
    pop cx
    dec cx
    jz x3
    mov ah,02h
    inc dl
    mov bh,0
    int 10h
    jmp x2
    ;next row updating values
x3: pop cx
    inc cx
    cmp cl,cnt
    jnz x1
    ;blocking function
    mov ah,07h
    int 21h
    cmp al,'%'
    jnz x2





  
.exit
end
