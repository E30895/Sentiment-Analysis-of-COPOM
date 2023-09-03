get_wordclouds = function(atas_token){
  

  #Nuvem de palavras 2008
  subset_df_1 = subset(atas_token, date >= as.Date("2008-01-01") & date <= as.Date("2008-12-31")) %>%
    group_by(token) %>%
    summarise(contagem = n()) %>%
    arrange(desc(contagem))
  
  geral_2008 = wordcloud2(subset_df_1, size = 2, minRotation = -pi/6, maxRotation = -pi/6, rotateRatio = 1)
  
  
  #2015-17
  subset_df_2 = subset(atas_token, date >= as.Date("2015-01-01") & date <= as.Date("2017-12-31")) %>%
    group_by(token) %>%
    summarise(contagem = n()) %>%
    arrange(desc(contagem))
  
  geral_15_17 = wordcloud2(subset_df_2, size = 2, minRotation = -pi/6, maxRotation = -pi/6, rotateRatio = 1)
  
  
  #2020-21
  subset_df_3 = subset(atas_token, date >= as.Date("2020-01-01") & date <= as.Date("2021-12-31")) %>%
    group_by(token) %>%
    summarise(contagem = n()) %>%
    arrange(desc(contagem))
  
  geral_20_21 = wordcloud2(subset_df_3, size = 2, minRotation = -pi/6, maxRotation = -pi/6, rotateRatio = 1)
  
  return(list(geral_2008 = geral_2008,
              geral_15_17 = geral_15_17,
              geral_20_21 = geral_20_21))
  
}