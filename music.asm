ORG 0x0001

START:
    NOTES:
        ZERO:
            LD HL, (0)
        
        ONE:
            LD HL, (1)

        TWO:
            LD HL, (2)

        THREE:
            LD HL, (3)

        FOUR:
            LD HL, (4)

    PLAY:
        DB ONE
        DB ZERO
        DB ONE
        DB ZERO
        DB TWO
        DB ZERO
        DB TWO
        DB 0
