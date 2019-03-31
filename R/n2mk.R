### Aplica FUN em t, t+1, ..., t+k do vetor x informado.
### Espera-se que x tenha comprimento n múltiplo de k, isto é, n=km.
n2mk <- function(x, k, FUN = sum) {
  FUN <- match.fun(FUN)
  n <- length(x)
  m <- n/k
  out <- rep(NA, m)
  for(i in 1:m) { out[i] <- FUN(x[(k * i - (k - 1)):(k * i)]) }

  return(out)
}
