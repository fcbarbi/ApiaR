### Carrega na memória todos os metadados do SGSEc e seleciona apenas os dos
### códigos informados.
metasgs <- function(codigo = "todos") {
  require(RMySQL)
  usuario <- Sys.getenv("Username")
  con <- dbConnect(MySQL(), user = usuario, password = senha,
                   dbname = db, host = ip)
  rs <- dbSendQuery(con, "select * from series")
  dados <- dbFetch(rs, n = -1)
  dbClearResult(rs)
  dbDisconnect(con)

  quais <- which(dados$codigo %in% codigo) 
  out <- as.list(dados[quais,])

  if(codigo == "todos") { 
    out <- dados[c("idserie", "codigo", "nome", "frequencia", "fonte",
                   "defasagem", "dia", "responsavel")]
  }
  
  return(out)
}