; Filename: EXER19.ASM
; Programmer Name: RAFAEL A. MENDOZA
; Date: SEPTEMBER 20 2024
; Description: Create a program that asks the user to input 3 characters. Then 
; display each character on its own line.

.MODEL small
.STACK 100h
.DATA
    iC1 DB ?
    iC2 DB ?
    iC3 DB ?
    
    p1 DB 'Enter first character: $'
    p2 DB 'Enter second character: $'
    p3 DB 'Enter third character: $'

    o1 DB 'The first character is $'
    o2 DB 'The second character is $'
    o3 DB 'The third character is $'
    nxt DB 0dh, 0ah, '$'

.CODE
Next:   
    lea dx, nxt
    MOV ah, 09h
    INT 21h
    RET

PerNext:
    MOV dx, '.'
    INT 21h
    MOV dx, OFFSET nxt
    MOV ah, 09h
    INT 21h
    RET

Start:
    MOV ax, @data
    MOV ds, ax

    lea dx, p1
    MOV ah, 09h
    INT 21h

    mov ah, 01h
    int 21h
    mov iC1, al
    CALL Next

    
    lea dx, p2
    MOV ah, 09h
    INT 21h

    mov ah, 01h
    int 21h
    mov iC2, al
    CALL Next

    
    lea dx, p3
    MOV ah, 09h
    INT 21h

    mov ah, 01h
    int 21h
    mov iC3, al
    CALL Next

    MOV dx, OFFSET o1
    mov ah, 09h
    INT 21h

    MOV dl, iC1
    mov ah, 2h
    INT 21h
    CALL PerNext

    MOV dx, OFFSET o2
    mov ah, 09h
    INT 21h

    MOV dl, iC2
    mov ah, 2h
    INT 21h
    CALL PerNext

    MOV dx, OFFSET o3
    mov ah, 09h
    INT 21h

    MOV dl, iC3
    mov ah, 2h
    INT 21h
    CALL PerNext

    MOV ax, 4c00h
    INT 21h
END Start