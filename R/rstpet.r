rstpet <- function(size, log2 = FALSE) {
  S <- list()
  k <- 0
  while(k < size) {
    r <- rle(sample(0:1, 10+2*(size-k), TRUE))$length-1
    # le dernier n'est pas bon !!
    r <- r[-length(r)]
    S <- c(S, list(r))
    k <- k + length(r)
  }
  S <- unlist(S)[1:size]
  if(log2)
    S
  else
    2**S
}
