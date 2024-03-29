#' JAMA-style summary for a Categorical Row
#' 
#' Summarizes a categorical row using column percentages and the total number in each cell divided by the column total. This is the style used by the Journal of the American Medical Association.
#' @param dt the name of the dataframe object.
#' @param ... Additional arguments supplied within the package row functions.
#' @return A dataframe with summary statistics for a categorical variable.
#' @details This is an internal function of `tangram.pipe`. Additional arguments 
#' should be supplied for this function to work properly.
#' 
#' `rowlabel` : the label for the table row name, if different from row_var.
#' 
#' `missing` : if TRUE, missing data is considered; FALSE only uses complete cases.
#' 
#' `ordering` : Sorts the row variable: options are "ascending" or "descending"
#' 
#' `sortvar` : Column to sort row on. Requires `ordering` to be `ascending` or `descending`. By default, will sort based on overall statistics.
#' 
#' `digits` : significant digits to use.
#' @seealso Additional prewritten summary functions for categorical data: \link[tangram.pipe]{cat_default}, \link[tangram.pipe]{cat_pct}, \link[tangram.pipe]{cat_count}
#' @import dplyr
#' @keywords tangram.pipe
#' @export

cat_jama <- function(dt, ...){
  dots <- list(...)
  rowlabel <- dots$rowlabel
  missing <- dots$missing
  digits <- dots$digits
  ordering <- dots$ordering
  sortcol <- dots$sortcol
  rnd <- paste0("%.", digits, "f")
  
  nocols <- FALSE
  if (is.null(ncol(dt))){
    nocols <- TRUE
    dt <- data.frame(x = dt) %>% 
      mutate(y= 1:n() %% 2)
  }
  
  dt <- filter(dt, !is.na(dt[,2]))
  if (is.null(sortcol)) {sortcol <- "Overall"}
  if (sortcol != "Overall" & !(sortcol %in% dt[,2])) {
    message <- cat("Sorting column", sortcol, "not found, sorting by overall instead\n")
    message
    sortcol <- "Overall"
  }
  if (is.null(ordering)) {ordering <- "none"}
  
  ct <- dt %>%
    table(useNA=ifelse(missing==TRUE, "ifany", "no")) %>%
    as.matrix() %>%
    cbind(Overall=dt %>%
            table(useNA=ifelse(missing==TRUE, "ifany", "no")) %>%
            rowSums())
  if (ordering == "ascending") {ct <- ct[order(ct[,sortcol], decreasing = FALSE),]}
  if (ordering == "descending") {ct <- ct[order(ct[,sortcol], decreasing = TRUE),]}
  
  total.ct <- rep(colSums(ct), nrow(ct)) %>%
    matrix(ncol = nrow(ct)) %>%
    t()
  
  prop <- dt %>%
    table(useNA=ifelse(missing==TRUE, "ifany", "no")) %>%
    prop.table(margin=2) %>%
    as.matrix() %>%
    cbind(Overall=dt %>%
            table(useNA=ifelse(missing==TRUE, "ifany", "no")) %>%
            prop.table() %>%
            rowSums())
  if (ordering == "ascending") {prop <- prop[order(prop[,sortcol], decreasing = FALSE),]}
  if (ordering == "descending") {prop <- prop[order(prop[,sortcol], decreasing = TRUE),]}
  
  prop <- prop * 100
  
  cols <- unlist(dimnames(prop)[2])
  out <- matrix(paste0(sprintf(rnd, prop), " (", sprintf("%1.0f/%1.0f", ct, total.ct), ")"), 
                nrow=nrow(prop), dimnames = list(NULL,cols)) %>%
    as.data.frame() 
  
  out <- cbind(dimnames(prop)[1], out)
  
  row1 <- c(paste(rowlabel), rep("", ncol(out)-1))
  out <- rbind(row1, out)
  
  if (missing == TRUE){
    out[is.na(out[,1]),1] <- "Missing"
    out <- rbind(out[out[,1] != "Missing",], out[out[,1] == "Missing",])
    rownames(out) <- NULL
  }
  out <- cbind(out[,1], Measure="", out[,(2:ncol(out))])
  out$Measure[1] <- "Pct. (n/N)"
  colnames(out)[1] <- "Variable"
  if (nocols == TRUE){
    out <- out[,-c(3,4)]
  }
  out
}
