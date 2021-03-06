#' @title Add additional info to 2D-TPP CCR output data 
#' @description Adds additional info to 2D-TPP CCR output data, like counts on how often a 
#'   certain protein was stabilized or destabilized
#' 
#' @return A data frame to which additional data like how often a protein has been (de-)stabilized
#'  has been attached
#' 
#' @examples 
#' load(system.file("example_data/2D_example_data/shortCCRresults.RData", package="TPP"))
#' shortCCRresults <- tpp2dAddAdditionalInfo(data = shortCCRresults, idVar="representative")
#' 
#' @param data output table returned by the \code{tpp2dCurveFit} function
#' @param idVar character string indicating which column of the data table contains unique
#'  protein ids 
#' 
#' @export
tpp2dAddAdditionalInfo <- function(data, idVar = "gene_name"){
  
  # Check for missing function arguments
  checkFunctionArgs(match.call(), c("data"))
  
  ## Initialize variables to prevent "no visible binding for global
  ## variable" NOTE by R CMD check:
  compound_effect <- NULL
  
  data <- data %>%
    group_by_(.dots=idVar) %>%
    mutate(protein_stabilized_count=
             sum((!is.na(compound_effect) & compound_effect=="stabilized")*1)) %>%
    mutate(protein_destabilized_count=
             sum((!is.na(compound_effect) & compound_effect=="destabilized")*1)) %>%
    mutate(no_cpd_effect_count=sum((!is.na(compound_effect))*1))
  
  return(as.data.frame(data))
  
}
