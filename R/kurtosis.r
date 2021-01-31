#' Kurtosis
#'
#' @param x
#' @param excess.kurtosis
#' @param sample
#' @param na.rm
#'
#' @return The kurtosis
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
