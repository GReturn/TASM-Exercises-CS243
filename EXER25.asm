; Filename: EXER25.ASM
; Programmer Name: RAFAEL A. MENDOZA
; Date : September 28, 2024
; Description: This assembly language program will get 3 string inputs and
; display back the 3 strings on separate lines.

.model small
.stack 100h
.data
    inputString1 db 50 DUP('$') ; Reserve 50 bytes for input string
    inputString2 db 50 DUP('$')
    inputString3 db 50 DUP('$')
    promptString1 db 'Enter first string: $'
    promptString2 db 'Enter second string: $'
    promptString3 db 'Enter third string: $'
    outputString1 db 'You entered first string: $'
    outputString2 db 'You entered second string: $'
    outputString3 db 'You entered third string: $'
.code
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    
    LEA DX, promptString1
    MOV AH, 09h ; DOS function to display a string
    INT 21h
    
    LEA DX, inputString1
    MOV AH, 0Ah ; DOS function to read a string
    INT 21h

    ; this is for displaying new line
    mov ah,02h
    mov cl,0Ah ; 0Ah new line
    mov dl,cl
    int 21h

    ; Prompt the user for input second string
    LEA DX, promptString2
    MOV AH, 09h ; DOS function to display a string
    INT 21h

    LEA DX, inputString2
    MOV AH, 0Ah 
    INT 21h

    mov ah,02h
    mov cl,0Ah 
    mov dl,cl
    int 21h

    LEA DX, promptString3
    MOV AH, 09h
    INT 21h

    LEA DX, inputString3
    MOV AH, 0Ah
    INT 21h

    mov ah,02h
    mov cl,0Ah 
    mov dl,cl
    int 21h

    LEA DX, outputString1
    MOV AH, 09h 
    INT 21h

    ; Display the entered first string
    LEA DX, inputString1 + 2 ; Skip the first two bytes (length and max length)
    MOV AH, 09h 
    INT 21h

    mov ah,02h
    mov cl,0Ah 
    mov dl,cl
    int 21h

    LEA DX, outputString2
    MOV AH, 09h
    INT 21h

    LEA DX, inputString2 + 2
    MOV AH, 09h
    INT 21h

    mov ah,02h
    mov cl,0Ah
    mov dl,cl
    int 21h

    LEA DX, outputString3
    MOV AH, 09h 
    INT 21h

    LEA DX, inputString3 + 2 
    MOV AH, 09h 
    INT 21h

    MOV AX, 4C00h
    INT 21h
MAIN ENDP
END MAIN