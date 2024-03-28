; This Assembly Language Program (ALP) checks the entered username and password, and displays a custom message accordingly.

.model tiny
.data

; Data section contains the messages, the correct username, and password for comparison.

msg1 db "enter User Name: $" ; Message 1: Prompt to enter the username
usn1 db "rosh@g.com$" ; Correct username for comparison
inp1 db 20 dup("$") ; Buffer to store user's input for username

msg2 db "enter password:$" ; Message 2: Prompt to enter the password
pass1 db "oscar" ; Correct password for comparison
inp2 db 30 dup("$") ; Buffer to store user's input for password
msg3 db "hello $" ; Message 3: Greeting message when both inputs are correct
msg4 db "wrong username$" ; Message 4: Wrong username input
msg5 db "wrong password$" ; Message 5: Wrong password input
nline db 0ah, 0dh, "$" ; New line characters
file1 db 'user.txt',0
handle1 dw  ?
file2 db 'pswd.txt',0
handle2 dw  ?

.code
.startup
    ;opening user.txt
    mov ah,3dh
    mov al,00h
    lea dx,file1
    int 21h
    mov handle1,ax

    ;reading user.txt
    mov ah,3fh
    mov bx,handle1
    mov cx,32
    lea dx,inp1
    int 21h


    ;closing user.txt
    mov ah,3eh
    int 21h

    ;opening pswd.txt
    mov ah,3dh
    mov al,00h
    lea dx,file2
    int 21h
    mov handle2,ax

    ;reading pswd.txt
    mov ah,3fh
    mov bx,handle2
    mov cx,32
    lea dx,inp2
    int 21h

    ;closing pswd.txt
    mov ah,3eh
    int 21h

    ; Display message 1 on the screen and go to the next line.

    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Add a new line after the message.

    lea dx, nline
    mov ah, 09h
    int 21h

    ; Take input from the user and store it in inp1.

    ; lea dx, max1
    ; mov ah, 0ah
    ; int 21h
    ; mov ah,3fh
    ; lea bx,file1
    ; mov cx,10
    ; lea dx,inp1
    ; int 21h

    ; Compare the entered username with the stored username.

    cld
    lea di, inp1
    lea si, usn1
    mov cx, 11
    repe cmpsb
    jcxz l1

    ; If the username is incorrect, display the "wrong username" message and exit.

    lea dx, nline
    mov ah, 09h
    int 21h

    lea dx, msg4
    mov ah, 09h
    int 21h

    mov ah, 4ch
    int 21h

    ; If the username is correct, display the "enter password" message.

    l1:
    lea dx, nline
    mov ah, 09h
    int 21h

    lea dx, msg2
    mov ah, 09h
    int 21h

    lea dx, nline
    mov ah, 09h
    int 21h

    ; Take password input from the user, masking the characters.

    ; mov cx, 6
    ; lea di, inp2
    ; l2:
    ; mov ah, 08h
    ; int 21h
    ; mov [di], al
    ; mov dl, '*'
    ; mov ah, 02h
    ; int 21h
    ; inc di
    ; dec cx
    ; jnz l2
    ; mov ah,3fh
    ; lea bx,file2
    ; mov cx,5
    ; lea dx,inp2
    ; int 21h

    ; Compare the entered password with the stored password.

    cld
    mov cx, 6
    lea di, inp2
    lea si, pass1
    repe cmpsb
    jcxz l3

    ; If the password is incorrect, display the "wrong password" message and exit.

    lea dx, nline
    mov ah, 09h
    int 21h

    lea dx, msg5
    mov ah, 09h
    int 21h

    mov ah, 4ch
    int 21h

    ; If the password is correct, display the greeting message and the username.

    l3:
    lea dx, nline
    mov ah, 09h
    int 21h

    lea dx, msg3
    mov ah, 09h
    int 21h

    lea dx, usn1
    mov ah,09h
    int 21h

    lea dx, nline
    mov ah, 09h
    int 21h


    lea bx, msg2
    lea bx, msg2
    lea bx, msg2
    lea bx, msg2


.exit
end