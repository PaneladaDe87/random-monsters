ORG 0x0000

START:
    MUSIC:
        NOTES:
            CALL 0x0001

    RESTART:
        LD A, (0)

        JP LOADING

    LOADING:
        ADD A, (1)
        CP A
        
        JR NZ, MENU
        JR Z, LOADING

    MENU:
        LD A, (0)
