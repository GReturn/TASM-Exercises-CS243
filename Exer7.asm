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
WhiteBack:
    MOV ah, 09h
	MOV bl, 80h
	MOV cx, 14
	INT 10h
	MOV ah, 02h
	RET
YellowBack:
	MOV ah, 09h
	MOV bl, 70h
	MOV cx, 1
	INT 10h
	MOV ah, 02h
	RET
BlackBack:
	MOV ah, 09h
	MOV bl, 00h
	MOV cx, 1
	INT 10h
	MOV ah, 02h
	RET	
OrangeBack:
	MOV ah, 09h
	MOV bl, 60h
	MOV cx, 1
	INT 10h
	MOV ah, 02h
	RET	

Blink:
	MOV ah, 09h
	MOV bl, 89h
	MOV cx, 1
	INT 10h
	
	MOV ah, 2
	MOV dl, 4h
	INT 21h
	RET

Start:
    ; Row 1
	CALL WhiteBack          
	CALL Space
	CALL Space
	CALL Space
	CALL Space
	CALL Space
    CALL Space
	CALL Space
	CALL Space
	CALL Space
	CALL Space
    CALL Space
	CALL Space
	CALL Space
	CALL Space
		CALL NextL
	
	; Row 2
	CALL WhiteBack
	CALL Space
	CALL Space
	CALL Space
	CALL Space
    CALL YellowBack
	CALL Space
    CALL YellowBack
    CALL Space
    CALL YellowBack
	CALL Space
    CALL YellowBack
	CALL Space
    CALL YellowBack
	CALL Space
	CALL Space
    CALL Space
	CALL Space
	CALL Space
	CALL Space
		CALL NextL

; Row 3
	CALL WhiteBack
	CALL Space
	CALL Space
	CALL Space
	CALL YellowBack
	CALL Space
    CALL YellowBack
	CALL Space
    CALL YellowBack
    CALL Space
    CALL YellowBack
	CALL Space
    CALL YellowBack
	CALL Space
    CALL YellowBack
	CALL Space
	CALL YellowBack
	CALL Space
    CALL Space
	CALL Space
	CALL Space
	CALL Space
		CALL NextL

; Row 4
	CALL WhiteBack
	CALL Space
	CALL Space
	CALL Space
	CALL OrangeBack
	CALL Space
    CALL YellowBack
	CALL Space
	CALL Blink
    CALL YellowBack
    CALL Space
    CALL YellowBack
	CALL Space
    CALL YellowBack
	CALL Space
    CALL YellowBack
	CALL Space
	CALL Space
    CALL Space
	CALL Space
	CALL Space
	CALL Space
		CALL NextL

        
	CALL Exit
Exit:
	MOV ah, 4CH
	INT 27h
	END Start