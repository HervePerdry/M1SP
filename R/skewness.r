#' Skewness
#'
#' @param x numerical vector.
#' @param sample logical. Compute sample skewness or apply correction?
#' @param na.rm logical. Should missing values be removed?
#'
#' @return The value of the skewness. If \code{sample = FALSE} a correction for sample size is applied.
#' @export
#'
#' @examples
#' # skewness of the height in EUR2170 data
#' skewness(EUR2170$height, sample = TRUE)
#' # adults only
#' skewness(EUR2170$height[EUR2170$age > 20], sample = TRUE)

skewness <- function(x, sample = FALSE, na.rm = FALSE) {
  calc.moment(x, 3L, sample, na.rm)
}
