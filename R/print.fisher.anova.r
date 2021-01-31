#' Pretty Print Fisher Anova
#'
#' @param x an object of class \code{"fisher.anova"}
#'
#' @return Returns a \code{NULL} object.
#' @export
#'
print.fisher.anova <- function(x) {
  cat("Résumé des données\n")
  cat("------------------\n")
  D <- data.frame(n = x$N, Sy = x$Sy, Sy2 = x$Sy2, SC = x$SC)
  rownames(D) <- x$levels
  printCoefmat(D)

  cat("\nTable de Fisher")
  cat("\n---------------\n")
  D <- data.frame( SC = c(x$SCF, x$SCR, x$SCT), ddl = c(x$p-1, x$n-x$p, x$n-1),
                   CM = c(x$CMF, x$CMR, NA), F = c(x$F, NA, NA), p = c(pf(x$F, x$p-1, x$n-x$p, lower.tail = FALSE), NA, NA))
  rownames(D) <- c(x$factor, "Residuel", "Total")
  printCoefmat(D, na.print = "", P.values  = TRUE, has.Pvalue = TRUE)
  NULL
}
