#' Kurtosis
#'
#' @param x numerical vector.
#' @param excess.kurtosis logical. Compute excess kurtosis instead of kurtosis?
#' @param sample logical. Compute sample kurtosis or apply correction?
#' @param na.rm logical. Should missing values be removed?
#'
#' @return The value of the (excess) kurtosis. If \verb!sample = FALSE! a correction for sample size is applied.
#' @export
#'
#' @examples
kurtosis <- function(x, excess.kurtosis = FALSE, sample = FALSE, na.rm = FALSE) {
  K <- calc.moment(x, 4L, sample, na.rm)
  if(excess.kurtosis)
    K-3
  else
    K
}
