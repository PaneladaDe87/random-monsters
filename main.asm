ORG 0x0000

; The script starts here

JP START

START:
    JP MENU

    MENU:
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

; Walking logic

WALK_LEFT:
    LD B, 1
    JR CHECK_INPUT

WALK_RIGHT:
    LD B, 2
    JR CHECK_INPUT

WALK_UP:
    LD B, 3
    JR CHECK_INPUT

WALK_DOWN:
    LD B, 4
    JR CHECK_INPUT

IDLE:
    RET

; Check a button if pressed
; The player can move in 4 directions
CHECK_INPUT:
    ; Compare the register D value to walk
    CP D
    JR Z, CHECK_INPUT

    ; If D is 1
    CP 1
    JR Z, WALK_LEFT

    ; If D is 2
    CP 2
    JR Z, WALK_RIGHT

    ; If D is 3
    CP 3
    JR Z, WALK_UP

    ; If D is 4
    CP 4
    JR Z, WALK_DOWN

    ; If D is 0
    CALL IDLE
    JR CHECK_INPUT

; Randomons logic(battle, encounter and catch)

; Logic to found a randomon
RANDOMON_ENCOUNTER:
    CP H
    JR Z, RANDOMON_ENCOUNTER

    CP 1
    JR Z, RANDOMON_BATTLE

; Logic to the founded randomon
RANDOMON_BATTLE:
    CP E
    JR Z, RANDOMON_BATTLE

    CP 1
    JR Z, SHINTO

    ; Shinto battle logic
    SHINTO:
        SHINTO_HEALTH:
            LD A, 5

            CP A
            JR Z, SHINTO

            CP 5
            DB "Shinto health is full"

            CP 3
            DB "Shinto health is half"

            CP 0
            DB "Shinto health is empty"

        ; RAG or Random Action Group
        ; Is the action group, allow the randomon dodge, attack, etc...
        ; Each randomon can use just 4 RAG's

        SHINTO_RAG:
            CALL RAG_SEED

; Seed is a base for semi-random number selector
; Used in games like minecraft(the semi-perfect game)
; The seed in this game is for specific cases

RAG_SEED:
    LD L, 4
    RET
