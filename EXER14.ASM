; Filename: EXER14.ASM
; Programmer Name: RAFAEL A. MENDOZA
; Date: SEPTEMBER 20 2024
; Description: This assembly language program will get character input and 
; display back character input.


.MODEL small
.STACK 200h

.DATA
    iChr DB ?
    iMsg DB 'Enter a character: $'
    oMsg DB 0dh, 0ah, 'You entered: $'

.CODE
Start:
    MOV ax, @data
    MOV ds, ax

    MOV dx, OFFSET iMsg
    MOV ah, 09h
    INT 21h

    mov ah, 01h
    int 21h
    mov iChr, al


    MOV dx, OFFSET oMsg
    mov ah, 09h
    INT 21h

    MOV dl, iChr
    mov ah, 2h
    INT 21h

    MOV ax, 4c00h
    INT 21h
    END Start