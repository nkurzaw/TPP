% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analyzeTPPCCR.R
\name{analyzeTPPCCR}
\alias{analyzeTPPCCR}
\title{Analyze TPP-CCR experiment}
\usage{
analyzeTPPCCR(
  configTable,
  data = NULL,
  resultPath = NULL,
  idVar = "gene_name",
  fcStr = "rel_fc_",
  naStrs = c("NA", "n/d", "NaN", "<NA>"),
  qualColName = "qupm",
  normalize = TRUE,
  ggplotTheme = tppDefaultTheme(),
  nCores = "max",
  nonZeroCols = "qssm",
  r2Cutoff = 0.8,
  fcCutoff = 1.5,
  slopeBounds = c(1, 50),
  plotCurves = TRUE,
  verbose = FALSE,
  xlsxExport = TRUE,
  fcTolerance = 0.1
)
}
\arguments{
\item{configTable}{dataframe, or character object with the path to a file, 
that specifies important details of the TPP-CCR experiment. See Section 
\code{details} for instructions how to create this object.}

\item{data}{single dataframe, containing fold change measurements and 
additional annotation columns to be imported. Can be used instead of 
specifying the file path in the \code{configTable} argument.}

\item{resultPath}{location where to store dose-response curve plots and 
results table.}

\item{idVar}{character string indicating which data column provides the 
unique identifiers for each protein.}

\item{fcStr}{character string indicating which columns contain the actual 
fold change values. Those column names containing the suffix \code{fcStr} 
will be regarded as containing fold change values.}

\item{naStrs}{character vector indicating missing values in the data table. 
When reading data from file, this value will be passed on to the argument 
\code{na.strings} in function \code{read.delim}.}

\item{qualColName}{character string indicating which column can be used for 
additional quality criteria when deciding between different non-unique 
protein identifiers.}

\item{normalize}{perform median normalization (default: TRUE).}

\item{ggplotTheme}{ggplot theme for dose response curve plots.}

\item{nCores}{either a numerical value given the desired number of CPUs, or 
'max' to automatically assign the maximum possible number (default).}

\item{nonZeroCols}{character string indicating a column that will be used for
filtering out zero values.}

\item{r2Cutoff}{Quality criterion on dose response curve fit.}

\item{fcCutoff}{Cutoff for highest compound concentration fold change.}

\item{slopeBounds}{Bounds on the slope parameter for dose response curve 
fitting.}

\item{plotCurves}{boolean value indicating whether dose response curves should
be plotted. Deactivating plotting decreases runtime.}

\item{verbose}{print name of each fitted or plotted protein to the command 
line as a means of progress report.}

\item{xlsxExport}{produce results table in xlsx format and store at the 
location specified by the \code{resultPath} argument.}

\item{fcTolerance}{tolerance for the fcCutoff parameter. See details.}
}
\value{
A data frame in which the fit results are stored row-wise for each
  protein.
}
\description{
Performs analysis of a TPP-CCR experiment by invoking routines 
  for data import, data processing, normalization, curve fitting, and 
  production of the result table.
}
\details{
Invokes the following steps: \enumerate{ \item Import data using the
  \code{\link{tppccrImport}} function. \item Perform normalization by fold 
  change medians (optional) using the \code{\link{tppccrNormalize}} function.
  To perform normalization, set argument \code{normalize=TRUE}. \item Fit and
  analyze dose response curves using the \code{\link{tppccrCurveFit}} 
  function. \item Export results to Excel using the \code{\link{tppExport}} 
  function. }
  
  The default settings are tailored towards the output of the python package 
  isobarQuant, but can be customized to your own dataset by the arguments 
  \code{idVar, fcStr, naStrs, qualColName}.
  
  If \code{resultPath} is not specified, result files are stored at the path 
  defined in the first entry of \code{configTable$Path}. If the input data are not 
  specified in \code{configTable}, no result path will be set. This means 
  that no output files or dose response curve plots are produced and 
  \code{analyzeTPPCCR} just returns the results as a data frame.
  
  The function \code{analyzeTPPCCR} reports intermediate results to the 
  command line. To suppress this, use \code{\link{suppressMessages}}.
  
The dose response curve plots will be stored in a subfolder with 
  name \code{DoseResponse_Curves} at the location specified by 
  \code{resultPath}.
  
Only proteins with fold changes bigger than
\code{[fcCutoff * (1 - fcTolerance)} or smaller than 
\code{1/(fcCutoff * (1 - fcTolerance))]} will be used for curve fitting.
Additionally, the proteins fulfilling the fcCutoff criterion without 
tolerance will be marked in the output column \code{meets_FC_requirement}.
}
\examples{
data(hdacCCR_smallExample)
tppccrResults <- analyzeTPPCCR(configTable=hdacCCR_config, 
                               data=hdacCCR_data, nCores=1)
  
}
\references{
Savitski, M. M., Reinhard, F. B., Franken, H., Werner, T., 
  Savitski, M. F., Eberhard, D., ... & Drewes, G. (2014). Tracking cancer 
  drugs in living cells by thermal profiling of the proteome. Science, 
  346(6205), 1255784.
  
  Franken, H, Mathieson, T, Childs, D. Sweetman, G. Werner, T. Huber, W. & Savitski, M. M. (2015),
  Thermal proteome profiling for unbiased identification of drug targets and detection of downstream effectors.
  Nature protocols 10(10), 1567-1593.
}
\seealso{
tppDefaultTheme
}
