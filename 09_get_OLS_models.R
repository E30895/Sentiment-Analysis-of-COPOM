get_model_diff = function(dataset_fit){
  
  dataset_model = tibble(
    date = dataset_fit$date [-1],
    sentimentos = dataset_fit$sentimento_copom[-1],
    ipca = dataset_fit$`13522`[-1],
    selic = dataset_fit$`432`[-1],
    divida_consolidada = diff(dataset_fit$`4513`),
    ibc_br = diff(dataset_fit$`24363`),
    cambio = diff(dataset_fit$`3695`),
    incerteza = dataset_fit$Incerteza[-1])
  
  
  lm = lm(dataset_model$sentimentos ~ 
            dataset_model$ipca + 
            dataset_model$selic + 
            dataset_model$divida_consolidada + 
            dataset_model$ibc_br + 
            dataset_model$cambio+
            dataset_model$incerteza)
  
  
  coef_ajust = lmtest::coeftest(lm, vcov. = sandwich::NeweyWest(lm))
  summary(lm)
  coef_ajust
  
  grafico = ggplot(dataset_model) +
    aes(x = date) +
    geom_line(aes(y = lm$fitted.values), color = "blue")+
    geom_line(aes(y = sentimentos), color = "green")
  
  modelo = list(
    dataset_model = dataset_model,
    lm = lm,
    coef_ajust = coef_ajust,
    grafico = grafico)
  
  return(modelo)
}

get_model = function(dataset_fit){
  
  dataset_model = tibble(
    date = dataset_fit$date,
    sentimentos = dataset_fit$sentimento_copom,
    ipca = dataset_fit$`13522`,
    selic = dataset_fit$`432`,
    divida_consolidada = dataset_fit$`4513`,
    ibc_br = dataset_fit$`24363`,
    cambio = dataset_fit$`3695`,
    incerteza = dataset_fit$Incerteza)
  
  
  lm = lm(dataset_model$sentimentos ~ 
            dataset_model$ipca + 
            dataset_model$selic + 
            dataset_model$divida_consolidada + 
            dataset_model$ibc_br + 
            dataset_model$cambio+
            dataset_model$incerteza)
  
  coef_ajust = lmtest::coeftest(lm, vcov. = sandwich::NeweyWest(lm))
  
  summary(lm)
  coef_ajust
  
  
  grafico = ggplot(dataset_fit) +
    aes(x = date) +
    geom_line(aes(y = lm$fitted.values), color = "blue")+
    geom_line(aes(y = sentimento_copom), color = "green")
  
  
  modelo = list(
    dataset_model = dataset_model,
    lm = lm,
    coef_ajust = coef_ajust,
    grafico = grafico)
  
  return(modelo)
  
}