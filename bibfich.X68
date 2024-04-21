
CLOSE_ALL_FILE:
    MOVE.B  #50, D0
    TRAP    #15
    RTS
    
OPEN_FILE:
    MOVE.L  #51, D0
    TRAP    #15
    RTS
    
NEW_FILE:
    MOVE.L  #52, D0
    TRAP    #15
    RTS
    
READ_FILE:
    MOVE.L  #53, D0
    TRAP    #15
    RTS
    
WRITE_FILE:
    MOVE.L  #54, D0
    TRAP    #15
    RTS
    
CLOSE_FILE:
    MOVE.L  #56, D0
    TRAP    #15
    RTS
    
DELETE_FILE:
    MOVE.L  #57, D0
    TRAP    #15
    RTS
    
    

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
