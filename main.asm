ORG 0x0000

JP START

START:
    LD A, (0)

    JP LOADING

    LOADING:
        ADD A, (1)
        CP A
        
        JR NZ, MENU
        JR Z, LOADING

    MENU:
        LD A, (0)

        DB "press START button to start"

        CP B
        JR Z, MENU
        JR NZ, PLAY

    PLAY:
        DB "in development..."
