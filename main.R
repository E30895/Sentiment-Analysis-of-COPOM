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
source('get_transform.R')
source('get_Loughran_McDonald.R')
source('sentiment_analysis.R')

main = function(){
  atas = get_atas()
  atas_token = get_transform(atas)
  Loughran_McDonald = get_Loughran_McDonald()
  sentiment_analysis = sentiment_analysis(atas_token, Loughran_McDonald)
  
  return(sentiment_analysis)
}

analise_senetimentos = main()
