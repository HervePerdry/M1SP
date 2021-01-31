#' Plotting a heatmap for 2D data
#'
#' @param x a numeric vector
#' @param y a numeric vector
#' @param n.x number of bins for x
#' @param n.y number of bins for y
#' @param xlim limits for x
#' @param ylim limits for y
#' @param freq If \code{TRUE}, the number of data points in each bin is printed (if non zero)
#' @param text.cex \code{cex} parameter for printing the frequencies
#' @param ... extra parameters for \code{image}
#'
#' @details plot a
#' @return NULL
#' @export
#'
#' @examples
#' x <- rnorm(500)
#' y <- x + rnorm(500)
#' plotbins(x, y)
#'
plotbins <- function(x, y, n.x = 11, n.y = 11, xlim = range(x), ylim = range(y), freq = TRUE, text.cex = 1, ...) {
  ar <- list(...)
  if(!("xlab" %in% names(ar)))
    ar$xlab <- deparse(substitute(x))
  if(!("ylab" %in% names(ar)))
    ar$ylab <- deparse(substitute(y))

  x1 <- my.cut(x, xlim[1], xlim[2], n.x)
  y1 <- my.cut(y, ylim[1], ylim[2], n.y)
  ar$z <- as.matrix(table(x1, y1))
  ar$x <- seq(xlim[1], xlim[2], length.out = n.x)
  ar$y <- seq(ylim[1], ylim[2], length.out = n.y)

  do.call(image, ar)
  if(freq)
    for(i in 1:nrow(ar$z))
      for(j in 1:ncol(ar$z))
        if(ar$z[i,j] > 0)
          text(ar$x[i],ar$y[j],ar$z[i,j], cex = text.cex)
}

