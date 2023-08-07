get_transform_atas = function(atas){
  
  '
  Essa função transforma o dataframe das atas do COPOM obtidos pela API,
  afim de remover impurezas e informações desnecessárias para a análise.
  '
  
  termos_rm = c(
    "th",
    "Minutes of the Meeting",
    "Monetary Policy Comittee",
    "Copom",
    "Banco Central do Brasil",
    "Banco central brasil",
    "Central Bank",
    "bcb.gov.br",
    "govbr",
    "bcbgovbr",
    "BCB",
    "RBCB",
    "BACEN",
    "Headquarters",
    "Meeting rooms",
    "floor",
    "Brasilia",
    "Brasília",
    "Federal Distric",
    "DF",
    "Brazil",
    "Brasil",
    "Departament",
    "Banking",
    "Operations",
    "Deputy",
    "Governor",
    "Comittee",
    "Meeting",
    "Office",
    "rd",
    "st",
    "nd",
    "pp"
  )
  
  atas_token = atas %>% 
    dplyr::select(-"link") %>% 
    dplyr::mutate(
      
      texto = stringr::str_to_lower(texto) %>% 
        
        #DROP STOPWORD
        tm::removeWords(words = tm::stopwords(kind = "english")) %>% 
        tm::removeWords(word = tm::stopwords(kind = "portuguese")) %>% 
        
        #DROP POTUATION
        tm::removePunctuation() %>% 
        tm::removeNumbers() %>% 
        
        #DROP SELECIONADOS
        tm::removeWords(words = stringr::str_to_lower(termos_rm)) %>% 
        stringr::str_replace_all(pattern = "\\n|\\r|\\-", replacement = " ") %>% 
        tm::stemDocument(language = "english")
    ) %>% 
    
    tidytext::unnest_tokens(output = 'token', input = 'texto', token = 'words')
  
  return(atas_token)
  
}
