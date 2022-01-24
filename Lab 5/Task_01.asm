.MODEL SMALL
.STACK 100H

.DATA
    
    arr DB "Mason Mount" 
    
.CODE
                                         
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START
        
        MOV CX, 11
        LEA SI, arr
        
        replace:
            MOV DL, [SI]
            
            ;space checking
            MOV BL, 20H
            CMP DL, BL
            JE jump
            
            MOV BL, 41H
            CMP DL, BL
            JGE nxt_check
            JMP replacez
            
            nxt_check:
                MOV BL, 5AH
                CMP DL, BL
                JLE replaceA
                JMP replacez
            
            replaceA:
                MOV [SI], 'A'
                JMP jump
            replacez:
                MOV [SI], 'z'
                
            jump:      
                INC SI
                LOOP replace
                
                
        ;Printing
        MOV CX, 11
        MOV AH, 2
        LEA SI, arr
        
        repeat:
            MOV DL, [SI]
            INT 21H
            INC SI
            LOOP repeat
        
        
        ;CODE END
        EXIT:
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN
