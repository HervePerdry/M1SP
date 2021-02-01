
calc.moment <- function(x, moment, sample = FALSE, na.rm = FALSE) {
  if(is.matrix(x))
    apply(x, 2, calc.moment, moment = moment, sample = sample, na.rm = na.rm)
  else if(is.data.frame(x))
    sapply(x, calc.moment, moment = moment, sample = sample, na.rm = na.rm)
  else {
    x <- as.double(x)
    b <- is.na(x)
    if(any(b)) {
      if(na.rm)
        x <- x[!b]
      else
       return(NA_real_)
    }

    n <- length(x)
    m <- mean(x)
    if(moment == 2L) {
      if(sample)
        sum((x-m)**2)/n
      else
        sum((x-m)**2)/(n-1)
    } else if(moment == 3L) {
      s <- sd(x)
      m <- mean(x)
      x <- (x - m)/s
      S3 <- sum(x**3)
      if(sample)
        S3/n
      else
        n*S3/( (n-1)*(n-2) )
    } else if(moment == 4L) {
      s <- sd(x)
      m <- mean(x)
      x <- (x - m)/s
      S4 <- sum(x**4)
      if(sample)
        S4/n
      else
        ( n*(n+1)*S4 - 3*(n-1)*(3*n-5) )/( (n-1)*(n-2)*(n-3) )
    } else {
      stop("Bad moment")
    }
  }
}
