; Filename: EXER21.ASM
; Programmer Name: RAFAEL A. MENDOZA
; Date: SEPTEMBER 20 2024
; Description: Create a program that asks for your first name, middle name, and 
; family name. Then display “Hello, FIRST NAME MIDDLE NAME FAMILY NAME!”

.MODEL small
.STACK 200h
.DATA
    row0 DB 'REGISTRATION FORM', 0dh, 0ah, '$'

    pFirst DB 'Enter First Name: $'    
    iFirst DB 100, 0     ; Max input size is 100, initially 0 characters entered
    iFirstBuffer DB 100 DUP ('$')  ; Buffer for the first name input

    pMiddle DB 'Enter Middle Name: $'
    iMiddle DB 100, 0     ; Max input size is 100, initially 0 characters entered
    iMiddleBuffer DB 100 DUP ('$')  ; Buffer for the middle name input

    pLast DB 'Enter Last Name: $'
    iLast DB 100, 0      ; Max input size is 100, initially 0 characters entered
    iLastBuffer DB 100 DUP ('$')   ; Buffer for the last name input

    oHello DB 'Hello, $'
    space DB ' $'
    exclam DB '!$'
    nxt DB 0dh, 0ah, '$'

.CODE

PrintString:
    MOV ah, 09h
    INT 21h
    RET

NextL:
    lea dx, nxt
    MOV ah, 09h
    INT 21h
    RET

PrintSpace:
    lea dx, space
    MOV ah, 09h
    INT 21h
    RET

PrintExclamation:
    lea dx, exclam
    MOV ah, 09h
    INT 21h
    RET

Start:
    mov ax, @data
    mov ds, ax

    lea dx, row0
    CALL PrintString
    CALL NextL

    ; Prompt for First Name
    lea dx, pFirst
    CALL PrintString
    lea dx, iFirst
    mov ah, 0ah
    int 21h
    CALL NextL

    ; Prompt for Middle Name
    lea dx, pMiddle
    CALL PrintString
    lea dx, iMiddle
    mov ah, 0ah
    int 21h
    CALL NextL

    ; Prompt for Last Name
    lea dx, pLast
    CALL PrintString
    lea dx, iLast
    mov ah, 0ah
    int 21h
    CALL NextL

    ; Output Hello
    lea dx, oHello
    CALL PrintString

    ; Print First Name
    lea si, iFirst + 2   ; Start of first name in buffer (after length bytes)
    mov cl, [iFirst+1]   ; Get length of first name
PrintFirstName:
    mov dl, [si]
    cmp dl, 0dh          ; Check for ENTER key (carriage return)
    je DoneFirstName
    mov ah, 02h          ; Print character function
    int 21h
    inc si
    loop PrintFirstName
DoneFirstName:
    CALL PrintSpace

    ; Print Middle Name
    lea si, iMiddle + 2  ; Start of middle name in buffer
    mov cl, [iMiddle+1]  ; Get length of middle name
PrintMiddleName:
    mov dl, [si]
    cmp dl, 0dh          ; Check for ENTER key
    je DoneMiddleName
    mov ah, 02h          ; Print character function
    int 21h
    inc si
    loop PrintMiddleName
DoneMiddleName:
    CALL PrintSpace

    ; Print Last Name
    lea si, iLast + 2    ; Start of last name in buffer
    mov cl, [iLast+1]    ; Get length of last name
PrintLastName:
    mov dl, [si]
    cmp dl, 0dh          ; Check for ENTER key
    je DoneLastName
    mov ah, 02h          ; Print character function
    int 21h
    inc si
    loop PrintLastName
DoneLastName:
    CALL PrintExclamation

    mov ah, 4ch
    int 21h
END Start
