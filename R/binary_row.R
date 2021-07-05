#' Binary Row
#'
#' Adds in a binary row to the table.
#' @param list_obj the name of the tbl_start object previously initialized.
#' @param row_var the name of the variable to be used in the rows.
#' @param col_var the variable to be used in the table columns. Default is from initialized tbl_start object.
#' @param newdata enter new dataset name if different from that initialized in tbl_start.
#' @param rowlabels the label for the table row name, if different from row_var.
#' @param summary summary function for the data. Default will compute proportion (N).
#' @param reference the name of the row category to use as the reference. Default will use alphabetical first category.
#' @param missing logical: if TRUE, missing data is considered; FALSE only uses complete cases.
#' @param overall logical: if TRUE, an overall column is included.
#' @param comparison the name of the comparison test to use, if different from that initialized in tbl_start.
#' @param digits significant digits to use.
#' @param indent number of spaces to indent category names.
#' @return A list with the binary row's table information added as a new element to `list_obj`.
#' @import dplyr
#' @keywords tangram.pipe
#' @examples 
#' iris$color <- sample(c("Blue", "Purple"), size=150, replace=TRUE)
#' x <- tbl_start(iris, "Species", missing=TRUE, overall=TRUE, comparison=TRUE) %>%
#'   binary_row("color", rowlabels="Color")
#' @export

binary_row <- function(
  list_obj
  , row_var
  , col_var=NULL
  , newdata=FALSE
  , rowlabels=NULL
  , summary=binary_default
  , reference=NULL
  , missing=NULL
  , overall=NULL
  , comparison=NULL  #Null or function
  , digits=2
  , indent=5
){
  if (is.null(missing)){
    missing <- list_obj[["missing"]]
  }
  if (is.null(overall)){
    overall <- list_obj[["overall"]]
  }
  if (is.null(comparison)){
    comparison <- list_obj[["comparison"]] #Hierarchy of if-else (1. check if comparison not NULL, 2. T/F)
    if (comparison == TRUE){
      comparison <- binary_diff
    }
  }

  if (is.null(col_var)){
    col_var <- list_obj[["col_var"]]
    num_col <- list_obj[['num_col']]
  } else {
    if (class(newdata) == 'logical'){
      num_col <- list_obj[['data']][col_var] %>%
        filter(!is.na(list_obj[['data']][col_var])) %>%
        unique() %>%
        nrow()
    }
  }
  if (class(newdata) == 'logical'){
    data <- list_obj[['data']][,c(row_var, col_var)]
  } else {
    data <- newdata[,c(row_var, col_var)]
    if (!is.null(col_var)){
      num_col <- data[col_var] %>%
        filter(!is.na(data[col_var])) %>%
        unique() %>%
        nrow()
    } else {
      num_col <- 1
    }
  }
  if (is.null(rowlabels)){
    if (is.null(dim(data))) {
      if  (!is.null(attr(data, "label"))){
        rowlabels <- attr(data, "label")
      } else {
        rowlabels <- row_var
      }
    } else {
      if (!is.null(attr(data[,1], "label"))) {
        rowlabels <- attr(data[,1], "label")
      } else {
        rowlabels <- row_var
      }
    }
  }
  
  if (!is.null(col_var)){
    data[,2] <- as.factor(data[,2])
  }
  
  #Default summary function will take % (N)

  #Calculations
  if (is.null(reference)){
    if (is.null(col_var)){
      reference = sort(unique(data))[1]
    } else {
      reference = sort(unique(data[,1]))[1]
    }
  }
  binary_out <- summary(data, reference, rowlabels, missing, digits)
  if (overall == FALSE){
    binary_out <- binary_out[,-ncol(binary_out)]
  }

  if (class(comparison) == "function" & num_col > 1){
    comp <- comparison(data, num_col, reference, digits)
    for (i in 1:ncol(comp)){
      binary_out$compare <- ""
      binary_out$compare[1] <- comp[i]
      binary_out$compare <- as.character(binary_out$compare)
      colnames(binary_out)[ncol(binary_out)] <- colnames(comp)[i]
    }
    colnames(binary_out)[ncol(binary_out)] <- "Compare: All Groups"
  }
  
  idt <- paste(rep(" ", indent), collapse="")
  binary_out[,1] <- ifelse(binary_out[,2]=="" & binary_out[,1] != "", paste0(idt, binary_out[,1]), binary_out[,1])

  list_obj[[length(list_obj) + 1]] <- binary_out
  return(list_obj)
}