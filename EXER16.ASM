; Filename: EXER16.ASM
; Programmer Name: RAFAEL A. MENDOZA
; Date: SEPTEMBER 20 2024
; Description: This assembly language program will get character input and 
; and determine if input is 'y' or 'Y' to display good morning message
; else display good afternoon message.

.MODEL small
.STACK 100h
.DATA
    pTime DB 'Is it after 12 noon (Y/N)? $'
    msgGM LABEL BYTE 
        DB 13, 10,'Good morning, world!',13, 10,'$'
    msgGA LABEL BYTE 
        DB 13, 10, 'Good afternoon, world!', 13, 10, '$'    
.CODE
Start:
    mov ax, @data
    mov ds, ax

    mov dx, offset pTime
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h

    cmp al, 'y'
    jz IsAft
    cmp al, 'Y'
    jnz IsMor


IsAft:
    mov dx, offset msgGA
    jmp DisplayGreeting

IsMor:
    mov dx, offset msgGM
    jmp DisplayGreeting
    
DisplayGreeting:
    mov ah, 9
    int 21h

    MOV ah, 4ch
    INT 21h
END Start