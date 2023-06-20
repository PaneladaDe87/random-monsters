ORG 150h

LD A, $0
ADD A, 1

NOTE_A = 5
NOTE_B = 6
NOTE_C = 0
NOTE_D = 1
NOTE_E = 2
NOTE_F = 3
NOTE_G = 4
BEATS_PER_MINUTE = 100

MUSIC_DATA:
    DB NOTE_A
    DB NOTE_B
    DB NOTE_C
    DB NOTE_E
    DB NOTE_F
    DB NOTE_G
    DB 0

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
