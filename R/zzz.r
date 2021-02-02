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

#' Trisomy 21
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

#' French individuals biometrical data
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

#' European individuals biometrical data
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

#' Global Lakes and Wetlands
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
NULL

#' Halley mortality table
#'
#' This historical table was established by Halley in 1693, using data
#' transmitted by Caspar Neumann. It gives the number of individuals
#' reaching a given age, on a total of 1328 births, in the city of Breslau
#' (now Wrocław, in Poland).
#' The variables are \code{age}, going from 1 to 84, and \code{number},
#' the number of individuals.
#' This table is in fact a population pyramid. Assuming population
#' stationarity, mortality rates can be deduced.
#' For ages above 107, Halley states only that there are a total of
#' 107 individuals. A plausible completion of the table is given
#' in the examples section.
#' @docType data
#' @name Halley
#' @aliases Halley
#' @usage data(Halley)
#' @format Data frame
#' @references Nicolas Bacaër, Histoires de mathématiques et de population, Cassini, 2008.
#' La table de mortalité d'E. Halley, présentée par J. Dupaquier,
#' Annales de démographie historique, 1976.
#' @examples
#' # survival function
#' S <- c(1, Halley$number/1238)
#' plot(0:84, S, type = "l", xlab = "t", ylab = "S(t)")
#' # life expectancy
#' sum(S)
#' # completing the table above age 84
#' P <- c(Halley$number,18,16,14,13,11,9,8,6,5,3,2,1,1)
#' S <- c(1, P/1238)
#' sum(S)
NULL

#' Odier Mortality table
#'
#' This table gives the number of deaths in Genève, by age and sex,
#' for the years 1778 and 1779.
#'
#' @docType data
#' @name Odier
#' @aliases Odier
#' @usage data(Odier)
#' @format Data frame
#' @references Louis Odier, Extrait mortuaire de Genève pour les années 1778 et 1779,
#' Mémoires de la société établie à Genève pour l'encouragement des arts et de l'agriculture, 1780.
#' \url{https://books.google.fr/books?id=cBUGAAAAQAAJ&pg=PA144}
NULL
