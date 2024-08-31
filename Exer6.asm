MODEL small
STACK 100h

CODESEG

yel:
	MOV ah, 09h
	MOV bl, 0Eh
	MOV cx, 5
	INT 10h
	MOV ah, 02h
	RET
BlinkH:
	MOV ah, 09h
	MOV bl, 84h
	MOV cx, 1
	INT 10h
	
	MOV ah, 2
	MOV dl, 03h
	INT 21h
	RET
	
Start:
	MOV ah, 02h
	CALL yel
	
	MOV dl, 'I'
	INT 21H
	MOV dl, ' '
	INT 21H
	CALL BlinkH
	MOV dl, ' '
	INT 21H
	MOV dl, 'U'
	INT 21H
	

	MOV cl, 4Ch
	CALL Exit
Exit:
	MOV ah, 4CH
	INT 27h
	END Start