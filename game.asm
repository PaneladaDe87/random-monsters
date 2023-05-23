ORG 100h   ; Endereço de início do programa

START:

    LD A, 10    ; Carrega o valor 10 no registrador A

    LD B, 5     ; Carrega o valor 5 no registrador B

    ADD A, B    ; Soma os valores de A e B

    ; Agora o resultado da soma está em A, você pode fazer o que quiser com ele

    HALT        ; Para a execução do programa

END START   ; Fim do programa

