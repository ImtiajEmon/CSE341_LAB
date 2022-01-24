.MODEL SMALL
.STACK 100H

.DATA
    
    flag DB ?
    first_dig DB ?
    second_dig DB ?
    
.CODE

    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START 
        
             
        MOV DH, 3  
        MOV DL, 0  ;DL = SUM
        MOV flag, 0
        
        Loop_start:
            CMP DH, 21
            JG Print_sum
            CMP flag, 0
            JE do_add
            JMP do_sub
            do_add:
                ADD DL, DH
                MOV flag, 1
                JMP Then
            do_sub:
                SUB DL, DH
                MOV flag, 0
                JMP Then
            Then:   
                ADD DH, 3
                JMP Loop_start
            
        
        Print_sum:
            MOV AH, 0
            MOV AL, DL
            MOV BL, 10
            DIV BL
            
            MOV first_dig, AL
            ADD first_dig, 48
            MOV second_dig, AH
            ADD second_dig, 48
            
            MOV AH, 2
            MOV DL, first_dig
            INT 21H
            MOV DL, second_dig
            INT 21H
        
        ;CODE END
        EXIT:
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN
