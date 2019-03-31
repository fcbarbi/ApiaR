### Aplica FUN em t, t+1, t+2 do vetor x informado.
### Espera-se que x tenha comprimento múltiplo de 3.
trimestralizam <- function(x, FUN = sum) {
  out <- n2mk(x, 3, FUN)

  return(out)
}
