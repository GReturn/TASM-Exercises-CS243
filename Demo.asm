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
ByelFlred:
	MOV ah, 09h
	MOV bl, 6Ch
	MOV cx, 5
	INT 10h
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
	CALL ByelFlred
	MOV ah, 02h

	CALL LetR
	CALL LetA
	CALL LetF
	CALL LetA
	CALL LetE
	CALL LetL
	CALL Space
	CALL LetM
	CALL LetE
	CALL LetN
	CALL LetD
	CALL LetO
	CALL LetZ
	CALL LetA
	
	CALL BlinkH
	CALL NextL
	
	CALL ByelFlred
	MOV ah, 02h
	
	CALL LetH
	CALL LetE
	CALL LetL
	CALL LetL
	CALL LetO
	CALL Comma
	CALL Space
	CALL LetW
	CALL LetO
	CALL LetR
	CALL LetL
	CALL LetD
	CALL Exclam
	CALL NextL
	
	CALL LetT
	CALL LetH
	CALL LetA
	CALL LetN
	CALL LetK
	CALL Space
	CALL LetY
	CALL LetO
	CALL LetU
	CALL Exclam
	

	MOV cl, 4Ch
	CALL Exit
Exit:
	MOV ah, 4CH
	INT 27h
	END Start