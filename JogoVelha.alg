
algoritmo "JogoDaVelha"

var
   tabuleiro, jogo: vetor[1..9] de caractere
   casa, posicao, i, j, primeira, pontos: inteiro
   jogador, inicial, vencedor, campeao: caractere
   vitoria, fimJogo, livre: logico

inicio
   para i de 1 ate 9 faca
      tabuleiro[i] <- " "
   fimpara

   jogador <- "X"
   campeao <- " "
   fimJogo <- falso
   pontos <- 0

   escreval("===================================")
   escreval("          JOGO DA VELHA")
   escreval("===================================")
   escreval("REGRAS DO JOGO:")
   escreval("Cada numero representa uma casa.")
   escreval("Cada casa possui uma partida menor.")
   escreval("Quem ganhar conquista a casa escolhida.")
   escreval("Os jogadores X e O alternam as jogadas.")
   escreval("Quem escolher a casa comeca jogando.")
   escreval("Se houver empate, a casa continua livre.")
   escreval("Vence quem conseguir alinhar 3 casas.")
   escreval("")

   enquanto fimJogo = falso faca

      escreval("")
      escreval("-------- TABULEIRO PRINCIPAL --------")

      para i de 1 ate 9 faca
         se tabuleiro[i] = " " entao
            escreva("[", i, "] ")
         senao
            escreva("[", tabuleiro[i], "] ")
         fimse

         se i mod 3 = 0 entao
            escreval("")
         fimse
      fimpara

      escreval("")
      escreval("Vez do jogador: ", jogador)

      repita
         escreva("Digite a casa desejada (1 a 9): ")
         leia(casa)

         livre <- falso

         se (casa >= 1) e (casa <= 9) entao
            se tabuleiro[casa] = " " entao
               livre <- verdadeiro
            fimse
         fimse

         se livre = falso entao
            escreval("Casa invalida ou ocupada. Tente novamente.")
         fimse

      ate livre

      inicial <- jogador

      escreval("")
      escreval("===================================")
      escreval("       PARTIDA DA CASA ", casa)
      escreval("===================================")
      escreval("O jogador ", inicial, " escolheu a casa.")
      escreval("Ele comeca a partida menor.")
      escreval("Os dois jogadores disputam esta casa.")
      escreval("O vencedor conquista a casa escolhida.")
      escreval("Se empatar, ela podera ser escolhida novamente.")
      escreval("")
      escreval("POSICOES DO JOGO:")
      escreval("[1] [2] [3]")
      escreval("[4] [5] [6]")
      escreval("[7] [8] [9]")

      para i de 1 ate 9 faca
         jogo[i] <- " "
      fimpara

      posicao <- 0
      vitoria <- falso
      vencedor <- " "

      enquanto (posicao < 9) e (vitoria = falso) faca

         escreval("")
         escreval("-------- JOGO DA CASA ", casa, " --------")

         para i de 1 ate 9 faca
            se jogo[i] = " " entao
               escreva("[", i, "] ")
            senao
               escreva("[", jogo[i], "] ")
            fimse

            se i mod 3 = 0 entao
               escreval("")
            fimse
         fimpara

         repita
            escreva("Jogador ", jogador, ", escolha a posicao: ")
            leia(j)

            livre <- falso

            se (j >= 1) e (j <= 9) entao
               se jogo[j] = " " entao
                  livre <- verdadeiro
               fimse
            fimse

            se livre = falso entao
               escreval("Posicao invalida ou ocupada. Escolha outra.")
            fimse

         ate livre

         jogo[j] <- jogador
         posicao <- posicao + 1

         para i de 1 ate 3 faca
            primeira <- (i - 1) * 3 + 1

            se (jogo[primeira] = jogador) e (jogo[primeira+1] = jogador) e (jogo[primeira+2] = jogador) entao
               vitoria <- verdadeiro
            fimse

            se (jogo[i] = jogador) e (jogo[i+3] = jogador) e (jogo[i+6] = jogador) entao
               vitoria <- verdadeiro
            fimse
         fimpara

         se (jogo[1] = jogador) e (jogo[5] = jogador) e (jogo[9] = jogador) entao
            vitoria <- verdadeiro
         fimse

         se (jogo[3] = jogador) e (jogo[5] = jogador) e (jogo[7] = jogador) entao
            vitoria <- verdadeiro
         fimse

         se vitoria entao
            vencedor <- jogador
         senao
            se jogador = "X" entao
               jogador <- "O"
            senao
               jogador <- "X"
            fimse
         fimse

      fimenquanto

      escreval("")
      escreval("--------- FIM DA PARTIDA ---------")

      se vitoria entao

         tabuleiro[casa] <- vencedor
         pontos <- pontos + 1

         escreval("Vencedor: ", vencedor)
         escreval("A casa ", casa, " foi conquistada!")

         para i de 1 ate 3 faca
            primeira <- (i - 1) * 3 + 1

            se (tabuleiro[primeira] = vencedor) e (tabuleiro[primeira+1] = vencedor) e (tabuleiro[primeira+2] = vencedor) entao
               fimJogo <- verdadeiro
            fimse

            se (tabuleiro[i] = vencedor) e (tabuleiro[i+3] = vencedor) e (tabuleiro[i+6] = vencedor) entao
               fimJogo <- verdadeiro
            fimse
         fimpara

         se (tabuleiro[1] = vencedor) e (tabuleiro[5] = vencedor) e (tabuleiro[9] = vencedor) entao
            fimJogo <- verdadeiro
         fimse

         se (tabuleiro[3] = vencedor) e (tabuleiro[5] = vencedor) e (tabuleiro[7] = vencedor) entao
            fimJogo <- verdadeiro
         fimse

         se fimJogo entao
            campeao <- vencedor
         fimse

      senao
         escreval("A partida terminou empatada!")
         escreval("A casa ", casa, " continua disponivel.")
      fimse

      jogador <- inicial

      se jogador = "X" entao
         jogador <- "O"
      senao
         jogador <- "X"
      fimse

      se pontos = 9 entao
         fimJogo <- verdadeiro
      fimse

      se fimJogo = falso entao
         escreval("Proximo jogador: ", jogador)
      fimse

   fimenquanto

   escreval("")
   escreval("===================================")
   escreval("          RESULTADO FINAL")
   escreval("===================================")

   para i de 1 ate 9 faca
      se tabuleiro[i] = " " entao
         escreva("[ ] ")
      senao
         escreva("[", tabuleiro[i], "] ")
      fimse

      se i mod 3 = 0 entao
         escreval("")
      fimse
   fimpara

   escreval("")

   se campeao = " " entao
      escreval("EMPATE GERAL!")
   senao
      escreval("CAMPEAO DO JOGO: ", campeao)
   fimse

   escreval("FIM DA PARTIDA!")

fimalgoritmo
