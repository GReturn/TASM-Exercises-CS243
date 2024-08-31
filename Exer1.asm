MODEL small
STACK 100h

CODESEG
LetR:
	MOV dl, 52h
	INT 21h
	RET
LetA:
	MOV dl, 41h
	INT 21h
	RET
LetF:
	MOV dl, 46h
	INT 21h
	RET
LetE:
	MOV dl, 45h
	INT 21h
	RET
LetL:
	MOV dl, 4Ch
	INT 21h
	RET
LetM:
	MOV dl, 4Dh
	INT 21h
	RET
LetN:
	MOV dl, 4Eh
	INT 21h
	RET
LetD:
	MOV dl, 44h
	INT 21h
	RET
LetO:
	MOV dl, 4Fh
	INT 21h
	RET
LetZ:
	MOV dl, 5Ah
	INT 21h
	RET
LetH:
	MOV dl, 48h
	INT 21h
	RET
LetW:
	MOV dl, 57H
	INT 21H
	RET
LetT:
	MOV dl, 54H
	INT 21H
	RET
LetK:
	MOV dl, 4bH
	INT 21H
	RET
LetY:
	MOV dl, 59H
	INT 21H
	RET
LetU:
	MOV dl, 55H
	INT 21H
	RET

Exclam:
	MOV dl, 21H
	INT 21H
	RET
Comma:
	MOV dl, 2CH
	INT 21H
	RET
Space:
	MOV dl, 20h
	INT 21h
	RET
NextL:
	MOV dl, 0Ah
	INT 21h
	RET
	
	
Start:
	MOV ah, 02h

	MOV dl, 61h
	INT 21h
	MOV dl, 62h
	INT 21h
	MOV dl, 63h
	INT 21h
	MOV dl, 64h
	INT 21h
	MOV dl, 66h
	INT 21h
	MOV dl, 67h
	INT 21h
	MOV dl, 68h
	INT 21h
	MOV dl, 69h
	INT 21h
	MOV dl, 6Ah
	INT 21h
	MOV dl, 6Bh
	INT 21h
	MOV dl, 6Ch
	INT 21h
	MOV dl, 6Dh
	INT 21h
	MOV dl, 6Eh
	INT 21h
	MOV dl, 6Fh
	INT 21h
	
	MOV dl, 70h
	INT 21h
	MOV dl, 71h
	INT 21h
	MOV dl, 72h
	INT 21h
	MOV dl, 73h
	INT 21h
	MOV dl, 74h
	INT 21h
	MOV dl, 76h
	INT 21h
	MOV dl, 77h
	INT 21h
	MOV dl, 78h
	INT 21h
	MOV dl, 79h
	INT 21h
	MOV dl, 7Ah
	INT 21h
	
	CALL NextL
	



	CALL LetA
	CALL Space
	
	MOV dl, 42h
	INT 21h
	CALL Space
	
	MOV dl, 43h
	INT 21h
	CALL Space
	
	CALL LetD
	CALL Space
	
	CALL LetE
	CALL Space
	
	CALL LetF
	CALL Space

	MOV dl, 47h
	INT 21h
	CALL Space
	
	MOV dl, 48h
	INT 21h
	CALL Space
	
	MOV dl, 49h
	INT 21h
	CALL Space
	
	MOV dl, 4Ah
	INT 21h
	CALL Space
	
	MOV dl, 4Bh
	INT 21h
	CALL Space
	
	MOV dl, 4Ch
	INT 21h
	CALL Space
	
	MOV dl, 4Dh
	INT 21h
	CALL Space

	MOV dl, 4Eh
	INT 21h
	CALL Space
	
	MOV dl, 4Fh
	INT 21h
	CALL Space

	MOV dl, 50h
	INT 21h
	CALL Space
	
	MOV dl, 51h
	INT 21h
	CALL Space
	
	MOV dl, 52h
	INT 21h
	CALL Space
	
	MOV dl, 53h
	INT 21h
	CALL Space
	
	MOV dl, 54h
	INT 21h
	CALL Space
	
	MOV dl, 55h
	INT 21h
	CALL Space
	
	MOV dl, 56h
	INT 21h
	CALL Space

	MOV dl, 57h
	INT 21h
	CALL Space
	
	MOV dl, 58h
	INT 21h
	CALL Space
	
	MOV dl, 59h
	INT 21h
	CALL Space

	MOV dl, 5Ah
	INT 21h
	CALL Space
	

	CALL Exit
Exit:
	MOV ah, 4CH
	INT 27h
	END Start