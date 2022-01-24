.MODEL SMALL
.STACK 100H

.DATA
    
    arr DB 5 DUP(?)
    x DB "Enter Five numbers: $"
    y DB "Sum: $"
    
.CODE

    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START
        
        MOV CX, 5
        LEA SI, arr
        
        ;Taking the inputs and store in array
        LEA DX, x
        MOV AH, 9
        INT 21H
        
        repeat:
            MOV AH, 1
            INT 21H
            SUB AL, 30H
            MOV [SI], AL
            INC SI
            LOOP repeat
            
        
        MOV CX, 5
        MOV DL, 0
        LEA SI, arr
        
        do_sum:
            MOV AH, 0
            MOV AL, [SI]
            MOV BL, 2
            DIV BL
            
            CMP AH, 0
            JG do
            JMP rep
            do:
                ADD DL, [SI]
            
            rep:
                INC SI
                LOOP do_sum
                
        
        MOV BL, DL        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        
        LEA DX, y
        MOV AH, 9
        INT 21H
        
        
        
        MOV DL, BL
        ADD DL, 30H        
        MOV AH, 2
        INT 21H
        
        ;CODE END
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN
