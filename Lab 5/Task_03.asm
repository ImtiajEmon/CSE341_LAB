.MODEL SMALL
.STACK 100H

.DATA
    
    arr DB 6 DUP(?)
    x DB "Enter Six numbers: $"
    y DB "Sum: $"
    i DB ?
    j DB ?
    
.CODE

    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START
        
        MOV CX, 6
        LEA SI, arr
        
        ;Taking the inputs and store in array
        LEA DX, x
        MOV AH, 9
        INT 21H
        
        repeat:
            MOV AH, 1
            INT 21H
            ;SUB AL, 30H
            MOV [SI], AL
            INC SI
            LOOP repeat
                     
            
       ;sorting Algorithm
       MOV i, 0
       
       loop1:
           CMP i, 5
           JE break
           MOV j, 0
           
           loop2:
               MOV BH, 5
               SUB BH, i
               CMP j, BH
               JE break1
               
               MOV DH, 0
               MOV DL, J
               
               MOV SI, DX
               MOV CH, [SI]
               INC SI
               MOV CL, [SI]
               
               CMP CH, CL
               JL swap
               JMP not_swap
               
               swap:
                   XCHG CH, [SI]
                   DEC SI
                   XCHG CL, [SI]
               not_swap:
               INC j
               LOOP loop2
               
           break1:
           INC i
           LOOP loop1
       break:
       
       
        ;Line Breaking
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
            
        
        MOV CX, 6  
        MOV AH, 2
        LEA SI, arr
        
        do_print:
            MOV DL, [SI]
            INT 21H
            INC SI
            LOOP do_print
        
        ;CODE END
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN
