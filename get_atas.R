get_atas = function(){
  
  "
  Essa função se alimenta da API do bacen para trazer as atas do COPOM disponíveis.
  
  Para o objetivo finald desta aplicação, serão trazidas as atas em sua versão
  em inglês, podendo haver defasages.
  
  É possível que a API seja modificada e a função pare de funcionar ou deixe
  de trazer alguma informação sem aviso prévio.
  
  "
  
  url_json = "https://www.bcb.gov.br/api/servico/sitebcb/copomminutes/ultimas?quantidade=1000&filtro="
  
  atas_texto = jsonlite::fromJSON(txt = url_json) %>% 
    magrittr::extract2('conteudo') 
  
  
  atas_texto = atas_texto %>% 
    dplyr::mutate(
      
      data = as.Date(atas_texto$DataReferencia),
      
      ata = stringr::str_extract(string = Titulo, pattern = "^[[:digit:]]{2,3}") %>% 
        as.numeric(),
      
      link = paste0("https://www.bcb.gov.br", Url) %>% URLencode(),
      
      texto = purrr::map_chr(
        .x = link,
        .f = ~paste0(pdftools::pdf_text(.x), collapse = "\n")
      ),
      
      .keep = 'none'
      
    ) %>% 
    
    tidyr::drop_na(ata) %>% 
    dplyr::as_tibble()
  
  return(atas_texto)
  
}
