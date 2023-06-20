ORG 150h

LD A, $0
ADD A, 1

DB NOTE_A
DB NOTE_B
DB NOTE_C
DB NOTE_D
DB NOTE_E
DB NOTE_F
DB NOTE_G
DB BEATS_PER_MINUTE

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
