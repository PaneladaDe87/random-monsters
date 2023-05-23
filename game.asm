ORG 100h

START:
    LD A, 1
    CALL LOADING ; chame a subrotina LOADING
    
    JMP START    ; volta para a rotina principal
    
LOADING:
    ADD A, 1     ; adiciona mais 1 ao registrador A
    
    RET          ; retorna o ponto de chamada(START) para fazer a porra do loop de novo
