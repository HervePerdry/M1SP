#' Kurtosis
#'
#' @param x numerical vector.
#' @param excess.kurtosis logical. Compute excess kurtosis instead of kurtosis?
#' @param sample logical. Compute sample kurtosis or apply correction?
#' @param na.rm logical. Should missing values be removed?
#'
#' @return The value of the (excess) kurtosis. If \code{sample = FALSE} a correction for sample size is applied.
#' @export
#'
#' @examples
#' # kurtosis of the height in EUR2170 data
#' kurtosis(EUR2170$height, sample = TRUE)
#' # adults only
#' he <- subset(EUR2170, age > 20, "height")
#' kurtosis(he, sample = TRUE)
#' # males and females separately
#' heM <- subset(EUR2170, age > 20 & sex == "M", "height")
#' heF <- subset(EUR2170, age > 20 & sex == "F", "height")
#' kurtosis(heM, sample = TRUE)
#' kurtosis(heF, sample = TRUE)

kurtosis <- function(x, excess.kurtosis = FALSE, sample = FALSE, na.rm = FALSE) {
  K <- calc.moment(x, 4L, sample, na.rm)
  if(excess.kurtosis)
    K-3
  else
    K
}
