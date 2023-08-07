get_sentiment_analysis = function(atas_token, dicionario){
  
  '
  Essa função realiza a análise de sentimentos das atas do COPOM construindo
  uma série temporal da mesma.
  
  Para a análise de sentimentos é utilizado o dicionário de finanças:
  Loughran-McDonald Master Dictionary w/ Sentiment Word Lists.
  '
  
  atas_sentimentos = dplyr::inner_join(
    x = atas_token,
    y = dicionario,
  ) %>% 
    dplyr::group_by(date) %>% 
    dplyr::count(ata, sentimento)
  
  analise_sentimento = atas_sentimentos %>% 
    tidyr::pivot_wider(
      id_cols = "date",
      names_from = "sentimento",
      values_from = "n",
    ) %>% 
    dplyr::mutate(sentimento_copom = ((positive - negative)/(positive+negative)))
  
  return(analise_sentimento)
  
}
