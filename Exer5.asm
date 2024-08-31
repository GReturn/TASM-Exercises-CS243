MODEL small
STACK 100h

CODESEG

Space:
	MOV dl, ' '
	INT 21h
	RET
NextL:
	MOV dl, 0Ah
	INT 21h
	RET
BlueBack:
	MOV ah, 09h
	MOV bl, 1Ah
	MOV cx, 5
	INT 10h
	MOV ah, 02h
	RET
RedBack:
	MOV ah, 09h
	MOV bl, 4Ah
	MOV cx, 1
	INT 10h
	MOV ah, 02h
	RET	
	
Start:
	CALL BlueBack
	CALL Space
	CALL Space
	CALL Space
	CALL Space
	CALL Space
		CALL NextL
	
	
	CALL BlueBack
	CALL Space
	CALL Space
	
	CALL RedBack
	CALL Space
	
	CALL Space
	CALL Space
		CALL NextL

	CALL BlueBack
	CALL Space	
	CALL RedBack
	CALL Space
	CALL RedBack
	CALL Space
	CALL RedBack
	CALL Space
	CALL Space
		CALL NextL


	CALL BlueBack
	CALL Space
	CALL Space
	
	CALL RedBack
	CALL Space
	
	CALL Space
	CALL Space
		CALL NextL

	CALL BlueBack
	CALL Space
	CALL Space
	CALL Space
	CALL Space
	CALL Space
	CALL Exit
Exit:
	MOV ah, 4CH
	INT 27h
	END Start