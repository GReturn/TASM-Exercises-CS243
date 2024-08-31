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
	
	
Start:
	MOV ah, 02h

	MOV dl, 'R'
	INT 21h
	MOV dl, 'a'
	INT 21h
	MOV dl, 'f'
	INT 21h
	MOV dl, 'a'
	INT 21h
	MOV dl, 'e'
	INT 21h
	MOV dl, 'l'
	INT 21h
	CALL Space
	
	MOV dl, 'A'
	INT 21h
	MOV dl, 'b'
	INT 21h
	MOV dl, 'a'
	INT 21h
	MOV dl, 'b'
	INT 21h
	MOV dl, 'a'
	INT 21h
	MOV dl, 't'
	INT 21h
	CALL Space
	
	MOV dl, 'M'
	INT 21h
	MOV dl, 'e'
	INT 21h
	MOV dl, 'n'
	INT 21h
	MOV dl, 'n'
	INT 21h
	MOV dl, 'd'
	INT 21h
	MOV dl, 'o'
	INT 21h
	MOV dl, 'z'
	INT 21h
	MOV dl, 'a'
	INT 21h	
	
	
	CALL NextL
	
	
	MOV dl, 'B'
	INT 21h
	MOV dl, 'a'
	INT 21h
	MOV dl, 'c'
	INT 21h
	MOV dl, 'h'
	INT 21h
	MOV dl, 'e'
	INT 21h
	MOV dl, 'l'
	INT 21h
	MOV dl, 'o'
	INT 21h
	MOV dl, 'r'
	INT 21h
	CALL Space
	
	MOV dl, 'o'
	INT 21h
	MOV dl, 'f'
	INT 21h
	CALL Space
	
	MOV dl, 'S'
	INT 21h
	MOV dl, 'c'
	INT 21h
	MOV dl, 'i'
	INT 21h
	MOV dl, 'e'
	INT 21h
	MOV dl, 'n'
	INT 21h
	MOV dl, 'c'
	INT 21h
	MOV dl, 'e'
	INT 21h
	CALL Space
	
	MOV dl, 'i'
	INT 21h
	MOV dl, 'n'
	INT 21h
	CALL Space
	
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
	CALL Space
	
	MOV dl, 'S'
	INT 21h
	MOV dl, 'c'
	INT 21h
	MOV dl, 'i'
	INT 21h
	MOV dl, 'e'
	INT 21h
	MOV dl, 'n'
	INT 21h
	MOV dl, 'c'
	INT 21h
	MOV dl, 'e'
	INT 21h
	CALL Space

	MOV dl, '2'
	INT 21h
	MOV dl, 'n'
	INT 21h
	MOV dl, 'd'
	INT 21h
	CALL Space
	
	MOV dl, 'Y'
	INT 21h
	MOV dl, 'e'
	INT 21h
	MOV dl, 'a'
	INT 21h
	MOV dl, 'r'
	INT 21h


	CALL NextL
	
	
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
	CALL Space
	
	MOV dl, 'o'
	INT 21h
	MOV dl, 'f'
	INT 21h
	CALL Space
	
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
	CALL Space
	
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
	
	
	CALL NextL
	
	
	MOV dl, 'C'
	INT 21h
	MOV dl, 'e'
	INT 21h
	MOV dl, 'b'
	INT 21h
	MOV dl, 'u'
	INT 21h
	CALL Space
	
	MOV dl, 'I'
	INT 21h
	MOV dl, 'n'
	INT 21h
	MOV dl, 's'
	INT 21h
	MOV dl, 't'
	INT 21h
	MOV dl, 'i'
	INT 21h
	MOV dl, 't'
	INT 21h
	MOV dl, 'u'
	INT 21h
	MOV dl, 't'
	INT 21h
	MOV dl, 'e'
	INT 21h
	CALL Space

	MOV dl, 'o'
	INT 21h
	MOV dl, 'f'
	INT 21h
	CALL Space

	MOV dl, 'T'
	INT 21h
	MOV dl, 'e'
	INT 21h
	MOV dl, 'c'
	INT 21h
	MOV dl, 'h'
	INT 21h
	MOV dl, 'n'
	INT 21h
	MOV dl, 'o'
	INT 21h
	MOV dl, 'l'
	INT 21h
	MOV dl, 'o'
	INT 21h
	MOV dl, 'g'
	INT 21h
	MOV dl, 'y'
	INT 21h
	CALL Space
	
	MOV dl, '-'
	INT 21h
	CALL Space
	
	MOV dl, 'U'
	INT 21h
	MOV dl, 'n'
	INT 21h
	MOV dl, 'i'
	INT 21h
	MOV dl, 'v'
	INT 21h
	MOV dl, 'e'
	INT 21h
	MOV dl, 'r'
	INT 21h
	MOV dl, 's'
	INT 21h
	MOV dl, 'i'
	INT 21h
	MOV dl, 't'
	INT 21h
	MOV dl, 'y'
	INT 21h
	CALL Space
	

	CALL Exit
Exit:
	MOV ah, 4CH
	INT 27h
	END Start