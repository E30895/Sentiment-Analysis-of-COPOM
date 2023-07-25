get_Loughran_McDonald = function(){

  "Essa função obtem o dicionário de Loughran and McDonald
  e filtra apenas as palavras positivas e negativas"
  
  dicionario = textdata::lexicon_loughran() %>% 
    dplyr::mutate(
      token = tm::stemDocument(x = word, language = "english"),
      sentimento = sentiment,
      .keep = "none"
    ) %>% 
    dplyr::group_by(token) %>% 
    dplyr::distinct(sentimento) %>%
    dplyr::ungroup() %>% 
    dplyr::filter(sentimento %in% c('positive', 'negative'))
                  
    return(dicionario)
}
