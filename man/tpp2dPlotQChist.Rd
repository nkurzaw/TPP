% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tpp2dPlotQChist.R
\name{tpp2dPlotQChist}
\alias{tpp2dPlotQChist}
\title{Plot quality control histograms}
\usage{
tpp2dPlotQChist(
  configFile = NULL,
  resultTable = NULL,
  resultPath = NULL,
  trRef = NULL,
  fcStr = "rel_fc_",
  idVar = "gene_name",
  qualColName = "qupm"
)
}
\arguments{
\item{configFile}{data frame or system path to table that specifies important details 
of the 2D-TPP experiment}

\item{resultTable}{data.frame containing the results of a CCR analysis of 2D-TPP data}

\item{resultPath}{character string containing a valid system path to which the the qc
plots will be written}

\item{trRef}{character string with a link to a TPP-TR reference object RData file}

\item{fcStr}{character string indicating how columns that will contain the actual 
fold change values are called.}

\item{idVar}{character string indicating name of the columns containing the unique protein 
identifiers}

\item{qualColName}{character string indicating which column contain protein 
identification quality measures}
}
\value{
A pdf with various quality control plots for a specified 2D-TPP data set
}
\description{
Plots quality control histograms of pEC50 values of reference dataset and
  indicates the pEC50 values of the 2D-TPP experiment
}
