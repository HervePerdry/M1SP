#' Variance
#'
#' @param x
#' @param sample
#' @param na.rm
#'
#' @return The variance
#' @export
#'
#' @examples
variance <- function(x, sample = FALSE, na.rm = FALSE) {
  calc.moment(x, 2L, sample, na.rm)
}
