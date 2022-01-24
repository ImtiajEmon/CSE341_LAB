.MODEL SMALL
.STACK 100H

.DATA
    
    a DB "1st input: $"
    b DB "2nd input: $"
    c DB "3rd input: $"
    
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
        MOV BL, AL ;BL = 2nd Number
        
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H  
        
        
        ;Printing 3rd prompt
        LEA DX, b
        MOV AH, 9
        INT 21H 
        
        ;Tking 3rd Input
        MOV AH, 1
        INT 21H
        MOV CH, AL ;CH = 2nd Number
        
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H  
        
        
        CMP BH, BL
        JL max1
        JMP second_step
        
        max1:
            MOV BH, BL ; BH = max(BH, BL)  
            
        second_step:
            CMP BH, CH
            JL max2
            JMP print
            
        max2:
            MOV BH, CH ; BH = max(BH, CH)
            
            
        ;max num printing
        print:
            MOV DL, BH
            MOV AH, 2
            INT 21H
            
        
        ;CODE END
        EXIT:
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN
