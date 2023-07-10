ORG 0x0000

JP START

START:
    JP MENU

    MENU:
        LD A, 0

        DB "press START button to start"

        CP C
        JR Z, MENU
        JR NZ, PLAY

    PLAY:
        LD D, 0
        LD E, 1
        LD C, 0
        CP D
        JR Z, PLAY
        JR NZ, CHECK_INPUT

WALK_LEFT:
    LD B, 1

WALK_RIGHT:
    LD B, 2

WALK_UP:
    LD B, 3

WALK_DOWN:
    LD B, 4

IDLE:
    LD B, 0

; Check a button if pressed
; The player can move in 4 directions
CHECK_INPUT:
    ; Compare the register D value to walk
    CP D
    JR Z, CHECK_INPUT

    ; If the register D is one
    CALL WALK_LEFT

    ; I will stop here, for now
