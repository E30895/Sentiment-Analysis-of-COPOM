
get_graphics = function(sentiment_analysis){
  
  '
  Essa função abre os dados obtidos pelos processos anteiores
  e obtem os resultados do NPL das atas do COPOM.
  '
  
  hoje = Sys.Date() %>% as.Date()
  hoje = format(hoje - 30, "%Y-%m") 
  
  sentiment_anualized = sentiment_analysis %>%
    group_by(ano = lubridate::year(date)) %>%
    summarise_all(mean)
  
  #GRÁFICO SENTIMENTOS ANUALISADOS
  graphic_sentiment = ggplot(
    sentiment_anualized, 
    aes(x = ano))+
    geom_line(aes(y = (positive)/(positive+negative+uncertainty), color = 'positive'), size = 0.8, linetype = 'longdash') +
    geom_line(aes(y = (negative)/(positive+negative+uncertainty), color = 'negative'), size = 0.8, linetype = 'dotted') +
    geom_line(aes(y = (uncertainty)/(positive+negative+uncertainty), color = 'uncertainty'), size = 0.8, linetype = 'twodash') +
    ggplot2::annotate("text", x = 2008, y = 0.2, label = "2008", hjust = 0, color = "black")+
    ggplot2::annotate("text", x = 2015, y = 0.2, label = "Recessao", hjust = 0, color = "black")+
    ggplot2::annotate("text", x = 2018, y = 0.2, label = "Pandemia", hjust = 0, color = "black")+
    
    labs(title = "Sentiment Series - Single Sentiment",
         subtitle = paste("2000-01 to", hoje),
         x = "Data",
         y = "Valores (anualizados)",
         color = "Indicador") +
    scale_color_manual(values = c('positive' = '#0072B2', 'negative' = '#D55E00', 'uncertainty' = '#808080')) +
    theme_minimal() +
    theme(plot.title = element_text(size = 18, face = "bold"),
          axis.text.x = element_text(angle = 45, hjust = 1),
          legend.title = element_blank(),
          legend.text = element_text(size = 12),
          legend.position = "bottom")
  
  
  #GRÁFICO SCORE MENSAL
  graphic_score = ggplot(
    sentiment_analysis,
    aes(x = date))+
    geom_line(aes(y = sentimento_copom, color = 'sentimento_copom'), size = 0.8, linetype = 'solid') +
    ggplot2::annotate("text", x = as.Date('2008-01-01'), y = -0.4, label = "2008", hjust = 0, color = "black")+
    ggplot2::annotate("text", x = as.Date('2014-04-14'), y = -0.4, label = "Recessao", hjust = 0, color = "black")+
    ggplot2::annotate("text", x = as.Date('2019-12-11'), y = -0.6, label = "Pandemia", hjust = 0, color = "black")+
    labs(title = "Sentiment Series - Score Sentiment",
          subtitle = paste("2000-01 to", hoje),
          x = "Data",
          y = "Valores",
          color = "Indicador") +
    scale_color_manual(values = c('sentimento_copom' = '#0072B2')) +
    theme_minimal() +
    theme(plot.title = element_text(size = 18, face = "bold"),
          axis.text.x = element_text(angle = 45, hjust = 1),
          legend.title = element_blank(),
          legend.text = element_text(size = 12),
          legend.position = "bottom")

  return(list(a = graphic_sentiment, b = graphic_score ))
  
}
