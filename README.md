## Introdução

Neste conteúdo, exploraremos uma abordagem econômica menos convencional, utilizando técnicas de Processamento de Linguagem Natural (NPL) para quantificar informações categoricamente nas atas do comite de politica montetária (COPOM).

## Metodologia

Para o desenvolvimento deste material, nos apoiaremos em (Costa 2016) e (Nopp and Hanbury 2015), no qual é empregado uso de técnicas (nem tão) modernas de estatística e linguística computacional para realizar o procedimento de processamento de linguagem natural (NPL).

### NPL

O Processamento de Linguagem Natural (NPL) é uma vertente computacional intimamente ligada ao Aprendizado de Máquina, cujo propósito é extrair e mensurar informações contidas em um ou mais conjuntos textuais, denominados Corpus.

De maneira simplificada, o NPL abrange um conjunto de técnicas que permitem a extração, quantificação, estimativa e modelagem abrangente de informações, bem como possibilita a interpretação empírica de decisões.

No escopo do NPL, nossa atenção se volta para a mineração de texto e a análise de sentimentos.

### Mineração de Texto

Encontrado na literatura como Mining Text, a mineração de texto é uma das técnicas que engloba o arcabouço do NPL.

O objetivo desta técnica é utilizar das arquiteturas como elementos HTML das páginas web, elementos LaTeX e/ou Markdown dos PDF’s e requisições JSON para o caso de API’s, extraindo informações textuais.

### Análise de sentimentos

Seu objetivo é mensurar o sentimento expresso pelas palavras através de seus respectivos valores semânticos, isoladamente.

De modo mais generalista, quebramos o Corpus obtido seja pelo input manual ou mineração de texto, essa quebra é feita necessariamente palavra por palavra, de modo a obter em cada linha uma única palavra, para que seja possível analisá-la individualmente.

Existem pelo menos duas formas de realizar a análise de sentimentos:


$$sentimento = Palavras_{positivas} - Palavras_{negativas} \tag{1}$$

$$e$$

$$sentimento = \frac {Palavras_{positivas} - Palavras_{negativas}}{TotalDePalavras} \tag{2}$$

Iremos adotar o método (2), pois com ele é possível obter a participação relativa do sentimento.

### Dicionário

A análise de sentimentos requer um dicionário que capture o valor semântico das palavras para garantir a qualidade da interpretação. 

De acordo com (Loughran and McDonald 2011), 73,8% das palavras corriqueiras do dia-dia apresentam um contexto diferente quando aplicadas as finanças, portanto, ao utilizar-se de um dicionário genérico, a interpretação do Corpus pode ser equivocada. 

Por esse motivo, iremos utilizar o dicionário de Loughran McDonald.

## Resultados

![image](https://github.com/E30895/Sentiment-Analysis-of-COPOM/assets/99520642/132edb86-852f-4260-9f2f-788df4444e94)

![image](https://github.com/E30895/Sentiment-Analysis-of-COPOM/assets/99520642/fe57eb25-5edb-4779-ada8-f071b17d827a)


