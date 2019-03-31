### Carrega na memória os metadados do SGSEc para agenda (código, fonte e
### defasagem das séries com data informada.
agendasgs <- function(dias = NA) {
  require(RMySQL)
  usuario <- Sys.getenv("Username")
  con <- dbConnect(MySQL(), user = usuario, password = senha,
                   dbname = db, host = ip)
  rs <- dbSendQuery(con, "select defasagem, fonte, codigo, dia
                          from series")
  dados <- dbFetch(rs, n = -1)
  dbClearResult(rs)
  dbDisconnect(con)
  
  dados$dia <- as.numeric(dados$dia)
  quais <- which(dados$dia %in% dias)
  x <- dados[quais, ]
  out <- x[ with(x, order(defasagem, fonte, codigo)), ]
  
  return(out)
}