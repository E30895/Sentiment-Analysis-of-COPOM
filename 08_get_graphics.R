
get_graphics = function(sentiment_analysis, dataset_fit){
  
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
  
  
  ipca = ggplot(dataset_fit, aes(x = date))+
    geom_line(aes(y = `13522`), color = "blue")+
    labs(title = "IPCA acumulado 12m",
         x = "Data",
         y = "Valor",
         color = "Indicador") +
    theme_minimal() +
    theme(plot.title = element_text(size = 18, face = "bold"),
          axis.text.x = element_text(angle = 45, hjust = 1),
          legend.title = element_blank(),
          legend.text = element_text(size = 12),
          legend.position = "bottom")
  
  
  selic = ggplot(dataset_fit, aes(x = date))+
    geom_line(aes(y = `432`), color = "red")+
    labs(title = "Selic",
         x = "Data",
         y = "Valor",
         color = "Indicador") +
    theme_minimal() +
    theme(plot.title = element_text(size = 18, face = "bold"),
          axis.text.x = element_text(angle = 45, hjust = 1),
          legend.title = element_blank(),
          legend.text = element_text(size = 12),
          legend.position = "bottom")
  
  
  divida_consolidada = ggplot(dataset_fit, aes(x = date))+
    geom_line(aes(y = `4513`), color = "purple")+
    labs(title = "divida Consolidada",
         x = "Data",
         y = "Valor",
         color = "Indicador") +
    theme_minimal() +
    theme(plot.title = element_text(size = 18, face = "bold"),
          axis.text.x = element_text(angle = 45, hjust = 1),
          legend.title = element_blank(),
          legend.text = element_text(size = 12),
          legend.position = "bottom")
  
  
  ibc_br = ggplot(dataset_fit, aes(x = date))+
    geom_line(aes(y = `24363`), color = "black")+
    labs(title = "ibc_br",
         x = "Data",
         y = "Valor",
         color = "Indicador") +
    theme_minimal() +
    theme(plot.title = element_text(size = 18, face = "bold"),
          axis.text.x = element_text(angle = 45, hjust = 1),
          legend.title = element_blank(),
          legend.text = element_text(size = 12),
          legend.position = "bottom")
  
  
  cambio = ggplot(dataset_fit, aes(x = date))+
    geom_line(aes(y = `3695`), color = "grey")+
    labs(title = "cambio",
         x = "Data",
         y = "Valor",
         color = "Indicador") +
    theme_minimal() +
    theme(plot.title = element_text(size = 18, face = "bold"),
          axis.text.x = element_text(angle = 45, hjust = 1),
          legend.title = element_blank(),
          legend.text = element_text(size = 12),
          legend.position = "bottom")
  
  
  incerteza = ggplot(dataset_fit, aes(x = date))+
    geom_line(aes(y = Incerteza), color = "black")+
    labs(title = "incerteza",
         x = "Data",
         y = "Valor",
         color = "Indicador") +
    theme_minimal() +
    theme(plot.title = element_text(size = 18, face = "bold"),
          axis.text.x = element_text(angle = 45, hjust = 1),
          legend.title = element_blank(),
          legend.text = element_text(size = 12),
          legend.position = "bottom")
  
  
  #graficos = list(graphic_sentiment = graphic_sentiment,
  #               graphic_score = graphic_score,
  #               ipca = ipca,
  #               selic = selic,
  #               divida_consolidada = divida_consolidada,
  #               ibc_br = ibc_br,
  #               cambio = cambio,
  #               incerteza = incerteza)"
  
  
  Grid_geral = gridExtra::grid.arrange(graphic_score,
                                       ipca,
                                       selic, 
                                       divida_consolidada, 
                                       incerteza,
                                       ibc_br,
                                       ncol = 2,  nrow = 3, newpage = F)
  
  Grid_ch = gridExtra::grid.arrange(graphic_score, ipca, selic, nrow =3, ncol = 1, newpage = F)
                  
  
  return(list(a = graphic_sentiment, 
              b = graphic_score , 
              Grid_geral = Grid_geral,
              Grid_ch = Grid_ch))
  
}