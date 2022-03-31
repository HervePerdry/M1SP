#' One-Way Fisher Anova
#'
#' @param formula an object of class formula.
#' @param data an optional data frame containing the variables in the model.
#'
#' @details This functions performs a one-way Fisher anova. Only
#' for pedagogical illustration, use \code{aov} for your analyses.
#'
#' @return \code{fisher.anova} returns an object of class \code{"fisher.anova"}, which
#' is pretty-printed in a traditional way.
#'
#' @export
#'
#' @examples
#' fisher.anova(Time ~ Groupe, Clearance)
#' # Comparison with `aov` R function
#' summary(aov(Time ~ Groupe, Clearance))
fisher.anova <- function(formula, data = environment(formula)) {
  data <- model.frame(formula, data)
  if(ncol(data) != 2)
    stop("This function is for one-way anova only")
  if(!is.factor(data[,2]))
    data[,2] <- as.factor(data[,2])
  Groups <- tapply(data[,1], data[,2], c)
  N <- sapply(Groups, length)
  n <- sum(N)
  p <- length(Groups)
  Sy <- sapply(Groups, sum)
  Sy2 <- sapply(Groups, function(x) sum(x**2))
  SC <- Sy2 - Sy**2/N
  SCR <- sum(SC)
  CMR <- sum(SCR/(n-p))
  SCT <- sum(Sy2) - sum(Sy)**2/n
  SCF <- SCT - SCR
  CMF <- SCF / (p-1)
  F <- CMF/CMR
  R <- list(factor = names(data)[2], levels = levels(data[,2]), SC = SC, N = N, Sy = Sy, Sy2 = Sy2, n = n, p = p, SCF = SCF, SCR = SCR, SCT = SCT, CMF = CMF, CMR = CMR, F = F)
  class(R) <- "fisher.anova"
  R
}
