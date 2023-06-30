ORG 150h

LD A, $0
ADD A, 1

NOTE_NULL:
    LD HL, (0)

NOTE_A:
    LD HL, (1)

NOTE_B:
    LD HL, (2)

NOTE_C:
    LD HL, (3)

MUSIC_DATA:
    DB 0

MAIN:
    CP 0
    JR Z, START
    
    JR MAIN

MUSIC_PLAY:
    CALL MUSIC_DATA

START:
    WAIT_FOR_BUTTON:
        IN A, ($FF)
        
        AND %00000011
        CP %00000001
        
        JR Z, INTRO
        
        JR WAIT_FOR_BUTTON
        
    INTRO:
        LD A, 0

        CALL MUSIC_PLAY
