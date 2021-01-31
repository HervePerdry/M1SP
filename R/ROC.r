#' Plots A ROC Curve and computes AUC
#'
#' @param formula an object of class formula.
#' @param data an optional data frame containing the variables in the model.
#' @param plot if \code{TRUE}, the function plots the ROC curve
#' @param add if \code{TRUE}, the ROC curve is added to an existing plot
#' @param ... extra parameters for the plot function
#'
#' @return an invisible list with components \code{x} (the specificity),
#' \code{y} (the sensitivity), and \code{AUC} (the AUC).
#' @export
#'
#' @examples
#' ROC(T21 ~ hCG, data = T21)
#' ROC(T21 ~ I(-AFP), T21, add = TRUE, lty = 2)
#' ROC(T21 ~ I(hCG/100 - 6.8*AFP + 51*age.gest + 33*age), data = T21, add = TRUE, col = "red")
#' abline(0,1,lty=3)
#' legend("bottomright", lty = c(1,2,1),
#'        col = c("black", "black", "red"), legend = c("hCG", "-AFP", "all vars"))
ROC <- function( formula, data, plot = TRUE, add = FALSE, ...) {
  data <- model.frame(formula, data)
  if(ncol(data) != 2)
    stop("Can't plot a ROC curve with more than a predictor")

  score <- data[,2]
  status <- data[,1]
  if(!all(status %in% c(0,1)))
    status <- as.integer(as.factor(status)) - 1
  if(!all(status %in% c(0,1)))
    stop("Can't plot a ROC curve for an outcome with more than two values")

  sc <- sort(unique(score), decreasing=TRUE)
  s0 <- score[status == 0]
  s1 <- score[status == 1]
  n0 <- length(s0)
  n1 <- length(s1)
  x <- sapply(sc, function(s) sum(s0 > s))/n0
  y <- sapply(sc, function(s) sum(s1 > s))/n1
  auc <- sum( y[-1]*diff(x))
  L <- list(x = x, y = y, AUC = auc)
  if(plot) {
    if(add)
      lines(L, ...)
    else {
      ar <- list(...)
      if(!("xlab" %in% names(ar)))
        ar$xlab <- "1 - Spécifité"
      if(!("ylab" %in% names(ar)))
        ar$ylab <- "Sensibilité"
      if(!("type" %in% names(ar)))
        ar$type = "l"
      ar$x <- L$x
      ar$y <- L$y
      do.call(plot.default, ar)
    }
  }
  invisible(L)
}
