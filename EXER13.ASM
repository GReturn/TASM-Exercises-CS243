; Filename: EXER13.ASM
; Programmer Name: RAFAEL A. MENDOZA
; Date: SEPTEMBER 20 2024
;  Description: This assembly language program will display multiple string variables on separate lines.


.MODEL small
.STACK 200h

.DATA
String1 DB 'Line1', 0Dh, 0Ah, '$'
String2 DB 'Line2', 0Dh, 0Ah, '$'
String3 DB 'Line3', 0Dh, 0Ah, '$'

.CODE
Start:
    MOV ax, @data
    MOV ds, ax
    MOV ah, 9
    MOV dx, OFFSET String1
    INT 21h

    MOV dx, OFFSET String2
    INT 21h

    MOV dx, OFFSET String3
    INT 21h

    MOV ah, 4ch
    INT 21h
    END Start