.MODEL SMALL
.STACK 100H

.DATA
    
    a DB "30$"
    b DB "31$"
    c DB "28/29$"
    
.CODE

    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START 
        
        ;Taking Input
        MOV AH, 1
        INT 21H ; AL = Input
        MOV CL, AL ; CL = Input
        
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H 
        
        
        MOV BL, 32H
        
        
        ;If input == 2
        CMP CL, BL
        JE print_1
        
        ;Checking the input wheather it is even or odd
        MOV AH, 0
        MOV AL, CL
        MOV BL, 2
        DIV BL ; AH = Reminder
        MOV BH, 0
        CMP AH, BH
        JG print_2 ;If input is odd
        JMP print_3 ; If input is even
        
        
        
        print_1:
            LEA DX, C
            MOV AH, 9
            INT 21H
            JMP EXIT
            
        print_2:
            LEA DX, b
            MOV AH, 9
            INT 21H
            JMP EXIT
            
            
       print_3:
            LEA DX, a
            MOV AH, 9
            INT 21H
            JMP EXIT            
        
        ;CODE END
        EXIT:
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN