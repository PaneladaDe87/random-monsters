ORG 150h

LD A, $0

ADD A, 1

MAIN:
    CP 0
    JR Z, START
    
    JR MAIN

START:
    WAIT_FOR_BUTTON:
        IN A, ($FF)
        
        AND %00000011
        CP %00000001
        
        JR Z, INTRO
        
        JR WAIT_FOR_BUTTON
        
    INTRO:
        LD A, 0
