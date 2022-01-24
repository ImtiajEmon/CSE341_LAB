.MODEL SMALL
.STACK 100H

.DATA
   
    a DB "ENTER A HEX DIGIT: $"
    b DB "IN DECIMAL IT IS $"    
    
.CODE

    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START
        
        
        ;Prompt
        LEA DX, a
        MOV AH, 9
        INT 21H
        
        ;Input
        MOV AH, 1
        INT 21H ; AL = Hex Digit
        MOV BH, AL ;BH = AL
        
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        ;Prompt
        LEA DX, b
        MOV AH, 9
        INT 21H
        
        ;Converting Hex to Dec digit
        SUB BH, 011H
        MOV BL, 031H
        
        ;Output Printing
        MOV DL, BL
        MOV AH, 2
        INT 21H
        MOV DL, BH
        INT 21H
        
        ;CODE END
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN