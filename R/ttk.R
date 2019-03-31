### Calcula a variação percentual t/(t-k) do vetor x informado.
ttk <- function(x, k){
  n <- length(x)
  y <- (x[(k + 1):n] / x[1:(n - k)] - 1) * 100
  out <- c(rep(NA, k), y)

  return(out)
}
