# Curso Básico de Morfometria Geométrica

Este curso intenciona oferecer uma introdução básica aos conceitos e
técnicas de Morfometria Geométrica, de maneira a instrumentar o aluno
na execução de projetos vinculados à esta abordagem, desde a coleta de
dados até as análises estatísticas e apresentação de resultados.

Devido ao caráter teórico-prático do curso, uma série de exercícios
serão propostos. Todos estes exercícios são propostos dentro do
ambiente de programação estatística **R**, que possui todas as
ferramentas necessárias para conduzir um projeto baseado em
Morfometria Geométrica.

**Responsáveis**
- Bárbara Costa (<tafinha@gmail.com>)
- Daniela Rossoni (<daniela.rossoni@gmail.com>)
- Guilherme Garcia (<wgar@usp.br>)

## Preliminares

### R

Inicialmente, você deve instalar o **R** no seu computador. Você pode
encontrá-lo no sítio http://www.r-project.org, e lá existem instruções
(em inglês) para instalá-lo em vários sistemas operacionais
diferentes. Em suma, vá a um dos espelhos do *Comprehensive R Archive
Network* (CRAN), por exemplo http://brieger.esalq.usp.br/CRAN/, e siga
os links de download para Windows, MAC OS ou Linux e instale o pacote
referente ao seu sistema operacional. Usuários de Linux provavelmente
possuem um gerenciador de pacotes instalado em seu sistema, como por
exemplo *apt* ou *yum*, que podem também ser utilizados para a
instalação.

A instalação básica do R no Windows ou MAC OS providencia uma
interface básica para execução de rotinas; no entanto, recomendamos a
instalação do **R Studio**, uma interface bastante intuitiva para
utilizarmos o R. Esta interface pode ser encontrada no sítio
http://www.rstudio.com para Windows, MAC OS ou Linux.

O curso foi pensado para pessoas que não são familiarizadas com o R;
não esperamos que você seja, a princípio, capaz de escrever rotinas na
linguagem. Os exercícios propostos se baseiam em rotinas prontas, uma
para cada aula, de modo que estes exercícios consistem em executar
estas rotinas, observar e entender o que foi feito, e responder
algumas perguntas. Assim, estes exercícios servem como ponto de
partida para você começar a entender a linguagem. Durante o curso, nós
vamos introduzir alguns conceitos que são cruciais para o entendimento
das rotinas que estamos disponibilizando aqui.

Para você começar a entender a linguagem antes do curso iniciar,
recomendamos o sítio http://ecologia.ib.usp.br/bie5782/, da disciplina
básica de R oferecida pelo Departamento de Ecologia do IB-USP. O link
"Atividades Preparatórias" oferece um introdução compreensiva da
linguagem.

### Pacotes _shapes_ e _geomorph_

O ambiente de programação **R** possui uma multitude de pacotes
escritos para execução de análises em diversos contextos. O uso do R
em Morfometria Geométrica necessita de certas funções e rotinas
disponíveis dentro dos pacotes *geomorph* e *shapes*. Dessa forma, é
necessário que você instale estes pacotes sobre a instalação do R
básico que você possui em seu computador. No entanto, a instalação
destes pacotes pode apresentar problemas, devido à dependência que
ambos os pacotes apresentam ao pacote *rgl*, que essencialmente
providencia uma maneira de visualizarmos e manipularmos gráficos em
três dimensões no R. Em princípio, podemos tentar instalar estes
pacotes usando os comandos

```{R}
> install.packages('geomorph', dependencies = TRUE)
> install.packages('shapes', dependencies = TRUE)
```

e, se tudo estiver bem, podemos carregá-los

```{R}
> require(geomorph)
> require(shapes)
```

No entanto, a instalação destes pacotes pode apresentar erros, de modo
a impedí-los de serem carregados. Apresentamos aqui algumas soluções
para possíveis problemas; no entanto, no início do curso reservamos
algum tempo para ajudar vocês a instalar estes pacotes em seu
computador.

#### MAC OS 

Provavelmente, problemas de instalação do _rgl_ no MAC OS são
relacionados à instalação do X11, o controlador de dispositivos
gráficos padrão do R. Se você não possui o X11, vá ao sítio
http://xquartz.macosforge.org/ e instale o XQuartz.

A partir da edição *Yosemite*, o X11 foi transferido da pasta */usr*
para a pasta */opt*, de modo que o R não consegue encontrar o X11
quando tenta instalar o _rgl_. Isso pode ser facilmente resolvido,
supondo que você possua uma instalação do X11 no seu sistema.

Abra um terminal no MAC OS (você pode pressionar
*Command + Espaço*, digitar 'terminal' no *Spotlight* e pressionar
Enter) e digite

```{bash}
$ sudo ln -sf /opt/X11 /usr/X11
```

O terminal irá pedir sua senha de usuário. O que você fez foi criar um
link na pasta */usr* para a pasta */opt/X11*. Dessa forma, o R deverá
ser capaz de encontrar o X11 quando o procura na pasta */usr*, e você
pode tentar instalar o _shapes_ e o _rgl_ a partir do próprio R como
exposto acima.

#### Ubuntu / Linux Mint

Em geral, problemas de instalação no Ubuntu e derivações deste são
resolvidos instalando-se a versão pré-compilada do *rgl* disponível
nos repositórios destas distribuições.

```{shell}
$ sudo apt-get install r-cran-rgl
```

Após essa instalação, pode-se tentar novamente instalar o _shapes_ e o
_geomorph_ diretamente pelo R.

O *geomorph* também depende do pacote *jpeg*, e este necessita de
bibliotecas de manipulação de arquivos .jpg. Caso a instalação do
*geomorph* falhe, instale esta biblioteca no terminal:

```{shell}
$ sudo apt-get install libjpeg8-dev
```

Após este passo, tente novamente instalar o *geomorph*.
