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
        LD E, 1
        LD C, 0
        CP D
        JR Z, PLAY
        JR NZ, WALK_RIGHT

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

CHECK_FOR_INPUT:
    CP B
    ADD A, E
