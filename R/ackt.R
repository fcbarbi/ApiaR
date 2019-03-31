### Calcula a variação percentual acumulada em k períodos do vetor x informado.
ackt <- function(x, k) {
  sel <- which(is.na(x))
  if(length(sel) == 0) { x1 <- cumsum(x) } else { x1 <- cumsum(x[-sel]) }
  x2 <- c(rep(NA, k - 1), x1[k], diff(x1, lag = k))
  if(length(sel) == 0) {
    out <- ttk(x2, k) } else {
    out <- c(rep(NA, length(sel)), ttk(x2, k)) }

  return(out)
}