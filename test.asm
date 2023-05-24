ORG 150h

LD A, $80

LD ($FF40), A

LD HL, $9800  ; Endereço da tela de exibição (vide RAM do Game Boy)

LD DE, info_string  ; Endereço da string de informações do Pokémon

LD BC, info_length  ; Tamanho da string de informações

DISPLAY_INFO_LOOP:

  LD A, (DE)   ; Carrega o próximo byte da string de informações em A

  CP $00       ; Verifica se chegou ao final da string

  JR Z, END_DISPLAY_INFO  ; Se sim, sai do loop

  LD (HL), A   ; Define o valor do byte atual na tela

  INC HL       ; Avança para o próximo byte na memória da tela

  INC DE       ; Avança para o próximo byte na string de informações

  DEC BC       ; Decrementa o contador de bytes restantes

  JR DISPLAY_INFO_LOOP  ; Repete o loop para exibir os próximos bytes da string

END_DISPLAY_INFO:

  JR $     ; Loop infinito

info_string:

  DB "Name: Shinto"   ; String com as informações do Pokémon

  ; Adicione mais linhas para exibir outras informações, como tipo, altura, peso, etc.

info_length EQU $ - info_string  ; Calcula o tamanho da string de informações

END

