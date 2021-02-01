#' Skewness
#'
#' @param x numerical vector.
#' @param sample logical. Compute sample skewness or apply correction?
#' @param na.rm logical. Should missing values be removed?
#'
#' @return The value of the skewness. If \verb!sample = FALSE! a correction for sample size is applied.
#' @export
#' 
#' @examples
skewness <- function(x, sample = FALSE, na.rm = FALSE) {
  calc.moment(x, 3L, sample, na.rm)
}
