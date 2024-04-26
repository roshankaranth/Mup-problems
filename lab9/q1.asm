
.model tiny
.386
.data
usrinp  db  ?
fname   db  'lab1.txt',0
inp1 db 32 DUP(0)
rowstr dw ?
rowend dw ?
colmstr dw ?
colmend dw ?
cnt dw ?

.code
.startup

    ;setting display mode
    mov ah,00h
    mov al,12h
    int 10h
    ;initialization
    mov rowstr,10
    mov rowend,410
    mov colmstr,10
    mov colmend,410
    mov cnt,25
    ;take input from user
    mov ah,08h
    int 21h
    mov usrinp,al
    ;opening file
    mov ah,3dh
    mov al,00
    lea dx,fname
    int 21h
    ;reading from file
    mov bx,ax
    mov ah,3fh
    lea dx,inp1
    mov cx,32
    int 21h
    ;comparing user input with file input
    lea si,usrinp
    lea di,inp1
    mov cx,11
    mov al,[si]
x1: inc di
    dec cx
    jnz x1
    mov cx,cnt
    cmp al,[di]
    jnz purple

    ;drawing green rectangle
    green:
    push cx
    mov dx,rowend
    rowg:
    mov cx,colmend
    colg:
    mov ah,0ch
    mov al,00101010b
    int 10h
    dec cx
    cmp cx,rowstr
    jnz colg
    dec dx
    cmp dx,colmstr
    jnz rowg
    
    ;updating coords
    mov si,rowend
    sub si,16
    mov rowend,si

    ;checking count
    pop cx
    dec cx
    jz END1

    ;drawing purple rectangle
    purple:
    push cx
    mov dx,rowend
    rowp:
    mov cx,colmend
    colp:
    mov ah,0ch
    mov al,01011101b
    int 10h
    dec cx
    cmp cx,rowstr
    jnz colp
    dec dx
    cmp dx,colmstr
    jnz rowp

    ;updating coords
    mov si,rowend
    sub si,16
    mov rowend,si

    ;checking count
    pop cx
    dec cx
    jz END1
    jmp green

    END1:
    MOV AH, 07H
    INT 21h
    CMP AL, "%"
    JNZ END1 ; Loop until '%' is received


.exit
end
