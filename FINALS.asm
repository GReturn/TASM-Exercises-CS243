; Name of System: Kwason Online Grocer
; Brief Description of System: Online Food Order System
;     -> This app is all about simulating an online ordering system. It is able to handle different users and take their order.
;
; Programmer: RAFAEL A. MENDOZA
; DATE: DEC 06, 2024

.MODEL small
.STACK 100h
.DATA

    ; String Management
    maxStringLength equ 50        
    maxStrings equ 5                   
    stringBlocks db maxStrings * maxStringLength dup(0)
    stringArray dw maxStrings dup(0)

    ; Kwason User Item List Management
    arrayCount dw 0              
    count db '0', 0
    numberSTOP db '$'
    spaceNum db " $"
    naaAccount dw 0
    index db '0', 0
    indexSTOP db '$'

    listOrder db " Here is the list of your Kwasons: $"
    newLine db 13, 10, '$'      

screen          DB '                                                  ',13,10
                DB '           The Kwason Online Grocer               ',13,10
                DB '    ____                                    ?~~bL ',13,10
                DB '   z@~ b                                    |  `U,',13,10
                DB '  ]@[  |                                   ]    z@',13,10
                DB '  d@~  `|, .__     _----L___----, __, .  _t    `@j',13,10
                DB ' `@L_,   "-~ `--"~-a,           `C.  ~""O_    ._`@',13,10
                DB '  q@~    ]P       ]@[            `Y=,   `H+z_  `a@',13,10
                DB '  `@L  _z@        d@               Ya     `-@b,_a,',13,10
                DB '   `-@d@a        )@[               `VL       `a@@ ',13,10
                DB '     aa~    ],  .a@                 qqL  ), ./~   ',13,10
                DB '     @@_  _z~  _d@[                 .V@  .L_d     ',13,10
                DB '      "~@@@   ]@@@         __      )@n@bza@-"     ',13,10
                DB '        `-@zzz@@@L        )@@z     ]@@=%-"        ',13,10
                DB '          "~~@@@@@bz_    _a@@@@z___a@K      made with <3 by rafael a. mendoza',13,10
                DB '              "~-@@@@@@@@@@@@@@@@@@~"       date created: 12/06/2024',13,10
                DB '                 `~~~-@~~-@@~~~~~                 ',13,10
          DB 10,13,"                                                  "  
          DB 10,13," ENTER '1' to REGISTER As Kwason User             "
          DB 10,13," ENTER '2' to LOGIN to Kwason                     "
          DB 10,13," ENTER '3' to EXIT Kwason :<                      $"

register_screen                 db 10,13,"  _  __                              ___            "
                                db 10,13," | |/ /__ __ __ __ _  ___ ___  _ _  | _ \ ___  __ _ "
                                db 10,13," | ' < \ V  V // _` |(_-</ _ \| ' \ |   // -_)/ _` |"
                                db 10,13," |_|\_\ \_/\_/ \__,_|/__/\___/|_||_||_|_\\___|\__, |"
                                db 10,13,"                                              |___/ ",27, '[0m'
                                db 10,13," Enter new username: $"
           register_pass        db 10,13," Enter new password: $"

login_screen                db 10,13,"  _  __                               _                ___       "
                            db 10,13," | |/ /__ __ __ __ _  ___ ___  _ _   | |    ___  __ _ |_ _| _ _  "
                            db 10,13," | ' < \ V  V // _` |(_-</ _ \| ' \  | |__ / _ \/ _` | | | | ' \ "
                            db 10,13," |_|\_\ \_/\_/ \__,_|/__/\___/|_||_| |____|\___/\__, ||___||_||_|"
                            db 10,13,"                                                 |___/           "
                            db 10,13,"                                                                 ",27,'[0m'
                            db 10,13," Enter username: $"
login_pass                        db " Enter password: $"

menuTab     db 10,13,"  _  __                              __  __                 "
            db 10,13," | |/ /__ __ __ __ _  ___ ___  _ _  |  \/  | ___  _ _  _  _ "
            db 10,13," | ' < \ V  V // _` |(_-</ _ \| ' \ | |\/| |/ -_)| ' \| || |"
            db 10,13," |_|\_\ \_/\_/ \__,_|/__/\___/|_||_||_|  |_|\___||_||_|\_,_|"
            db 10,13,"                                                            ",27,'[0m'
            db 10,13," ***********************************************************"
            db 10,13," |                                                         |"
            db 10,13," |  1.Order Kwasons                                        |"
            db 10,13," |  2.Change My Kwasons                                    |"
            db 10,13," |  3.Remove My Kwasons                                    |"
            db 10,13," |  4.View My Kwasons                                      |"
            db 10,13," |  5.Exit Kwason App                                      |"
            db 10,13," |                                                         |"
            db 10,13," ***********************************************************"
            db 10,13," Enter choice: $"

ch_menu     db 10,13, "   ____ _                               ___          _            "
            db 10,13, "  / ___| |__   __ _ _ __   __ _  ___   / _ \ _ __ __| | ___ _ __  "
            db 10,13, " | |   | '_ \ / _` | '_ \ / _` |/ _ \ | | | | '__/ _` |/ _ \ '__| "
            db 10,13, " | |___| | | | (_| | | | | (_| |  __/ | |_| | | | (_| |  __/ |    "
            db 10,13, "  \____|_| |_|\__,_|_| |_|\__, |\___|  \___/|_|  \__,_|\___|_|    "
            db 10,13, "                          |___/                                   ",27,'[0m'
            db 10,13, "------------------------------------------------------------------$"
            
ch_prompt   db 10,13, "Please enter 'r' to replace and 'x' to exit"
            db 10,13, "Enter choice: $"

del_menu    db 10,13, "   ____       _      _         ___ _                     "
            db 10,13, "   |  _ \  ___| | ___| |_ ___  |_ _| |_ ___ _ __ ___     "
            db 10,13, "   | | | |/ _ \ |/ _ \ __/ _ \  | || __/ _ \ '_ ` _ \    "
            db 10,13, "   | |_| |  __/ |  __/ ||  __/  | || ||  __/ | | | | |   "
            db 10,13, "   |____/ \___|_|\___|\__\___| |___|\__\___|_| |_| |_|   ",27,'[0m'
            db 10,13, " +-------------------------------------------------------+"
            db 10,13, " |   1.Remove My Recent Kwason                           |"
            db 10,13, " |   2.Remove All My Kwason Orders. Hmph!                |"
            db 10,13, " |   3.Exit                                              |"
            db 10,13, " +-------------------------------------------------------+"
            db 10,13, "Enter choice: $"

quickbites  db 10,13, "      _       _     _   _  __                               "
            db 10,13, "     /_\   __| | __| | | |/ /__ __ __ __ _  ___ ___  _ _    "
            db 10,13, "    / _ \ / _` |/ _` | | ' < \ V  V // _` |(_-</ _ \| ' \   "
            db 10,13, "   /_/ \_\\__,_|\__,_| |_|\_\ \_/\_/ \__,_|/__/\___/|_||_|  ",27,'[0m'
            db 10,13, " +---------------------------------------------------------+"
            db 10,13, " |                                                         |"
            db 10,13, " | 1. Almond KWASON                - PHP 100.00            |"
            db 10,13, " | 2. Chocolate KWASON             - PHP 200.00            |"
            db 10,13, " | 3. Ham and Cheese KWASON        - PHP 300.00            |"
            db 10,13, " | 4. Matcha KWASON                - PHP 400.00            |"
            db 10,13, " | 5. Strawberry and Cream KWASON  - PHP 500.00            |"
            db 10,13, " | 6. Salted Caramel KWASON        - PHP 600.00            |"
            db 10,13, " | 7. Exit                                                 |"
            db 10,13, " |                                                         |"
            db 10,13, " +---------------------------------------------------------+"
            db 10,13, "Enter choice: $"                                                         

lines db 10,13, "-------------------------------------------------------------------------------$"


qb1 db "Almond KWASON               - PHP 100.00", '$'
qb2 db "Chocolate KWASON            - PHP 200.00", '$'
qb3 db "Ham and Cheese KWASON       - PHP 300.00", '$'
qb4 db "Matcha KWASON               - PHP 400.00", '$'
qb5 db "Strawberry and Cream KWASON - PHP 500.00", '$'
qb6 db "Salted Caramel KWASON       - PHP 600.00", '$'
wala db "None", '$'

cartmenu_screen db 10,13,"  __  __         _  __                                  "
                db 10,13," |  \/  | _  _  | |/ /__ __ __ __ _  ___ ___  _ _   ___ "
                db 10,13," | |\/| || || | | ' < \ V  V // _` |(_-</ _ \| ' \ (_-< "
                db 10,13," |_|  |_| \_, | |_|\_\ \_/\_/ \__,_|/__/\___/|_||_|/__/ "
                db 10,13,"          |__/                                          ",27,'[0m'
                db 10,13," Total Amount: P $"

qty_items   db 10,13," Your Kwason Quantity: $"
back   db 10,13,"Press any key to go back: $"
emptryOrd   db 10,13,"                    Uh Oh! You don't have Any Kwasons!$"
selectOrderPrompt db 10,13, "Please enter what Kwason number you want to be replaced: $"
invalidSelectionMsg db 10,13, "PLEASE ENTER A VALID INDEX$"
replacementSuccessMsg db 10,13, "REPLACED SUCCESFULLY$"
itemUpdatedMsg db 10,13, "Item replaced successfully$"

replace_screen  db 10,13, " +-----------------------------------------------------------+"
                db 10,13, " | 1. Almond KWASON                           - PHP 100.00   |"
                db 10,13, " | 2. Chocolate KWASON (Pain au Chocolat)     - PHP 200.00   |"
                db 10,13, " | 3. Ham and Cheese KWASON                   - PHP 300.00   |"
                db 10,13, " | 4. Matcha KWASON                           - PHP 400.00   |"
                db 10,13, " | 5. Strawberry and Cream KWASON             - PHP 500.00   |"
                db 10,13, " | 6. Salted Caramel KWASON                   - PHP 600.00   |"
                db 10,13, " | 7. None                                                   |"
                db 10,13, " | 8. Exit                                                   |"
                db 10,13, " +-----------------------------------------------------------+"
                db 10,13, " Please select Kwason to switch: $"  

error1 db 27, '[5;1;33;41m', " NO HOARDING! ONLY A MAXIMUM OF 5 KWASONS! ", 27, '[0m', '$'
error2 db 27, '[5;1;33;41m', " INVALID INPUT ", 27, '[0m', '$'
error3 db 27, '[5;1;33;41m', " YOU DON'T HAVE AN ACCOUNT ", 27, '[0m', '$'
error4 db 27, '[5;1;33;41m', " YOU ALREADY HAVE AN ACCOUNT ", 27, '[0m', '$'
error5 db 27, '[5;1;33;41m', " YOU DON'T HAVE ANY KWASONS ", 27, '[0m', '$'

bufferedRead db maxStringLength dup(?)          
bufferedReadNUM db maxStringLength dup(?) 

TOTAL1 DW 0 
TOTAL2 DW 0 
TOTAL3 DW 0 
TOTAL4 DW 0 
TOTAL DW 0 
TOTALSTOP DB "$" 
QTY DW 0
QTYSTOP DW "$" 

; Secondary Lines for sub options
remove_success  db 10,13,"-------------------       REMOVED SUCCESSFULLY!          ----------------------$"
log_error  db 10,13,"-----------------------       LOGIN FAILED!          --------------------------$"

num_total db 10,13, " Total: PHP $"
str1 db 10,13," New Kwason Acquired: Almond KWASON$"
str2 db 10,13," New Kwason Acquired: Chocolate KWASON$"
str3 db 10,13," New Kwason Acquired: Ham and Cheese KWASON$"
str4 db 10,13," New Kwason Acquired: Matcha KWASON$"
str5 db 10,13," New Kwason Acquired: Strawberry and Cream KWASON$"
str6 db 10,13," New Kwason Acquired: Salted Caramel KWASON$"

gawas db 10,13,"Sad to see you go... Thank You for Using Kwason!$"


; Resultant Array

RES DB 10 DUP ('$')
username db 50 dup('$')
password db 50 dup('$')

.CODE

Main Proc
    mov ax,@data
    mov ds,ax

    call CLEARSCREEN
    call InitializeArray

    call opening
    mov ah,4ch
    int 21h
Main EndP

InitializeArray PROC
    mov cx, maxStrings           ; Loop counter
    mov si, offset stringBlocks  ; Start of memory blocks
    mov di, offset stringArray   ; Start of pointer array

InitLoop:
    mov [di], si                 ; Set pointer to current block
    add si, maxStringLength      ; Move to the next block
    add di, 2                    ; Move to the next pointer
    loop InitLoop                ; Repeat for all blocks

    ret
InitializeArray ENDP

CLEARSCREEN PROC
    MOV AX, 0600H
    MOV BH, 07H
    MOV CX, 0000H
    MOV DX, 184FH
    INT 10H
    
    MOV AH, 02H
    MOV BH, 0
    MOV DX, 0000H
    INT 10H
    RET
CLEARSCREEN ENDP

opening Proc
    lea dx,screen
    mov ah,9
    int 21h

    mov ah,1
    int 21h

    cmp al, '1'
    je register
    cmp al, '2'
    je login
    cmp al, '3'
    je quick_exit

    call CLEARSCREEN
    call INVALIDINPUT
    call opening
opening Endp

quick_exit Proc
    call CLEARSCREEN
    call EXITPROG
quick_exit Endp

register Proc
    call CLEARSCREEN

    cmp naaAccount, 1
    je register_error

    lea dx,register_screen
    mov ah,9
    int 21h

    lea dx, username
    mov ah, 0Ah
    int 21h

    lea dx,register_pass
    mov ah,9
    int 21h

    lea dx, password
    mov ah, 0Ah
    int 21h
    

    add naaAccount, 1
    call CLEARSCREEN
    call opening
register Endp

register_error Proc
    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov ah, 2
    mov dh, 25
    mov dl, 25
    int 10h

    lea dx, error4
    mov ah,9
    int 21h

    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov ah, 2
    mov dh, 0
    mov dl, 0
    int 10h
    call opening
register_error Endp

login Proc
    call CLEARSCREEN

    login_loop:
        cmp naaAccount, 0
        je login_error
    
    lea dx,login_screen
    mov ah,9
    int 21h

    mov bx, offset username + 2
    mov cl, byte ptr [username + 1]
    mov ch, 0
    ;Credential Verfication 

    usernameVerification:
    mov ah,1
    int 21h
    cmp al,[bx]
    jne invalid
    inc bx
    loop usernameVerification
    int 21h

    mov bx,offset password + 2
    mov cl, byte ptr [password + 1]
    mov ch, 0
    lea dx,login_pass
    mov ah,9
    int 21h
    jmp passwordVerification
    
    passwordVerification:
    mov ah,7
    int 21h
    cmp al,[bx]
    jne invalid
    inc bx
    mov dl,'*'
    mov ah,2
    int 21h
    loop passwordVerification

    jmp starter
    invalid:
        call CLEARSCREEN
        lea dx,log_error
        mov ah,9
        int 21h
        jmp login_loop
   
   
   starter:
   call CLEARSCREEN

   call MAINMENU
   
   ret 
login Endp  

login_error Proc
    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov ah, 2
    mov dh, 25
    mov dl, 25
    int 10h

    lea dx, error3
    mov ah,9
    int 21h

    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov ah, 2
    mov dh, 0
    mov dl, 0
    int 10h
    call opening
login_error Endp


MAINMENU Proc
    lea dx,menuTab
    mov ah,9
    int 21h

    call MMINPUT
    ret
MAINMENU EndP

MMINPUT Proc
    mov ah,1
    int 21h  
    cmp al,'1'
    je qbCall
    cmp al,'2'
    je chOrder
    cmp al,'3'
    je delCall
    cmp al,'4'
    je cartCall
    cmp al,'5'
        lea dx,gawas
        mov ah,9
        int 21h
    je EXITCALL

    call CLEARSCREEN
    call INVALIDINPUT
    call MAINMENU
MMINPUT EndP


qbCall Proc
    call CLEARSCREEN
    call qbMENU
qbCall Endp

chOrder PROC
    call CLEARSCREEN
    call chMENU
chOrder ENDP

cartCall Proc
    call CLEARSCREEN
    call cartMENU
cartCall Endp

delCall Proc
    call CLEARSCREEN
    call delMENU
delCall Endp

MainCall Proc
    call CLEARSCREEN
    call MAINMENU
MainCall Endp

EXITCALL Proc
    call EXITPROG
EXITCALL Endp


INVALIDINPUT Proc
    mov ax, 0
    mov bx, 0
    mov cx, 0

    mov ah, 2
    mov dh, 25
    mov dl, 32
    int 10h

    lea dx, error2
    mov ah,9
    int 21h

    mov ax, 0
    mov bx, 0
    mov cx, 0

    mov ah, 2
    mov dh, 0
    mov dl, 0
    int 10h
    ret
INVALIDINPUT Endp

qbINPUT Proc
    mov ah,1
    int 21h

    cmp al,'7'
    je qb7CallJump ;exit

    cmp arrayCount, maxStrings
    je qbERROR

    cmp al,'1'
    je qb1Call
    cmp al,'2'
    je qb2Call
    cmp al,'3'
    je qb3Call
    cmp al,'4'
    je qb4Call
    cmp al,'5'
    je qb5Call
    cmp al,'6'
    je qb6Call

    call CLEARSCREEN
    call INVALIDINPUT
    call MAINMENU
qbINPUT EndP 

qb7CallJump proc
    call qb7Call
    ret
qb7CallJump Endp

qbERROR proc
    call CLEARSCREEN
    mov ax, 0
    mov bx, 0
    mov cx, 0

    mov ah, 2
    mov dh, 25
    mov dl, 18
    int 10h

    lea dx, error1
    mov ah,9
    int 21h

    mov ax, 0
    mov bx, 0
    mov cx, 0

    mov ah, 2
    mov dh, 0
    mov dl, 0
    int 10h
    call MAINMENU
qbERROR Endp


qb1Call Proc
    call addQB1
    call CLEARSCREEN
    call MAINMENU
qb1Call Endp

qb2Call Proc
    call addQB2
    call CLEARSCREEN
    call MAINMENU
qb2Call Endp

qb3Call Proc
    call addQB3
    call CLEARSCREEN
    call MAINMENU
qb3Call Endp

qb4Call Proc
    call addQB4
    call CLEARSCREEN
    call MAINMENU
qb4Call Endp

qb5Call Proc
    ; CALL HERE
    call addQB5
    call CLEARSCREEN
    call MAINMENU
qb5Call Endp

qb6Call Proc
    call addQB6
    call CLEARSCREEN
    call MAINMENU
qb6Call Endp

qb7Call Proc ; exit - goes back to main
    call CLEARSCREEN
    call MAINMENU
qb7Call Endp

qbMENU Proc 
    lea dx,lines
    mov ah,9
    int 21h 
        
    lea dx,quickbites
    mov ah,9
    int 21h

    call qbINPUT 
    ret
qbMENU EndP

currAll PROC
    mov ah, 9
    lea dx, newLine
    int 21h
    int 21h

    mov ah, 9
    lea dx, listOrder
    int 21h

    mov ah, 9
    lea dx, newLine
    int 21h
    int 21h

    mov ax, arrayCount           
    cmp ax, 0
    je mana   

    mov cx, arrayCount           ; Set loop counter to the number of items
    mov si, offset stringArray   ; Start of the pointer array

    ; Initialize a counter starting from 1
    mov index, '0'                    ; Counter for display

padayun:
    ; lea dx, spaceNum
    ; mov ah, 9
    ; int 21h

    add index, 1
    
    lea dx, index
    mov ah,9
    int 21h         ; Call a procedure to print the number

    ; Display the order string
    mov bx, [si]                 ; Get pointer to the string
    mov dx, bx                   ; Load the pointer into DX
    mov ah, 9                    ; Display the order string
    int 21h

    mov ah, 9
    lea dx, newLine
    int 21h

    add si, 2                    ; Move to the next pointer in the array
    inc bx                       ; Increment the counter
    loop padayun             ; Repeat for all items

mana:
    ret
currAll ENDP

chMENU PROC
    lea dx, lines
    mov ah, 9
    int 21h

    lea dx, ch_menu
    mov ah, 9
    int 21h

    call currAll                ; Display current orders

    lea dx, ch_prompt
    mov ah, 9
    int 21h

    mov ah, 1                   ; Read user input
    int 21h

    cmp al, 'r'                 ; Check if the user pressed 'R'
    je repOrder

    call CLEARSCREEN            ; Clear screen and go back to main menu
    call MAINMENU
    ret

repOrder:
    call SelectOrderToReplace   ; Call the procedure to replace an order
    ret
chMENU ENDP

SelectOrderToReplace PROC
    lea dx, selectOrderPrompt    ; Prompt user to select an order
    mov ah, 9
    int 21h

    mov ah, 1                    ; Read a character
    int 21h
    sub al, '0'                  ; Convert ASCII to integer
    mov bl, al                   ; Store selected index in BL (for replacement)

    mov bh, 0                    ; Clear higher byte of BX
    cmp bx, arrayCount           ; Validate the selection
    jae InvalidSelection

    call DisplayReplacementMenu  ; Show replacement menu
    ret

InvalidSelection:
    lea dx, invalidSelectionMsg  ; Display error message
    mov ah, 9
    int 21h
    jmp SelectOrderToReplace     ; Retry selection
SelectOrderToReplace ENDP

DisplayReplacementMenu PROC
    lea dx, replace_screen       ; Display available items
    mov ah, 9
    int 21h

    ; lea dx, selectNewItemPrompt  ; Prompt for replacement item
    ; mov ah, 9
    ; int 21h

    mov ah, 1                    ; Read user input
    int 21h
    sub al, '0'                  ; Convert ASCII to integer
    mov cl, al                   ; Store the replacement item index in CL

    cmp cx, 10           ; Validate selection
    jae sayop_bords

    call ReplaceOrder            ; Replace the selected order
    ret

sayop_bords:
    lea dx, invalidSelectionMsg
    mov ah, 9
    int 21h
    jmp DisplayReplacementMenu
DisplayReplacementMenu ENDP

ReplaceOrder PROC
    ; bl contains the index of the order to replace (from SelectOrderToReplace)
    sub bl, 1
    ; Calculate the address where the old string is stored in stringArray
    lea si, stringArray            ; SI points to stringArray
    shl bl, 1                      ; Multiply index by 2 (word size)
    add si, bx                     ; SI now points to the selected index in stringArray
    mov bx, [si]                   ; BX points to the actual address of the old string

    ; Check if the replacement index is valid (1 to 3, can add more cases)
    cmp cl, 1                     
    je isqb1
    cmp cl, 2                     
    je isqb2
    cmp cl, 3                   
    je isqb3
    cmp cl, 4                   
    je isqb4
    cmp cl, 5                     
    je isqb5
    cmp cl, 6                      
    je isqb6
    cmp cl, 7                       
    je is0
    cmp cl, 8                       
    CALL CLEARSCREEN
    CALL MAINMENU
    ; Invalid replacement index, just return
    ret

is0:
    lea di, wala
    CALL CopyString
    add [TOTAL], 0
    sub [QTY], 1
    ret

isqb1:
    lea di, qb1                    ; Prepare the destination address for qb1
    CALL CopyString
    add [TOTAL], 100               ; Add price of qb1
    ret

isqb2:
    lea di, qb2                    ; Prepare the destination address for qb2
    CALL CopyString
    add [TOTAL], 200               ; Add price of qb2
    ret

isqb3:
    lea di, qb3                    ; Prepare the destination address for qb3
    CALL CopyString
    add [TOTAL], 300               ; Add price of qb3
    ret

isqb4:
    lea di, qb4                    ; Prepare the destination address for qb3
    CALL CopyString
    add [TOTAL], 400               ; Add price of qb3
    ret

isqb5:
    lea di, qb5                    ; Prepare the destination address for qb3
    CALL CopyString
    add [TOTAL], 500               ; Add price of qb3
    ret

isqb6:
    lea di, qb6                    ; Prepare the destination address for qb3
    CALL CopyString
    add [TOTAL], 600               ; Add price of qb3
    ret

; The copy string routine
CopyString PROC
    ; Copy the string from DI (source) to SI (destination)
cpy_loop:
    mov al, [di]                  ; Load byte from source (bufferedRead or qb1/qb2/qb3)
    mov [bx], al                  ; Store it in the old string's location
    inc di                        ; Increment DI (move to next byte in source)
    inc bx                        ; Increment BX (move to next byte in destination)
    cmp al, '$'                   ; Check for null terminator
    jne cpy_loop                  ; Continue copying until the null terminator

    ret
CopyString ENDP

ReplaceOrder ENDP

delMENU Proc
    lea dx,lines
    mov ah,9
    int 21h 

    lea dx,del_menu
    mov ah,9
    int 21h

    mov ah,1
    int 21h

    cmp al,'3'
    je rm3Call

    cmp arrayCount, 0
    je rmERROR

    cmp al,'1'
    je rm1Call
    cmp al,'2'
    je rm2Call

    call CLEARSCREEN
    call INVALIDINPUT
    call MAINMENU
delMENU ENDP

rm3Call Proc
    call CLEARSCREEN
    call MAINMENU
rm3Call Endp

rmERROR Proc
    call CLEARSCREEN
    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov ah, 2
    mov dh, 25
    mov dl, 25
    int 10h

    lea dx, error5
    mov ah,9
    int 21h

    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov ah, 2
    mov dh, 0
    mov dl, 0
    int 10h
    call MAINMENU
rmERROR Endp

rm2Call Proc
    mov word ptr arrayCount, 0
    mov word ptr QTY, 0
    mov word ptr TOTAL, 0
    call CLEARSCREEN

    mov ah, 9
    lea dx, remove_success
    int 21h

    call delMENU
    call MAINMENU
rm2Call Endp

rm1Call Proc
    sub arrayCount, 1
    sub QTY, 1
    call CHANGETOTALPRICE
    call CLEARSCREEN

    mov ah, 9
    lea dx, remove_success
    int 21h

    call delMENU
    call MAINMENU
rm1Call Endp

CHANGETOTALPRICE Proc
    cmp arrayCount, 4
    je CHANGETOTALPRICE4
    cmp arrayCount, 3
    je CHANGETOTALPRICE3
    cmp arrayCount, 2
    je CHANGETOTALPRICE2
    cmp arrayCount, 1
    je CHANGETOTALPRICE1
    cmp arrayCount, 0
    je CHANGETOTALPRICE0
CHANGETOTALPRICE Endp

CHANGETOTALPRICE4 Proc
    mov bx, [TOTAL4]
    mov [TOTAL], BX
    ret
CHANGETOTALPRICE4 Endp

CHANGETOTALPRICE3 Proc
    mov bx, [TOTAL3]
    mov [TOTAL], BX
    ret
CHANGETOTALPRICE3 Endp

