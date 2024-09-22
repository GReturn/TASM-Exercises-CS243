; Filename: EXER20.ASM
; Programmer Name: RAFAEL A. MENDOZA
; Date: SEPTEMBER 20 2024
; Description: Create a program that asks user to input a character. Determine if 
; character is letter A and display message “Yes, you have entered 
; letter A.” If not, display “No, you have not entered letter A. You 
; entered character _.”

.MODEL small        
.STACK 100h         
.DATA
    iC DB ?         
    p DB 'Enter a character: $'
    oT DB 'Yes, you have entered letter A.$'
    oF DB 'No, you have not entered letter A. You entered character $'
    nxt DB 0dh, 0ah, '$'   

.CODE

Next:
    MOV dx, OFFSET nxt   ; Load address of newline characters into DX
    MOV ah, 09h          ; DOS interrupt to print string
    INT 21h              
    RET                  

Period:
    MOV dl, '.'          ; Load period character into DL
    MOV ah, 02h          
    INT 21h              
    RET                  

Start:
    MOV ax, @data        
    MOV ds, ax           

    MOV dx, OFFSET p     
    MOV ah, 09h          
    INT 21h              

    mov ah, 1           
    int 21h             


    mov iC, al         
    CALL Next         

    cmp iC, 'A'        
    je T                
    jne F                

T:
    MOV dx, OFFSET oT   
    mov ah, 09h         
    INT 21h             
    CALL Stop          

F:
    MOV dx, OFFSET oF   
    mov ah, 09h      
    INT 21h             

    MOV dl, iC          
    mov ah, 02h         
    INT 21h              
    CALL Period         

Stop:
    MOV ax, 4c00h        
    INT 21h            
    END Start          
