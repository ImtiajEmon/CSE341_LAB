.MODEL SMALL
.STACK 100H

.DATA
    
    a DB "1st side: $"
    b DB "2nd side: $"
    c DB "3rd side: $"
    d DB "4th side: $"
    
    y DB "Y$"
    n DB "N$"
    
    ZERO DB 030H
    
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
        MOV BH, AL ;BH = 1st side
        
        
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
        MOV BL, AL ;BL = 2nd side
        
        
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
        MOV CH, AL ;CH = 3rd side
        
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        
        ;Printing 4th prompt
        LEA DX, b
        MOV AH, 9
        INT 21H
        
        ;Tking 4th Input
        MOV AH, 1
        INT 21H
        MOV CL, AL ;CL = 4th side
        
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        
        ;Checking the sides are 0 or not
        CMP BH, ZERO
        JE print_n
        
        CMP BL, ZERO
        JE print_n
        
        CMP CH, ZERO
        JE print_n
        
        CMP CL, ZERO
        JE print_n
        
        
        ;Checking the sides are equal or not
        CMP BH, BL
        JE nxt_check
        JMP print_n
        
        
        nxt_check:
            CMP BL, CH
            JE nxt_check1
            JMP print_n
            
            
        nxt_check1:
            CMP CH, CL
            JE print_y
            JMP print_n
        
        
        
        print_y:
            LEA DX, y
            MOV AH, 9
            INT 21H
            JMP EXIT
            
        print_n:
            LEA DX, n
            MOV AH, 9
            INT 21H
            JMP EXIT
           
        
        ;CODE END
        EXIT:
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN