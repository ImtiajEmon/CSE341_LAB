.MODEL SMALL
.STACK 100H

.DATA
    A DB 10
    B DB 20
    C DB 30
    D DB 40   
    
    
.CODE

    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START
         
        ADD AL, A ;Al = A
        ADD AL, C ;AL = A+C
        SUB A, AL ;A = A-AL = A-(A+c)
        MOV AL, A ; AL = A
        ADD D, AL ; D = D+A = A-(A+c)+D 
        
        ;CODE END
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN
