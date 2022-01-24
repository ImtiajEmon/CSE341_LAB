.MODEL SMALL
.STACK 100H

.DATA

    a DB "Enter the first initial: $"
    b DB "Enter the second initial: $"
    c DB "Enter the third initial: $"
    
.CODE

    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START
        
        
        ;First prompt
        LEA DX, a
        MOV AH, 9
        INT 21H
        
        ;Taking the first initial
        MOV AH, 1
        INT 21H      ;AL = First initial
        MOV BH, AL   ;BH = AL
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        
        
        ;Second prompt
        LEA DX, b
        MOV AH, 9
        INT 21H
        
        ;Taking the second initial
        MOV AH, 1
        INT 21H      ;AL = second initial
        MOV BL, AL   ;BL = AL
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        
        
        ;Third prompt
        LEA DX, c
        MOV AH, 9
        INT 21H
        
        ;Taking the Third initial
        MOV AH, 1
        INT 21H      ;AL = Third initial
        MOV CH, AL   ;CH = AL
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H 
        
        
        
        ;Print first initial
        MOV DL, BH
        MOV AH, 2
        INT 21H
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        
        ;Print third initial
        MOV DL, CH
        MOV AH, 2
        INT 21H
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        
        ;Print second initial
        MOV DL, BL
        MOV AH, 2
        INT 21H
 
        
        ;CODE END
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN