get_series = function(){
  
  
  ipca_acumulado = rbcb::get_series(
    13522,
    start_date = "2000-01-01",
    end_date = Sys.Date(),
    as = 'tibble')
  
  selic_meta = rbcb::get_series(
    432,
    start_date = "2000-01-01",
    end_date = Sys.Date(),
    as = 'tibble')
  
  divida_consolidada = rbcb::get_series(
    4513,
    start_date = "2000-01-01",
    end_date = Sys.Date(),
    as = 'tibble')
  
  ibc_br = rbcb::get_series(
    24363,
    start_date = "2000-01-01",
    end_date = Sys.Date(),
    as = 'tibble')
  
  cambio = rbcb::get_series(
    3695,
    start_date = "2000-01-01",
    end_date = Sys.Date(),
    as = 'tibble')
  
  incerteza = read.csv('xgdvConsulta.csv', sep = ";") %>% tibble()
  incerteza$date = as.Date(incerteza$date, format = "%d/%m/%Y")
  
  
  return(list(
    ipca_acumulado = ipca_acumulado, 
    selic_meta = selic_meta,
    divida_consolidada = divida_consolidada,
    ibc_br = ibc_br,
    cambio = cambio,
    incerteza = incerteza))
  
}
