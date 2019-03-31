### Aplica FUN em t, t+1, t+2 do vetor x informado.
### Espera-se que x tenha comprimento múltiplo de 3.
mesatri <- function(x, FUN = sum) {
  FUN <- match.fun(FUN)
  n <- length(x)
  m <- n/3
  out <- rep(NA, m)
  for(i in 1:m) { out[i] <- FUN(x[(3 * i - 2):(3 * i)]) }

  return(out)
}