CHANGETOTALPRICE2 Proc
    mov bx, [TOTAL2]
    mov [TOTAL], BX
    ret
CHANGETOTALPRICE2 Endp

CHANGETOTALPRICE1 Proc
    mov bx, [TOTAL1]
    mov [TOTAL], BX
    ret
CHANGETOTALPRICE1 Endp

CHANGETOTALPRICE0 Proc
    mov [TOTAL], 0
    ret
CHANGETOTALPRICE0 Endp

cartMENU Proc
    lea dx, cartmenu_screen
    mov ah,9
    int 21h 
    ;Total Goes here

    MOV AX,TOTAL
    LEA SI,RES
    CALL HEX2DEC
    LEA DX,RES
    MOV AH,9
    INT 21H
    
    lea dx,qty_items
    mov ah,9
    int 21h
    ;QTY GOES HERE 

    MOV AX, QTY
    LEA SI,RES
    CALL HEX2DEC
    LEA DX,RES
    MOV AH,9
    INT 21H 

    mov count, '0'

    call ShowAll

    cmp arrayCount, 0
    je EMPTYINV

    lea dx,lines
    mov ah,9
    int 21h
    lea dx,back
    mov ah,9
    int 21h

    mov ah,1
    int 21h 

    call CLEARSCREEN
    call MAINMENU
    ret

    EMPTYINV:
    lea dx,emptryOrd
    mov ah,9
    int 21h

    mov ah, 9
    lea dx, newLine
    int 21h

    lea dx,lines
    mov ah,9
    int 21h
    lea dx,back
    mov ah,9
    int 21h

    mov ah,1
    int 21h 

    call CLEARSCREEN
    call MAINMENU
    ret
cartMENU ENDP

HEX2DEC PROC NEAR
    MOV CX,0
    MOV BX,10
   
LOOP1: MOV DX,0
       DIV BX
       ADD DL,30H
       PUSH DX
       INC CX
       CMP AX,9
       JG LOOP1
     
       ADD AL,30H
       MOV [SI],AL
     
LOOP2: POP AX
       INC SI
       MOV [SI],AL
       LOOP LOOP2

       INC SI
       MOV BYTE PTR [SI], '$'
       RET
HEX2DEC ENDP


addQB1 Proc

    lea si, qb1
    call TOTHEBUFFERED
    call AddString

    call CLEARSCREEN

    lea dx,str1
    mov ah,9
    int 21h

    lea dx,num_total
    mov ah,9
    int 21h
        
    MOV BX,[TOTAL]
    ADD BX,100                  ;price
    MOV [TOTAL],BX
    CALL TOTALPRICE
    MOV AX,TOTAL
    LEA SI,RES
    CALL HEX2DEC
    LEA DX,RES
    MOV AH,9
    INT 21H
        

    mov BX,[QTY]           
    ADD BX, 1
    mov [QTY],BX

    jmp qbMENU
addQB1 EndP

addQB2 Proc
    lea si, qb2                 ; qb
    call TOTHEBUFFERED
    call AddString

    call CLEARSCREEN
    
    lea dx,num_total
    mov ah,9
    int 21h

    MOV BX,[TOTAL]
    ADD BX,200                    ; price
    MOV [TOTAL],BX
    CALL TOTALPRICE
    MOV AX,TOTAL
    LEA SI,RES
    CALL HEX2DEC
    LEA DX,RES
    MOV AH,9
    INT 21H

    lea dx,str2     ; str
    mov ah,9
    int 21h

    mov BX,[QTY]                                ;QTY
    ADD BX, 1
    mov [QTY],BX
    
    jmp qbMENU
    ret
addQB2 EndP

addQB3 Proc  
    lea si, qb3
    call TOTHEBUFFERED
    call AddString

    call CLEARSCREEN    
    
    lea dx,num_total
    mov ah,9
    int 21h  

    MOV BX,[TOTAL]
    ADD BX,300                          ;PRICE
    MOV [TOTAL],BX
    CALL TOTALPRICE
    MOV AX,TOTAL
    LEA SI,RES
    CALL HEX2DEC
    LEA DX,RES
    MOV AH,9
    INT 21H

    lea dx,str3
    mov ah,9
    int 21h
    mov BX,[QTY]                            ;QTY
    ADD BX, 1
    mov [QTY],BX

    jmp qbMENU
    ret
addQB3 EndP

