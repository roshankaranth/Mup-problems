.model tiny
.data
fname1	db	'name.txt',0
fname2 	db	'id.txt',0
handle1	dw	?
handle2	dw ?

max1	db	32
act1	db	?
inp1 	db	32 dup('$')

max2	db	32
act2	db	?
inp2 	db	32 dup('$')

.code
.startup

    ;creating name.txt
    mov ah,3ch
    mov cx,0
    lea dx,fname1
    mov al,0
    int 21h
    mov handle1,ax
    ;creating id.txt
    mov ah,3ch
    lea dx,fname2
    mov al,0
    int 21h
    mov handle2,ax
    ;taking name as input
    lea dx,max1
    mov ah,0ah
    int 21h
    ;taking id as input
    lea dx,max2
    mov ah,0ah
    int 21h
    ;opening name.txt
    mov ah,3dh
    mov al,01
    lea dx,fname1
    int 21h
    ;writing to name.txt
    mov ah,40h
    mov bx,handle1
    mov cl,act1
    lea dx,inp1
    int 21h
    ;closing name.txt
    mov ah,3eh
    int 21h
    ;opening id.txt
    mov ah,3dh
    mov al,01
    lea dx,fname2
    int 21h
    ;writing to name.txt
    mov ah,40h
    mov bx,handle2
    mov cl,act2
    lea dx,inp2
    int 21h
    ;closing name.txt
    mov ah,3eh
    int 21h



.exit
end

;can we open two files simultaneoulsy?