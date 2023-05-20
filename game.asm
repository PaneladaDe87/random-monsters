SECTION "Variables", VRAMO
random_number: DB 0
guess:         DB 0

SECTION "Code", ROMO
start:
    ld   a, 10
    call randomize
    ld   (random_number)
    
prompt:
    ld hl, prompt_msg
    call prompt_string
    
    read_input:
    ld hl, guess
    call read_digit
    
    ld a, (guess)
    cp (random_number)
    jr z, correct_guess
    jr prompt
    
    correct_guess:
    ld hl, correct_msg
    call print_string
    
randomize:
    ld a, r
    xor $1F
    add $01
    ret
    
