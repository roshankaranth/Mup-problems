.model tiny
.data

    filename    db  'sec.txt',0
    data        db  'Hello World!'
    handle      dw  ?

.code
.startup
opening_file:
    lea dx,filename
    mov al,01
    mov ah,3dh
    int 21h
    sbb bx,bx
    neg bx
    mov handle,ax

writing_file:
    mov ah,40h
    mov bx,handle
    mov cx,12
    lea dx,data
    int 21h
 
closing_file:
    mov ah,3eh
    int 21h


.exit
end