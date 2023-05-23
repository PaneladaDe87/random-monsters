ORG 150h

LD A, $80
LD ($FF40), A

LD HL, TEXT
LD DE, $8000

CALL PRINT_STRING

MAIN_LOOP:
    JR MAIN_LOOP

PRINT_STRING:
    LD A, (HL)
    OR A
    RET Z
    LD ($8000), A
    INC HL
    INC DE
    JR PRINT_STRING

TEXT:
  DB 'this game is brazilian', 0
  
END
