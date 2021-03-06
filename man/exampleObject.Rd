% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exampleObject.R
\docType{data}
\name{exampleObject}
\alias{exampleObject}
\title{An Example Predicted Power Object For Tests}
\format{An object of class \code{PowerExplorerStorage} with 12152 rows and 21 columns.}
\usage{
data(exampleObject)
}
\description{
This is an example PowerExplorerStorage resulted from
an example run on a publically available RNA-Seq datase containing 
the gene expression in C57BL/6J and DBA/2J Mouse Striatum
}
\examples{
data(exampleObject)

show(exampleObject)
plotEstPwr(exampleObject)
}
\keyword{datasets}
