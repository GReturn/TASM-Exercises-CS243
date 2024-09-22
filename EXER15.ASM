; Filename: EXER15.ASM
; Programmer Name: RAFAEL A. MENDOZA
; Date: SEPTEMBER 20 2024
; Description: This assembly language program will continuously get 
; character input and display back input until Enter key is pressed.


.MODEL small
.STACK 200h

.CODE
Start:
    EchoLoop:
        MOV ah, 1
        int 21h

        cmp al, 13
        jz EchoDone
        mov dl, al
        mov ah, 2
        int 21h
        jmp EchoLoop
    EchoDone:
        MOV ah, 4ch
        INT 21h
END Start