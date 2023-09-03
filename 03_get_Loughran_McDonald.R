get_Loughran_McDonald = function(){
  
  dicionario = textdata::lexicon_loughran() %>% 
    dplyr::mutate(
      token = tm::stemDocument(x = word, language = "english"),
      sentimento = sentiment,
      .keep = "none"
    ) %>% 
    dplyr::group_by(token) %>% 
    dplyr::distinct(sentimento) %>%
    dplyr::ungroup() %>% 
    dplyr::filter(sentimento %in% c('positive', 'negative', 'uncertainty'))
                  
    return(dicionario)
}