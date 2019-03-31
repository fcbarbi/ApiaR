### Aplica FUN em t, t+1, ..., t+12 do vetor x informado.
### Espera-se que x tenha comprimento múltiplo de 12.
anualizam <- function(x, FUN = sum) {
  out <- n2mk(x, 12, FUN)

  return(out)
}
