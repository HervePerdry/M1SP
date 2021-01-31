#' Skewness
#'
#' @param x
#' @param sample
#' @param na.rm
#'
#' @return The skewness
#' @export
#'
#' @examples
skewness <- function(x, sample = FALSE, na.rm = FALSE) {
  calc.moment(x, 3L, sample, na.rm)
}
