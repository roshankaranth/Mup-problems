.model tiny
.data

    loc1     db 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'
    loc2     db 10 dup(?)
    count   equ 10  
.code
.startup

    lea si,loc1
    lea di,loc2+9
    mov cx,count

transfer:
    cld
    movsb
    dec di
    dec di
    dec cx
    jnz transfer


.exit
end