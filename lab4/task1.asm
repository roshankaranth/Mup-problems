.model tiny
.data
dat1 db 'wasitacatisaw'
dat1length db 0ch
res dw 00h
.code
.startup

               lea si,dat1 //0130
               lea bx,dat1length //013d
               mov cx,[bx]
               lea bx,res //013e
               mov di,si
               add di,cx
               cld

checker_loop:  
               cmpsb 
               jnz not_palindrome
               dec di
               dec di
               cmp si,di
               jge palindrome
               jmp checker_loop

not_palindrome:
               mov dx,00
               mov [bx],dx
               jmp end_program

palindrome:    
               mov dx,01
               mov[bx],dx
               jmp end_program

end_program:

.exit
end