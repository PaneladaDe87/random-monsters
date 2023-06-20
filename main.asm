ORG 150h

LD A, $0
ADD A, 1

DB NOTE_A
DB NOTE_B
DB NOTE_C
DB BPM

NOTE_A:
    LD HL, 1

NOTE_B:
    LD HL, 2

NOTE_C:
    LD HL, 3

BPM:
    LD HL, 2

MUSIC_DATA:
    DB BPM
    DB NOTE_A
    DB NOTE_B
    DB NOTE_B
    DB NOTE_A
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
