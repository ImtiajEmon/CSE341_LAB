.MODEL SMALL
.STACK 100H

.DATA
    
    s1 DW "Enter the first number: $"
    s2 DW "Enter the second number: $"
    s3 DW "The numbers which are ends with 6 are: $"
    s4 DW "There is no number between the given range which is ends with 6 !!!$"
    num1 DW ?
    num2 DW ?
    temp DB ?
    cnt DB 0
    x DB 10 
    
.CODE
                                         
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START 
        
        
        ;Print s1
        LEA DX, s1
        MOV AH, 9
        INT 21H
        
        ;Taking 1st digit of 1st number
        MOV AH, 1
        INT 21H
        SUB AL, 30H 
        MOV BH, AL ;BH = 1st digit of 1st Number
        
        ;Taking 2nd digit of 1st number
        MOV AH, 1
        INT 21H
        SUB AL, 30H
        MOV BL, AL ;BL = 2nd digit of 1st Number
        
        ;Making 1st number
        MOV AL, 10
        MUL BH    ;AX = BH * AL = BH * 10
        MOV BH, 0
        ADD AX, BX
        MOV num1, AX
        
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        
        
        ;Print s2
        LEA DX, s2
        MOV AH, 9
        INT 21H
        
        ;Taking 1st digit of 2nd number
        MOV AH, 1
        INT 21H
        SUB AL, 30H 
        MOV BH, AL ;BH = 1st digit of 2nd Number
        
        ;Taking 2nd digit of 2nd number
        MOV AH, 1
        INT 21H
        SUB AL, 30H
        MOV BL, AL ;BL = 2nd digit of 2nd Number
        
        ;Making 2nd number
        MOV AL, 10
        MUL BH    ;AX = BH * AL = BH * 10
        MOV BH, 0
        ADD AX, BX
        MOV num2, AX 
        
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        
        
        
        
        
        ;Loop for searching the numbers which is eend with 6
        MOV BX, num1
        loop_start:
            CMP BX, num2
            JG Check      ; IF BX > num2 Then stop
            ;Check wheather BX ends with 6 or not
            MOV AX, BX
            DIV X      ;Reminder(Last digit) is in AH
            CMP AH, 6
            JE Print_num
            
            After_that:
                INC BX
                JMP loop_start 
            
            
        
        
        ;Print s3
        Print_prompt:
            LEA DX, s3
            MOV AH, 9
            INT 21H
            JMP Then
        
        ;=========================================  

        ;Printing the number which end with 6
        Print_num:
            INC cnt     ;If cnt == 1, that means Print_num execute for first time
            CMP cnt, 1  ;and we have to print the output prompt
            JE Print_prompt
            
            Then:
                ;Line Breaking
                MOV AH, 2
                MOV DL, 0DH
                INT 21H
                MOV DL, 0AH
                INT 21H
            
                MOV AX, BX
                DIV x
        
                MOV temp, AH
                MOV AH, 2
                MOV DL, AL
                ADD DL, 48
                INT 21H
                MOV DL, temp
                ADD DL, 48
                INT 21H
            
                JMP After_that
                
                
        Check:
            CMP cnt, 0
            JE Sad
            JMP EXIT
            Sad:
                LEA DX, s4
                MOV AH, 9
                INT 21H
            

        ;CODE END
        EXIT:
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN