# Carrega na mem�ria a lista de usu�rios e seus respectivos c�digos
# de identifica��o
usuariosgs <- function() {
  require(RMySQL)
  usuario <- Sys.getenv("Username")
  con <- dbConnect(MySQL(), user = usuario, password = senha,
                   dbname = db, host = ip)
  rs <- dbSendQuery(con, "select idusuario, nome, status from usuarios")
  dados <- dbFetch(rs, n = -1)
  dbClearResult(rs)
  dbDisconnect(con)

  out <- dados
  return(out)
}