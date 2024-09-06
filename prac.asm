MODEL small
STACK 100h

CODESEG
Corner:
	MOV dl, '+'
	INT 21h
	RET
Hori:
	MOV dl, '-'
	INT 21h
	RET
Vert:
	MOV dl, '|'
	INT 21h
	RET
Space:
	MOV dl, ' '
	INT 21h
	RET
NextL:
	MOV dl, 0Ah
	INT 21h
	RET

CellSide:
    CALL Corner
    CALL Hori
    CALL Hori
    CALL Hori
    CALL Hori
    RET

Start:
    mov ah, 02h
    CALL CellSide
    CALL CellSide
    CALL CellSide
    CALL CellSide
    CALL CellSide
    CALL CellSide
    CALL CellSide
    CALL CellSide
    CALL CellSide
    CALL CellSide
    CALL Corner
    CALL NextL

    CALL Vert
    CALL Space
    CALL Space
    MOV dl, '1'
	INT 21h
    CALL Space
    CALL Vert
    CALL Space
    CALL Space
    MOV dl, '2'
	INT 21h
    CALL Space
    CALL Vert
    CALL Space
    CALL Space
    MOV dl, '3'
	INT 21h
    CALL Space
    CALL Vert
    CALL Space
    CALL Space
    MOV dl, '4'
	INT 21h
    CALL Space
    CALL Vert
    CALL Space
    CALL Space
    MOV dl, '5'
	INT 21h
    CALL Space
    CALL Vert
    CALL Space
    CALL Space
    MOV dl, '6'
	INT 21h
    CALL Space
    CALL Vert
    CALL Space
    CALL Space
    MOV dl, '7'
	INT 21h
    CALL Space
    CALL Vert
    CALL Space
    CALL Space
    MOV dl, '8'
	INT 21h
    CALL Space
    CALL Vert
    CALL Space
    CALL Space
    MOV dl, '9'
	INT 21h
    CALL Space
    CALL Vert
    CALL Space
    MOV dl, '1'
	INT 21h
    MOV dl, '0'
	INT 21h
    CALL Space
    CALL Vert

        
	CALL Exit
Exit:
	MOV ah, 4CH
	INT 27h
	END Start