#' @title Example subsets of a Panobinostat TPP-CCR dataset (replicates 1 and 2) and the
#'   corresponding configuration table to start the analysis.
#' @name hdacCCR_smallExample
#' @docType data
#' @description Example dataset obtained by TPP-CCR experiments for analysis by 
#' the TPP-package. It contains all necessary arguments to start the analysis
#' (config table and list of data frames).
#' @seealso \code{\link{hdacCCR_data}}, \code{\link{hdacCCR_config}}
#' @references Franken, H, Mathieson, T, Childs, D. Sweetman, G. Werner, T. Huber, W. & Savitski, M. M. (2015),
#'   Thermal proteome profiling for unbiased identification of drug targets and detection of downstream effectors.
#'   Nature protocols 10(10), 1567-1593.
NULL
#' 
#' @rdname hdacCCR_data
#' @name hdacCCR_data
#' @title TPP-CCR example dataset (replicates 1 and 2)
#' @description Example subset of a Panobinostat TPP-CCR dataset (replicates 1 
#' and 2)
#' @details A list with two subsets of a dataset obtained by TPP-CCR experiments to 
#'   investigate drug effects for HDAC inhibitor Panobinostat. It contains 7 
#'   HDACs as well as a random selection of 493 further proteins.
#'   
#'   You can use this dataset to explore the \code{\link{TPP}} package 
#'   functionalities without invoking the whole time consuming analysis on the 
#'   big dataset.
#'   
#'   The original dataset is located in the folder 
#'   \code{'example_data/CCR_example_data'} in the package's installation 
#'   directory. You can find it on your system by the \code{R} command 
#'   \code{system.file('example_data', package = 'TPP')}.
#'   The measurements were generated by four separate multiplexed TMT 
#'   experiments with 10 TMT labels each.
#'   Quantitative values per protein were obtained by the python  
#'   software isobarQuant and converted to fold changes relative to the lowest 
#'   temperature.
#'   The raw data before quantification can be found in the \code{proteomicsDB}
#'   database (http://www.proteomicsdb.org/#projects/4221/3102) with the following sample mapping:
#'   
#'   \itemize{ 
#'   \item{\code{Panobinostat_1}: }{MS-experiment numbers P97404B02-B10} 
#'   \item{\code{Panobinostat_2}: }{MS-experiment numbers P97414B02-B10} 
#'   }
#'   
#' @seealso \code{\link{hdacCCR_smallExample}}, \code{\link{hdacTR_config}}
#' @references Franken, H, Mathieson, T, Childs, D. Sweetman, G. Werner, T. Huber, W. & Savitski, M. M. (2015),
#'   Thermal proteome profiling for unbiased identification of drug targets and detection of downstream effectors.
#'   Nature protocols 10(10), 1567-1593.
NULL
#' @rdname hdacCCR_config
#' @name hdacCCR_config
#' @title The configuration table to analyze \link{hdacCCR_data}.
#' @description The configuration table to analyze \link{hdacCCR_data}.
#' @details \code{hdacCCR_config} is a data frame that specifies the experiment
#'  names, isobaric labels, and the administered drug concentrations at each
#'  label.
#' @seealso \code{\link{hdacCCR_smallExample}}, \code{\link{hdacCCR_data}}
#' @references Franken, H, Mathieson, T, Childs, D. Sweetman, G. Werner, T. Huber, W. & Savitski, M. M. (2015),
#'   Thermal proteome profiling for unbiased identification of drug targets and detection of downstream effectors.
#'   Nature protocols 10(10), 1567-1593.
NULL