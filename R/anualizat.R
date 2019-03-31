### Aplica FUN em t, t+1, t+2, t+3 do vetor x informado.
### Espera-se que x tenha comprimento múltiplo de 4.
anualizat <- function(x, FUN = sum) {
  out <- n2mk(x, 4, FUN)

  return(out)
}
