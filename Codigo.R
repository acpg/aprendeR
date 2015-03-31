### R code from vignette source 'Documento.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: Documento.Rnw:61-66
###################################################
x <- 2 + 11 # se guarda una operacion en el objeto x
x
y <- x^2 - 1 # se llama a x para crear a y
y
ls() # se listan los objetos en la memoria


###################################################
### code chunk number 2: Documento.Rnw:71-75
###################################################
options(digits = 16)
sqrt(2) # raiz cuadrada de 2
exp(1) # e
pi # pi


###################################################
### code chunk number 3: Documento.Rnw:94-104
###################################################
x <- 57
typeof(x)
x <- as.integer(x) # se cambia a tipo entero
typeof(x)
y <- 'hola' # es equivalente usar "hola"
typeof(y)
sqrt(-2) # no esta definido
sqrt(as.complex(-2))
typeof(5 + 3i) # numero complejo
1 > 2


###################################################
### code chunk number 4: Documento.Rnw:113-119
###################################################
vec.1 <- c(1, -1, 0, 2, 0, 3)
vec.1 # vector numerico
class(vec.1) # clase de todo tipo de numero
vec.2 <- c('a', 'b', 'c')
vec.2
class(vec.2) # vector de caracteres


###################################################
### code chunk number 5: Documento.Rnw:124-126
###################################################
seq(from = 5, to = 20, by = 3)
7:11


###################################################
### code chunk number 6: Documento.Rnw:131-136
###################################################
mat.1 <- matrix(data = vec.1, ncol = 2, byrow = TRUE)
mat.1
mat.2 <- matrix(vec.1, ncol = 2) # byrow = FALSE
mat.2
class(mat.1) # clase matriz


###################################################
### code chunk number 7: Documento.Rnw:141-144
###################################################
par(mfrow=c(1,2))
plot(mat.1)
plot(vec.1)


###################################################
### code chunk number 8: Documento.Rnw:149-151
###################################################
str(mat.1)
str(vec.1)


###################################################
### code chunk number 9: Documento.Rnw:156-160
###################################################
vec.1
vec.1[2]
vec.1[2:5]
vec.1[-2]


###################################################
### code chunk number 10: Documento.Rnw:165-167
###################################################
mat.1[1,2] # componente fila 1 y columna 2
mat.1[,2] # segunda columna


###################################################
### code chunk number 11: Documento.Rnw:174-175
###################################################
setwd("~/Dropbox/ITAM/SERVICIO SOCIAL")


###################################################
### code chunk number 12: Documento.Rnw:177-178
###################################################
mis.datos <- read.table("CASAS.txt", header=TRUE)


###################################################
### code chunk number 13: Documento.Rnw:183-186
###################################################
head(mis.datos) # muestra 6 observaciones
nrow(mis.datos) # observaciones
ncol(mis.datos) # variables


###################################################
### code chunk number 14: Documento.Rnw:194-197
###################################################
vec.1[c(1,4,5)] # indices que no son consecutivos
a <- c(1,3,2) # tambien se puede en desorden
vec.1[a]


###################################################
### code chunk number 15: Documento.Rnw:202-204
###################################################
a.2 <- vec.1 > 0 # vector con TRUE donde cumple y FALSE donde no 
vec.1[a.2] # los elementos cuyo indice tiene TRUE en a.2


###################################################
### code chunk number 16: Documento.Rnw:209-217
###################################################
mat.1[1,2] # un elemento
mat.1[c(1,2), ] # dos renglones, todas las columans
mat.1[1:2, ] # lo mismo que el anterior
mat.1[1:2,1] # una columna, dos renglones
mat.1[1:2,1, drop=FALSE] # para que no convierta a vector
mis.datos[1:5, c(2,5,6)]
vec.3 <- mis.datos[ , 2]  # esto es un vector, la 2a columna
vec.3[1:20]


###################################################
### code chunk number 17: Documento.Rnw:222-225
###################################################
indice <- mis.datos[ , 6] > 0 # ST > 0
sub.datos <- mis.datos[indice, ] # nuevo objeto
nrow(sub.datos)


###################################################
### code chunk number 18: Documento.Rnw:230-234
###################################################
impuesto <- mis.datos$TAX # columna con titulo TAX
head(impuesto)
aux <- subset(mis.datos, Price > 60 & ST == 1)
aux


###################################################
### code chunk number 19: Documento.Rnw:243-246
###################################################
sum(vec.1) # suma
max(vec.1) # maximo
mean(vec.1) # promedio


###################################################
### code chunk number 20: Documento.Rnw:253-255
###################################################
sort(vec.1) # ordena
sort(vec.1, decreasing = TRUE) # ordena de mayor a menor


###################################################
### code chunk number 21: Documento.Rnw:260-261
###################################################
sort


###################################################
### code chunk number 22: Documento.Rnw:266-272
###################################################
mayor <- function(x, y=1){
  z <- max(x,y)
  return(z)
}
mayor(5,3)
mayor(-3)


###################################################
### code chunk number 23: Documento.Rnw:280-281
###################################################
library(ggplot2)


###################################################
### code chunk number 24: Documento.Rnw:307-308
###################################################
rm(list=ls())


###################################################
### code chunk number 25: Documento.Rnw:322-324
###################################################
x <- c(0,1,2,3)
f <- c(1/8, 3/8, 3/8, 1/8)


###################################################
### code chunk number 26: Documento.Rnw:329-331
###################################################
mu <- sum(x * f)
mu


###################################################
### code chunk number 27: Documento.Rnw:336-338
###################################################
sigma2 <- sum((x-mu)^2 * f)
sigma2


###################################################
### code chunk number 28: Documento.Rnw:343-345
###################################################
sigma <- sqrt(sigma2)
sigma


###################################################
### code chunk number 29: Documento.Rnw:350-352
###################################################
F <- cumsum(f)
F


###################################################
### code chunk number 30: Documento.Rnw:357-360
###################################################
library(distrEx)
X <- DiscreteDistribution(supp = 0:3, prob = c(1,3,3,1)/8)
E(X); var(X); sd(X)


###################################################
### code chunk number 31: Documento.Rnw:375-379
###################################################
x <- sample(6, size = 3000, replace = TRUE) # m = 6, 3000 veces
mean(x) # mu = (6 + 1)/2 = 3.5
var(x) # sigma2 = (36 - 1)/12 = 2.92
hist(x) 


###################################################
### code chunk number 32: Documento.Rnw:384-388
###################################################
x <- sample(30:70, size = 270, replace = TRUE)
mean(x) # mu = (70 - 30 + 1)/2 + 30 = 50.5
var(x) # sigma2 = ((70 - 30)^2 + 1)/12 = 133.42
hist(x)


###################################################
### code chunk number 33: Documento.Rnw:403-408
###################################################
dbinom(2, size = 4, prob = 1/2) # funcion de densidad P(X = 2)
pbinom(2, size = 4, prob = 1/2) # funcion de distribucion P(X < 2)
pbinom(9, size = 12, prob = 1/6) - 
  pbinom(6, size = 12, prob = 1/6) # P(6 < X < 9)
diff(pbinom(c(6,9), size = 12, prob = 1/6)) # lo mismo


###################################################
### code chunk number 34: Documento.Rnw:413-416
###################################################
library(distr)
X <- Binom(size = 3, prob = 1/2)
X


###################################################
### code chunk number 35: Documento.Rnw:421-423
###################################################
d(X)(1) # funcion de densidad P(X = 1)
p(X)(2) # funcion de distribucion P(X < 2)


###################################################
### code chunk number 36: Documento.Rnw:428-429
###################################################
rbinom(10, size = 4, prob = 1/2)


###################################################
### code chunk number 37: Documento.Rnw:434-451
###################################################
bin <- function(n,p){
  return(binr(n,p,n))
}

binr <- function(n,p,k){
  if(k>=1){
    # La entrada k+1 representa la probabilidad en k.
    # Se concatena la respuesta conforme sale, 
    #   para obtener todas la probabilidades
    B <- c(binr(n, p, k-1), p/(1-p) * 
             (n-(k-1))/((k-1)+1) * binr(n, p, k-1)[k])
  }
  else{
    B <- (1 - p)^n # Caso particular para la probabilidad en cero
  }
 return(B)
}


###################################################
### code chunk number 38: Documento.Rnw:457-460
###################################################
n = 6
p = 0.4
bin(n,p) # llamamos a la funcion definida


###################################################
### code chunk number 39: Documento.Rnw:472-480
###################################################
library(moments) # paqueteria para obtener momentos de las variables
vars <- rbinom(10000, 10, .3) # parametros n, repeticiones y p respectivamente
hist(vars)
mean(vars) # el valor esperado es n * p
var(vars) # la varianza es np(1-p)
moment(vars,1) # el primer momento es la esperanza E[X]
moment(vars,2) # el segundo momento es E[X^2] = E[X]^2 + V[X]
mean(vars)^2 + var(vars) # se puede ver la equivalencia


###################################################
### code chunk number 40: Documento.Rnw:491-504
###################################################
poi <- function(n,l){ #Se necesitan n y l
  return(poir(l,n))
}

poir <- function(l,k){
  if(k>=1){
    P <- c(poir(l,k-1), l/k * poir(l,k-1)[k])
  }
  else{
    P <-exp(1)^(-l) # Caso para P(X=0)
  }
  return(P)
}


###################################################
### code chunk number 41: Documento.Rnw:509-513
###################################################
l = 3.2
n = 2
poi(n,l)
sum(poi(n,l))


###################################################
### code chunk number 42: Documento.Rnw:520-521
###################################################
set.seed(000118440)


###################################################
### code chunk number 43: Documento.Rnw:523-526
###################################################
n = 10
prob = 0.4
X <- rbinom(1000, n, prob)


###################################################
### code chunk number 44: Documento.Rnw:528-532
###################################################
  prom.parciales <- cumsum(X)/1:1000
  plot(1:1000, prom.parciales, type='l', col='blue')
  title('Media de la distribucion Binomial')
  abline(h=n*prob, col='red')


###################################################
### code chunk number 45: Documento.Rnw:537-541
###################################################
var.parciales <- vector("numeric",1000)
for (i in 1:1000){
  var.parciales[i] <- sum((X[1:i] - prom.parciales[i])^2)/i 
} 


###################################################
### code chunk number 46: Documento.Rnw:543-546
###################################################
plot(1:1000, var.parciales, type='l', col='blue') 
title('Varianza de la distribucion Binomial')
abline(h=n*prob*(1 - prob), col='red')


###################################################
### code chunk number 47: Documento.Rnw:548-551
###################################################
# POISSON
lambda <- 1
X <- rpois(1000,lambda)


###################################################
### code chunk number 48: Documento.Rnw:553-557
###################################################
prom.parciales <- cumsum(X)/1:1000
plot(1:1000, prom.parciales, type='l',col='blue')
title('Promedio de la distribucion Poisson') 
abline(h=lambda, col='red')


###################################################
### code chunk number 49: Documento.Rnw:559-562
###################################################
var.parciales <- vector("numeric",1000)
for (i in 1:1000)
  var.parciales[i] <- sum((X[1:i] - prom.parciales[i])^2)/i 


###################################################
### code chunk number 50: Documento.Rnw:564-567
###################################################
plot(1:1000, var.parciales, type='l', col='blue') 
title('Varianza de la distribuci\'on Poisson')
abline(h=lambda, col='red')


###################################################
### code chunk number 51: Documento.Rnw:576-578
###################################################
prob <- 75/250000    #estimacion de la probabilidad
X <- sample(c(0,1), 250000, prob=c(1-prob,prob), replace=TRUE)


###################################################
### code chunk number 52: Documento.Rnw:583-588
###################################################
accidentes <- vector("numeric", 1000)
for (j in 1:1000) {
  aseguradora <- sample(X,10000)
  accidentes[j] <- sum(aseguradora) # total de accidentes
}


###################################################
### code chunk number 53: Documento.Rnw:591-594
###################################################
Y <- rpois(1000, lambda = 10000*prob)
table(accidentes)
table(Y)


###################################################
### code chunk number 54: comparacion
###################################################
par(mfrow = c(1,3)) # comando para mostrar las 3 graficas en 1 linea
hist(accidentes,prob=TRUE,main='Histograma de accidentes')
lines(density(accidentes,adjust=2), col='blue')
hist(Y,prob=TRUE,main='Histograma de Poisson(n*p)')
lines(density(Y, adjust=2), col='red')
plot(density(accidentes,adjust=2),type='l',col='blue',main='Comparacion')
lines(density(Y, adjust=2), col='red')


###################################################
### code chunk number 55: Documento.Rnw:606-613
###################################################
# DISCRETA UNIFORME
n <- 10
X <- sample(n,1000,replace=TRUE)
prom.parciales <- cumsum(X)/1:1000
plot(1:1000,prom.parciales,type='l', col='blue') 
title('Media de la distribucion Discreta Uniforme')
abline(h=(n+1)/2, col='red')


###################################################
### code chunk number 56: Documento.Rnw:615-618
###################################################
var.parciales <- vector("numeric",1000)
for (i in 1:1000)
  var.parciales[i] <- sum((X[1:i]-prom.parciales[i])^2)/i 


###################################################
### code chunk number 57: Documento.Rnw:620-623
###################################################
plot(1:1000, var.parciales,type='l',col='blue') 
title('Varianza de la distribucion Discreta Uniforme')
abline(h=(n^2-1)/12, col='red') 


###################################################
### code chunk number 58: Documento.Rnw:634-636
###################################################
pgeom(4, prob = 0.812, lower.tail = FALSE) # P(X > x)
1 - pgeom(4, prob = 0.812) # Default: lower.tail = TRUE, P(X <= 4)


###################################################
### code chunk number 59: Documento.Rnw:646-647
###################################################
dnbinom(5, size = 7, prob = 0.5) 


###################################################
### code chunk number 60: Documento.Rnw:660-661
###################################################
3/10*dhyper(0, 4, 10-4, 3) + 7/10*dhyper(0, 1, 10-1, 3)


###################################################
### code chunk number 61: Documento.Rnw:686-687
###################################################
rm(list=ls())


###################################################
### code chunk number 62: Documento.Rnw:717-721
###################################################
# funci\'on de densidad de probabilidad
f <- function(x) 3 * x^2 
# se integra para sacar la probabilidad deseada
integrate(f, lower = 0.14, upper = 0.71)


###################################################
### code chunk number 63: Documento.Rnw:726-730
###################################################
library(distr)
f <- function(x) 3 * x^2
X <- AbscontDistribution(d = f, low1 = 0, up1 = 1)
p(X)(0.71) - p(X)(0.14)


###################################################
### code chunk number 64: Documento.Rnw:737-741
###################################################
library(distrEx)
E(X) # media
var(X) # varianza
3/80 # varianza teorica


###################################################
### code chunk number 65: Documento.Rnw:758-759
###################################################
hist(runif(1000,-5,5))


###################################################
### code chunk number 66: Documento.Rnw:766-769
###################################################
x <- runif(1000,0,10)
mean(x) # E(X) = 5
var(x) # V(X) = 100/12


###################################################
### code chunk number 67: Documento.Rnw:777-779
###################################################
punif(15, min = 0, max = 30) - punif(10, min = 0, max = 30) + 
  punif(30, min = 0, max = 30) - punif(25, min = 0, max = 30)


###################################################
### code chunk number 68: Documento.Rnw:794-795
###################################################
pnorm(2, mean = 3, sd = sqrt(9), lower.tail = FALSE) - pnorm(5, mean = 3, sd = sqrt(9), lower.tail = FALSE)


###################################################
### code chunk number 69: Documento.Rnw:800-801
###################################################
pnorm(9, mean = 3, sd = sqrt(9), lower.tail = FALSE) + pnorm(-3, mean = 3, sd = sqrt(9), lower.tail = TRUE)


###################################################
### code chunk number 70: Documento.Rnw:815-816
###################################################
hist(rbinom(10, 10, .4))


###################################################
### code chunk number 71: Documento.Rnw:818-819
###################################################
hist(rbinom(50, 10, .4))


###################################################
### code chunk number 72: Documento.Rnw:821-822
###################################################
hist(rbinom(100, 10, .4))


###################################################
### code chunk number 73: Documento.Rnw:824-825
###################################################
hist(rbinom(1000, 10, .4))


###################################################
### code chunk number 74: Documento.Rnw:840-841
###################################################
pnorm(.16) - pnorm(-.16)


###################################################
### code chunk number 75: Documento.Rnw:854-855
###################################################
hist(rexp(200), breaks=25)


###################################################
### code chunk number 76: Documento.Rnw:857-858
###################################################
hist(rexp(500, 5), breaks=25)


###################################################
### code chunk number 77: Documento.Rnw:863-864
###################################################
x <- rexp(200); mean(x); mean(x)^2; var(x)


###################################################
### code chunk number 78: Documento.Rnw:866-867
###################################################
x <- rexp(500,5); mean(x); mean(x)^2; var(x)


###################################################
### code chunk number 79: Documento.Rnw:877-878
###################################################
pexp(10, rate = 1/10, lower.tail=FALSE)


###################################################
### code chunk number 80: Documento.Rnw:883-884
###################################################
pexp(10, rate = 1/10, lower.tail=FALSE) - pexp(20, rate = 1/10, lower.tail=FALSE)


###################################################
### code chunk number 81: Documento.Rnw:901-902
###################################################
hist(rgamma(200, 5), breaks=25)


###################################################
### code chunk number 82: Documento.Rnw:904-905
###################################################
hist(rgamma(500, 5, 5), breaks=25)


###################################################
### code chunk number 83: Documento.Rnw:910-914
###################################################
n <- 5
gamma(n); factorial(n-1)
n <- 10
gamma(n); factorial(n-1)


###################################################
### code chunk number 84: Documento.Rnw:919-922
###################################################
x <- rgamma(500, 1)
hist(x, breaks=25)
mean(x); var(x)


###################################################
### code chunk number 85: Documento.Rnw:924-927
###################################################
x <- rexp(500)
hist(x, breaks=25)
mean(x); var(x)


###################################################
### code chunk number 86: Documento.Rnw:942-943
###################################################
hist(rweibull(1000, 1, 1), breaks = 25)


###################################################
### code chunk number 87: Documento.Rnw:945-946
###################################################
hist(rweibull(1000, 5, 5), breaks = 25)


###################################################
### code chunk number 88: Documento.Rnw:948-949
###################################################
hist(rweibull(1000, .5, 1), breaks = 25)


###################################################
### code chunk number 89: Documento.Rnw:951-952
###################################################
hist(rweibull(1000, 1.5, 1), breaks = 25)


###################################################
### code chunk number 90: Documento.Rnw:957-960
###################################################
x <- rweibull(1000, 1, 5)
hist(x, breaks = 25)
mean(x); var(x)


###################################################
### code chunk number 91: Documento.Rnw:962-965
###################################################
x <- rexp(1000, 1/5)
hist(x, breaks = 25)
mean(x); var(x)


###################################################
### code chunk number 92: Documento.Rnw:973-975
###################################################
x <- data.frame(samples = rcauchy(100))
ggplot(x, aes(x = samples)) + geom_histogram(aes(y = ..density..), colour = 'darkgreen', fill = 'white') + geom_density(colour = 'blue') + ggtitle('Cauchy Distribution')


###################################################
### code chunk number 93: Documento.Rnw:986-988
###################################################
x <- data.frame(samples = rbeta(1000,1,2))
ggplot(x, aes(x = samples)) + geom_histogram(aes(y = ..density..), colour = 'darkgreen', fill = 'white') + geom_density(colour = 'blue') + ggtitle('Beta Distribution')


###################################################
### code chunk number 94: Documento.Rnw:990-992
###################################################
x <- data.frame(samples = rbeta(1000,2,5))
ggplot(x, aes(x = samples)) + geom_histogram(aes(y = ..density..), colour = 'darkgreen', fill = 'white') + geom_density(colour = 'blue') + ggtitle('Beta Distribution')


###################################################
### code chunk number 95: Documento.Rnw:1025-1026
###################################################
rm(list=ls())


###################################################
### code chunk number 96: Documento.Rnw:1059-1066
###################################################
masa <- function(i,j){
  if(i + j < 4)
    m <- choose(3,i)*choose(5,3-i-j)*choose(4,j)/choose(12,3)
  else
    m <- 0
  return(m)
}


###################################################
### code chunk number 97: Documento.Rnw:1071-1079
###################################################
options(digits=2)
m <- matrix(nrow = 4, ncol = 4)
for(i in 0:3){
  for(j in 0:3){
    m[i+1, j+1] <- masa(i,j)
  }
}
m


###################################################
### code chunk number 98: Documento.Rnw:1084-1085
###################################################
rowSums(m)


###################################################
### code chunk number 99: Documento.Rnw:1090-1091
###################################################
colSums(m)


###################################################
### code chunk number 100: Documento.Rnw:1118-1120
###################################################
x <- runif(10000, min=-1, max=1)
y <- runif(10000, min=-1, max=1)


###################################################
### code chunk number 101: Documento.Rnw:1125-1139
###################################################
circulo <- 0 # veces que los puntos caen dentro del circulo
cuadrado <- 0 # veces que los puntos caen fuera del circulo

plot(x[1], y[1], type="n", xlim=range(x), ylim=range(y))

for(i in 1:10000){ # para todos los puntos
  if(x[i]^2 + y[i]^2 < 1){ # si dentro del circulo, entra
    circulo <- circulo + 1 # suma el punto dentro del circulo
    points(x[i], y[i], pch=20, col="red") # punto en rojo
  }else{
    cuadrado <- cuadrado + 1 # si fuera del circulo, entra
    points(x[i], y[i], pch=20, col="blue") # punto en azul
    }
}


###################################################
### code chunk number 102: Documento.Rnw:1154-1165
###################################################
n <- 50 # cantidad de exponenciales
lambda <- .3
x <- 1:50
m <- 1000 # replicaciones del experimento
xx <- 1:m
for(j in 1:m){
  for(i in 1:n)
    x[i] <- rexp(1,lambda)
  xx[j] <- sum(x)
}
hist(xx, breaks = 15)


###################################################
### code chunk number 103: Documento.Rnw:1167-1168
###################################################
hist(rgamma(m,n,lambda), breaks = 15)


###################################################
### code chunk number 104: Documento.Rnw:1173-1183
###################################################
n <- 50 # cantidad de xi
x <- 1:50
m <- 1000 # replicaciones del experimento
xx <- 1:m
for(j in 1:m){
  for(i in 1:n)
    x[i] <- rnorm(1,0,1)
  xx[j] <- sum(x^2)
}
hist(xx, breaks = 15)


###################################################
### code chunk number 105: Documento.Rnw:1185-1186
###################################################
hist(rgamma(m,n/2,1/2), breaks = 15)


###################################################
### code chunk number 106: Documento.Rnw:1199-1203
###################################################
xA <- rbinom(1000, 26, 0.4)
mean(xA)
var(xA)
hist(xA)


###################################################
### code chunk number 107: Documento.Rnw:1205-1209
###################################################
xB <- rbinom(1000, 18, 0.7)
mean(xB)
var(xB)
hist(xB)


###################################################
### code chunk number 108: Documento.Rnw:1214-1218
###################################################
xA <- rnorm(1000, 10.4, sqrt(6.24))
mean(xA)
var(xA)
hist(xA)


###################################################
### code chunk number 109: Documento.Rnw:1220-1224
###################################################
xB <- rnorm(1000, 12.6, sqrt(3.78))
mean(xB)
var(xB)
hist(xB)


###################################################
### code chunk number 110: Documento.Rnw:1229-1235
###################################################
xZ <- rnorm(1000, 23, sqrt(10.02))
mean(xZ)
mean(xA + xB)
var(xZ)
var(xA + xB)
hist(xZ)


###################################################
### code chunk number 111: Documento.Rnw:1237-1238
###################################################
hist(xA + xB)


###################################################
### code chunk number 112: Documento.Rnw:1255-1256
###################################################
rm(list=ls())


###################################################
### code chunk number 113: Documento.Rnw:1284-1288
###################################################
X <- rbinom(1000, 200, 1/10)
hist(X)
mean(X) # E(X)
mean(X)/120 # cota


###################################################
### code chunk number 114: Documento.Rnw:1295-1296
###################################################
pbinom(120, 200, 1/10, lower.tail = FALSE) # P(X > 120)


###################################################
### code chunk number 115: Documento.Rnw:1311-1312
###################################################
sd(X)^2 / (120 - mean(X))^2


###################################################
### code chunk number 116: Documento.Rnw:1335-1336
###################################################
hist(rnorm(1000, 5, 0.1), breaks = seq(from = 4.6, to = 5.4, by = 0.02))


###################################################
### code chunk number 117: Documento.Rnw:1338-1339
###################################################
hist(rnorm(1000, 5, 0.01), breaks = seq(from = 4.6, to = 5.4, by = 0.01))


###################################################
### code chunk number 118: Documento.Rnw:1341-1342
###################################################
hist(rnorm(1000, 5, 0.001), breaks = seq(from = 4.6, to = 5.4, by = 0.01))


###################################################
### code chunk number 119: Documento.Rnw:1363-1369
###################################################
n <- 5
pnorm(.5*sqrt(n)/2) - pnorm(-.5*sqrt(n)/2)
n <- 15
pnorm(.5*sqrt(n)/2) - pnorm(-.5*sqrt(n)/2)
n <- 62
pnorm(.5*sqrt(n)/2) - pnorm(-.5*sqrt(n)/2)


###################################################
### code chunk number 120: Documento.Rnw:1378-1381
###################################################
n <- 320
pnorm(.5*sqrt(n)/2) - pnorm(-.5*sqrt(n)/2)
pcauchy(.5*sqrt(n)/2) - pcauchy(-.5*sqrt(n)/2) # checar xq q raro!!


###################################################
### code chunk number 121: Documento.Rnw:1401-1406
###################################################
n <- 1:100
x <- rnorm(100, 68, 3.5)
s <- cumsum(x)
mu <- s/n
plot(mu, xlab="n", ylim = c(60,70), type="l")


###################################################
### code chunk number 122: Documento.Rnw:1445-1446
###################################################
rm(list=ls())


###################################################
### code chunk number 123: Documento.Rnw:1460-1461
###################################################
library(ggplot2)


###################################################
### code chunk number 124: Documento.Rnw:1466-1467
###################################################
head(mtcars)


###################################################
### code chunk number 125: Documento.Rnw:1472-1475
###################################################
mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5), labels=c("3gears","4gears","5gears")) 
mtcars$am <- factor(mtcars$am,levels=c(0,1), labels=c("Automatic","Manual")) 
mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8), labels=c("4cyl","6cyl","8cyl")) 


###################################################
### code chunk number 126: Documento.Rnw:1481-1482
###################################################
qplot(mpg, data=mtcars, geom="density", fill=gear, alpha=I(.5), main="distribuci\'on de Millaje de Gasolina", xlab="Millas Por gal\'on", ylab="Densidad")


###################################################
### code chunk number 127: Documento.Rnw:1487-1488
###################################################
qplot(hp, mpg, data=mtcars, shape=am, color=am, facets=gear~cyl, size=I(3), xlab="Caballos de Fuerza", ylab="Millas por gal\'on") 


###################################################
### code chunk number 128: Documento.Rnw:1493-1494
###################################################
qplot(wt, mpg, data=mtcars, geom=c("point", "smooth"), method="lm", formula=y~x, color=cyl, main="Regresion de MPG con peso", xlab="Peso", ylab="Millas por gal\'on")


###################################################
### code chunk number 129: Documento.Rnw:1499-1500
###################################################
qplot(gear, mpg, data=mtcars, geom=c("boxplot", "jitter"), fill=gear, main="Millage por Cantidad de Engranjes", xlab="", ylab="Millas per gal\'on")


###################################################
### code chunk number 130: Documento.Rnw:1509-1511
###################################################
x <- runif(10000) # se generan 1000 variables pseudo-aleatorias uniformes
hist(x) # histograma de las variables aleatorias


###################################################
### code chunk number 131: Documento.Rnw:1516-1523
###################################################
m1 <- function(n,x,a,c,M){
  for(i in 1:n){
    x[i+1] <- (a*x[i]+c)%%M
  }
  x <- x/(M-1)
  return(x[-1])
}


###################################################
### code chunk number 132: Documento.Rnw:1528-1530
###################################################
x0 <- m1(50,1e-83,7,7,2^32-1)
plot(c(1:50),x0,type="l")




