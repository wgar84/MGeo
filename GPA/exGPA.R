### carregando geomorph
require (geomorph)

## Primeira coisa a se fazer: olhar a ajuda da funcao gpagen 
?gpagen

### Exemplo 1: Generalized Procrustes Analysis GPA (gpagen) = USANDO PONTOS FIXOS SOMENTE

### Vamos usar o exemplo com a salamandra do genero Plethodon

### para detalhes, veja:
?plethodon

data(plethodon) # carrega os dados
plethodon.gpa <- gpagen(A = plethodon$land) #aplica a funcao gpagen nas coordenadas dos dados 

### A funcao retorna uma lista contendo as coordenadas de Procrustes
### ($coord), os tamanhos dos centroides ($Csize). Com a opcao
### ShowPlot=TRUE na funcao, obtemos um grafico onde os individuos
### estao em cinza ao redor da forma media em preto.

class(plethodon.gpa) #investigue a classe a qual pertence seu objeto plethodon.gpa
names(plethodon.gpa) #investigue o que tem dentro da sua lista

### investigue os objetos contidos na lista

plethodon.gpa$coord ### array
plethodon.gpa$Csize ### vetor


### Exemplo 2: Generalized Procrustes Analysis GPA (gpagen) = USANDO
### PONTOS FIXOS E SEMILANDMARKS NAS CURVAS

### para detalhes:
?hummingbirds


### Agora vamos usar o exemplo com os beija-flores 
data (hummingbirds) #carrega os dados
class (hummingbirds) #hummingbirds e uma lista
names (hummingbirds) # uma lista que contem land e curvepts 

hummingbirds$land ### landmarks

hummingbirds$curvepts
### matriz que mostra quais pontos sao semilandmarks (coluna do meio)
### e quais direcoes eles deslizam (coluna 1 vs. 3) - vocês já fizeram
### uma matriz desse tipo na aula sobre landmarks

### Agora vamos usar a Distancia de Procrustes para deslizar

### Lembre-se de sempre visitar os argumentos da funcao
args(gpagen)
### ja que estamos falando de semilandmarks temos que dar uma
### informacao para curvas na funcao

### vamos acomodar o output gráfico das duas GPAs
### em uma janela gráfica só
par (mfrow = c(1, 2))

beija.gpa.procD <- gpagen(A = hummingbirds$land,
                          curves = hummingbirds$curvepts, ProcD = TRUE)

### aplica a funcao gpagen nas coordenadas dos dados, otimizando o
### posicionamento dos semilandmarks

beija.gpa.procD #a funcao retorna uma lista contendo as corrdenadas de
                #Procrustes ($coord), os tamanhos dos centroides
                #($Csize). Com a opcao ShowPlot=TRUE na funcao,
                #obtemos um grafico onde os individuos estao em cinza
                #ao redor da media da forma em preto.

### Vamos usar energia de dobramento para otimizar a posição dos semilandmarks
### Olhem os argumentos da funcao novamente e procurem pelo ProcD

beija.gpa.bend <- gpagen(A = hummingbirds$land,
                         curves = hummingbirds$curvepts, ProcD=FALSE) 

### O que mudou entre o gráfico gerado pelas duas GPAs? Como
### interpretamos esse resultado gráfico?