addQB4 Proc  
    lea si, qb4
    call TOTHEBUFFERED
    call AddString

    call CLEARSCREEN
    
    lea dx,num_total
    mov ah,9
    int 21h

    MOV BX,[TOTAL]
    ADD BX,400                      ;PRICE
    MOV [TOTAL],BX
    CALL TOTALPRICE
    MOV AX,TOTAL
    LEA SI,RES
    CALL HEX2DEC
    LEA DX,RES
    MOV AH,9
    INT 21H

    lea dx,str4
    mov ah,9
    int 21h
    mov BX,[QTY]                            ;QTY
    ADD BX, 1
    mov [QTY],BX

    jmp qbMENU
    ret
addQB4 EndP

addQB5 Proc  
    lea si, qb5
    call TOTHEBUFFERED
    call AddString

    call CLEARSCREEN
    
    lea dx,num_total
    mov ah,9
    int 21h

    MOV BX,[TOTAL]
    ADD BX,500                      ;PRICE
    MOV [TOTAL],BX
    CALL TOTALPRICE
    MOV AX,TOTAL
    LEA SI,RES
    CALL HEX2DEC
    LEA DX,RES
    MOV AH,9
    INT 21H

    lea dx,str5
    mov ah,9
    int 21h
    mov BX,[QTY]                            ;QTY
    ADD BX, 1
    mov [QTY],BX

    jmp qbMENU
    ret
addQB5 EndP

addQB6 Proc  
    lea si, qb6
    call TOTHEBUFFERED
    call AddString

    call CLEARSCREEN
    
    lea dx,num_total
    mov ah,9
    int 21h

    MOV BX,[TOTAL]
    ADD BX,600                      ;PRICE
    MOV [TOTAL],BX
    CALL TOTALPRICE
    MOV AX,TOTAL
    LEA SI,RES
    CALL HEX2DEC
    LEA DX,RES
    MOV AH,9
    INT 21H

    lea dx,str6
    mov ah,9
    int 21h
    mov BX,[QTY]                            ;QTY
    ADD BX, 1
    mov [QTY],BX

    jmp qbMENU
    ret
addQB6 EndP

TOTALPRICE Proc
    cmp arrayCount, 1
    je TOTALPRICE1
    cmp arrayCount, 2
    je TOTALPRICE2
    cmp arrayCount, 3
    je TOTALPRICE3
    cmp arrayCount, 4
    je TOTALPRICE4
    ret
TOTALPRICE Endp

TOTALPRICE1 Proc
    mov ax, word ptr TOTAL
    mov [TOTAL1], ax
TOTALPRICE1 Endp

TOTALPRICE2 Proc
    mov ax, word ptr TOTAL
    mov [TOTAL2], ax
TOTALPRICE2 Endp

TOTALPRICE3 Proc
    mov ax, word ptr TOTAL
    mov [TOTAL3], ax
TOTALPRICE3 Endp

TOTALPRICE4 Proc
    mov ax, word ptr TOTAL
    mov [TOTAL4], ax
TOTALPRICE4 Endp

TOTHEBUFFERED PROC
    lea di, bufferedRead    

    copy_loop:
        mov al, [si]              
        mov [di], al              
        inc si                    
        inc di                    
        cmp al, '$'                 
        je EndIt
        jne copy_loop             

    EndIt:
        lea si, bufferedRead
        ret
TOTHEBUFFERED EndP

AddString PROC
    mov ax, arrayCount           
    cmp ax, maxStrings
    jae ArrayFull                

    mov di, offset stringArray
    mov bx, arrayCount           
    shl bx, 1                   
    add di, bx                   
    mov bx, [di]                 


    lea si, bufferedRead      
    CopyLoop:
        mov al, [si]                
        mov [bx], al                 
        inc si
        inc bx
        cmp al, '$'              
        je EndCopy
        jnz CopyLoop

    EndCopy:
        inc word ptr arrayCount
        ret

    SkipInput:

        ret

    ArrayFull:
        call MAINMENU
   
    ret
AddString ENDP

ShowAll PROC
    mov ah, 9
    lea dx, newLine
    int 21h
    int 21h

    mov ah, 9
    lea dx, listOrder
    int 21h

    mov ah, 9
    lea dx, newLine
    int 21h
    int 21h

    mov ax, arrayCount           
    cmp ax, 0
    je EndDis   

    mov cx, arrayCount           
    mov si, offset stringArray   

    DisplayLoop:
        lea dx, spaceNum
        mov ah,9
        int 21h

        add count, 1
        
        lea dx, count           
        mov ah, 09h              
        int 21h                  

        mov bx, [si]                 
        mov dx, bx                   
        mov ah, 9                    
        int 21h

        
        mov ah, 9
        lea dx, newLine
        int 21h

        add si, 2                    
        loop DisplayLoop

    EndDis:

    ret
ShowAll ENDP

EXITPROG Proc 
     mov ah,4ch
     int 21h
     EXITPROG EndP
End Main