library(tidyverse)
library(jsonlite)
library(curl)
library(pdftools)
library(tm)
library(tidytext)
library(textdata)
library(scales)
library(ggtext)


source('get_atas.R')
source('get_transform_atas.R')
source('get_Loughran_McDonald.R')
source('get_sentiment_analysis.R')
source('get_graphics.R')


atas = get_atas()
atas_token = get_transform_atas(atas)
Loughran_McDonald = get_Loughran_McDonald()
sentiment_analysis = get_sentiment_analysis(atas_token, Loughran_McDonald)
grafico_ts = get_graphics(sentiment_analysis)
