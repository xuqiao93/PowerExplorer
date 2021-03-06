% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predictPower.R
\name{predictPower}
\alias{predictPower}
\title{Estimate Power Under Increasing Sample Sizes}
\usage{
predictPower(inputObject, groupVec, isLogTransformed = FALSE,
  dataType = c("RNASeq", "Proteomics"), enableROTS = FALSE,
  paraROTS = list(B = 1000, K = NULL, paired = FALSE, a1 = NULL, a2 = NULL,
  progress = FALSE), minLFC = 0.5, rangeSimNumRep = NA, alpha = 0.05,
  ST = 100, seed = 123, parallel = FALSE, BPPARAM = bpparam(),
  showProcess = FALSE, saveResultData = FALSE)
}
\arguments{
\item{inputObject}{a numeric raw Proteomics abundance data matrix,
in which rows correspond to proteins and columns correspond to samples.}

\item{groupVec}{a vector indicating the grouping of samples}

\item{isLogTransformed}{logical; logical; set to \code{TRUE},
if the input data is log transformed.}

\item{dataType}{"RNASeq" or "Proteomics" indictes the data type of
the input data matrix.}

\item{enableROTS}{logical; if \code{TRUE}, Reproducibility-Optimized
Test Statistic (ROTS) will be used as the statistical model.}

\item{paraROTS}{a \code{list} object containing addtional parameters 
passed to ROTS (if enabled), see \code{\link{ROTS}}.}

\item{minLFC}{LFC threshold}

\item{rangeSimNumRep}{a vector of sample sizes under which power
will be estimated}

\item{alpha}{controlled false positive rate.}

\item{ST}{the number of simulations of abundance data generation and
repeated times of statistical test for each protein (>=100 recommended).}

\item{seed}{an integer seed for the random number generator.}

\item{parallel}{logical; if \code{FALSE} parallelization is disabled;
if \code{TRUE}, parallelize calculations using 
\code{\link{BiocParallel}}.}

\item{BPPARAM}{an optional argument object passed \code{\link{bplapply}}
to indicate the registered cores, if \code{parallel=TRUE}.}

\item{showProcess}{logical; if \code{TRUE},
show the detailed information of
each simulation, used for debugging only.}

\item{saveResultData}{logical; if \code{TRUE}, save the simulated data
into RData with name pattern
"simulated_Data_numRep_X_numSim_XXX_XXXXX.RData".}
}
\value{
a list of power predictions for each sample size, grouped in
comparisons between each two groups
}
\description{
Simlilar to \code{\link{estimatePower}},
power estimations are performed under multiple increasing sample sizes
}
\examples{
# Example 1: a random generated Proteomics dataset (10 DE, 100 non-DE)
data(exampleProteomicsData)
dataMatrix <- exampleProteomicsData$dataMatrix
groupVec <- exampleProteomicsData$groupVec

# Run estimation
# Note: Simulation times(ST) is specified as 5 for shorter example runtime
#       For better performence, ST > 50 is recommended
predictedPower <- predictPower(dataMatrix, groupVec,
                               isLogTransformed=FALSE,
                               dataType="Proteomics",
                               minLFC=0,
                               rangeSimNumRep=c(5, 10, 15),
                               alpha=0.05, ST=5, seed=123)
}
\seealso{
\code{\link{estimatePower}} estimate power based on
actual data
}
