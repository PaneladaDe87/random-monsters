ORG 150h

LD      A,       $80
LD      ($FF40), A
LD      HL,      $9800
LD      BC,      $2000
LD      A,       $FF

CLEAR_SCREEN_LOOP:
    LD  (HL),    A
    INC HL
    DEC BC
    LD  A,       B
    OR  C
    JR  NZ,      CLEAR_SCREEN_LOOP
MAIN_LOOP:
    JP  MAIN_LOOP
    
END
