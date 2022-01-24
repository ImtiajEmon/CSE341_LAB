.MODEL SMALL
.STACK 100H

.DATA
    
.CODE

    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START
        ;(10/5)*(4–0)+(5+3*2)+(2/1)
        
        MOV AH, 0
        MOV AL, 10
        MOV BL, 5
        DIV BL ;AL = AX/BL = (10/5)
        MOV BL, AL ;BL = (10/5)
        
        MOV BH, 4 ;BH = 4
        SUB BH, 0 ;BH = BH-0 = (4-0)
        
        MOV AL, 3
        MOV AH, 2
        MUL AH ; AX = AL*AH = 3*2
        MOV CL, AL ;CL = 3*2
        ADD CL, 5 ;CL = (5+3*2)
        
        MOV AH, 0
        MOV AL, 2 ;AX = 2
        MOV CH, 1
        DIV CH ;AL = 2/1
        MOV CH, AL ;CH = 2/1
        
        ;BL*BH = (10/5)* (4-0)
        MOV AL, BL
        MUL BH ;AL = BL*BH = (10/5)* (4-0)
        MOV BH, AL ;BH = (10/5)* (4-0)
        
        ADD BH, CL ;BH = (10/5)*(4–0)+(5+3*2)
        ADD BH, CH ;BH = (10/5)*(4–0)+(5+3*2)+(2/1)
        
        ;CODE END
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN
