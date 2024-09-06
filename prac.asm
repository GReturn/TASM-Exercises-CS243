MODEL small
STACK 100h

DATASEG
my db 'by Lin$'

row1 db '|  x |   1 |   2 |   3 |   4 |   5 |   6 |   7 |   8 |   9 |  10 |$'
row2 db '|  1 |   2 |   2 |   3 |   4 |   5 |   6 |   7 |   8 |   9 |  10 |$'
row3 db '|  2 |   2 |   4 |   6 |   8 |  10 |  12 |  14 |  16 |  18 |  20 |$'
row4 db '|  3 |   3 |   6 |   9 |  12 |  15 |  18 |  21 |  24 |  27 |  30 |$'
row5 db '|  4 |   4 |   8 |  12 |  16 |  20 |  24 |  28 |  32 |  36 |  40 |$'
row6 db '|  5 |   5 |  10 |  15 |  20 |  25 |  30 |  35 |  40 |  45 |  50 |$'
row7 db '|  6 |   6 |  12 |  18 |  24 |  30 |  36 |  42 |  48 |  54 |  60 |$'
row8 db '|  7 |   7 |  14 |  21 |  28 |  35 |  42 |  49 |  54 |  63 |  70 |$'
row9 db '|  8 |   8 |  16 |  24 |  32 |  40 |  48 |  56 |  64 |  72 |  80 |$'
rowA db '|  9 |   9 |  18 |  27 |  36 |  45 |  54 |  63 |  72 |  81 |  90 |$'
rowB db '| 10 |  10 |  20 |  30 |  40 |  50 |  60 |  70 |  80 |  90 | 100 |$'

CODESEG
Orange:
    MOV ah, 09h
	MOV bl, 60h
	MOV cx, 6
	INT 10h
	MOV ah, 02h
	RET

NextL:
	MOV ah, 02h
    MOV dl, 0Ah
    int 21h
    MOV ah, 09h
    RET


Start:
    MOV ax, @data
    MOV ds, ax

    MOV ah, 09h
    MOV dx, offset my
    int 21h

    call NextL

    MOV ah, 09h
	MOV bl, 60h
	MOV cx, 66
	INT 10h

    MOV ah, 09h
    MOV dx, offset row1
    int 21h
    call NextL

    CALL Orange
    MOV ah, 09h
    MOV dx, offset row2
    int 21h
    call NextL

    CALL Orange
    MOV ah, 09h
    MOV dx, offset row3
    int 21h
    
    call NextL

    CALL Orange
    MOV ah, 09h
    MOV dx, offset row4
    int 21h

    call NextL

    CALL Orange
    MOV ah, 09h
    MOV dx, offset row5
    int 21h

    call NextL

    CALL Orange
    MOV ah, 09h
    MOV dx, offset row6
    int 21h
    
    call NextL
    
    CALL Orange
    MOV ah, 09h
    MOV dx, offset row7
    int 21h
    call NextL

    CALL Orange
    MOV ah, 09h
    MOV dx, offset row8
    int 21h


    call NextL 
    CALL Orange
    MOV ah, 09h
    MOV dx, offset row9
    int 21h

    call NextL
    CALL Orange
    MOV ah, 09h
    MOV dx, offset rowA
    int 21h

    call NextL
    CALL Orange
    MOV ah, 09h
    MOV dx, offset rowB
    int 21h


	CALL Exit
Exit:
	MOV ah, 4CH
	INT 27h
	END Start
