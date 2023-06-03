ORG 150h

LD A, $0

MAIN:
    CP 0
    JR Z, START
    
    JR MAIN

START:
    BUTTON_A equ 0
    BUTTON_B equ 1
    
    WAIT_FOR_BUTTON:
        IN A, ($FF)
        
        AND %00000011
        CP %00000001
        
        JR Z, INTRO
        
        JR WAIT_FOR_BUTTON
        
    INTRO:
        LD A, 0
