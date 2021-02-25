#' Successive means
#'
#' @param x a numeric vector
#'
#' @details This function computes successive means
#' of the values in \code{x}.
#'
#' @return A vector of same length than \code{x}
#'
#' @examples
#' # Illustration of the Law of large numbers
#' # using the normal distribution
#' set.seed(1)
#' x <- rnorm(5e3)
#' plot(means(x), type = "l", ylim = c(-.5,.5))
#' abline(h = 0, col = "red")
#' # Using t(1) (expected value is undefined)
#' x <- rt(5e3, df = 1)
#' plot(means(x), type = "l")
#' abline(h = 0, col = "red")
#' @export
means <- function(x) cumsum(x) / seq_along(x)
