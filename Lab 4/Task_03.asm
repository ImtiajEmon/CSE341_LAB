.MODEL SMALL
.STACK 100H

.DATA
    
    operator DB ?
    s DB "Which operation do you want to perform: $"
    
.CODE

    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START 
         
        ;AX = 65
        ;BX = 10
        
        ;Printing the prompt
        LEA DX,s
        MOV AH, 9
        INT 21H
        
        ;Taking the operator as Input
        MOV AH, 1
        INT 21H
        MOV operator, AL ;operator = M or D
        
        
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        ;Decision
        CMP operator, "D" 
        JE do_division
        JMP do_multiplication
        
        
        
        do_division:
            MOV AX, 65
            MOV BX, 10
            
            Loop1_start:
                CMP AX, BX
                JL Print1
                SUB AX, BX
                JMP Loop1_start
                
                
        do_multiplication:
            MOV AX, 65
            MOV BX, 10
                
            MOV CX, BX
            MOV DX, AX ; DX will be = AX * BX
            MOV AX, 0
            Loop2_start:
                ADD AX, DX
                LOOP Loop2_start
            JMP Print2 
                 
        
        
        Print1:
            MOV AH, 2
            MOV DL, AL
            ADD DL, 48
            INT 21H
            JMP EXIT
            
        Print2:
            MOV DX, 0
            MOV BX, 100
            DIV BX
            MOV AH, 2
            MOV CX, DX
            MOV DL, AL
            ADD DL, 48
            INT 21H
            
            MOV AX, CX
            MOV DX, 0
            MOV BX, 10
            DIV BX
            MOV AH, 2
            MOV CX, DX
            MOV DL, AL
            ADD DL, 48
            INT 21H
            
            MOV DL, CL
            ADD DL, 48
            INT 21H
            
            
            
            
        
        ;CODE END
        EXIT:
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN
