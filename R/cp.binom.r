#' Coverage probability of binomial confidence interval procedure
#'
#' @param n first parameter of the binomial (number of Bernoulli trials)
#' @param p second parameter of the binomial (probability of success)
#' @param CI a string giving the confidence interval procedure name, or a custom function
#' @param ... extra arguments for CI (typically, \code{correct} for continuity correction
#' and \code{conf.level} for confidence level)
#'
#' @details If \code{CI} is a function, its two first arguments should be
#' \code{x} and \code{n}, as in \code{prop.test}, \code{binom.test}, \code{binom.conf.int}.
#' If its a string, the corresponding procedure is obtained through
#' a call to \code{binom.conf.int}.
#'
#' @return A data frame giving the coverage probability and mean interval width of
#' the chosen procedure for the various
#' values of \code{n} and \code{p} provided.
#' @export
#'
#' @examples
#' # Wald procedure for p = 0.1 and n from 1 to 100, with or without continuity correction
#' P.wald <- cp.binom(1:100, 0.1, "wald")
#' P.wald.cc <- cp.binom(1:100, 0.1, "wald", correct = TRUE)
#' plot(1:100, P.wald$cov.prob, type = "l", ylim = c(0,1), xlab = "n",
#'      ylab = "coverage probability", main = "Wald Confidence Interval")
#' lines(1:100, P.wald.cc$cov.prob, col = "red")
#' abline(h = 0.95, lty = 3)
#' legend("bottomright", col = c("black", "red"), lty = 1,
#'        legend = c("wald", "wald cc"))
#'
#' # Comparison of Wald and Arcsine procedures (with continuity correction)
#' p <- seq(0,1,length=501)
#' P.wald.10 <- cp.binom(10, p, "wald", correct = TRUE)
#' P.arcs.10 <- cp.binom(10, p, "arcs", correct = TRUE)
#' plot(p, P.wald.10$cov.prob, ylim = c(0.5,1), type = "l", main = "n = 10",
#'      ylab = "coverage probability")
#' lines(p, P.arcs.10$cov.prob, col = "red")
#' abline(h = 0.95, lty = 3)
#' legend(0.4, 0.6, c("Wald", "Arcsine"), lty = 1, col = c("black", "red"), bty = "n")
#'
#' P.wald.50 <- cp.binom(50, p, "wald", correct = TRUE)
#' P.arcs.50 <- cp.binom(50, p, "arcs", correct = TRUE)
#' plot(p, P.wald.50$cov.prob, ylim = c(0.5,1), type = "l", main = "n = 50",
#'      ylab = "coverage probability")
#' lines(p, P.arcs.50$cov.prob, col = "red")
#' abline(h = 0.95, lty = 3)
#' legend(0.4, 0.6, c("Wald", "Arcsine"), lty = 1, col = c("black", "red"), bty = "n")

cp.binom <- function(n, p, CI = c("wald", "wilson", "clopper-pearson", "arcsine"), ...) {
  if(is.character(CI)) {
    CIt <- match.arg(CI)
    CI <- function(x, n, ...) binom.conf.int(x, n, CIt, ...)
  }
  if(!is.function(CI)) {
    stop("CI should be a string or a function")
  }
  if(length(n) > 1 & length(p) > 1) {
    r <- mapply(cp.binom.0, n, p, MoreArgs = c(list(CI = CI), list(...)))
  } else if(length(n) > 1) {
    r <- sapply(n, cp.binom.0, p = p, CI = CI, ...)
  } else {
    r <- cp.binom.0(n, p, CI, ...)
  }
  data.frame(n = n, p = p, cov.prob = r["cov.prob",],
             mean.width = r["mean.width",])
}

cp.binom.0 <- function(n, p, CI, ...) {
  X <- 0:n
  f <- function(x) {
    res <- CI(x, n = n, ...)
    if(is.list(res))
      res$conf.int
    else
      res
  }
  R <- data.frame( t(sapply(X, f) ))
  cov.prob <- numeric(length(p))
  mean.width <- numeric(length(p))
  for(i in seq_along(p)) {
    P <- dbinom(X, n, p[i])
    cov.prob[i] <- sum( P * (R$X1 <= p[i] & p[i] <= R$X2) )
    mean.width[i] <- sum(P * (R$X2 - R$X1))
  }
  if(length(p) > 1)
    rbind(cov.prob = cov.prob, mean.width = mean.width)
  else
    c(cov.prob = cov.prob, mean.width = mean.width)
}
