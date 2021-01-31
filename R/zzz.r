#' Galton Height Data
#'
#' This data set is reconstitued from Galton data tables on heights in families.
#' The variables are
#' \itemize{
#' \item Family: The family that the child belongs to, labeled from 1 to 204 and 136A
#' \item Father: The father's height, in inches
#' \item Mother: The mother's height, in inches
#' \item Gender: The gender of the child, male (M) or female (F)
#' \item Height: The height of the child, in inches
#' \item Kids: The number of kids in the family of the child
#' }
#' @docType data
#' @keywords Galton
#' @name Galton
#' @aliases Galton
#' @usage data(Galton)
#' @format Data frame
#' @references \url{http://www.randomservices.org/random/data/Galton.html} and
#' \url{http://www.medicine.mcgill.ca/epidemiology/hanley/galton/}
#'
NULL

#' Trisomy 21 data
#'
#' This data set is a case/control data set for T21 status.
#' #' The variables are
#' \itemize{
#' \item age Mother's age
#' \item age.gest Gestationnal age (in weeks)
#' \item AFP Alphafoetoprotein
#' \item hCG human chorionic gonadotropin
#' \item T21 T21 status
#' }
#' @docType data
#' @keywords T21
#' @name T21
#' @aliases T21
#' @usage data(T21)
#' @format Data frame
#' @references Françoise Jauzein, \url{http://acces.ens-lyon.fr/}
#'
NULL

#' French 1643 data
#'
#' This is a data set of 1643 French individuals. Data are self-reported.
#' The variables are \code{sex}, \code{age}, \code{prof} (the profession),
#' \code{dept} (département in which the person is living), \code{dip} (last
#' diploma obtained), \code{children} (the number of children), \code{height}
#' (in cm), and \code{weight} (in kg).
#' @docType data
#' @name FR1643
#' @aliases FR1643
#' @usage data(FR1643)
#' @format Data frame
NULL

#' European 2170 data
#'
#' This is a data set of 2170 european individuals.
#' The variables are \code{birth} (the date of birth), \code{country}, \code{sex},
#' \code{height}, \code{weight}, and \code{age}.
#' @docType data
#' @name EUR2170
#' @aliases EUR2170
#' @usage data(EUR2170)
#' @format Data frame
NULL

#' Global Lakes and Wetlands Data
#'
#' This data set gives the size and the coordinates of 248613 lakes and bodies of water,
#' combining the GLWD-1 and GLWD-2 datasets.
#' The variables are \code{id} (a numerical id), \code{type}, \code{name},
#' \code{area.km2}, \code{perim.km}, \code{long} and \code{lat}.
#' @docType data
#' @name GLWD
#' @aliases GLWD
#' @usage data(GLWF)
#' @format Data frame
#' @references \url{https://www.worldwildlife.org/pages/global-lakes-and-wetlands-database}
