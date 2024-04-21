*-----------------------------------------------------------
* Title      : Bubulle Eclateur
* Written by : A. DELAVAQUERIE - N.LORMIER
* Date       : 24/11/2021
* Description: Eclateur de bubulle avec la souris
*-----------------------------------------------------------
    ORG    $1000
    
    ; Changer la résolution de l'écran
    MOVE.L  #$050002D0, D1 ; 1280*720
    JSR     RESOLUTION
    MOVE.L  #0, D1
    
    ;Liaison Variable - Adresse
    MOVE.l  #SCORE, A0
    MOVE.w  #COMPTEUR, A1
    MOVE.w  #BUBULLE_X1, A2
    MOVE.w  #BUBULLE_Y1, A3
    MOVE.w  #BUBULLE_X2, A4
    MOVE.w  #BUBULLE_Y2, A5
    MOVE.w  #BUBULLE_RADIUS, A6 

ALEA_POS_BUBULLE:
    
    ;Coordonnées Y
    JSR     GET_TIME
    MOVE.L  D1, D3 ;Stock du time Y1
    JSR     GET_TIME 
    MOVE.L  D1, D4 ;Stock du time Y2
    
    ;Coordonnées X
    JSR     GET_TIME
    MOVE.L  D1, D2 ;Stock du time X2 
    JSR     GET_TIME ;Stock direct du time X1 D1
    
    ;Calcul de X
    MOVE.L  D2, D7 ;D7 = Zone mémoire tampon pour les deux times
    ADD.L   D1, D7 ;Addition entre le les deux valeurs
    ADD.L   #25536, D7 
    
    MOVE.W  #1281,D0 ;Largeur de l'écran
    SUB.W   (A6),D0 ;On retire le diamètre d'une bulle pour éviter de dépasser
    DIVU    D0, D7 ;On divise par la largeur de l'écran
    SWAP    D7 ;Et on récupère le modulo
    
    *Attribution de la position en x de la bulle
    MOVE.L  #0, D1 
    MOVE.W  D7, D1
    
    ;Calcul de Y
    MOVE.L  D3, D7
    ADD.L   D4, D7 
    
    MOVE.W  #721, D0 ;Hauteur de l'écran
    SUB.W   (A6), D0 ;On retire le diamètre d'une bulle pour éviter de dépasser
    DIVU    D0, D7 ;On divise par la hauteur de l'écran
    SWAP    D7 ;Et on récupère le modulo
    
    *Attribution de la position en y de la bulle
    MOVE.L  #0, D2
    MOVE.W  D7, D2
    
    ;Reset des registres
    MOVE.L  #0, D0
    MOVE.L  #0, D3
    MOVE.L  #0, D4
    MOVE.L  #0, D7
    
BOUCLE_BUBULLE:

    ;Coordonnées d'arrivée
    *On copie les coordonnées des bulles
    MOVE.W  D1, D3
    MOVE.W  D2, D4
    
    *On ajoute la dimension sur les deux axes et on dessine la bulle
    ADD.W   (A6),D3
    ADD.W   (A6),D4
    JSR     DRAW_ELLIPSE
    
    ;Récupérer les coordonnées de la bubulle dans les registres d'adresse
    MOVE.w  D1, (A2) ;x1
    MOVE.w  D2, (A3) ;y1
    MOVE.w  D3, (A4) ;x2
    MOVE.w  D4, (A5) ;y2
    
    ;Reset des registre de données de la bubulle
    MOVE.W  #0, D1
    MOVE.W  #0, D2
    MOVE.W  #0, D3
    MOVE.W  #0, D4

BOUCLE_CLIQUE:
    ;Test clique
    MOVE.L  #0, D1 ;Reset de D1 pour récupérer le clic souris gauche
    JSR     GET_MOUSE
    CMP.b   #1, D0 ;Si la souris n'est pas cliqué
    BNE     BOUCLE_CLIQUE ;On relance la boucle
    
    ;Sinon
    ;Récupérer les coordonnées du clic
    MOVE.w  D1, D2 ;Position de la souris en X
    MOVE.L  D1, D3 ;Position de la souris en Y
    AND.L   #$FFFF0000, D3 ;Ne garder que la position Y
    SWAP    D3 ;La passer en bits de poids faible
    
BOUCLE_CLIQUE_FIN:
    ;Test clique
    MOVE.L  #0, D1 ;Reset de D1 pour récupérer le clic souris gauche
    JSR     GET_MOUSE
    CMP.b   #0, D0 ;Si la souris n'est pas cliqué
    BNE     BOUCLE_CLIQUE_FIN ;On relance la boucle    
    
    ;Reset des registres
    MOVE.L  #0, D1
    MOVE.L  #0, D0
    
TEST_COOR_CLIQUE:
    TEST_X_INF:
    CMP     (A2),D2 ;Si la position x du clic est plus petite que la position x1 de la bulle
    BLT     DEL_BUBULLE
    TEST_X_SUP:
    CMP     (A4),D2 ;Si la position x du clic est plus grande que la position x2 de la bulle
    BGT     DEL_BUBULLE
    TEST_Y_INF: 
    CMP     (A3),D3 ;Si la position y du clic est plus petite que la position y1 de la bulle
    BLT     DEL_BUBULLE
    TEST_Y_SUP:
    CMP     (A5),D3 ;Si la position y du clic est plus grande que la position y2 de la bulle
    BGT     DEL_BUBULLE
    
    ;Sinon on augmente le score
    MOVE.L  #100, D7
    ADD.L   D7, (A0)
    MOVE.L  #0, D7
    MOVE.L  (A0),D7
    
    ;Reset
    MOVE.w  #0, D2
    MOVE.w  #0, D3
    
DEL_BUBULLE:
    MOVE.W  #$FF00, D1
    JSR     POS_CURS
    MOVE.w  #0, D1
    MOVE.w  #0, D0
    
    SUB.w   #1,(A1) *Compteur de bulle
    CMP     #0,(A1)
    BNE     ALEA_POS_BUBULLE
    
    *Sinon fin du programme
FIN_PRG:
    JMP     FINPRG

*Variables & Includes
    include 'bibperiph.x68'
    include 'bibgraph.x68'
    include 'biblio.x68'
    
SCORE: DS.l 1 
COMPTEUR: DC.w 20
BUBULLE_X1: DS.w 1
BUBULLE_X2: DS.w 1
BUBULLE_Y1: DS.w 1
BUBULLE_Y2: DS.w 1
BUBULLE_RADIUS: DC.w 60

    END     $1000




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
