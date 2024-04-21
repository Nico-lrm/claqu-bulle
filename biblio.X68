
SAISCAR:
    MOVE.B  #5, D0
    TRAP #15
    RTS

AFFCAR:
    MOVE.B #6, D0
    TRAP #15
    RTS
    
FINPRG:
    MOVE.B #9, D0
    TRAP  #15
    RTS
    
GET_TIME:
    MOVE.L #8, D0
    TRAP #15
    RTS
    
POS_CURS:
    MOVE.L #11, D0
    TRAP #15
    RTS
    
GET_AFFCAR:
    MOVE.L #22, D0
    TRAP #15
    RTS
    

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
