## ---- eval=FALSE--------------------------------------------------------------
#  install.packages("tangram.pipe")

## ---- warning=FALSE-----------------------------------------------------------
suppressPackageStartupMessages(require(tangram.pipe))
suppressPackageStartupMessages(require(knitr))
suppressPackageStartupMessages(require(kableExtra))

## ---- echo = FALSE------------------------------------------------------------
set.seed(04082022)

## -----------------------------------------------------------------------------
iris$color <- sample(c("Blue", "Purple"), size=150, replace=TRUE)
iris$Stem.Size <- sample(c("Small", "Medium", "Medium", "Large"), size=150, replace=TRUE)
iris[149,5] <- NA
iris[150,c(1:4, 6:7)] <- NA
head(iris) %>% 
  kable(escape=F, align="c") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## -----------------------------------------------------------------------------
tbl1 <- tbl_start(data=iris, 
                  col_var="Species", 
                  missing=FALSE, 
                  overall=TRUE, 
                  comparison=FALSE,
                  digits = 2,
                  default_num_summary = num_default,
                  default_cat_summary = cat_default,
                  default_binary_summary = binary_default)

## -----------------------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  num_row(row_var="Sepal.Length", rowlabel="Sepal Length") %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## -----------------------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  num_row(row_var="Sepal.Length", rowlabel="Sepal Length", digits=4) %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## -----------------------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  num_row(row_var="Sepal.Length", rowlabel="Sepal Length", missing=TRUE) %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## ---- eval = FALSE------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    num_row(row_var="Sepal.Length", rowlabel="Sepal Length", comparison=num_diff) %>%
#    tbl_out()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"))

## ---- echo = FALSE------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  num_row(row_var="Sepal.Length", rowlabel="Sepal Length", comparison=num_diff) %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered")) %>%
  column_spec(c(7:9), width_min = "1.5in")

## -----------------------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  cat_row("Stem.Size", rowlabel="Stem Size") %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## -----------------------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  cat_row("Stem.Size", rowlabel="Stem Size", missing=TRUE) %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## -----------------------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  cat_row("Stem.Size", rowlabel="Stem Size (Ascending by versicolor)", missing=TRUE, 
          ordering = "ascending", sortcol = "versicolor") %>%
  cat_row("Stem.Size", rowlabel="Stem Size (Descending by overall count)", missing=TRUE, 
          ordering = "descending") %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## ---- eval = FALSE------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    cat_row("Stem.Size", rowlabel="Stem Size", comparison=cat_comp_default) %>%
#    tbl_out()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"))

## ---- echo = FALSE------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  cat_row("Stem.Size", rowlabel="Stem Size", comparison=cat_comp_default) %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered")) %>%
  column_spec(c(2:6), width_min = "1.1in") %>%
  column_spec(7, width_min = "1.5in")

## -----------------------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  binary_row("color", rowlabel = "Color") %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## -----------------------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  binary_row("color", rowlabel = "Color", reference="Purple") %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## -----------------------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  binary_row("color", rowlabel = "Color", compact = FALSE) %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## ---- eval = FALSE------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    binary_row("color", comparison=binary_diff) %>%
#    tbl_out()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"))

## ---- echo = FALSE------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  binary_row("color", comparison=binary_diff) %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered")) %>%
  column_spec(1, width_min = "1in") %>%
  column_spec(c(2:6), width_min = "1.1in") %>%
  column_spec(7, width_min = "1.75in") %>%
  column_spec(c(8:9), width_min = "1.5in")

## ---- eval = FALSE------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    binary_row("color", comparison=binary_or) %>%
#    tbl_out()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"))

## ---- echo = FALSE------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  binary_row("color", comparison=binary_or) %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered")) %>%
  column_spec(1, width_min = "1in") %>%
  column_spec(c(2:7), width_min = "1.1in") %>%
  column_spec(c(8:9), width_min = "1.25in")

## ---- eval = FALSE------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    binary_row("color", comparison=binary_rr) %>%
#    tbl_out()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"))

## ---- echo = FALSE------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  binary_row("color", comparison=binary_rr) %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered")) %>%
  column_spec(1, width_min = "1in") %>%
  column_spec(c(2:7), width_min = "1.1in") %>%
  column_spec(c(8:9), width_min = "1.25in")

## -----------------------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  n_row() %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## ----eval=FALSE---------------------------------------------------------------
#  tbl1 <- tbl1 %>% empty_row()

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(
#                    data = iris,
#                    col_var = "Species",
#                    missing=FALSE,
#                    overall=TRUE,
#                    comparison=TRUE,
#                    default_num_summary = num_default,
#                    default_cat_summary = cat_pct,
#                    default_binary_summary = binary_default) %>%
#    n_row() %>%
#    num_row("Sepal.Length", rowlabel="Sepal Length") %>%
#    empty_row('<i>No rowlabel, 3 decimal places</i>') %>%
#    num_row("Sepal.Width", digits=3) %>%
#    empty_row("<i>No comparison test used, Min-Max summary</i>") %>%
#    num_row("Petal.Length", rowlabel="Petal Length", summary = num_minmax, comparison=FALSE) %>%
#    empty_row("<i>Missing data considered, mean/Std. Dev summary</i>") %>%
#    num_row("Petal.Width", rowlabel="Petal Width", summary = num_mean_sd, missing=TRUE) %>%
#    cat_row("Stem.Size", rowlabel="Stem Size", missing=TRUE) %>%
#    empty_row("<i>No rowlabels, indent 3 spaces, odds ratio as test</i>") %>%
#    binary_row("color", missing = TRUE, comparison=binary_or, indent=3) %>%
#    tbl_out()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"))

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start( 
                  data = iris, 
                  col_var = "Species", 
                  missing=FALSE, 
                  overall=TRUE, 
                  comparison=TRUE,
                  default_num_summary = num_default,
                  default_cat_summary = cat_pct,
                  default_binary_summary = binary_default) %>%
  n_row() %>%
  num_row("Sepal.Length", rowlabel="Sepal Length") %>%
  empty_row('<i>No rowlabel, 3 decimal places</i>') %>%
  num_row("Sepal.Width", digits=3) %>%
  empty_row("<i>No comparison test used, Min-Max summary</i>") %>%
  num_row("Petal.Length", rowlabel="Petal Length", summary = num_minmax, comparison=FALSE) %>%
  empty_row("<i>Missing data considered, mean/Std. Dev summary</i>") %>%
  num_row("Petal.Width", rowlabel="Petal Width", summary = num_mean_sd, missing=TRUE) %>%
  cat_row("Stem.Size", rowlabel="Stem Size", missing=TRUE) %>%
  empty_row("<i>No rowlabels, indent 3 spaces, odds ratio as test</i>") %>%
  binary_row("color", missing = TRUE, comparison=binary_or, indent=3) %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered")) %>%
  column_spec(1, width_min = "1.5in") %>%
  column_spec(c(2:6), width_min = "1.3in") %>%
  column_spec(c(7:9), width_min = "1.5in")

## -----------------------------------------------------------------------------
tbl1 <- tbl_start(iris, NULL, missing=FALSE, overall=TRUE, comparison=FALSE) %>%
  n_row() %>%
  num_row("Sepal.Length", rowlabel="Sepal Length") %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>%
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## -----------------------------------------------------------------------------
sepaldat <- iris %>% select(-c(Petal.Length, Petal.Width))
petaldat <- iris %>% select(-c(Sepal.Length, Sepal.Width))

## -----------------------------------------------------------------------------
tbl1 <- tbl_start(sepaldat, "Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
  num_row("Sepal.Length", rowlabel="Sepal Length") %>%
  num_row("Sepal.Width", rowlabel="Sepal Width") %>%
  empty_row(header="Switch to Petal Dataset") %>% 
  num_row(row_var="Petal.Length", col_var="Species", newdata=petaldat, rowlabel="Petal Length") %>%
  num_row(row_var="Petal.Width", col_var="Species", newdata=petaldat, rowlabel="Petal Width") %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>%
  trimws %>%
  kable_styling(c("striped","bordered"))

## -----------------------------------------------------------------------------
petal.small <- iris %>% filter(Petal.Length <= 4.3)
petal.large <- iris %>% filter(Petal.Length > 4.3)

## -----------------------------------------------------------------------------
tbl1 <- tbl_start(iris, "Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
  empty_row(header="All Data") %>%
  n_row() %>%
  num_row("Sepal.Length", rowlabel="     Sepal Length") %>%
  num_row("Sepal.Width", rowlabel="     Sepal Width") %>%
  empty_row(header="Petal Length less than 4.3") %>%
  n_row(newdata=petal.small) %>%
  num_row("Sepal.Length", rowlabel="     Sepal Length", col_var="Species", newdata=petal.small) %>%
  num_row("Sepal.Width", rowlabel="     Sepal Width", col_var="Species", newdata=petal.small) %>%
  empty_row(header="Petal Length greater than 4.3") %>%
  n_row(newdata=petal.large) %>%
  num_row("Sepal.Length", rowlabel="     Sepal Length", col_var="Species", newdata=petal.large) %>%
  num_row("Sepal.Width", rowlabel="     Sepal Width", col_var="Species", newdata=petal.large) %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## ---- eval = FALSE------------------------------------------------------------
#  tbl1 <- tbl_start(iris, "Species", missing=TRUE, overall=TRUE, comparison=TRUE,
#                    default_num_summary = num_minmax,
#                    default_cat_summary = cat_pct,
#                    default_binary_summary = binary_jama) %>%
#    n_row() %>%
#    num_row("Sepal.Length", rowlabel="Sepal Length") %>%
#    cat_row("Stem.Size", rowlabel="Stem Size") %>%
#    binary_row("color", rowlabel="Color") %>%
#    tbl_out()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l", caption = "Example Summary table", format = "html") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"), font_size = 12)

## ---- echo = FALSE------------------------------------------------------------
tbl1 <- tbl_start(iris, "Species", missing=TRUE, overall=TRUE, comparison=TRUE, 
                  default_num_summary = num_minmax,
                  default_cat_summary = cat_pct,
                  default_binary_summary = binary_jama) %>%
  n_row() %>%
  num_row("Sepal.Length", rowlabel="Sepal Length") %>%
  cat_row("Stem.Size", rowlabel="Stem Size") %>%
  binary_row("color", rowlabel="Color") %>%
  tbl_out()
tbl1 %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l", caption = "Example Summary table", format = "html") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"), font_size = 12) %>%
  column_spec(1, width_min = "1.5in") %>%
  column_spec(c(2:6), width_min = "1.3in") %>%
  column_spec(c(7:9), width_min = "1.5in")

