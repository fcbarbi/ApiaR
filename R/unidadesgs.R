# Carrega na mem�ria a lista de c�digos de unidades e suas respectivas
# descri��es
unidadesgs <- function() {
  require(RMySQL)
  usuario <- Sys.getenv("Username")
  con <- dbConnect(MySQL(), user = usuario, password = senha,
                   dbname = db, host = ip)
  rs <- dbSendQuery(con, "select idunidade, nome from unidades")
  dados <- dbFetch(rs, n = -1)
  dbClearResult(rs)
  dbDisconnect(con)

  out <- dados
  return(out)
}