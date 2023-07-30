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
        CALL SHINTO_HEALTH

    ; RAG or Random Action Group
    ; Is the action group, allow the randomon dodge, attack, etc...
    ; Each randomon can use just 4 RAGs

    SHINTO_RAG:
        JP RAG_SEED

        SHINTO_RAG_POWER:
            ; Compare the RAG power
            ; The RAG power is like the elixir from Clash Royale
            ; Each randomon can have 10 RAG power or lower

            LD A, 10

            CP A
            JR Z, SHINTO_RAG_POWER

            CP 10
            DB "Shinto have full RAG power"

            CP 5
            DB "Shinto have half RAG power"

            CP 0
            DB "Shinto have null RAG power"

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

SHINTO_PUNCH:
    DB "Shinto used PUNCH"
    SUB A, 2
    SUB A', 2
    RET

SHINTO_BITE:
    DB "Shinto used BITE"
    SUB A, 3
    SUB A', 4
    RET

SHINTO_DODGE:
    DB "Shinto used DODGE"
    SUB A', 1
    RET

SHINTO_HEAL:
    DB "Shinto used HEAL"
    ADD A, 2
    ADD A', 1
    RET

; Seed is a base for semi-random number selector
; Used in games like minecraft(the semi-perfect game)
; The seed in this game is for specific cases

RAG_SEED:
    LD L, 4
    CP L
    JR Z, RAG_SEED

    CP 1
    JR Z, SHINTO_PUNCH

    CP 2
    JR Z, SHINTO_BITE

    CP 3
    JR Z, SHINTO_DODGE

    CP 4
    JR Z, SHINTO_HEAL

    RET
