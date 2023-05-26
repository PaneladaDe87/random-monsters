ORG 150h

LD A, $0

MAIN:
    CP 0
    JR Z, NUMBER_ONE
    
    JR MAIN
    
NUMBER_ONE:
    LD A, $1
