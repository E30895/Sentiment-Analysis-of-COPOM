get_transform_dataset = function(series, sentiment_analysis) {
  
  
  # JUNTANDO O SENTIMENT ANALYSIS NA LISTA E TROCANDO O NOME
  series = c(timeseries, list(sentiment_analysis))
  
  posicao = as.numeric(length(series))
  nomes_lista = names(series)
  nomes_lista[posicao] = "sentiment_analysis"
  names(series) = nomes_lista
  
  cdates = Reduce(intersect, list(series$selic_meta$date, series$sentiment_analysis$date)) %>% 
    as.Date() %>% 
    zoo::as.yearmon()
  
  df_final = data.frame(date = cdates)
  
  serie_end = list()
  
  # CONVERTER PARA Y/M
  for (i in seq_along(series)) {
    
    serie = series[[i]]
    serie$date = zoo::as.yearmon(serie$date)
    serie_end[[names(series)[i]]] = serie
    df_final = left_join(df_final, serie, by = "date")
    
    #}else {
    # serie = series[[i]]
    #serie$date = zoo::as.yearmon(serie$date)
    #serie_end[[names(series)[i]]] = serie
    #df_final = left_join(df_final, serie, by = "date")
    
  }
  
  df_final = df_final %>% distinct(date, .keep_all = TRUE) %>% 
    na.omit()
  
  return(df_final)
  
}





