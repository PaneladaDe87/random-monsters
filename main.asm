ORG 0x0000

JP START

START:
    JP MENU

    MENU:
        LD A, 0

        DB "press START button to start"

        CP B
        JR Z, MENU
        JR NZ, PLAY

    PLAY:
        LD C, 0
        CP D
        JR Z, PLAY
        JR NZ, WALK_RIGHT

WALK_RIGHT:
    ; move one tile to forward
    ADD A, 1

WALK_LEFT:
    ; move one tile to behind
    SUB A, 1

WALK_UP:
    ; move one tile to up
    ADD A, 1

WALK_DOWN:
    ; move one tile to down
    SUB 1, 1

CHECK_BUTTON_PRESSED:
    LD C, 0
    LD D, 0
