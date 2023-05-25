ORG 150h

LD          A,       $80
LD          ($FF40), A
LD          HL,      $9800
LD          BC,      $2000
LD          A,       $FF

CLEAR_SCREEN_LOOP:
    LD      (HL),    A
    INC     HL
    DEC     BC
    LD      A,       B
    OR      C
    JR      NZ,      CLEAR_SCREEN_LOOP
    
MAIN_LOOP:
    JP      MAIN_LOOP

DRAW_TEXT_LOOP:
    LD      (HL),    A
    CP      $00
    JR      Z,       END_DRAW_TEXT
    ADD     A,       A
    LD      DE,      $FE00
    ADD     A,       E
    LD      E,       A
    LD      BC,      16
    LD      HL,      (CHAR_PATTERNS)
    
    DRAW_CHAR_LOOP:
        LD  A,       (HL)
        LD  DE,      A
        INC HL
        INC DE
        
        LD  A,       (HL)
        LD  DE,      A
        INC HL
        INC DE
        
        DEC BC
        JR  NZ,      DRAW_CHAR_LOOP
    
    INC HL
    JR      DRAW_TEXT_LOOP
    
END_DRAW_TEXT:
    JR      $
    
CHAR_PATTERNS:
    DB      $FF,   $00,   $FF,  $00, $FF
    DB      $FF,   $FF,   $FF,  $00, $00
    
STRING:
    DB      "LOL"
    
END
