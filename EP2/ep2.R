#################################################################
## AO PREENCHER ESSE CABEÇALHO COM O MEU NOME E O MEU NÚMERO USP,
## DECLARO QUE SOU O ÚNICO AUTOR E RESPONSÁVEL POR ESSE PROGRAMA.
## TODAS AS PARTES ORIGINAIS DESSE EXERCÍCIO PROGRAMA (EP) FORAM
## DESENVOLVIDAS E IMPLEMENTADAS POR MIM SEGUINDO AS INSTRUÇÕES
## DESSE EP E QUE PORTANTO NÃO CONSTITUEM DESONESTIDADE
## ACADÊMICA OU PLÁGIO.
## DECLARO TAMBÉM QUE SOU RESPONSÁVEL POR TODAS AS CÓPIAS
## DESSE PROGRAMA E QUE EU NÃO DISTRIBUI OU FACILITEI A
## SUA DISTRIBUIÇÃO. ESTOU CIENTE QUE OS CASOS DE PLÁGIO E
## DESONESTIDADE ACADÊMICA SERÃO TRATADOS SEGUNDO OS CRITÉRIOS
## DIVULGADOS NA PÁGINA DA DISCIPLINA.
## ENTENDO QUE EPS SEM ASSINATURA NÃO SERÃO CORRIGIDOS E,
## AINDA ASSIM, PODERÃO SER PUNIDOS POR DESONESTIDADE ACADÊMICA.

## Nome : Lucas da Silva Kairoff
## NUSP : 11373518
## Turma: 22
## Prof.: Roberto Hirata Jr.

## Referências: 
### Slides do professor
#############################################################

# EX 1
df <- read.table('ml-100k/u.data', 
                 col.names = c('user_id', 
                               'item_id', 
                               'rating', 
                               'timestamp'))

# EX 2
userid <- df$user_id
itemid <- df$item_id
rating <- df$rating

matriz <- matrix(nrow = max(userid), ncol = max(itemid))

for(index in 1:nrow(df)){                 
  matriz[df[index,1], df[index,2]] <- df[index,3]
}

# EX 3
contaLinha <- function(m){
  q_rating_user <- c()
  for (i in 1:nrow(m)){
    q_rating_user <- c(q_rating_user, length(which(!is.na(m[i, ])))) # onde o valor na linha da matriz for NA, retorna o índice e depois calcula o tamanho de todos esses índices, que saem em de which vetorizado
  }
  q_rating_user
}

# EX 4
contaColuna <- function(m){
  q_rating_movie <- c()
  for (i in 1:ncol(m)){
    q_rating_movie <- c(q_rating_movie, length(which(!is.na(m[, i]))))  
  }
  q_rating_movie
}

# EX 5
## Criação de uma função que calcula a média sem NA
mean_without_na <- function(vector){
  sum_elements <- 0
  len_new_vector <- 0
  
  for(element in vector){
    if (!is.na(element)){
      len_new_vector <- len_new_vector + 1    # tamanho do novo vetor sem NA
      sum_elements <- sum_elements + element
    }
  }
  mean_vector <- sum_elements / len_new_vector
  mean_vector
}

## Função  que calcula média da coluna de uma matriz
mediaColuna <- function(m){
  mean_m <- c()
  for (index in 1:ncol(m)){
    mean_m <- c(mean_m, mean_without_na(m[, index]))
  }
  mean_m
}

# EX 6
mediaFilmes <- mediaColuna(matriz)

# EX 7 
u_item <- read.csv('ml-100k/u.item', sep = '|', header = FALSE,
                   col.names = c('movie_id', 'movie_title', 3:24))

data <- u_item[, c('movie_id', 'movie_title')]

mascara <- mediaFilmes >= 4.3
all_movies <- data$movie_title
nomeFilmes <- all_movies[mascara]

# EX 8
contaUsers <- contaLinha(matriz)

# EX 9
contaFilmes <- contaColuna(matriz)

# EX 10
hist(contaUsers, 
     main = 'Histograma da quantidade de avaliações que cada usuário deu',
     xlab = 'Usuário',
     ylab = 'Quantidade de avaliações')

hist(contaFilmes,
    main = 'Histograma da quantidade de avaliações que cada cada filme recebeu',
    xlab = 'Filme',
    ylab = 'Quantidade de avaliações')

## Experimentando outros resultados
hist(contaUsers, breaks = 50,
     main = 'Histograma da quantidade de avaliações que cada usuário deu (breaks = 50)',
     xlab = 'Usuário',
     ylab = 'Quantidade de avaliações')

hist(contaUsers, breaks = 100,
     main = 'Histograma da quantidade de avaliações que cada usuário deu (breaks = 100',
     xlab = 'Usuário',
     ylab = 'Quantidade de avaliações')

hist(contaFilmes, breaks = 50,
     main = 'Histograma da quantidade de avaliações que cada cada filme recebeu (breaks = 50)',
     xlab = 'Filme',
     ylab = 'Quantidade de avaliações')

hist(contaFilmes, breaks = 100,
     main = 'Histograma da quantidade de avaliações que cada cada filme recebeu (breaks = 100)',
     xlab = 'Filme',
     ylab = 'Quantidade de avaliações')
