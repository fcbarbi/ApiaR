# Carrega na memória a lista de usuários e seus respectivos códigos
# de identificação
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