### Comandos básicos no R voltados ao curso

### A primeira coisa a se fazer é criar uma pasta para você armazenar todos os documentos
# usados e gerados ao longo deste curso (incluindo este script) 

### depois de criar a pasta para o Curso, faca o seguinte:

getwd() # verifique o diretorio de trabalho atual

setwd() # se necessario, mude o diretorio de trabalho (para trabalhar dentro da sua pasta do curso)  

getwd() # verifique 

### Voce tambem tem a opcao de fazer isso utilizando a janela no canto inferior direito do RStudio,
# da seguinte forma: selecione a pasta que deseja, e na opcao More selecione Set As Working Directory

### Instale e carregue alguns pacotes

install.packages ("geomorph") # instalando
isntall.packages ("ggplot2") # instalando

require (geomorph) # carregando
require (ggplot2) # carregando

??geomorph # familiarize-se com o pacote

### Algumas opercoes aritimeticas basicas

4 + 9
4 - 5
4 * 5
4 / 5
4^5
(4 + 5 ) * 7 - (36/18)^3
sqrt(9) # raiz quadrada
log( 10 ) # logaritmo natural ou neperiano
log( 10, base = 10) # logaritmo base 10
log10(10) # também logaritmo de base 10
exp (1) # exponencial

### Criação de Vetores
### Para criar um vetor, podemos usar a função c (c = colar, concatenar). Essa função
# simplesmente junta todos os argumentos dados a ela, formando um vetor: 

vector.a <- c(1, 10, 3.4, 16, 23, 91, 46 )
vector.b <- c(1, 10, 3.4, pi, pi/4, exp(-1), log( 2.23 ), sin(pi/7) )
vector.c <- c(6.1, 7.5, 7.0, 8.8, 9.1, 6.3)  
### Voce criou objetos e eles estao no Global Environment do RStudio

### Vetores: Operações Estatísticas

mean (vector.a)
var(vector.b)
max(vector.c)
sd(vector.a)
summary(vector.a)

### Use a funca help para pesquisar sobre as operacoes anteriores

?mean
help(mean)
?var
help(sd)
?summary
help(summary)

### Vamos trabalhar com os Tipos de Objetos no R

### Vetor:

meu.vetor <- c(10.5,11.3,12.4,5.7)
meu.vetor

### Matriz:

minha.matriz <- matrix(data=1:12,nrow=3,ncol=4)
minha.matriz

?matrix # olhe o help da funcao matrix
args(matrix) # olhe os argumentos da funcao matrix

### Array:

my.array <- array(1:36, dim=c(3,4,3))
my.array

### Data frame:

nomes <- c("Didi","Dedé","Mussum","Zacarias")
ano.nasc <- c(1936,1936,1941,1934)
vive <- c("V","V","F","F")
trapalhoes <- data.frame(nomes,ano.nasc,vive)
trapalhoes

### Lista:

minha.lista <- list(um.vetor=1:5, uma.matriz=matrix(1:6,2,3), um.dframe=data.frame(seculo=c("XIX","XX","XXI"),inicio=c(1801,1901,2001)))
minha.lista

?list

### Funcoes basicas no R

class(minha.lista) # a classe do objeto
class(trapalhoes) # a classe do objeto
class(my.array) # a classe do objeto
class(minha.matriz) # a classe do objeto

attributes(minha.lista) # atributo do objeto
attributes(trapalhoes) # atributo do objeto
attributes(my.array) # atributo do objeto
attributes(minha.matriz) # atributo do objeto

dim(my.array) # dimensões do objeto

nrow(minha.matriz) # numero de linhas 
ncol(minha.matriz) # número de colunas 

### Vamos trabalhar com um objeto do pacote geomorph
### Ja instalamos e carregamos esse pacote no comeco de script

data(plethodon) # carrega os dados
plethodon # olhe o conteudo do objeto plethodon  
names(plethodon) # olhe os nomes dentro do objeto plethodon
class(plethodon) # mostra a classe a que pertence o objeto plethodon 

## Voce pode chamar o conteudo de uma lista da seguinte maneira

plethodon$land
plethodon$links
plethodon$species
plethodon$site

## Por fim, escolha uma funcao quaquer no pacote geomorph para dar uma olhada

??geomorph # clique no Index no final da pagina e depois escolha a funcao que deseja olhar




