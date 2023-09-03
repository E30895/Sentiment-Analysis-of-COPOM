## Sobre

A metodologia empregada inicia-se com a utilização de métodos empíricos com o propósito
de mensurar os sentimentos do Comitê de Política Monetária ao longo do tempo. Para essa
finalidade, faz-se uso da API fornecida pelo Banco Central, que disponibiliza as atas em língua
inglesa desde janeiro de 2000. É relevante notar que a data original das atas é mantida intacta,
visando à construção de uma série temporal dos sentimentos.

## Bibliotecas

As bibliotecas utilizadas para o desenvolvimento do trabalho foram:

```{r, warning=FALSE, error=FALSE, message=FALSE}
library(tidyverse)
library(jsonlite)
library(curl)
library(pdftools)
library(tm)
library(tidytext)
library(textdata)
library(scales)
library(ggtext)
library(lmtest)
library(wordcloud2)
```
## As funções

As funções desenvolvidas para a modularização do projeto são:

```{r, warning=FALSE, error=FALSE, message=FALSE}
source('01_get_atas.R')
source('02_get_transform_atas.R')
source('03_get_Loughran_McDonald.R')
source('04_get_sentiment_analysis.R')
source('05_get_wordclouds.R')
source('06_get_series.R')
source('07_get_transform_dataset.R')
source('08_get_graphics.R')
source('09_get_OLS_models.R')
```

onde:

| Modulo                      | Função                     | Objetivo                                |
|:---------------------|:--------------------|:----------------------------|
| 01_get_atas.R               | `get_atas()`               | Obtém as atas do COPOM                  |
| 02_get_transform_atas.R     | `get_transform_atas()`     | Realiza o pré-processamento dos dados   |
| 03_get_Loughran_McDonald.R  | `get_Loughran_McDonald()`  | Obtém o dicionário de Loughran_McDonald |
| 04_get_sentiment_analysis.R | `get_sentiment_analysis()` | Realiza a análise de sentimentos        |
| 05_get_wordclouds.R         | `get_wordclouds()`         | Obtem as núvens de Palavras             |
| 06_get_series.R             | `get_series()`             | Obtem as séries do SGS                  |
| 07_get_transform_dataset.R  | `get_transform_dataset()`  | Realiza o pré-processamento das séries  |
| 08_get_graphics.R           | `get_graphics()`           | Obtem os gráficos                       |
| 09_get_OLS_models.R         | `get_model()`              | Obtem o modelo básico                   |
| 09_get_OLS_models.R         | `get_model_diff()`         | Obtem o modelo diferenciado             |

## Executando

Para executar o código, vamos utilizar as funções apresentadas
anteriormente nesta ordem:

```{r, warning=FALSE, error=FALSE, message=FALSE, results='hide', cache=T, fig.show='hide'}
atas = get_atas()
atas_token = get_transform_atas(atas)
Loughran_McDonald = get_Loughran_McDonald()
sentiment_analysis = get_sentiment_analysis(atas_token, Loughran_McDonald)
wordclouds = get_wordclouds(atas_token)
timeseries = get_series()
dataset_fit = get_transform_dataset(timeseries, sentiment_analysis)
grafico_ts = get_graphics(sentiment_analysis, dataset_fit)
modelo = get_model(dataset_fit)
modelo_diff = get_model_diff(dataset_fit)
```

Ao iniciar a execução, as atas serão prontamente baixadas, carregadas e
submetidas a um processo de processamento. É importante destacar que
estamos fazendo uso da função **`get_series()`** para baixar
determinadas séries diretamente do Sistema Gerenciador de Séries
Temporais (SGS).
