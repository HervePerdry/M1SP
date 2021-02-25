#' Randow draws of ages
#'
#' @param n number of draws
#' @param S numeric vector giving the survival function
#'
#' @details The vector \code{S} gives the survival function.
#' Specifically, \code{ S[i] = P(T > i-1)} ; \code{S}
#' must be decreasing. If \code{S[1] = 1}, \eqn{P(T > 0) = 1} and
#' all draws are positive.
#'
#' @return A vector of \code{n} random draws.
#' @export
#'
#' @examples
#' # A survival function obtained from Halley's table
#' P <- c(Halley$number,18,16,14,13,11,9,8,6,5,3,2,1,1)
#' S <- c(1, P/1238)
#' A <- r.age(1e4, S)
#' mean(A)

r.age <- function(n, S) {
  pr <- -diff(c(S,0))
  if(S[1] > 1 | any(pr < 0))
    stop("Not a survival function")
  sample( seq_along(S), n, TRUE, pr)
}
