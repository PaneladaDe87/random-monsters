ORG 150h

LD A, $80
LD ($FF40), A

LD HL, $9800  ; Endereço da tela de exibição (vide RAM do Game Boy)
LD BC, $2000  ; Tamanho total da tela de exibição (32x32 tiles)
LD A, $FF     ; Cor branca

CLEAR_SCREEN_LOOP:
  LD (HL), A   ; Define o valor da cor branca no endereço da tela
  INC HL       ; Avança para o próximo byte na memória da tela
  DEC BC       ; Decrementa o contador de bytes restantes
  LD A, B
  OR C
  JR NZ, CLEAR_SCREEN_LOOP  ; Repete o loop enquanto ainda houverem bytes restantes

MAIN_LOOP:
  JR MAIN_LOOP

END
