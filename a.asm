MODEL small
STACK 100h

CODESEG

leta:
	mov dl, 41h
	int 21h
	RET

start:
	mov	ah, 02h
	
	mov dl, 48h
	int 21h
	
	mov dl, 45h
	int 21h
	CALL leta
	CALL leta
	CALL leta
	
	mov dl, 4ch
	int 21h
	
	mov dl, 4ch
	int 21h
	
	mov dl, 4fh
	int 21h
	jmp exit
	
exit:
	mov ah, 4ch
	int 21h
	end start
	