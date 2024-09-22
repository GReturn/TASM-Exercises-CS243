; Filename: EXER12.ASM
; Programmer Name: RAFAEL A. MENDOZA
; Date: SEPTEMBER 20 2024
;  Description: This assembly language program will display multiple string variables on a single line.

MODEL small
STACK 200h

DATASEG
String1 DB 'Line1', '$'
String2 DB 'Line2', '$'
String3 DB 'Line3', '$'

CODESEG
Start:
    MOV ax, @data
    MOV ds, ax
    MOV ah, 9
    MOV dx, offset String1
    INT 21h

    MOV dx, offset String2
    INT 21h

    MOV dx, offset String3
    INT 21h

    MOV ah, 4ch
    INT 21h
    END Start