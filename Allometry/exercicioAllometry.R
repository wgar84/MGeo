### Alometria

### carregando geomorph
require(geomorph)

### Vamos usar o exemplo com a base de dados ratland

### para detalhes, veja:
?ratland

data (ratland) # carrega os dados
ratland # olhe o conteudo do objeto ratland  
class(ratland) # olhe a classe do objeto ratland
dim(ratland)  # olhe a dimensao do objeto ratland

### Exemplo de uma regressao alometrica, y~x (variaveis continuas) 

### O primeiro passo e alinhar os landmarks por GPA
rat.gpa<-gpagen(ratland) # aplica a funcao GPA na base de dados ratland

### Vamos olhar a ajuda da funcao procD.lm
?procD.lm

### A funcao procD.lm executa uma Procrustes ANOVA com procedimentos de permutacao para avaliar
# hipoteses estatisticas que descrevem padroes de variacao e covariacao de forma para um conjunto
# de coordenadas de Procrustes alinhadas

### two.d.array e usada para obter uma matriz bidimensional a partir de um array 3D

### Este exemplo testa a associacao entre o tamanho do centroide e a forma

rat.regress <- procD.lm(two.d.array(rat.gpa$coords)~rat.gpa$Csize,iter=99) 
rat.regress

### Perguntas:

# 1- Como voce interpreta os resultados apresentados na tabela?
# 2- A associacao entre as variaveis  testadas e significativa?


### Exemplo grafico de alometria

### Podemos examinar a variacao alometrica da forma usando plotAllometry(), com a base de dados ratland 

### O primeiro passo e alinhar os landmarks por GPA. Ja fizemos isso e criamos o objeto rat.gpa 
# que podemos usar para aplicar a funcao plotAllometry() 

### Vamos olhar a ajuda da funcao plotAllometry()
?plotAllometry

# x11() # abre a janela para visualizacao grafica no mac

rat.CAC <- plotAllometry(rat.gpa$coords,rat.gpa$Csize,method="CAC", iter=5)
rat.CAC

### Pergunta:

# 1- O que o metodo CAC significa?

### Agora vamos usar o metodo RegScore
### Com a selecao desse metodo, a funcao calcula scores de forma a partir da regressao da forma pelo
# tamanho, e plota isso pelo tamanho. 

# x11() # abre a janela para visualizacao grafica no mac

rat.RegScore <- plotAllometry(rat.gpa$coords,rat.gpa$Csize,method="RegScore", iter=5)
rat.RegScore

### Agora vamos usar o metodo PredLine
### Com a selecao desse metodo, a função calcula os valores previstos a partir de uma regressão da forma 
# pelo tamanho, e plota o primeiro componente principal dos valores previstos versus tamanho (o grafico mostra 
# uma tendência alométrica)

# x11() # abre a janela para visualizacao grafica no mac

rat.PredLine <- plotAllometry(rat.gpa$coords,rat.gpa$Csize,method="PredLine", iter=5)
rat.PredLine

### Sugetoes:

# 1- Experimente usar verbose=TRUE 
# Este argumento verbose = TRUE ira retornar uma lista contendo uma tabela de ANOVA ($ProcDist.lm),
# uma matriz de scores de forma alometrica ($allom.score), uma matriz do tamanho do centroide em 
# log ($LogCsize), uma matriz da forma predita para a regressao ($pred.shape). Esta ultima pode ser usada 
# na funcao plotRefToTarget() 

### Resumindo...

# A funcao plotAllometry mostra a variacao de forma pelo tamanho do centroide (em escala logaritimica), 
# para estudos que abordam questoes alometricas. E tambem possivel usar esta funcao para visualizar mudancas na forma 
# associada a quaisquer outras variaveis continuas (ex. comprimento do corpo, precipitacao). Quando as 
# variaveis nao estiverem em escala logaritimica, basta colocar como (exp(x)). 
