.model tiny
.data
fname1	db 'name.txt',0
handle1	dw ?
fname2	db 'id.txt',0
handle2	dw ?
fname3	db 'splice.txt',0
handle3	dw ?

part1	db  32 dup('$')
part2	db  32 dup('$')
len1    db  ?

.code
.startup

        ;create splice.txt
        mov ah,3ch
        mov cx,00
        lea dx,fname3
        mov al,00
        int 21h
        mov handle3,ax
        ;opening id.txt
        mov ah,3dh
        mov al,0
        lea dx,fname2
        int 21h
        mov handle2,ax
        ;reading from id.txt
        mov ah,3fh
        mov bx,handle2
        mov cx,32
        lea dx,part1
        int 21h
        lea si,part1
        add si,ax
        mov len1,al
        ;closing id.txt
        mov ah,3eh
        int 21h
        ;opening name.txt
        mov ah,3dh
        mov al,0
        lea dx,fname1
        int 21h
        mov handle1,ax
        ;reading from name.txt
        mov ah,3fh
        mov bx,handle1
        mov cx,32
        mov dx,si
        int 21h
        add len1,al
        ;closing name.txt
        mov ah,3eh
        int 21h
        ;opening splice.txt
        mov ah,3dh
        mov al,1
        lea dx,fname3
        int 21h
        ;writing to splic.txt
        mov ah,40h
        mov bx,handle3
        mov cl,len1
        lea dx,part1
        int 21h
        ;closing splic.txt
        mov ah,3eh
        int 21h


.exit
end