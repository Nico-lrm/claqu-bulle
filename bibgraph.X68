
SET_PEN_COLOR:
    MOVE.L  #80, D0
    TRAP    #15
    RTS
    
SET_FILL_COLOR:
    MOVE.L  #81, D0
    TRAP    #15
    RTS
    
DRAW_PIX:
    MOVE.L  #82, D0
    TRAP    #15
    RTS
    
GET_PIX_COLOR:
    MOVE.L  #83, D0
    TRAP    #15
    RTS
    
DRAW_LINE:
    MOVE.L  #84, D0
    TRAP    #15
    RTS
    
DRAW_TO:
    MOVE.L  #85, D0
    TRAP    #15
    RTS
    
MOVE_TO:
    MOVE.L  #86, D0
    TRAP    #15
    RTS
    
DRAW_FILL_RECT:
    MOVE.L  #87, D0
    TRAP    #15
    RTS
    
DrAW_FILL_ELLIPSE:
    MOVE.L  #88, D0
    TRAP    #15
    RTS
    
POT_DE_PEINTURE:
    MOVE.L  #89, D0
    TRAP    #15
    RTS
    
DRAW_RECT:
    MOVE.L  #90, D0
    TRAP    #15
    RTS
    
DRAW_ELLIPSE:
    MOVE.L  #91, D0
    TRAP    #15
    RTS
    
WIDTH_PEN:
    MOVE.L  #93, D0
    TRAP    #15
    RTS
    
DRAW_STRING:
    MOVE.L  #95, D0
    TRAP    #15
    RTS
    
DRAW_SCREEN:
    MOVE.L  #94, D0
    TRAP    #15
    RTS
    
DRAW_MODE:
    MOVE.L  #92, D0
    TRAP    #15
    RTS
    

    


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
