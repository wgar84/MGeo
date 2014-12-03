require (geomorph)
### se você ainda não possui o ggplot2, instale-o
install.packages('ggplot2')
require (ggplot2)

options(contrasts = c('contr.sum', 'contr.poly'))

data(plethodon)
str(plethodon)

### Neste exercício, vamos no afastar um pouco das funções padrão do
### geomorph, só pra ilustrar um pouco mais conceitos no R

### Mas, nunca podemos escapar da GPA
plethodon.gpa <- gpagen(plethodon$land, ShowPlot = TRUE)
plethodon.tan <- two.d.array(plethodon.gpa $ coords)

### PCA
plethodon.pca <- prcomp(plethodon.tan, retx = TRUE)

### Vamos plotar essa PCA usando o ggplot2. Para isso, precisamos construir um data.frame
plethodon.df <- data.frame (plethodon$species, plethodon$site, plethodon.pca $ x [, 1:2])

head(plethodon.df)
colnames(plethodon.df) <- c('species', 'site', 'PC1', 'PC2')

plethodon.pcplot <-
  ggplot (plethodon.df) +
  geom_point(aes (x = PC1, y = PC2, color = species, shape = site), size = 5) +
  theme_minimal()

### Observe o gráfico gerado
plethodon.pcplot

### Por que usar o ggplot2? Basicamente, porque, com menos código, o
### gráfico resultante é mais informativo. No entanto, a sintaxe é um
### tanto quanto estranha, e demora um tempo pra se acostumar com ela

### O gráfico indica um padrão de interação entre o efeito de
### localidade e a variação interespecífica.

### Vamos testar essas diferença usando uma ANOVA de Procrustes
plethodon.procANOVA <- procD.lm(plethodon.tan ~ plethodon $ site * plethodon $ species)

### Observe os resultados
plethodon.procANOVA

### podemos observar as diferenças usando grades de deformação
plethodon.means <- by(plethodon.tan, list (plethodon$site, plethodon$species), colMeans)

par(mfrow = c(2, 2))
plotRefToTarget(matrix (plethodon.means [['Allo', 'Jord']], nrow = 12, byrow = T),
                matrix (plethodon.means [['Symp', 'Jord']], nrow = 12, byrow = T),
                links = plethodon $ links)
mtext('1. Plethodon jordani Alopatria para Simpatria')

plotRefToTarget(matrix (plethodon.means [['Allo', 'Teyah']], nrow = 12, byrow = T),
                matrix (plethodon.means [['Symp', 'Teyah']], nrow = 12, byrow = T),
                links = plethodon $ links)
mtext('2. Plethodon teyahalee Alopatria para Simpatria')

plotRefToTarget(matrix (plethodon.means [['Allo', 'Jord']], nrow = 12, byrow = T),
                matrix (plethodon.means [['Allo', 'Teyah']], nrow = 12, byrow = T),
                links = plethodon $ links)
mtext('3. P. jordani para P. teyahalee em Alopatria')

plotRefToTarget(matrix (plethodon.means [['Symp', 'Jord']], nrow = 12, byrow = T),
                matrix (plethodon.means [['Symp', 'Teyah']], nrow = 12, byrow = T),
                links = plethodon $ links)
mtext('4. P. jordani para P. teyahalee em Simpatria')

### Neste caso, estamos observando as grades de deformação referentes
### à transformação das duas espécies de Plethodon em diferentes situações

### podemos também testar estas diferenças utilizando uma MANOVA
### tradicional sobre os 2 PCs
plethodon.pcANOVA <- lm(cbind(PC1, PC2) ~ site * species, data = plethodon.df)

anova(plethodon.pcANOVA)
