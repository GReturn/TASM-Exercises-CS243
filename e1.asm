MODEL small
STACK 100h

DATASEG
msg1 DB 'Multiplication Table$'
msg2 DB 'Created by: Rafael Ababat Mendoza$'
msg3 DB 'Date: September 6, 2024$'

row0 DB '___________________________________________________________________$'
row1 DB '|___X_|___1_|___2_|___3_|___4_|___5_|___6_|___7_|___8_|___9_|__10_|$'
row2 DB '|___1_|___1_|___2_|___3_|___4_|___5_|___6_|___7_|___8 |___9_|__10_|$'
row3 DB '|___2_|___2_|___4_|___6_|___8_|__10_|__12_|__14_|__16_|__18_|__20_|$'
row4 DB '|___3_|___3_|___6_|___9_|__12_|__15_|__18_|__21_|__24_|__27_|__30_|$'
row5 DB '|___4_|___4_|___8_|__12_|__16_|__20_|__24_|__28_|__32_|__36_|__40_|$'
row6 DB '|___5_|___5_|__10_|__15_|__20_|__25_|__30_|__35_|__40_|__45_|__50_|$'
row7 DB '|___6_|___6_|__12_|__18_|__24_|__30_|__36_|__42_|__48_|__54_|__60_|$'
row8 DB '|___7_|___7_|__14_|__21_|__28_|__35_|__42_|__49_|__56_|__63_|__70_|$'
row9 DB '|___8_|___8_|__16_|__24_|__32_|__40_|__48_|__56_|__64_|__72_|__80_|$'
rowA DB '|___9_|___9_|__18_|__27_|__36_|__45_|__54_|__63_|__72_|__81_|__90_|$'
rowB DB '|__10_|__10_|__20_|__30_|__40_|__50_|__60_|__70_|__80_|__90_|_100_|$'

bord DB '-------------------------------------------------------------------$'

CODESEG
NL:
    MOV ah, 02h
    MOV dl, 0Ah
    int 21h
    MOV ah, 09h
    RET
Borde:
	mov dx, offset bord
	int 21h
	CALL NL
	RET

Col:
	MOV ah, 09h
	MOV bl, 2Fh
	MOV cx, 7
	INT 10h
;	MOV ah, 09h 
	RET
Tabl:
	mov dx, offset row0
	int 21h
	CALL NL
	
	MOV ah, 09h
	MOV bl, 2Fh
	MOV cx, 67
	INT 10h
	

	mov dx, offset row1
	int 21h
	CALL NL
	;CALL Borde
	
	CAll Col
	mov dx, offset row2
	int 21h
	CALL NL
	;CALL Borde
	
	CAll Col	
	mov dx, offset row3
	int 21h
	CALL NL
	;CALL Borde
		
	CAll Col
	mov dx, offset row4
	int 21h
	CALL NL
	;CALL Borde
	
	CAll Col
	mov dx, offset row5
	int 21h
	CALL NL
	;CALL Borde
		
	CAll Col
	mov dx, offset row6
	int 21h
	CALL NL
	;CALL Borde
	
	CAll Col
	mov dx, offset row7
	int 21h
	CALL NL
	;CALL Borde
	
	CAll Col
	mov dx, offset row8
	int 21h
	CALL NL
	;CALL Borde
	
	CAll Col
	mov dx, offset row9
	int 21h
	CALL NL
	;CALL Borde
		
	CAll Col
	mov dx, offset rowA
	int 21h
	CALL NL
	;CALL Borde
	
	CAll Col
	mov dx, offset rowB
	int 21h
	CALL NL
	
	RET


Start:
    MOV ax, @data ; init dataseg
    MOv ds, ax

    MOV ah, 9
    MOV dx, offset msg1
    int 21h

    CALL NL

    MOV dx, offset msg2
    int 21h

    CALL NL

    MOV dx, offset msg3
    int 21h
    
    CALL NL
	;CALL NL
	CALL Tabl
    
    CALL Exit

Exit:
    MOV ah, 4CH
    int 27h
    end Start