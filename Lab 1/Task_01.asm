.MODEL SMALL
.STACK 100H

.DATA
    x DB 10
    y DB 20
    
    
.CODE

    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AX, 0
        ;CODE START
         
        ADD AL, x ;AL = x = 10
        ADD BL, y ;BL = y = 20
        
        SUB x, AL ;x = 0
        ADD X, BL ;x = x+BL = 0+20 = 20
        
        SUB y, BL ;y = 0
        ADD y, AL ; y = y+AL = 0 + 10 = 10
        
        
        ;CODE END
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
END MAIN
