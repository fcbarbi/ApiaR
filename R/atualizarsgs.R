### Seleciona os códigos das séries que deveriam estar atualizadas no SGS mas
### não estão.
atualizarsgs <- function() {

  q <- "select idserie, max(atualizada) from serievalor group by idserie"
  require(RMySQL)
  usuario <- Sys.getenv("Username")
  con <- dbConnect(MySQL(), user = usuario, password = senha,
                   dbname = db, host = ip)
  rs <- dbSendQuery(con, q)
  dados1 <- dbFetch(rs, n = -1)
  dbClearResult(rs)
  dbDisconnect(con)
  names(dados1)[2] <- "data"

  dados2 <- metasgs()
  dados <- merge(dados1, dados2, by = "idserie")
  sel <- which(toupper(dados$frequencia) == "M")
  dados <- dados[sel, ]
  
  hoje <- Sys.Date()
  dados$hmes <- as.numeric(substr(as.character(hoje), 6, 7))
  dados$hdia <- as.numeric(substr(as.character(hoje), 9, 10))
  dados$dia <- as.numeric(dados$dia)
  dados$mes <- as.numeric(substr(dados$data, 6, 7))

  sel1 <- which(dados$dia <= dados$hdia & dados$defasagem == 0 &
                dados$mes < dados$hmes - dados$defasagem)
  sel2 <- which(dados$dia <= dados$hdia &
                dados$mes < dados$hmes - dados$defasagem)
  sel <- sort(unique(c(sel1, sel2)))

  out <- dados[sel,]

  return(out)
}
