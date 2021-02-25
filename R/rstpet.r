#' Random St. Petersburg Paradox lottery draws
#'
#' @param size the number of draws
#' @param log2 Logical. If \code{TRUE}, returns log2 of results
#'
#' @details In this lottery, the gain is 1 with a probability 1/2,
#' 2 with probability 1/4, 4 with probability 1/8, and so on.
#'
#' @return a vector of length \code{size}.
#' @export
#'
#' @examples
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
