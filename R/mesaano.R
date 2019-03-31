### Aplica FUN em t, t+1, ..., t+12 do vetor x informado.
### Espera-se que x tenha comprimento múltiplo de 12.
mesaano <- function(x) {
  FUN <- match.fun(FUN)
  n <- length(x)
  m <- n/12
  out <- rep(NA, m)
  for(i in 1:m) { out[i] <- FUN(x[(12 * i - 11):(12 * i)]) }

  return(out)
}
