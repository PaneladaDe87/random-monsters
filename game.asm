ORG 100h

START:
    LD A, 1
    CALL LOADING     ; chame a subrotina LOADING
    
    JMP START        ; volta para a rotina principal
    
CONDICTION:
    JP LOL           ; para evitar bugs e executar tudo certo
    
LOADING:
    ADD A, 1         ; adiciona mais 1 ao registrador A
    
    CALL PRINT
    
    RET              ; retorna o ponto de chamada(START) para fazer a porra do loop de novo

PRINT:
    LD HL, MESSAGE   ; mensagem a ser imprimida
    
LOOP:
    LD A, (HL)       ; a zoeira não para lol
    OR A             ; hehehehaw
    JP Z, END        ; fim
    
    INC HL
    JP LOOP
    
END:
    RET              ; coolswag
    
MESSAGE:
    DB "AMOGUS", 0   ; termina com 0 porque sim
