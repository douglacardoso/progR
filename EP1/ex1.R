# ex1
data <- read.csv('MAC0113-EP1.csv', sep=';')
head(data)


# ex2
circunferencia <- data[,2]
diametro <- data[,3]

# ex3
meupi <- c()

i <- 1

while ( i < length( circunferencia ) + 1 ){
  
  meupi <- c( meupi, circunferencia[i] / diametro[i] )
  
  i = i + 1
  
}


## variacao1
meupi_1 <- circunferencia / diametro

## variacao2
meupi2 <- c()

for (i in 1:length(diametro)){
  
  meupi2 = c(meupi2, circunferencia[i] / diametro[i])
}

## variacao3
for (i in 1:length(circunferencia)){
  
  meupi2 = c(meupi2, circunferencia[i] / diametro[i])
}


# ex4 
soma <- 0
n <- 1

while (n < length(meupi)){
  
  soma <- soma + meupi[n] 
  
  piMedio <- soma/length(meupi)
  
  n <- n + 1
}


# ex 5

soma <- 0
p = 1

while (p < length(meupi)) {

  soma <- soma + ((meupi[p] - piMedio)^2)
  
  piVar <- soma / (length(meupi) - i)
  
  p <- p + 1
  
}

# ex 6
plot(diametro, circunferencia, ylab = 'Circunferência (cm)',
                               xlab = 'Diâmetro (cm)',
                               main = 'Estimativa de Pi')

# ex7
plot(meupi, ylab='Pi', xlab = 'Indices', main = 'Pi do diâmetro pela circunferência')


# ex8
lm_ep <- lm(diametro ~  circunferencia)
plot(lm_ep)
