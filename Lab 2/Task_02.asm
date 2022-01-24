.MODEL SMALL
.STACK 100H

.DATA
    
    
.CODE

    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START
        
        ;Taking a lowercase letter as input
        MOV AH, 1
        INT 21H      ;AL = Lower case letter
        SUB AL, 20H  ;AL = Upper case letter
        MOV BH, AL   ;BH = AL
        
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        ;Space Printing
        MOV DL, 20H
        MOV AH, 2
        INT 21H
        
        ;Output Printing
        MOV DL, BH
        MOV AH, 2
        INT 21H
        
        ;CODE END
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN