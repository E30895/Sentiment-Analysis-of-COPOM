---
title: "Sentiment Analysis of COPOM"
author: "Nathan Ramos D. Almeida"
date: "2023-07-21, atualizado em `r Sys.Date()`"
output:
  prettydoc::html_pretty:
    theme: hpstr
    highlight: github
    toc_float: true
    
editor_options: 
  markdown: 
    wrap: 72
---

## Introdução

::: {align="justify"}
Nesse material iremos explorar uma vertente não tão ortodoxa na
economia, onde iremos explorar de técnicas de NPL para quantificar
informações apresentadas de forma categórica.

O gatilho para essa discussão ocorre ao redor de duas perguntas
fundamentais: podemos mensurar a expectativa do agente formulador da
política monetária? E, caso a primeira seja afirmada, nos leva para a
segunda: os testes empíricos sustentam a mensuração? Buscaremos as
respostas para essas perguntas no decorrer do material.

Não obstante, discutiremos quais os benefícios para a teoria econômica
ao beneficiar-se da mensuração das expectativas do agente formulador da
política monetária.

## Metodologia

Para o desenvolvimento deste material, iremos adotar técnicas (não tão)
modernas de estatística e linguística computacional para realizar o
procedimento de processamento de linguagem natural (NPL) e mensurar as
expectativas do comitê de política monetária (COPOM).

Para realizar os testes empíricos nos apoiaremos no instrumental
econométrico estimando os modelos e interpretando seus resultados.

### NPL

NPL é uma área da computação, próxima ao Machine Learning que busca
extrair e mensurar informações contidas em um ou mais Corpus. O Corpus
pode ser generalizado como o objeto que contém as mensagens textuais a
serem analisadas. Em outras palavras, o processamento de linguagem
natural é um conjunto de técnicas que nos permite extrair, mensurar,
estimar e treinar modelos generalizados, bem como interpretar de forma
empírica as tomadas de decisão.

Os avanços dos métodos computacionais, bem como intensificação das
pesquisas em Machine Learning reascenderam as pesquisas em relação aos
métodos de NPL, expandindo seus horizontes para as mais diversas áreas,
incluindo a economia.

Das técnicas de NPL, estamos interessados em mineração de texto e
análise de sentimentos.

### Mineração de Texto

Encontrado na literatura como *Mining Text*, a mineração de texto é uma
das técnicas que engloba o arcabouço do NPL. O objetivo desta técnica é
utilizar das arquiteturas como elementos HTML das páginas web, elementos
LaTeX e/ou Markdown dos PDF's e requisições JSON para o caso de API's.

A aplicação destas técnicas não é trivial e implementá-las do zero foge
do nosso escopo enquanto não desenvolvedores. Portanto, os principais
softwares estatísticos possuem bibliotecas que implementam essas
funcionalidades, que é o caso do R e Python.

> Lembre-se da LGPD. A pesar de extensa, ela pode ser resumida em uma
> frase: "se o autor estiver interessado que terceiros se beneficiem com
> alguma informação, o mesmo irá disponibilizar por meio de download ou
> API".

### Análise de sentimentos

A análise de sentimentos é a segunda técnica do arcabouço de NPL que
iremos utilizar, seu objetivo é mensurar o sentimento expresso pelas
palavras através de seus respectivos valores semânticos, isoladamente.
De modo mais generalista, quebramos o Corpus obtido seja pelo input
manual ou mineração de texto, essa quebra é feita necessariamente
palavra por palavra, de modo a obter em cada linha uma única palavra,
para que seja possível analisá-la individualmente.

Existem algumas alternativas para a mensuração do score de sentimentos,
sendo elas a **absoluta**, **relativa** e ponderada.

Cabe mencionar o método apresentado em *NOPP, Clemens; HANBURY, Allan. Detecting risks in the banking system by sentiment analysis. In: Proceedings of the 2015 conference on empirical methods in natural language processing. 2015. p. 591-600*, onde os autores apresentam o método ponderado, no qual é atribuiudo diferentes pesos para os Corpus.

Devido à natureza da nossa aplicação, não temos essa preocupação, pois os autores argumentam que mensagens textuais apresentam diferentes repercussões na Zona do Euro, justificando a atribuição dos pesos, o que não reflete o nosso caso, tendo em vista que estamos tratando apenas do Brasil.


#### Método absoluto

O método absoluto é aquele no qual subtrairmos a quantidade de palavras positivas pela quantidade de palavras negativas, ou seja:

```{=tex}
\begin{equation}
\label{equacao1}
  sentimento = Palavras_{positivas} - Palavras_{negativas}
\end{equation}
```

O método absoluto é aquele no qual subtrairmos a quantidade de palavras positivas pela quantidade de palavras negativas, ou seja:
Esse método nos fornece um score irregular absoluto de sentimento, quanto maior melhor. Porém, por se tratar de 

valor absoluto dificulta a comparação de scores entre demais textos, uma vez que não apresenta denominador comum como mecanismo de ancoragem.


#### Método relativo

O método relativo é aquele no qual subtrairmos a quantidade de palavras positivas pela quantidade de palavras negativas e relativismo perante o número total de palavras, ou seja:

```{=tex}
\begin{equation}
\label{equacao2}
  sentimento = \frac {Palavras_{positivas} - Palavras_{negativas}}{TotalDePalavras}
\end{equation}
```

Esse método fornece um score regular, estando sempre no intervalo de [-1;1]. O quanto mais próximo de 1 melhor e quanto mais próximo de -1 pior.

Os métodos apresentados possuem suas vantagens e desvantagens. Para a nossa finalidade, estamos interessados apenas no método relativo, onde o nosso score é obtido em razão do número total de palavras, tornando possível a comparação entre diversos scores. Essa diferença se torna mais perceptível ao compararmos notícias entre fontes distintas, onde o número de palavras pode distorcer e enviesar o score de sentimentos.


#### Dicionário

É natural que o leitor esteja imaginando que para a realização da análise, seja necessário um dicionário de tamanho tal a obter todas as palavras que expressem valor semântico, de fato. A análise, bem como sua qualidade dependem de um dicionário de palavras adequadamente ajustado. 

Construir esse dicionário demandaria o tempo que não temos, portanto, iremos nos apoiar em materiais já desenvolvidos. O contraponto desta técnica é que até o momento não possuímos um dicionário para a língua portuguesa. Portanto, iremos nos apoiar em dicionários da língua inglesa. Para essa análise, iremos utilizar o dicionário de [Loughran McDonald](https://sraf.nd.edu/loughranmcdonald-master-dictionary/) esse é o mais conhecido dicionário para finanças.

De acordo com Loughran and McDonald (2011), 73,8% das palavras corriqueiras do dia-dia apresentam um contexto diferente quando aplicadas as finanças, portanto, ao utilizar-se de um dicionário genérico, a interpretação do Corpus pode ser equivocada. Logo, a utilização de um dicionário apropriado à aplicação é fundamental para a usabilidade.

> O dicionário de Loughran McDonald apresenta mais do que a dicotomia
> binária de positivo ou negativo, entretanto, devido ao tempo iremos
> nos concentrar apenas no método clássico.


### O Comitê de Política Monetária

O comitê de política monetária (COPOM) é a entidade máxima da política monetária do Brasil. Sua principal finalidade é plena condução da política monetária, a fim de manter a sua estabilidade. A cada 45 dias, aproximadamente, reúnem-se presidente do Banco Central e seus diretores para decidir em maioria simples os rumos da política monetária do país. Ao final da reunião, com alguns dias de defasagem, é publicado a ata, contendo o consenso do comitê, bem como as pautas discutidas. 

As atas do COPOM são fundamentais para nós, pois é através delas que iremos mensurar as expectativas. Portanto, o nosso objetivo de mensuração ocorre ao redor das atas do comitê de política monetária.


> Dado que só possuimos dicionários para a lingua inglesa, utilizaremos
> as atas na versão inglesa, podendo eventualmente haver defasagens.

> Como o (COPOM) se reune a cada 45 dias, teremos uma série temporal
> irregular



## Aplicação

Para o desenvolvimento desse projeto, utilizamos a arquitetura ETL
adotando o paradigma funcional, ou seja, todas as funções estão
devidamente modularizadas e disponíveis em
[Github](https://github.com/E30895/Sentiment-Analysis-of-COPOM).

Se preferir, baixe no botão abaixo:

```{r, include=TRUE, echo=FALSE}
downloadthis::download_link(
  link = "https://github.com/E30895/Sentiment-Analysis-of-COPOM/raw/main/NPL%20COPOM.zip",
  button_label = "Download Code",
  button_type = "danger",
  has_icon = TRUE,
  icon = "fa fa-save",
  self_contained = FALSE
)
```

### Bibliotecas

```{r, include=TRUE, message=FALSE, warning=FALSE}
library(tidyverse)
library(jsonlite)
library(curl)
library(pdftools)
library(tm)
library(tidytext)
library(textdata)
library(scales)
library(ggtext)
library(rbcb)
library(xts)
library(zoo)
library(tsibble)
library(lubridate)
```

Algumas bibliotecas acima merecem destaque:

-   [tidyverse:](https://www.tidyverse.org/) é o principal framework para manipulação de dados;
-   [jsonlite:](https://cran.r-project.org/web/packages/jsonlite/jsonlite.pdf) é o principal framework para requisições em API;
-   [pdftools:](https://cran.r-project.org/web/packages/pdftools/pdftools.pdf) é a biblioteca que vai nos permitir extrair os elementos
    dos PDFs;
-   [tm:](https://cran.r-project.org/web/packages/tm/tm.pdf) é a biblioteca que nos fornece recursos para o tratamento dos dados categóricos.

### Funções

O processo de modularização nos proporcionou4 funções para trabalhar a
aplicação, portanto, precisamos importar as funções criadas.

```{r}
source('get_atas.R')
source('get_transform_atas.R')
source('get_Loughran_McDonald.R')
source('get_sentiment_analysis.R')
source('get_graphics.R')
```

|          Modulo          |          Função          |                Objetivo                 |
|:------------------:|:------------------:|:-----------------------------:|
|         get_atas.R       |        `get_atas()`        |         Obtém as atas do COPOM          |
|     get_transform_atas.R      |     `get_transform_atas()`      |  Realiza o pré-processamento dos dados  |
| get_Loughran_McDonald.R  | `get_Loughran_McDonald()`  | Obtém o dicionário de Loughran_McDonald |
| get_sentiment_analysis.R | `get_sentiment_analysis()` |    Realiza a análise de sentimentos     |
|      get_graphics.R      |       `get_graphics()`       |        Obtém os gráficos finais         |

### Obtendo as atas

Para obter as atas iremos utilizara a função `get_atas()`

```{r, cache=F}
atas = get_atas()
```

> O mundo não é estático: eventualmente o BACEN pode implementar
> alterações em sua API e essa função deixar de funcionar sem aviso
> prévio.

### Pré-Processamento

A etapa de pré-processamento é fundamental na arquitetura ETL, pois impossibilita que os dados cheguem "sujos" em nossa base de dados, prejudicando a análise.

Para realizar o pré-processamento utilizamos a `função get_transform_atas()`

```{r}
atas_token = get_transform_atas(atas)
```

```{r, cache=F, echo=FALSE, error=FALSE, warning=FALSE, message=FALSE, eval=TRUE}
knitr::kable(head(atas_token))
```

Repare que o nome da variável atribuida a função é *atas_token*.

> Token ou Tokenização é o principal método para processamento de
> linguagem natural (NPL). O processo connsiste em quebrar o texto
> palavra por palavra e em seguida empilha-los para que conseguimos ter
> uma única palavra por linha.

### Loughran_McDonald

Para obtermos o dicionário de Loughran_McDonald utilizamos a função `get_Loughran_McDonald()`

```{r, cache=F, warning=FALSE, error=FALSE, message=FALSE}
Loughran_McDonald = get_Loughran_McDonald()
```

```{r, cache=F, echo=FALSE, error=FALSE, warning=FALSE, message=FALSE, eval=TRUE}
c = textdata::lexicon_loughran()
dados_sem_duplicatas <- subset(c, !duplicated(c[[2]]))
knitr::kable(dados_sem_duplicatas)
```

### Analise de Sentimentos

Para realizar a análise de sentimentos propriamente dita iremos juntar as informações tratadas com o dicionário de Loughran. Iremos utilizar a função `get_sentiment_analysis()`

```{r, cache=F, warning=FALSE, error=FALSE, message=FALSE}
sentiment_analysis = get_sentiment_analysis(atas_token, Loughran_McDonald)
```

```{r, cache=F, echo=FALSE, error=FALSE, warning=FALSE, message=FALSE, eval=TRUE}
knitr::kable(tail(sentiment_analysis))
```

### Série Temporal

Com os procedimentos prontos, basta plotar a série temporal com a função `get_graphics()`

```{r, ache=F, warning=FALSE, error=FALSE, message=FALSE, fig.align='center'}
grafico_ts = get_graphics(sentiment_analysis)
```

:::


