; Filename: EXER23.ASM
; Programmer Name: RAFAEL A. MENDOZA
; Date: SEPTEMBER 20 2024
; Description: Create an Automated Teller Machine (ATM) main menu screen. Ask the 
; user to input a number corresponding to an item in the main menu. 
; Print back the number input by user and the corresponding 
; transaction.

.MODEL small
.STACK 200h
.DATA
    row0 db 'Cebu Institute of Technology - University', 0dh, 0ah, '$'
    row1 db 'Automated Teller Machine', 0dh, 0ah, '$'
    
    row2 db 'Main Menu', 0dh, 0ah, '$'

    row3 db '1 Balance Inquiry$'
    row4 db '2 Withdrawal$'
    row5 db '3 Deposit$'
    row6 db '4 Transfer$'
    row7 db '5 Bills Payment$'
    row8 db '6 Change Pin$'
    row9 db '7 Exit$'

    rowAp db 'Enter number of your choice: $'
    iChoice db ?
    rowB db 'You have chosen $'

    rowC DB 'Thank you for banking with us!', 0dh, 0ah, '$'
    rowD DB 'Copyright 2024', 0dh, 0ah, '$'
    rowE DB 'Programmer: RAFAEL A. MENDOZA$'

    period db '.$'
    nxt DB 0dh, 0ah, '$'

    rowX db '(Incorrect Input. Exiting Now)$'

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

Start:
    mov ax, @data
    mov ds, ax

    lea dx, row0
    call PrintString

    lea dx, row1
    call PrintString
    call NextL

    lea dx, row2
    call PrintString
    CALL NextL

    lea dx, row3
    call PrintString
    CALL NextL

    lea dx, row4
    call PrintString
    CALL NextL

    lea dx, row5
    call PrintString
    CALL NextL

    lea dx, row6
    call PrintString
    CALL NextL

    lea dx, row7
    call PrintString
    CALL NextL

    lea dx, row8
    call PrintString
    CALL NextL

    lea dx, row9
    call PrintString
    CALL NextL

    ; Show Prompt
    lea dx, rowAp
    call PrintString

    mov ah, 1
    int 21h

    mov iChoice, al
    int 21h

    call NextL

    lea dx, rowB
    call PrintString
    
    cmp iChoice, '1'
    je Choice1
    cmp iChoice, '2'
    je Choice2
    cmp iChoice, '3'
    je Choice3
    cmp iChoice, '4'
    je Choice4
    cmp iChoice, '5'
    je Choice5
    cmp iChoice, '6'
    je Choice6
    cmp iChoice, '7'
    je Choice7
    jne ChoiceX

; row 3-9
Choice1:
    lea dx, row3
    CALL PrintString
    CALL Done
Choice2:
    lea dx, row4
    CALL PrintString
    CALL Done
Choice3:
    lea dx, row5
    CALL PrintString
    CALL Done
Choice4:
    lea dx, row6
    CALL PrintString
    CALL Done
Choice5:
    lea dx, row7
    CALL PrintString
    CALL Done
Choice6:
    lea dx, row8
    CALL PrintString
    CALL Done
Choice7:
    lea dx, row9
    CALL PrintString
    CALL Done
ChoiceX:
    lea dx, rowX
    CALL PrintString

Done:
    lea dx, period
    CALL PrintString
    CALL NextL

    CALL NextL
    lea dx, rowC
    CALL PrintString
    lea dx, rowD
    CALL PrintString
    lea dx, rowE
    CALL PrintString

    mov ah, 4ch
    int 21h
END Start
