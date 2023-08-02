ORG 0x0001

SETUP:
    JP CHECK_COMPONENTS

    CHECK_COMPONENTS:
        CP E
        JR Z, DISPLAYS

        CP 1
        JR NZ, SOUNDS

        CP 2
        JR NZ, CONTROLLS

        CP 3
        JR NZ, JOYSTICK

        CP 4
        JR NZ, END_SETUP
    
        DISPLAYS:
            CP HL
            JR Z, ERROR_DIS

            LD E, 1
            RET

        SOUNDS:
            CP BE
            JR Z, ERROR_AUD

            LD E, 2
            RET

        CONSTROLLS:
            CP B
            JR Z, ERROR_CON

            LD E, 3
            RET

        JOYSTICK:
            CP DE
            JR Z, ERROR_JOY

            LD E, 4
            RET

        END_SETUP:
            JP 0x0000

ERROR_DIS:
    DB "Error Name: NO_DISPLAY_FOUNDED"

ERROR_AUD:
    DB "Error Name: NO_AUDIO_EXIT_FOUNDED"

ERROR_CON:
    DB "Error Name: NO_CONTROLLERS_FOUNDED"

ERROR_JOY:
    DB "Error Name: NO_JOYSTICK_FOUNDED"
