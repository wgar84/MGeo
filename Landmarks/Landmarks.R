# setwd() direcionar para o diretório de trabalho atual.
require (geomorph) ### carregar o pacote.

## Exercício: Importar as imagens a partir do arquivo de dados e digitalizar 
# os pontos de referencia nas imagens.

## Primeiro passo:

?digitize2d #abrir a ajuda (help) desta função. Vamos olhar os argumentos da função.

## exercicio opcional: escreva a lista de imagens que serão digitalizadas
## usando c() ou list.files.

## Vídeo demonstrativo:

## Segundo passo:
# Digitalizar as mandibulas. Antes crie um objeto que contenha as imagens que serão
# trabalhas

jpgfiles <- dir (pattern = '.jpg') ### lista os arquivos .jpg no diretório. 
                                   #Dica: veja os argumentos da função dir em ajuda.
jpgfiles ## abra o objeto criado.

### Agora, veja a figura da pasta XXX e digitalize os marcadores nas mandibulas. Primeiro, a escala
# e em seguida os marcadores.
# Lembre-se que estamos marcando tanto landmarks como semilandmarks.
# Dica: use os comandos quartz(), X11(), windows() para mac, linux e windows respectivamente. 
# Esses comandos abrem um dispositivo gráfico para visualização das imagens.

digitize2d (jpgfiles, 44, scale = rep(10, length (jpgfiles2)),
           tpsfile = 'exercicio.tps', verbose = FALSE)

# Pergunta: é necessário digitalizar todos os espécimes do seu filelist criado de uma vez?

### Terceiro passo:
# Depois de finalizar a digitalização, as coordenadas dos marcadores são gravadas em um arquivo TPS.
#***** Pedir para o Pato exemplo de TPS file para mostrar.
# Utilizaremos a função "readland.tps" para a leitura do arquivo tps que foi criado ao digitalizar
# os marcadores (landmarks) nas mandíbulas.
#dica: ? readland.tps

exercicio <- readland.tps (file = 'exercicio.tps') ### criando um objeto.

# Pergunta: abra o objeto criado. Qual é a classe desse objeto?

### Quarto passo:
# Vamos definir os semilandmarks!
# Para cada semilandmark definido aqui, marco três pontos: antes-slider-depois.

# Exercício opcional: explique a indexação do objeto exercício abaixo. 

slm <- define.sliders.2d (exercicio [, , 1], 31)

slm # verifique o objeto criado.

GPA <- gpagen(exercicio.semi, ShowPlot = TRUE, curves = slm)
