.MODEL SMALL
.STACK 100H

.DATA
       
    w DB 10
    x DB 20
    y DB 10
    z DB 20
    x_prime DW ?
    
    
.CODE

    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START
        ;x = (x/y) * (y*z) / (z*w)
         ; =   2 * 200 /200 = 2
        
        MOV AH, 0
        MOV AL, x
        DIV y ;AL = x/y
        MOV BH, AL ;BH = x/y
        
        MOV AL, y ;AL = y
        MUL z     ;AX = y*z
        MOV CX, AX ;BL = y*z
        
        MOV AL, z
        MUL w     ;AX = z*w
        MOV DX, AX ;DX = z*w
        
        ;CX/DX
        MOV AX, CX
        MOV CX, DX
        MOV DX, 0
        DIV CX     ;AX = (y*z)/(z*w)
        
        ;BH*AX
        MOV BL, BH ;BL = BH
        MOV BH, 0  ;BX = x/y
        MUL BX ; AX = L.S.B  of(x/y)*(y*z)/(z*w),DX = M.S.B  of(x/y)*(y*z)/(z*w)
        
        MOV x_prime, AX  ;x_prime = (x/y)*(y*z)/(z*w)
        
        
        ;CODE END
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN
