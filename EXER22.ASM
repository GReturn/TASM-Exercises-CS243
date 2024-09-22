; Filename: EXER22.ASM
; Programmer Name: RAFAEL A. MENDOZA
; Date: SEPTEMBER 20 2024
; Description: Create a College Enrollment Form. Get user input. Display a summary 
; of the inputs. Include the necessary documentation as comments in 
; your code.

.MODEL small
.STACK 200h
.DATA
    row0 db 'Cebu Institute of Technology - University', 0dh, 0ah, '$'
    row1 db 'STUDENT ENROLLMENT FORM', 0dh, 0ah, '$'
    row2 db 'Please enter the following information:', 0dh, 0ah, '$'

    row3p db 'Student ID Number: $'
    iNumId DB 100, 0                            ; Max input size is 100, initially 0 characters entered
    iNumIdBuffer DB 100 DUP ('$')               ; Buffer for the ID input

    row4p DB 'First Name: $'    
    iFirst DB 100, 0                          
    iFirstBuffer DB 100 DUP ('$')            

    row5p DB 'Middle Name: $'
    iMiddle DB 100, 0                           
    iMiddleBuffer DB 100 DUP ('$')             

    row6p DB 'Last Name: $'
    iLast DB 100, 0                            
    iLastBuffer DB 100 DUP ('$')               

    row7p DB 'Address: $'
    iAddress DB 100, 0                             
    iAddressBuffer DB 100 DUP ('$')                

    row8p DB 'Course: $'
    iCourse DB 100, 0                             
    iCourseBuffer DB 100 DUP ('$')     
    
    row9p DB 'Year: $'
    iYear DB 2, 0                             
    iYearBuffer DB 2 DUP ('$')     

    rowAp DB 'Birthday Month: $'
    iMonth DB 100, 0                             
    iMonthBuffer DB 100 DUP ('$')     

    rowBp DB 'Birthday Day: $'
    iDay DB 100, 0                             
    iDayBuffer DB 100 DUP ('$')     
    
    rowCp DB 'Birthday Year: $'
    iYearBirth DB 100, 0                             
    iYearBirthBuffer DB 100 DUP ('$')     

    rowDp DB 'Email Address: $'
    iEmail DB 200, 0                             
    iEmailBuffer DB 200 DUP ('$')     

    rowE DB 'SUMMARY', 0dh, 0ah, '$'
    rowF DB 'Please check if all information are correct.', , 0dh, 0ah, '$'
    row10 DB 'ID Number: $'
    row11 DB 'Full Name: $'
    row12 DB 'Address: $'
    row13 DB 'Course & Year: $'
    row14 DB 'Birthday: $'
    row15 DB 'Email Address: $'

    row16 DB 'Thank you for enrolling at CIT-U.', 0dh, 0ah, '$'
    row17 DB 'Copyright 2024', 0dh, 0ah, '$'
    row18 DB 'Programmer: RAFAEL A. MENDOZA$'

    space DB ' $'
    comma DB ',$'
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

PrintComma:
    lea dx, comma
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

    ; Prompt for ID Number
    lea dx, row3p
    CALL PrintString
    lea dx, iNumId
    mov ah, 0ah
    int 21h
    CALL NextL

    ; Prompt for First Name
    lea dx, row4p
    CALL PrintString
    lea dx, iFirst
    mov ah, 0ah
    int 21h
    CALL NextL

    ; Prompt for Middle Name
    lea dx, row5p
    CALL PrintString
    lea dx, iMiddle
    mov ah, 0ah
    int 21h
    CALL NextL
    
    ; Prompt for Last Name
    lea dx, row6p
    CALL PrintString
    lea dx, iLast
    mov ah, 0ah
    int 21h
    CALL NextL

    ; Prompt for Address
    lea dx, row7p
    CALL PrintString
    lea dx, iAddress
    mov ah, 0ah
    int 21h
    CALL NextL
    
    ; Prompt for Course
    lea dx, row8p
    CALL PrintString
    lea dx, iCourse
    mov ah, 0ah
    int 21h
    CALL NextL

    ; Prompt for Year
    lea dx, row9p
    CALL PrintString
    lea dx, iYear
    mov ah, 0ah
    int 21h
    CALL NextL

    ; Prompt for Bday Month
    lea dx, rowAp
    CALL PrintString
    lea dx, iMonth
    mov ah, 0ah
    int 21h
    CALL NextL

    ; Prompt for Bday Day
    lea dx, rowBp
    CALL PrintString
    lea dx, iDay
    mov ah, 0ah
    int 21h
    CALL NextL

    ; Prompt for Bday Year
    lea dx, rowCp
    CALL PrintString
    lea dx, iYearBirth
    mov ah, 0ah
    int 21h
    CALL NextL

    ; Prompt for Email
    lea dx, rowDp
    CALL PrintString
    lea dx, iEmail
    mov ah, 0ah
    int 21h
    CALL NextL
    CALL NextL

; Print Details
    lea dx, rowE
    CALL PrintString
    lea dx, rowF
    CALL PrintString
    CALL NextL

    lea dx, row10
    CALL PrintString
    ; Print ID
    lea si, iNumId + 2   ; Start of ID Number string in buffer (after length bytes)
    mov cl, [iNumId+1]   ; Get length of string
PrintID:
    mov dl, [si]
    cmp dl, 0dh          ; Check for ENTER key (carriage return)
    je DoneID
    mov ah, 02h          ; Print character function
    int 21h
    inc si
    loop PrintID
DoneID:
    CALL NextL


; Print Name
    lea dx, row11
    call PrintString
    ; Print Last Name
    lea si, iLast + 2   
    mov cl, [iLast+1]    
PrintLastName:
    mov dl, [si]
    cmp dl, 0dh        
    je DoneLastName
    mov ah, 02h     
    int 21h
    inc si
    loop PrintLastName
DoneLastName:
    CALL PrintComma
    CALL PrintSpace

    ; Print First Name
    lea si, iFirst + 2   
    mov cl, [iFirst+1] 
PrintFirstName:
    mov dl, [si]
    cmp dl, 0dh        
    je DoneFirstName
    mov ah, 02h        
    int 21h
    inc si
    loop PrintFirstName
DoneFirstName:
    CALL PrintSpace

    ; Print Middle Name
    lea si, iMiddle + 2 
    mov cl, [iMiddle+1] 
PrintMiddleName:
    mov dl, [si]
    cmp dl, 0dh          
    je DoneMiddleName
    mov ah, 02h          
    int 21h
    inc si
    loop PrintMiddleName
DoneMiddleName:
    CALL NextL

; Print Address
    lea dx, row12
    call PrintString

    lea si, iAddress + 2  
    mov cl, [iAddress+1]  
PrintAddress:
    mov dl, [si]
    cmp dl, 0dh          
    je DoneAddress
    mov ah, 02h          
    int 21h
    inc si
    loop PrintAddress
DoneAddress:
    CALL NextL

; Course & Year

    lea dx, row13
    CALL PrintString

    ; Course
    lea si, iCourse + 2   
    mov cl, [iCourse+1] 
PrintCourse:
    mov dl, [si]
    cmp dl, 0dh        
    je DoneCourse
    mov ah, 02h        
    int 21h
    inc si
    loop PrintCourse
DoneCourse:
    CALL PrintSpace

    ; Year
    lea si, iYear + 2 
    mov cl, [iYear+1] 
PrintYear:
    mov dl, [si]
    cmp dl, 0dh          
    je DoneYear
    mov ah, 02h          
    int 21h
    inc si
    loop PrintYear
DoneYear:
    CALL NextL


; Birthdate
    lea dx, row14
    CALL PrintString

    ; Month
    lea si, iMonth + 2   
    mov cl, [iMonth+1] 
PrintMonth:
    mov dl, [si]
    cmp dl, 0dh        
    je DoneMonth
    mov ah, 02h        
    int 21h
    inc si
    loop PrintMonth
DoneMonth:
    CALL PrintSpace

    ; Day
    lea si, iDay + 2   
    mov cl, [iDay+1] 
PrintDay:
    mov dl, [si]
    cmp dl, 0dh        
    je DoneDay
    mov ah, 02h        
    int 21h
    inc si
    loop PrintDay
DoneDay:
    CALL PrintComma
    CALL PrintSpace

; Day
    lea si, iYearBirth + 2   
    mov cl, [iYearBirth+1] 
PrintYearBirth:
    mov dl, [si]
    cmp dl, 0dh        
    je DoneYearBirth
    mov ah, 02h        
    int 21h
    inc si
    loop PrintYearBirth
DoneYearBirth:
    CALL NextL



; Email
    lea dx, row15
    CALL PrintString

    lea si, iEmail + 2   
    mov cl, [iEmail+1] 
PrintEmail:
    mov dl, [si]
    cmp dl, 0dh        
    je DoneEmail
    mov ah, 02h        
    int 21h
    inc si
    loop PrintEmail
DoneEmail:
    CALL NextL
    CALL NextL

    lea dx, row16
    call PrintString
    lea dx, row17
    call PrintString
    lea dx, row18
    call PrintString

    mov ah, 4ch
    int 21h
END Start
