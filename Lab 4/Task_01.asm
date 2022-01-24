.MODEL SMALL
.STACK 100H

.DATA
    
    num1 DW ?
    num2 DW ?
    x DW ? 
    
.CODE
                                         
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START 
        
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
        
        
        MOV BX, num1
        MOV CX, 0   ; CX = SUM
        MOV x, 4
        Loop_start:
            CMP BX, num2
            JG Print_sum
            MOV AX, BX
            MOV DX, 0
            DIV X
            CMP DX, 0
            JE do_sum
            JMP then
            do_sum:
                ADD CX, BX
                JMP then
            then:
                INC BX
                JMP Loop_start
            
                
        ;Loop_end:
        
         
        
        
          
        
        ;=========================================
        ;Printing the sum
        Print_sum:
            MOV AH, 0
            MOV AL, CL
            MOV BL, 10
            DIV BL
        
            MOV CH, AH
            MOV AH, 2
            MOV DL, AL
            ADD DL, 48
            INT 21H
            MOV DL, CH
            ADD DL, 48
            INT 21H
        
        ;CODE END
        EXIT:
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN
