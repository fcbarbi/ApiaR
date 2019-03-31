### Carrega na memória todas as séries do SGSEc que têm a frequência desejada
### e seleciona apenas os códigos informados.
sgs <- function(freq = "m", codigos = "todos") {
  if(freq == "d") { q <- "select codigo, atualizada, valor from tabdiaria" }
  if(freq == "m") { q <- "select codigo, atualizada, valor from tabmensal" }
  if(freq == "t") { q <- "select codigo, atualizada, valor from tabtrimestral" }
  if(freq == "s") { q <- "select codigo, atualizada, valor from tabsemestral" }
  if(freq == "a") { q <- "select codigo, atualizada, valor from tabanual" }

  require(RMySQL)
  usuario <- Sys.getenv("Username")
  con <- dbConnect(MySQL(), user = usuario, password = senha,
                   dbname = db, host = ip)
  rs <- dbSendQuery(con, q)
  dados <- dbFetch(rs, n = -1)
  dbClearResult(rs)
  dbDisconnect(con)

  names(dados)[2] <- "data"
  require(reshape)
  x <- melt(dados, c("codigo", "data"), "valor")
  y <- cast(x, data ~ codigo)
  rm(dados, x)
  
  if(codigos == "todos") { cols <- names(y)
    } else { cols <- c("data", codigos) }
  out <- y[cols]

  return(out)
}
