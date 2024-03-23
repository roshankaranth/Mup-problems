.model tiny
.data
str1	db	'Enter your name: $'

max1	db	32
act1	db	?
inp1 	db	32 dup('$')

fname	db	'testing.txt',0
handle	dw	?
.code
.startup
    ;printing to the user
    lea dx,str1
    mov ah,09h
    int 21h
    ;taking output
    lea dx,max1
    mov ah,0ah
    int 21h
    ;creating testing.txt
    mov ah,3ch
    mov cx,0
    lea dx,fname
    mov al,0
    int 21h
    mov handle,ax
    ;opening file
    mov ah,3dh
    mov dl,1
    lea dx,fname
    int 21h
    ;writing to file
    mov ah,40h
    mov bx,handle
    mov cl,act1
    lea dx,inp1
    int 21h
    ;closing file
    mov ah,3eh
    int 21h

.exit
end