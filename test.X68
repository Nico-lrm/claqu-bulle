*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
    
    ;Coordonnées Y
    JSR  GET_TIME
    MOVE.L D1, D3
    JSR  GET_TIME
    MOVE.L D1, D4
    
    ;Coordonnées X
    JSR  GET_TIME
    MOVE.L D1, D2
    JSR  GET_TIME ; Stock direct dans D1
    
    ;Calcul de X
    MOVE.L D2, D7
    ADD.L  D1, D7
    
    DIVU  #1281, D7
    SWAP  D7
    
    MOVE.L  #0, D1
    MOVE.W  D7, D1
    
    ;Calcul de Y
    MOVE.L D3, D7
    ADD.L  D4, D7
    
    DIVU  #721, D7
    SWAP  D7
    
    MOVE.L  #0, D2
    MOVE.W  D7, D2
    
   
    
    
    
    


    include 'bibperiph.x68'
    include 'bibgraph.x68'
    include 'biblio.x68'
    END    $1000        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
