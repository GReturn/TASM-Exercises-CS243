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
ByelFlred:
	MOV ah, 09h
	MOV bl, 6Ch
	MOV cx, 5
	INT 10h
	MOV ah, 02h
	RET
	
	
Start:
	MOV ah, 09h
	MOV bl, 6Ch
	MOV cx, 7
	INT 10h
	MOV ah, 02h

	MOV dl, 'C'
	INT 21h
	MOV dl, 'o'
	INT 21h
	MOV dl, 'l'
	INT 21h
	MOV dl, 'l'
	INT 21h
	MOV dl, 'e'
	INT 21h
	MOV dl, 'g'
	INT 21h
	MOV dl, 'e'
	INT 21h
	CALL NextL
	
	MOV ah, 09h
	MOV bl, 1Ch
	MOV cx, 2
	INT 10h
	MOV ah, 02h
	
	MOV dl, 'o'
	INT 21h
	MOV dl, 'f'
	INT 21h
	CALL NextL
	
	MOV ah, 09h
	MOV bl, 5Eh
	MOV cx, 8
	INT 10h
	MOV ah, 02h
	
	MOV dl, 'C'
	INT 21h
	MOV dl, 'o'
	INT 21h
	MOV dl, 'm'
	INT 21h
	MOV dl, 'p'
	INT 21h
	MOV dl, 'u'
	INT 21h
	MOV dl, 't'
	INT 21h
	MOV dl, 'e'
	INT 21h
	MOV dl, 'r'
	INT 21h
	CALL NextL
	
	MOV ah, 09h
	MOV bl, 2Bh
	MOV cx, 7
	INT 10h
	MOV ah, 02h
	
	MOV dl, 'S'
	INT 21h
	MOV dl, 't'
	INT 21h
	MOV dl, 'u'
	INT 21h
	MOV dl, 'd'
	INT 21h
	MOV dl, 'i'
	INT 21h
	MOV dl, 'e'
	INT 21h
	MOV dl, 's'
	INT 21h
	

	CALL Exit
Exit:
	MOV ah, 4CH
	INT 27h
	END Start