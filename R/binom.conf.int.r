#' Confidence interval for the binomial parameter p
#'
#' @param x number of successes
#' @param n number of Bernoulli trials
#' @param proc which confidence interval procedure to use
#' @param conf.level confidence level for the returned confidence interval
#' @param correct a logical indicating whether continuity correction should be applied
#'
#' @details The Wald procedure is the textbook procedure for confidence intervals.
#' Arcsine procedure is obtained through the variance stabilizing transformation \eqn{arcsine(sqrt(p))}.
#' Wilson and Clopper-Pearson procedures are obtained through the functions \code{prop.test}
#' and \code{binom.test} respectively.
#'
#' @return a numeric vector of length 2, giving the bounds of the confidence interval
#' @export
#'
#' @examples
#' binom.conf.int(4, 10, "wald")
#' binom.conf.int(4, 10, "wilson")
#' binom.conf.int(4, 10, "arcsine")
#' binom.conf.int(4, 10, "clopper")
#' @export
binom.conf.int <- function(x, n, proc = c("wald", "arcsine", "wilson", "clopper-pearson"), conf.level = 0.95, correct = FALSE) {
  method <- match.arg(proc)
  if(method == "wilson")
    return( prop.test(x, n, conf.level = conf.level, correct = correct)$conf.int )
  if(method == "clopper-pearson") {
    if(correct)
      warning("correct = TRUE is ignored for clopper-pearson confidence interval")
    return( binom.test(x, n, conf.level = conf.level)$conf.int )
  }
  p <- x/n
  z <- qnorm(.5 + conf.level/2)
  if(method == "wald") {
    lo <- p - z*sqrt(p*(1-p)/n)
    hi <- p + z*sqrt(p*(1-p)/n)
    lo <- if(correct) lo - .5/n else lo
    hi <- if(correct) hi + .5/n else hi
    return( c(max(0, lo), min(1, hi)) )
  }
  if(method == "arcsine") {
    p.lo <- if(correct) p - 0.5/n else p
    p.hi <- if(correct) p + 0.5/n else p
    lo <- if(p == 0) 0 else sin(asin(sqrt(p.lo)) - 0.5*z/sqrt(n))**2
    hi <- if(p == 1) 1 else sin(asin(sqrt(p.hi)) + 0.5*z/sqrt(n))**2
    return( c(lo, hi) )
  }
}
