### Aplica FUN em t, t+1, t+2, t+3 do vetor x informado.
### Espera-se que x tenha comprimento múltiplo de 4.
triaano <- function(x, FUN = sum) {
  FUN <- match.fun(FUN)
  n <- length(x)
  m <- n/4
  out <- rep(NA, m)
  for(i in 1:m) { out[i] <- FUN(x[(4 * i - 3):(4 * i)]) }

  return(out)
}
