#' Variance
#'
#' @param x numerical vector.
#' @param sample logical. Compute sample variance or apply correction?
#' @param na.rm logical. Should missing values be removed?
#'
#' @return The variance, with ou whithout sample correction.
#' @export
#'
#' @examples
#' # variance of the height in EUR2170 data
#' variance(EUR2170$height, sample = TRUE)
#' # adults only
#' he <- subset(EUR2170, age > 20, "height")
#' variance(he, sample = TRUE)
#' # males and females separately
#' heM <- subset(EUR2170, age > 20 & sex == "M", "height")
#' heF <- subset(EUR2170, age > 20 & sex == "F", "height")
#' variance(heM, sample = TRUE)
#' variance(heF, sample = TRUE)

variance <- function(x, sample = FALSE, na.rm = FALSE) {
  calc.moment(x, 2L, sample, na.rm)
}
