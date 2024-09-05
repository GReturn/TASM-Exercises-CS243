MODEL small
STACK 100h

DATASEG
msg1 DB 'Rafael Ababat Mendoza$'
msg2 DB 'Bachelor of Science in Computer Science 2nd Year$'
msg3 DB 'College of Computer Studies$'
msg4 DB 'Cebu Institute of Technology - University$'


CODESEG
NL:
    MOV ah, 02h
    MOV dl, 0Ah
    int 21h
    MOV ah, 09h
    RET

Start:
    MOV ax, @data
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

    MOV dx, offset msg4
    int 21h
    
    CALL Exit

Exit:
    MOV ah, 4CH
    int 27h
    end Start