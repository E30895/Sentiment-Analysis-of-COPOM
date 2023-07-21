
timeSeries = function(data){
  
  ggplot2::ggplot(data) +
    geom_line(
      mapping  = aes(
        x = data,
        y = sentimento_copom)) +
    
    #geom_vline(
    #  xintercept = as.numeric(data$data[c(13)]),
    #  linetype="dashed", 
    #  color = "green", size=1.5)+
    
    #geom_text(
    #  label = 'BARBA',
    #  x = as.numeric(data$data[c(14)]),
    #  y = c(0.2),
    #  angle = 90, 
  #  vjust = 1) +
  
  labs(title = "Lorem ipsum",
       subtitle = "Lorem ipsum",
       caption = "Lorem ipsum")
  
  #geom_vline(xintercept=as.numeric(tmp$x[c(13, 24)]),
  #           linetype=4, colour="black")
}
