#' Binomial prediction interval
#' 
#' @param n number of Bernoulli trials
#' @param p probability of success
#' @param level level of confidence 
#'
#' @examples p <- seq(0,1,length = 1001)
#' IP <- binom.prediction(19, p)
#' plot(p, 19*p, type = "n", ylab = "x", main = "prediction intervals")
#' polygon( c(p, rev(p)), c(IP[1,], rev(IP[2,])), col = "red")
#' @export 
binom.prediction <- function(n, p, level = 0.95) {
  if(length(p) > 1)
    return(sapply(p, \(x) binom.prediction(n, x, level)))

  a <- (1 - level)/2
  x <- 0:n
  P <- pbinom(x, n, p)
  if(all(P > a)) 
    x1 <- 0
  else 
    x1 <- x[ tail(which(P <= a),1) ] + 1
  x2 <- x[ which(P > 1-a)[1]  ]

  c(x1, x2) 
}

