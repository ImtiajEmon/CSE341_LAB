.MODEL SMALL
.STACK 100H

.DATA
    
    a DB "The reminder is$"
    
.CODE

    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START
        
        ;Taking 1st Input
        MOV AH, 1
        INT 21H
        SUB AL, 30H
        MOV BH, AL ;BH = 1st Number
        
        ;Tking 2nd Input
        MOV AH, 1
        INT 21H
        SUB AL, 30H
        MOV BL, AL ;BL = 2nd Number
        
        MOV AH, 0
        MOV AL, BH ; AX = BH = 1st Number
        
        DIV BL ;AL = AX/BL, AH = AX%BL
        MOV BH, AH ;BH = Reminder(Hex)
        ADD BH, 30H ;BH = Reminder(Dec)
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        ;String printing
        LEA DX,a
        MOV AH, 9
        INT 21H
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        ;Reminder Printing         
        MOV DL, BH
        MOV AH, 2
        INT 21H
        
        ;CODE END
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN
