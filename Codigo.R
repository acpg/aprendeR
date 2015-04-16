### R code from vignette source 'Documento.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: Documento.Rnw:65-70
###################################################
x <- 2 + 11 # se guarda una operacion en el objeto x
x
y <- x^2 - 1 # se llama a x para crear a y
y
ls() # se listan los objetos en la memoria


###################################################
### code chunk number 2: Documento.Rnw:75-79
###################################################
options(digits = 16)
sqrt(2) # raiz cuadrada de 2
exp(1) # e
pi # pi


###################################################
### code chunk number 3: Documento.Rnw:98-108
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
### code chunk number 4: Documento.Rnw:117-123
###################################################
vec.1 <- c(1, -1, 0, 2, 0, 3)
vec.1 # vector numerico
class(vec.1) # clase de todo tipo de numero
vec.2 <- c('a', 'b', 'c')
vec.2
class(vec.2) # vector de caracteres


###################################################
### code chunk number 5: Documento.Rnw:128-130
###################################################
seq(from = 5, to = 20, by = 3)
7:11


###################################################
### code chunk number 6: Documento.Rnw:135-140
###################################################
mat.1 <- matrix(data = vec.1, ncol = 2, byrow = TRUE)
mat.1
mat.2 <- matrix(vec.1, ncol = 2) # byrow = FALSE
mat.2
class(mat.1) # clase matriz


###################################################
### code chunk number 7: Documento.Rnw:145-148
###################################################
par(mfrow=c(1,2))
plot(mat.1)
plot(vec.1)


###################################################
### code chunk number 8: Documento.Rnw:153-155
###################################################
str(mat.1)
str(vec.1)


###################################################
### code chunk number 9: Documento.Rnw:160-164
###################################################
vec.1
vec.1[2]
vec.1[2:5]
vec.1[-2]


###################################################
### code chunk number 10: Documento.Rnw:169-171
###################################################
mat.1[1,2] # componente fila 1 y columna 2
mat.1[,2] # segunda columna


###################################################
### code chunk number 11: Documento.Rnw:178-179
###################################################
setwd("~/Dropbox/ITAM/SERVICIO SOCIAL")


###################################################
### code chunk number 12: Documento.Rnw:181-182
###################################################
mis.datos <- read.table("CASAS.txt", header=TRUE)


###################################################
### code chunk number 13: Documento.Rnw:187-190
###################################################
head(mis.datos) # muestra 6 observaciones
nrow(mis.datos) # observaciones
ncol(mis.datos) # variables


###################################################
### code chunk number 14: Documento.Rnw:198-201
###################################################
vec.1[c(1,4,5)] # indices que no son consecutivos
a <- c(1,3,2) # tambien se puede en desorden
vec.1[a]


###################################################
### code chunk number 15: Documento.Rnw:206-208
###################################################
a.2 <- vec.1 > 0 # vector con TRUE donde cumple y FALSE donde no 
vec.1[a.2] # los elementos cuyo indice tiene TRUE en a.2


###################################################
### code chunk number 16: Documento.Rnw:213-221
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
### code chunk number 17: Documento.Rnw:226-229
###################################################
indice <- mis.datos[ , 6] > 0 # ST > 0
sub.datos <- mis.datos[indice, ] # nuevo objeto
nrow(sub.datos)


###################################################
### code chunk number 18: Documento.Rnw:234-238
###################################################
impuesto <- mis.datos$TAX # columna con titulo TAX
head(impuesto)
aux <- subset(mis.datos, Price > 60 & ST == 1)
aux


###################################################
### code chunk number 19: Documento.Rnw:247-250
###################################################
sum(vec.1) # suma
max(vec.1) # maximo
mean(vec.1) # promedio


###################################################
### code chunk number 20: Documento.Rnw:257-259
###################################################
sort(vec.1) # ordena
sort(vec.1, decreasing = TRUE) # ordena de mayor a menor


###################################################
### code chunk number 21: Documento.Rnw:264-265
###################################################
sort


###################################################
### code chunk number 22: Documento.Rnw:270-276
###################################################
mayor <- function(x, y=1){
  z <- max(x,y)
  return(z)
}
mayor(5,3)
mayor(-3)


###################################################
### code chunk number 23: Documento.Rnw:286-288
###################################################
library(ggplot2)
ggplot(mis.datos, aes(x=FLR,Price)) + geom_line()


###################################################
### code chunk number 24: Documento.Rnw:293-294
###################################################
ggplot(mis.datos, aes(x=FLR,Price)) + geom_point()


###################################################
### code chunk number 25: Documento.Rnw:317-318
###################################################
rm(list=ls())


###################################################
### code chunk number 26: Documento.Rnw:332-334
###################################################
x <- c(0,1,2,3)
f <- c(1/8, 3/8, 3/8, 1/8)


###################################################
### code chunk number 27: Documento.Rnw:339-341
###################################################
mu <- sum(x * f)
mu


###################################################
### code chunk number 28: Documento.Rnw:346-348
###################################################
sigma2 <- sum((x-mu)^2 * f)
sigma2


###################################################
### code chunk number 29: Documento.Rnw:353-355
###################################################
sigma <- sqrt(sigma2)
sigma


###################################################
### code chunk number 30: Documento.Rnw:360-362
###################################################
F <- cumsum(f)
F


###################################################
### code chunk number 31: Documento.Rnw:367-370
###################################################
library(distrEx)
X <- DiscreteDistribution(supp = 0:3, prob = c(1,3,3,1)/8)
E(X); var(X); sd(X)


###################################################
### code chunk number 32: Documento.Rnw:385-389
###################################################
x <- sample(6, size = 3000, replace = TRUE) # m = 6, 3000 veces
mean(x) # mu = (6 + 1)/2 = 3.5
var(x) # sigma2 = (36 - 1)/12 = 2.92
hist(x) 


###################################################
### code chunk number 33: Documento.Rnw:394-398
###################################################
x <- sample(30:70, size = 270, replace = TRUE)
mean(x) # mu = (70 - 30 + 1)/2 + 30 = 50.5
var(x) # sigma2 = ((70 - 30)^2 + 1)/12 = 133.42
hist(x)


###################################################
### code chunk number 34: Documento.Rnw:414-419
###################################################
dbinom(2, size = 4, prob = 1/2) # funcion de densidad P(X = 2)
pbinom(2, size = 4, prob = 1/2) # funcion de distribucion P(X <= 2)
pbinom(9, size = 12, prob = 1/6) - 
  pbinom(6, size = 12, prob = 1/6) # P(6 <= X < 9)
diff(pbinom(c(6,9), size = 12, prob = 1/6)) # lo mismo


###################################################
### code chunk number 35: Documento.Rnw:424-427
###################################################
library(distr)
X <- Binom(size = 3, prob = 1/2)
X


###################################################
### code chunk number 36: Documento.Rnw:432-434
###################################################
d(X)(1) # funcion de densidad P(X = 1)
p(X)(2) # funcion de distribucion P(X < 2)


###################################################
### code chunk number 37: Documento.Rnw:439-440
###################################################
rbinom(10, size = 4, prob = 1/2)


###################################################
### code chunk number 38: Documento.Rnw:445-462
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
### code chunk number 39: Documento.Rnw:468-471
###################################################
n = 6
p = 0.4
bin(n,p) # llamamos a la funcion definida


###################################################
### code chunk number 40: Documento.Rnw:483-491
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
### code chunk number 41: Documento.Rnw:502-515
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
### code chunk number 42: Documento.Rnw:520-521
###################################################
l <- 3.2; n <- 2; poi(n,l); sum(poi(n,l))


###################################################
### code chunk number 43: Documento.Rnw:530-531
###################################################
set.seed(000118440)


###################################################
### code chunk number 44: Documento.Rnw:533-536
###################################################
n = 10
prob = 0.4
X <- rbinom(1000, n, prob)


###################################################
### code chunk number 45: Documento.Rnw:538-542
###################################################
  prom.parciales <- cumsum(X)/1:1000
  plot(1:1000, prom.parciales, type='l', col='blue')
  title('Media de la Distribucion Binomial')
  abline(h=n*prob, col='red')


###################################################
### code chunk number 46: Documento.Rnw:547-551
###################################################
var.parciales <- vector("numeric",1000)
for (i in 1:1000){
  var.parciales[i] <- sum((X[1:i] - prom.parciales[i])^2)/i 
} 


###################################################
### code chunk number 47: Documento.Rnw:553-556
###################################################
plot(1:1000, var.parciales, type='l', col='blue') 
title('Varianza de la Distribucion Binomial')
abline(h=n*prob*(1 - prob), col='red')


###################################################
### code chunk number 48: Documento.Rnw:558-561
###################################################
# POISSON
lambda <- 1
X <- rpois(1000,lambda)


###################################################
### code chunk number 49: Documento.Rnw:563-567
###################################################
prom.parciales <- cumsum(X)/1:1000
plot(1:1000, prom.parciales, type='l',col='blue')
title('Promedio de la Distribucion Poisson') 
abline(h=lambda, col='red')


###################################################
### code chunk number 50: Documento.Rnw:569-572
###################################################
var.parciales <- vector("numeric",1000)
for (i in 1:1000)
  var.parciales[i] <- sum((X[1:i] - prom.parciales[i])^2)/i 


###################################################
### code chunk number 51: Documento.Rnw:574-577
###################################################
plot(1:1000, var.parciales, type='l', col='blue') 
title('Varianza de la Distribucion Poisson')
abline(h=lambda, col='red')


###################################################
### code chunk number 52: Documento.Rnw:586-588
###################################################
prob <- 75/250000    # estimacion de la probabilidad
X <- sample(c(0,1), 250000, prob=c(1-prob,prob), replace=TRUE)


###################################################
### code chunk number 53: Documento.Rnw:593-598
###################################################
accidentes <- vector("numeric", 1000)
for (j in 1:1000) {
  aseguradora <- sample(X,10000)
  accidentes[j] <- sum(aseguradora) # total de accidentes
}


###################################################
### code chunk number 54: Documento.Rnw:601-604
###################################################
Y <- rpois(1000, lambda = 10000*prob)
table(accidentes)
table(Y)


###################################################
### code chunk number 55: comparacion
###################################################
par(mfrow = c(1,3)) # comando para mostrar las 3 graficas en 1 linea
hist(accidentes, prob=TRUE, main='Histograma de Accidentes')
lines(density(accidentes, adjust=2), col='blue')
hist(Y, prob=TRUE, main='Histograma de Poisson(n*p)')
lines(density(Y, adjust=2), col='red')
plot(density(accidentes, adjust=2), type='l', col='blue', main='Comparacion')
lines(density(Y, adjust=2), col='red')


###################################################
### code chunk number 56: Documento.Rnw:616-623
###################################################
# DISCRETA UNIFORME
n <- 10
X <- sample(n,1000,replace=TRUE)
prom.parciales <- cumsum(X)/1:1000
plot(1:1000,prom.parciales,type='l', col='blue') 
title('Media de la distribucion Discreta Uniforme')
abline(h=(n+1)/2, col='red')


###################################################
### code chunk number 57: Documento.Rnw:625-628
###################################################
var.parciales <- vector("numeric",1000)
for (i in 1:1000)
  var.parciales[i] <- sum((X[1:i]-prom.parciales[i])^2)/i 


###################################################
### code chunk number 58: Documento.Rnw:630-633
###################################################
plot(1:1000, var.parciales,type='l',col='blue') 
title('Varianza de la Distribucion Discreta Uniforme')
abline(h=(n^2-1)/12, col='red') 


###################################################
### code chunk number 59: Documento.Rnw:645-647
###################################################
pgeom(4, prob = 0.812, lower.tail = FALSE) # P(X > x)
1 - pgeom(4, prob = 0.812) # Default: lower.tail = TRUE, P(X <= 4)


###################################################
### code chunk number 60: Documento.Rnw:657-658
###################################################
dnbinom(5, size = 7, prob = 0.5) 


###################################################
### code chunk number 61: Documento.Rnw:671-672
###################################################
3/10*dhyper(0, 4, 10-4, 3) + 7/10*dhyper(0, 1, 10-1, 3)


###################################################
### code chunk number 62: Documento.Rnw:697-698
###################################################
rm(list=ls())


###################################################
### code chunk number 63: Documento.Rnw:728-732
###################################################
# funcion de densidad de probabilidad
f <- function(x) 3 * x^2 
# se integra para sacar la probabilidad deseada
integrate(f, lower = 0.14, upper = 0.71)


###################################################
### code chunk number 64: Documento.Rnw:737-741
###################################################
library(distr)
f <- function(x) 3 * x^2
X <- AbscontDistribution(d = f, low1 = 0, up1 = 1)
p(X)(0.71) - p(X)(0.14)


###################################################
### code chunk number 65: Documento.Rnw:748-750
###################################################
library(distrEx)
E(X); var(X); 3/80 # media, varianza y varianza teorica


###################################################
### code chunk number 66: Documento.Rnw:767-769
###################################################
x <- data.frame(var = runif(1000,-5,5))
ggplot(x, aes(var)) + geom_histogram()


###################################################
### code chunk number 67: Documento.Rnw:776-777
###################################################
x <- runif(1000,0,10); mean(x); var(x) # E(X) = 5 V(X) = 100/12


###################################################
### code chunk number 68: Documento.Rnw:785-787
###################################################
punif(15, min = 0, max = 30) - punif(10, min = 0, max = 30) + 
  punif(30, min = 0, max = 30) - punif(25, min = 0, max = 30)


###################################################
### code chunk number 69: Documento.Rnw:802-803
###################################################
pnorm(2, mean = 3, sd = sqrt(9), lower.tail = FALSE) - pnorm(5, mean = 3, sd = sqrt(9), lower.tail = FALSE)


###################################################
### code chunk number 70: Documento.Rnw:808-809
###################################################
pnorm(9, mean = 3, sd = sqrt(9), lower.tail = FALSE) + pnorm(-3, mean = 3, sd = sqrt(9), lower.tail = TRUE)


###################################################
### code chunk number 71: Documento.Rnw:823-825
###################################################
x <- data.frame(var = rbinom(10, 10, .4))
ggplot(x, aes(var)) + geom_histogram(binwidth=1) + xlim(min(x$var), max(x$var))


###################################################
### code chunk number 72: Documento.Rnw:827-829
###################################################
x <- data.frame(var = rbinom(40, 10, .4))
ggplot(x, aes(var)) + geom_histogram(binwidth=1) + xlim(min(x$var), max(x$var))


###################################################
### code chunk number 73: Documento.Rnw:831-833
###################################################
x <- data.frame(var = rbinom(100, 10, .4))
ggplot(x, aes(var)) + geom_histogram(binwidth=1) + xlim(min(x$var), max(x$var))


###################################################
### code chunk number 74: Documento.Rnw:835-837
###################################################
x <- data.frame(var = rbinom(1000, 10, .4))
ggplot(x, aes(var)) + geom_histogram(binwidth=1) + xlim(min(x$var), max(x$var))


###################################################
### code chunk number 75: Documento.Rnw:852-853
###################################################
pnorm(.16) - pnorm(-.16)


###################################################
### code chunk number 76: Documento.Rnw:866-868
###################################################
x <- data.frame(var = rexp(200))
ggplot(x, aes(var)) + geom_histogram(binwidth=.2, colour = "darkblue", fill = "white") + xlim(min(x$var), max(x$var))


###################################################
### code chunk number 77: Documento.Rnw:870-872
###################################################
x <- data.frame(var = rexp(500, 5))
ggplot(x, aes(var)) + geom_histogram(binwidth=.05, colour = "darkblue", fill = "white") + xlim(min(x$var), max(x$var))


###################################################
### code chunk number 78: Documento.Rnw:877-878
###################################################
x <- rexp(200); mean(x); mean(x)^2; var(x)


###################################################
### code chunk number 79: Documento.Rnw:880-881
###################################################
x <- rexp(500,5); mean(x); mean(x)^2; var(x)


###################################################
### code chunk number 80: Documento.Rnw:891-892
###################################################
pexp(10, rate = 1/10, lower.tail=FALSE)


###################################################
### code chunk number 81: Documento.Rnw:897-898
###################################################
pexp(10, rate = 1/10, lower.tail=FALSE) - pexp(20, rate = 1/10, lower.tail=FALSE)


###################################################
### code chunk number 82: Documento.Rnw:915-917
###################################################
x <- data.frame(var = rgamma(200, 5))
ggplot(x, aes(var)) + geom_histogram(aes(y = ..density..), binwidth=.5, colour = "darkblue", fill = "white") + xlim(min(x$var), max(x$var)) + geom_density()


###################################################
### code chunk number 83: Documento.Rnw:919-921
###################################################
x <- data.frame(var = rgamma(500, 5, 5))
ggplot(x, aes(var)) + geom_histogram(aes(y = ..density..), binwidth=.1, colour = "darkblue", fill = "white") + xlim(min(x$var), max(x$var)) + geom_density()


###################################################
### code chunk number 84: Documento.Rnw:926-930
###################################################
n <- 5
gamma(n); factorial(n-1)
n <- 10
gamma(n); factorial(n-1)


###################################################
### code chunk number 85: Documento.Rnw:935-938
###################################################
x <- data.frame(var = rgamma(500, 1))
ggplot(x, aes(var)) + geom_histogram(aes(y = ..density..), binwidth=.1, colour = "darkblue", fill = "blue", alpha = 0.5) + xlim(min(x$var), max(x$var)) + geom_density(fill = 'yellow', alpha = 0.3) + ggtitle('Distr. Gamma')
mean(x$var); var(x$var)


###################################################
### code chunk number 86: Documento.Rnw:940-943
###################################################
x <- data.frame(var = rexp(500))
ggplot(x, aes(var)) + geom_histogram(aes(y = ..density..), binwidth=.1, colour = "darkblue", fill = "blue", alpha = 0.5) + xlim(min(x$var), max(x$var)) + geom_density(fill = 'yellow', alpha = 0.3) + ggtitle('Distr. Exponencial')
mean(x$var); var(x$var)


###################################################
### code chunk number 87: Documento.Rnw:1041-1042
###################################################
rm(list=ls())


###################################################
### code chunk number 88: Documento.Rnw:1075-1082
###################################################
masa <- function(i,j){
  if(i + j < 4)
    m <- choose(3,i)*choose(5,3-i-j)*choose(4,j)/choose(12,3)
  else
    m <- 0
  return(m)
}


###################################################
### code chunk number 89: Documento.Rnw:1087-1095
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
### code chunk number 90: Documento.Rnw:1100-1101
###################################################
rowSums(m)


###################################################
### code chunk number 91: Documento.Rnw:1106-1107
###################################################
colSums(m)


###################################################
### code chunk number 92: Documento.Rnw:1132-1134
###################################################
x <- runif(10000, min=-1, max=1)
y <- runif(10000, min=-1, max=1)


###################################################
### code chunk number 93: Documento.Rnw:1139-1153
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
### code chunk number 94: Documento.Rnw:1159-1160
###################################################
4 * circulo/(circulo+cuadrado)


###################################################
### code chunk number 95: Documento.Rnw:1176-1187
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
ggplot(data.frame(var = xx), aes(var)) + geom_histogram(aes(y = ..density..), binwidth=4, colour = "darkblue", fill = "blue", alpha = 0.5) + xlim(min(xx), max(xx)) + geom_density(fill = 'yellow', alpha = 0.3) + ggtitle('Variables Exponenciales')


###################################################
### code chunk number 96: Documento.Rnw:1189-1191
###################################################
x <- data.frame(var = rgamma(m,n,lambda))
ggplot(x, aes(var)) + geom_histogram(aes(y = ..density..), binwidth=4, colour = "darkblue", fill = "blue", alpha = 0.5) + xlim(min(x$var), max(x$var)) + geom_density(fill = 'yellow', alpha = 0.3) + ggtitle('Distr. Gamma')


###################################################
### code chunk number 97: Documento.Rnw:1196-1206
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
ggplot(data.frame(var = xx), aes(var)) + geom_histogram(aes(y = ..density..), binwidth=3, colour = "darkblue", fill = "blue", alpha = 0.5) + xlim(min(xx), max(xx)) + geom_density(fill = 'yellow', alpha = 0.3) + ggtitle('Variables Normales')


###################################################
### code chunk number 98: Documento.Rnw:1208-1210
###################################################
x <- data.frame(var = rgamma(m,n/2,1/2))
ggplot(x, aes(var)) + geom_histogram(aes(y = ..density..), binwidth=3, colour = "darkblue", fill = "blue", alpha = 0.5) + xlim(min(x$var), max(x$var)) + geom_density(fill = 'yellow', alpha = 0.3) + ggtitle('Distr. Gamma')


###################################################
### code chunk number 99: Documento.Rnw:1223-1226
###################################################
xA <- rbinom(1000, 26, 0.4)
mean(xA); var(xA)
hist(xA)


###################################################
### code chunk number 100: Documento.Rnw:1228-1231
###################################################
xB <- rbinom(1000, 18, 0.7)
mean(xB); var(xB)
hist(xB)


###################################################
### code chunk number 101: Documento.Rnw:1236-1239
###################################################
xA <- rnorm(1000, 10.4, sqrt(6.24))
mean(xA); var(xA)
hist(xA)


###################################################
### code chunk number 102: Documento.Rnw:1241-1244
###################################################
xB <- rnorm(1000, 12.6, sqrt(3.78))
mean(xB); var(xB)
hist(xB)


###################################################
### code chunk number 103: Documento.Rnw:1249-1253
###################################################
xZ <- rnorm(1000, 23, sqrt(10.02))
mean(xZ); mean(xA + xB)
var(xZ); var(xA + xB)
hist(xZ)


###################################################
### code chunk number 104: Documento.Rnw:1255-1256
###################################################
hist(xA + xB)


###################################################
### code chunk number 105: Documento.Rnw:1273-1274
###################################################
rm(list=ls())


###################################################
### code chunk number 106: Documento.Rnw:1302-1306
###################################################
X <- rbinom(1000, 200, 1/10)
hist(X)
mean(X) # E(X)
mean(X)/120 # cota


###################################################
### code chunk number 107: Documento.Rnw:1313-1314
###################################################
pbinom(120, 200, 1/10, lower.tail = FALSE) # P(X > 120)


###################################################
### code chunk number 108: Documento.Rnw:1329-1330
###################################################
sd(X)^2 / (120 - mean(X))^2


###################################################
### code chunk number 109: Documento.Rnw:1353-1354
###################################################
hist(rnorm(1000, 5, 0.1), breaks = seq(from = 4.6, to = 5.4, by = 0.02))


###################################################
### code chunk number 110: Documento.Rnw:1356-1357
###################################################
hist(rnorm(1000, 5, 0.01), breaks = seq(from = 4.6, to = 5.4, by = 0.01))


###################################################
### code chunk number 111: Documento.Rnw:1359-1360
###################################################
hist(rnorm(1000, 5, 0.001), breaks = seq(from = 4.6, to = 5.4, by = 0.01))


###################################################
### code chunk number 112: Documento.Rnw:1381-1387
###################################################
n <- 5
pnorm(.5*sqrt(n)/2) - pnorm(-.5*sqrt(n)/2)
n <- 15
pnorm(.5*sqrt(n)/2) - pnorm(-.5*sqrt(n)/2)
n <- 62
pnorm(.5*sqrt(n)/2) - pnorm(-.5*sqrt(n)/2)


###################################################
### code chunk number 113: Documento.Rnw:1396-1399
###################################################
n <- 320
pnorm(.5*sqrt(n)/2) - pnorm(-.5*sqrt(n)/2)
pcauchy(.5*sqrt(n)/2) - pcauchy(-.5*sqrt(n)/2) # checar xq q raro!!


###################################################
### code chunk number 114: Documento.Rnw:1419-1424
###################################################
n <- 1:100
x <- rnorm(100, 68, 3.5)
s <- cumsum(x)
mu <- s/n
plot(mu, xlab="n", ylim = c(60,70), type="l")


###################################################
### code chunk number 115: Documento.Rnw:1463-1464
###################################################
rm(list=ls())


###################################################
### code chunk number 116: Documento.Rnw:1478-1479
###################################################
library(ggplot2)


###################################################
### code chunk number 117: Documento.Rnw:1484-1485
###################################################
head(mtcars)


###################################################
### code chunk number 118: Documento.Rnw:1490-1493
###################################################
mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5), labels=c("3gears","4gears","5gears")) 
mtcars$am <- factor(mtcars$am,levels=c(0,1), labels=c("Automatic","Manual")) 
mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8), labels=c("4cyl","6cyl","8cyl")) 


###################################################
### code chunk number 119: Documento.Rnw:1499-1500
###################################################
qplot(mpg, data=mtcars, geom="density", fill=gear, alpha=I(.5), main="distribuci\'on de Millaje de Gasolina", xlab="Millas Por gal\'on", ylab="Densidad")


###################################################
### code chunk number 120: Documento.Rnw:1505-1506
###################################################
qplot(hp, mpg, data=mtcars, shape=am, color=am, facets=gear~cyl, size=I(3), xlab="Caballos de Fuerza", ylab="Millas por gal\'on") 


###################################################
### code chunk number 121: Documento.Rnw:1511-1512
###################################################
qplot(wt, mpg, data=mtcars, geom=c("point", "smooth"), method="lm", formula=y~x, color=cyl, main="Regresion de MPG con peso", xlab="Peso", ylab="Millas por gal\'on")


###################################################
### code chunk number 122: Documento.Rnw:1517-1518
###################################################
qplot(gear, mpg, data=mtcars, geom=c("boxplot", "jitter"), fill=gear, main="Millage por Cantidad de Engranjes", xlab="", ylab="Millas per gal\'on")


###################################################
### code chunk number 123: Documento.Rnw:1527-1529
###################################################
x <- runif(10000) # se generan 1000 variables pseudo-aleatorias uniformes
hist(x) # histograma de las variables aleatorias


###################################################
### code chunk number 124: Documento.Rnw:1534-1541
###################################################
m1 <- function(n,x,a,c,M){
  for(i in 1:n){
    x[i+1] <- (a*x[i]+c)%%M
  }
  x <- x/(M-1)
  return(x[-1])
}


###################################################
### code chunk number 125: Documento.Rnw:1546-1548
###################################################
x0 <- m1(50,1e-83,7,7,2^32-1)
plot(c(1:50),x0,type="l")


