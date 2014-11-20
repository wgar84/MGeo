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

#### Ubuntu / Linux Mint

Em geral, problemas de instalação no Ubuntu são resolvidos
instalando-se a versão pré-compilada do *rgl* disponível nos
repositórios destas distribuições.

```{shell}
$ sudo apt-get install r-cran-rgl
```

Após essa instalação, pode-se tentar novamente instalar o _shapes_ e o
_geomorph_ diretamente pelo R.
