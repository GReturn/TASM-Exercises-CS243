; Filename: EXER17.ASM
; Programmer Name: RAFAEL A. MENDOZA
; Date: SEPTEMBER 20 2024
; Description: This assembly language program will get string input and
; display back string.


.MODEL small
.STACK 100h
.DATA
    MAX_STRING_LEN EQU 1000
    iString DB MAX_STRING_LEN DUP (?)
    iPrompt DB 'Enter text: $'    
.CODE
Start:
    mov ax, @data
    mov ds, ax

    mov dx, offset iPrompt
    mov ah, 9
    int 21h

    mov ah, 3fh
    mov bx, 0
    mov cx, MAX_STRING_LEN
    mov dx, offset iString
    int 21h

    and ax, ax
    jz Done
    mov cx, ax

    push cx
    mov ah, 40h
    mov bx, 1
    mov dx, offset iString
    int 21h

Done:
    MOV ah, 4ch
    INT 21h
END Start