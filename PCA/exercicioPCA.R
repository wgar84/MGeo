### Analise de Componentes Principais (plotTangentSpace)

### carregando geomorph
require(geomorph)

### Primeira coisa a se fazer: olhar a ajuda da funcao plotTangentSpace
?plotTangentSpace 

### Vamos usar o exemplo com a salamandra do genero Plethodon

### para detalhes, veja:
?plethodon

data(plethodon) # carrega os dados
plethodon # olhe o conteudo do objeto plethodon  
names(plethodon) # olhe os nomes dentro do objeto plethodon
class(plethodon) # mostra a classe a que pertence o objeto plethodon 

plethodon.gpa <- gpagen(A = plethodon$land) # aplica a funcao GPA - alinhamento

plethodon.ref <- mshape(plethodon.gpa$coords) # estima a forma media para um conjunto de especimes alinhadas

# x11() # abre a janela para visualizacao grafica no mac

gp <- as.factor(paste(plethodon$species, plethodon$site)) # o grupo devera ser um fator
plethodon.plot <- plotTangentSpace(plethodon.gpa$coords, groups = gp, warpgrids=T, verbose=T) # visualizacao dos grupos no PC1 e PC2
plethodon.plot # olhe o conteudo do objeto plethodon
names (plethodon.plot) # olhe os nomes dentro do objeto plethodon.plot
class (plethodon.plot) # mostra a classe a que pertence o objeto plethodon.plot


### Perguntas:

# 1- O que significam os argumentos warpgrids e verbose na funcao plotTangentSpace acima? 
# 2- Como podemos chamar somente os scores dos PCs?
# 3- Como podemos visualizar somente os valores minimo e maximo das formas nos dois PCs plotados no grafico?
# 4- No $pc.summary, o que significa a proporcao de variancia nos dois primeiros componentes principais?
# 5- No $pc.scores, o que significam os scores nos componentes principais? 
# 6- Olhando a tabelha fornecida pelo $pc.summary, como poderiamos obter os autovalores?


### Se quisermos trocar as cores dos grupos no grafico podemos fazer o seguinte:

col.gp<-c(rep("black",10),rep("red",10),rep("yellow",10),rep("orange",10)) # must not be a factor

plotTangentSpace(plethodon.gpa$coords, groups = col.gp, warpgrids=T, verbose=T)


### Para visualizar melhor a variação associada ao PC1 e o PC2, vamos usar a funcao plotRefToTarget

### Vamos olhar a ajuda da funcao
?plotRefToTarget 

par (mfrow = c(2, 2)) # vamos plotar PC1 na primeira linha, PC2 na segunda

plotRefToTarget(plethodon.ref, plethodon.plot$pc.shapes$PC1min, links = plethodon$links)
plotRefToTarget(plethodon.ref, plethodon.plot$pc.shapes$PC1max, links = plethodon$links)

plotRefToTarget(plethodon.ref, plethodon.plot$pc.shapes$PC2min, links = plethodon$links)
plotRefToTarget(plethodon.ref, plethodon.plot$pc.shapes$PC2max, links = plethodon$links)


### Perguntas:

# 1- A ordenacao revelou padroes convenientes para abordarmos questoes biologicas? 
# 2- Se sim, entao qual o significado biologico que podemos tirar da visualizacao desses resultados graficos?

#IMPORTANTE: Lembrem-se que o PCA e usado para simplificar as descricoes de variacoes entre individuos! NAO PARA TESTAR HIPOTESES!


### Vamos explorar diferentes formas de visualizar os dados:

#x11() # abra janela para visualizacao grafica no mac

plotRefToTarget(plethodon.ref, plethodon.gpa$coords[,,39])

plotRefToTarget(plethodon.ref, plethodon.plot$pc.shapes$PC2min)

plotRefToTarget(plethodon.ref,plethodon.gpa$coords[,,39],mag=5) #mag: magnifica a diferenca por 3x 

plotRefToTarget(plethodon.ref,plethodon.gpa$coords[,,39],method="vector")

plotRefToTarget(plethodon.ref,plethodon.gpa$coords[,,39],method="points")

### Perguntas:

# 1- O que significa plethodon.gpa$coords[,,39]? 
# 2- O que cada grafico nos mostrou?

