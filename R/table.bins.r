#' Contingency table after binning data
#'
#' @param x a numeric vector
#' @param y a numeric vector
#' @param n.x number of bins for x
#' @param n.y number of bins for y
#'
#' @return a table object
#' @export
tablebins <- function(x, y,  n.x = 11, n.y = 11) {
  table( my.cut(x, n = n.x), my.cut(y, n = n.y) )
}
