.MODEL SMALL
.STACK 100H

.DATA
    
    a DB "1st input: $"
    b DB "2nd input: $"
    c DB "Divisible$"
    d DB "Not divisible$"
    
    rem1 DB ?
    rem2 DB ?
    
.CODE

    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START 
        
        ;Printing 1st prompt
        LEA DX,a
        MOV AH, 9
        INT 21H
        
        ;Taking 1st Input
        MOV AH, 1
        INT 21H
        SUB AL, 030H
        MOV BH, AL ;BH = 1st Number
        
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H  
        
        
        ;Printing 2nd prompt
        LEA DX, b
        MOV AH, 9
        INT 21H
        
        ;Tking 2nd Input
        MOV AH, 1
        INT 21H
        SUB AL, 030H
        MOV BL, AL ;BL = 2nd Number
        
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        
        ;Multiply the numbers
        MOV AL, BH ; AL = BH
        MUL BL     ; AX = AL * BL 
        MOV BL, AL ; BL = AL * BL
        
        
        MOV AH, 0
        MOV AL, BL 
        MOV BH, 3
        DIV BH     ;Reminder goes to AH
        MOV rem1, AH
        
        
        MOV AH, 0
        MOV AL, BL  
        MOV BH, 5
        DIV BH     ;Reminder goes to AH
        MOV rem2, AH
        
        
        MOV BH, 0
        CMP rem1, BH
        JE divisible
        JMP nxt_check
        
        
        divisible:
            CMP rem2, BH
            JE print_not_div
            JMP print_div
            
            
        nxt_check:
            CMP rem2, BH
            JE print_div
            JMP print_not_div
            
            
       
        print_div:
            LEA DX, C
            MOV AH, 9
            INT 21H
            JMP EXIT
            
            
        print_NOT_div:
            LEA DX, d
            MOV AH, 9
            INT 21H
        
        ;CODE END
        EXIT:
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN
