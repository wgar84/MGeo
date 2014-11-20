### carregando geomorph
require (geomorph)

## Primeira coisa a se fazer: olhar a ajuda da funcao gpagen 
?gpagen

### Exemplo 1: Generalized Procrustes Analysis GPA (gpagen) = USANDO PONTOS FIXOS SOMENTE

### Vamos usar o exemplo com a salamandra do genero Plethodon

### para detalhes, veja:
?plethodon

data(plethodon) #carrega os dados
plethodon.gpa <- gpagen(A = plethodon$land) #aplica a funcao gpagen nas coordenadas dos dados 

### A funcao retorna uma lista contendo as coordenadas de Procrustes ($coord), os tamanhos dos centroides
### ($Csize). Com a opcao ShowPlot=TRUE na funcao, obtemos um grafico onde os individuos estao em cinza ao 
### redor da forma media em preto.

class(plethodon.gpa) #investigue a classe a qual pertence seu objeto plethodon.gpa
names(plethodon.gpa) #investigue o que tem dentro da sua lista

### investigue os objetos contidos na lista

plethodon.gpa$coord ### array
plethodon.gpa$Csize ### vetor


### Exemplo 2: Generalized Procrustes Analysis GPA (gpagen) = USANDO PONTOS FIXOS E SEMILANDMARKS NAS CURVAS

### para detalhes:
?hummingbirds ### PEGAR ESSE ARTIGO


### Agora vamos usar o exemplo com os beija-flores 
data (hummingbirds) #carrega os dados
class (hummingbirds) #hummingbirds e uma lista
names (hummingbirds) # uma lista que contem land e curvepts 

hummingbirds$land ### landmarks

hummingbirds$curvepts
### matriz que mostra quais pontos sao semilandmarks (coluna do meio) e quais direcoes eles
### deslizam (coluna 1 vs. 3) - vocês já fizeram uma matriz desse tipo na aula sobre landmarks

### Agora vamos usar a Distancia de Procrustes para deslizar

### Lembre-se de sempre visitar os argumentos da funcao
args(gpagen)
### ja que estamos falando de semilandmarks temos que dar uma informacao para curvas na funcao

beija.gpa.procD <- gpagen(A = hummingbirds$land, curves = hummingbirds$curvepts, ProcD = TRUE)

### aplica a funcao gpagen nas coordenadas dos dados, otimizando o posicionamento dos semilandmarks
beija.gpa.procD #a funcao retorna uma lista contendo as corrdenadas de Procrustes ($coord), os tamanhos dos centroides
#($Csize). Com a opcao ShowPlot=TRUE na funcao, obtemos um grafico onde os individuos estao em cinza ao 
#redor  da media  da forma em preto.

#Vamos usar bending energy for sliding 
#Olhem os argumentos da funcao novamente e procurem pelo ProcD
beija.gpa.bend <- gpagen(A = hummingbirds$land, curves = hummingbirds$curvepts, ProcD=FALSE) 
#O que mudou entre o grafico gerado por Z e W??? Como interpretamos esse resultado gr??fico?

#Agora utilizaremos um exemplo com pontos fixos, curvas e superficies 
##Atencao Pato e Tafs precisamos ter falado sobre os conceitos disso antes do exercicio
#Para isso usaremos os dados sobre um molusco bivalve (Scallops)
data(scallops)
class(scallops) #scallops e uma lista
names (scallops) # uma lista que contem coorddata, curvslide, surfslide, ind e land.pairs
scallops$curvslide #matriz que mostra quais pontos sao semilandmarks (coluna do meio) e quais dire????es eles
#deslizam (coluna 1 vs. 3)
scallops$surfslide #matriz (1 coluna) que define quais pontos sao semilandmarks para deslizar sobre a superficie
#Vamos usar Distancia de Procrustes para deslizar
scallops.gpa <- gpagen (A=scallops$coorddata, curves=scallops$curvslide, surfaces=scallops$surfslide)
# veja a definicao dos argumentos curves e surfaces no help
#Interprete o grafico gerado em 3D

#Atencao! Para todas as analises subsequentes Y$coords (plethodon), Z$coords (hummingbirds), 
#S$coords (scallops) devem ser usados

