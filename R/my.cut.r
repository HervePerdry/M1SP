
my.cut <- function(x, lo = min(x), hi = max(x), n) {
  wi <- (hi - lo)/(n-1)
  lo <- lo - wi/2
  hi <- hi + wi/2
  x <- x[ lo <= x & x <= hi ]
  cut(x, breaks = seq(lo, hi, by = wi), include.lowest = TRUE)
}
