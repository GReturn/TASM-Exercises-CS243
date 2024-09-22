; Filename: EXER18.ASM
; Programmer Name: RAFAEL A. MENDOZA
; Date: SEPTEMBER 20 2024
; Description: This assembly language program will get string input and
; display the reverse of the string.


.MODEL small
.STACK 100h
.DATA
    MAX_STRING_LEN EQU 1000
    toRev DB MAX_STRING_LEN DUP (?)
    isRev DB MAX_STRING_LEN DUP (?)

.CODE
Start:
    mov ax, @data
    mov ds, ax

    mov ah, 3fh
    mov bx, 0
    mov cx, MAX_STRING_LEN

    mov dx, offset toRev
    int 21h
    and ax, ax

    jz Done
    mov cx, ax
    push cx
    
    mov bx, offset toRev
    mov si, offset isRev
    add si, cx
    dec si

RevLoop:
    mov al, [bx]
    mov [si], al
    inc bx
    dec si
    
    loop RevLoop
    pop cx
    mov ah, 40h
    mov bx, 1
    mov dx, offset isRev
    int 21h

Done:
    MOV ah, 4ch
    INT 21h
END Start