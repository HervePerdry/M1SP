% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cp.binom.r
\name{cp.binom}
\alias{cp.binom}
\title{Coverage probability of binomial confidence interval procedure}
\usage{
cp.binom(n, p, CI = c("wald", "wilson", "clopper-pearson", "arcsine"), ...)
}
\arguments{
\item{n}{first parameter of the binomial (number of Bernoulli trials)}

\item{p}{second parameter of the binomial (probability of success)}

\item{CI}{a string giving the confidence interval procedure name, or a custom function}

\item{...}{extra arguments for CI (typically, \code{correct} for continuity correction
and \code{conf.level} for confidence level)}
}
\value{
A data frame giving the coverage probability and mean interval width of
the chosen procedure for the various
values of \code{n} and \code{p} provided.
}
\description{
Coverage probability of binomial confidence interval procedure
}
\details{
If \code{CI} is a function, its two first arguments should be
\code{x} and \code{n}, as in \code{prop.test}, \code{binom.test}, \code{binom.conf.int}.
If its a string, the corresponding procedure is obtained through
a call to \code{binom.conf.int}.
}
\examples{
# Wald procedure for p = 0.1 and n from 1 to 100, with or without continuity correction
P.wald <- cp.binom(1:100, 0.1, "wald")
P.wald.cc <- cp.binom(1:100, 0.1, "wald", correct = TRUE)
plot(1:100, P.wald$cov.prob, type = "l", ylim = c(0,1), xlab = "n",
     ylab = "coverage probability", main = "Wald Confidence Interval")
lines(1:100, P.wald.cc$cov.prob, col = "red")
abline(h = 0.95, lty = 3)
legend("bottomright", col = c("black", "red"), lty = 1,
       legend = c("wald", "wald cc"))

# Comparison of Wald and Arcsine procedures (with continuity correction)
p <- seq(0,1,length=501)
P.wald.10 <- cp.binom(10, p, "wald", correct = TRUE)
P.arcs.10 <- cp.binom(10, p, "arcs", correct = TRUE)
plot(p, P.wald.10$cov.prob, ylim = c(0.5,1), type = "l", main = "n = 10",
     ylab = "coverage probability")
lines(p, P.arcs.10$cov.prob, col = "red")
abline(h = 0.95, lty = 3)
legend(0.4, 0.6, c("Wald", "Arcsine"), lty = 1, col = c("black", "red"), bty = "n")

P.wald.50 <- cp.binom(50, p, "wald", correct = TRUE)
P.arcs.50 <- cp.binom(50, p, "arcs", correct = TRUE)
plot(p, P.wald.50$cov.prob, ylim = c(0.5,1), type = "l", main = "n = 50",
     ylab = "coverage probability")
lines(p, P.arcs.50$cov.prob, col = "red")
abline(h = 0.95, lty = 3)
legend(0.4, 0.6, c("Wald", "Arcsine"), lty = 1, col = c("black", "red"), bty = "n")
}
