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

	MOV dl, '0'
	INT 21h
		CALL Space
	MOV dl, '1'
	INT 21h
		CALL Space
	MOV dl, '2'
	INT 21h
		CALL Space
	MOV dl, '3'
	INT 21h
		CALL Space
	MOV dl, '4'
	INT 21h
		CALL Space
	MOV dl, '5'
	INT 21h
		CALL Space
	MOV dl, '6'
	INT 21h
		CALL Space
	MOV dl, '7'
	INT 21h
		CALL Space
	MOV dl, '8'
	INT 21h
		CALL Space
	MOV dl, '9'
	INT 21h
		CALL NextL
		
		
	MOV dl, '!'
	INT 21h
		CALL Space
	MOV dl, '*'
	INT 21h
		CALL Space
	MOV dl, '#'
	INT 21h
		CALL Space
	MOV dl, '$'
	INT 21h
		CALL Space
	MOV dl, '%'
	INT 21h
		CALL Space
	MOV dl, '^'
	INT 21h
		CALL Space
	MOV dl, '&'
	INT 21h
		CALL Space
	MOV dl, '*'
	INT 21h
		CALL Space
	MOV dl, '('
	INT 21h
		CALL Space
	MOV dl, ')'
	INT 21h
		CALL NextL
		
		
	MOV dl, '-'
	INT 21h
		CALL Space
	MOV dl, '_'
	INT 21h
		CALL Space
	MOV dl, '+'
	INT 21h
		CALL Space
	MOV dl, '='
	INT 21h
		CALL Space
	MOV dl, '{'
	INT 21h
		CALL Space
	MOV dl, '}'
	INT 21h
		CALL Space
	MOV dl, '['
	INT 21h
		CALL Space
	MOV dl, ']'
	INT 21h
		CALL Space
	MOV dl, '<'
	INT 21h
		CALL Space
	MOV dl, '>'
	INT 21h
		CALL Space
	MOV dl, '?'
	INT 21h
		CALL Space
	MOV dl, '/'
	INT 21h
		CALL Space

	

	CALL Exit
Exit:
	MOV ah, 4CH
	INT 27h
	END Start