## ---- eval=FALSE--------------------------------------------------------------
#  install.packages("tangram.pipe")

## ---- warning=FALSE-----------------------------------------------------------
suppressPackageStartupMessages(require(tangram.pipe))
suppressPackageStartupMessages(require(knitr))
suppressPackageStartupMessages(require(kableExtra))

## -----------------------------------------------------------------------------
iris$color <- sample(c("Blue", "Purple"), size=150, replace=TRUE)
iris$Stem.Size <- sample(c("Small", "Medium", "Medium", "Large"), size=150, replace=TRUE)
iris[149,5] <- NA
iris[150,c(1:4, 6:7)] <- NA
head(iris) %>% 
  kable(escape=F, align="cl") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## -----------------------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE)

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    num_row(row_var="Sepal.Length", rowlabels="Sepal Length") %>%
#    tbl_out() %>%
#    print()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"))

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  num_row(row_var="Sepal.Length", rowlabels="Sepal Length") %>%
  tbl_out()
tbl1[[7]] %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    num_row(row_var="Sepal.Length", rowlabels="Sepal Length", digits=4) %>%
#    tbl_out() %>%
#    print()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"))

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  num_row(row_var="Sepal.Length", rowlabels="Sepal Length", digits=4) %>%
  tbl_out()
tbl1[[7]] %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    num_row(row_var="Sepal.Length", rowlabels="Sepal Length", missing=TRUE) %>%
#    tbl_out() %>%
#    print()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"))

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  num_row(row_var="Sepal.Length", rowlabels="Sepal Length", missing=TRUE) %>%
  tbl_out()
tbl1[[7]] %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    num_row(row_var="Sepal.Length", rowlabels="Sepal Length", comparison=num_diff) %>%
#    tbl_out() %>%
#    print()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered")) %>%
#    column_spec(c(7:9), width_min = "1.5in")

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  num_row(row_var="Sepal.Length", rowlabels="Sepal Length", comparison=num_diff) %>%
  tbl_out()
tbl1[[7]] %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered")) %>%
  column_spec(c(7:9), width_min = "1.5in")

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    cat_row("Stem.Size", rowlabels="Stem Size") %>%
#    tbl_out() %>%
#    print()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"))

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  cat_row("Stem.Size", rowlabels="Stem Size") %>%
  tbl_out()
tbl1[[7]] %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    cat_row("Stem.Size", rowlabels="Stem Size", missing=TRUE) %>%
#    tbl_out() %>%
#    print()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"))

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  cat_row("Stem.Size", rowlabels="Stem Size", missing=TRUE) %>%
  tbl_out()
tbl1[[7]] %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    cat_row("Stem.Size", rowlabels="Stem Size", comparison=cat_comp_default) %>%
#    tbl_out() %>%
#    print()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered")) %>%
#    column_spec(c(2:6), width_min = "1.1in") %>%
#    column_spec(7, width_min = "1.5in")

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  cat_row("Stem.Size", rowlabels="Stem Size", comparison=cat_comp_default) %>%
  tbl_out()
tbl1[[7]] %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered")) %>%
  column_spec(c(2:6), width_min = "1.1in") %>%
  column_spec(7, width_min = "1.5in")

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    binary_row("color", rowlabels="Color") %>%
#    tbl_out() %>%
#    print()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"))

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  binary_row("color", rowlabels="Color") %>%
  tbl_out()
tbl1[[7]] %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    binary_row("color", rowlabels="Color", reference="Purple") %>%
#    tbl_out() %>%
#    print()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"))

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  binary_row("color", rowlabels="Color", reference="Purple") %>%
  tbl_out()
tbl1[[7]] %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    binary_row("color", rowlabels="Color", comparison=binary_diff) %>%
#    tbl_out() %>%
#    print()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered")) %>%
#    column_spec(c(2:6), width_min = "1.1in") %>%
#    column_spec(7, width_min = "1.75in") %>%
#    column_spec(c(8:9), width_min = "1.5in")

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  binary_row("color", rowlabels="Color", comparison=binary_diff) %>%
  tbl_out()
tbl1[[7]] %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered")) %>%
  column_spec(c(2:6), width_min = "1.1in") %>%
  column_spec(7, width_min = "1.75in") %>%
  column_spec(c(8:9), width_min = "1.5in")

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    binary_row("color", rowlabels="Color", comparison=binary_or) %>%
#    tbl_out() %>%
#    print()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered")) %>%
#    column_spec(c(2:7), width_min = "1.1in") %>%
#    column_spec(c(8:9), width_min = "1.25in")

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  binary_row("color", rowlabels="Color", comparison=binary_or) %>%
  tbl_out()
tbl1[[7]] %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered")) %>%
  column_spec(c(2:7), width_min = "1.1in") %>%
  column_spec(c(8:9), width_min = "1.25in")

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    binary_row("color", rowlabels="Color", comparison=binary_rr) %>%
#    tbl_out() %>%
#    print()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered")) %>%
#    column_spec(c(2:7), width_min = "1.1in") %>%
#    column_spec(c(8:9), width_min = "1.25in")

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start(data=iris, col_var="Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>% 
  binary_row("color", rowlabels="Color", comparison=binary_rr) %>%
  tbl_out()
tbl1[[7]] %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered")) %>%
  column_spec(c(2:7), width_min = "1.1in") %>%
  column_spec(c(8:9), width_min = "1.25in")

## ----eval=FALSE---------------------------------------------------------------
#  tbl1 <- tbl1 %>% empty_row()

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(iris, "Species", missing=FALSE, overall=TRUE, comparison=TRUE) %>%
#    num_row("Sepal.Length", rowlabels="Sepal Length") %>%
#    empty_row('<i>No rowlabel, 3 decimal places</i>') %>%
#    num_row("Sepal.Width", digits=3) %>%
#    empty_row("<i>No comparison test used</i>") %>%
#    num_row("Petal.Length", rowlabels="Petal Length", comparison=FALSE) %>%
#    empty_row("<i>Missing data considered</i>") %>%
#    num_row("Petal.Width", rowlabels="Petal Width", missing=TRUE) %>%
#    cat_row("Stem.Size", rowlabels="Stem Size", missing=TRUE) %>%
#    empty_row("<i>No rowlabels, indent 3 spaces, odds ratio as test</i>") %>%
#    binary_row("color", comparison=binary_or, indent=3) %>%
#    tbl_out() %>%
#    print()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered")) %>%
#    column_spec(c(2:6), width_min = ".8in") %>%
#    column_spec(c(7:9), width_min = "1.5in")

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start(iris, "Species", missing=FALSE, overall=TRUE, comparison=TRUE) %>%
  num_row("Sepal.Length", rowlabels="Sepal Length") %>%
  empty_row('<i>No rowlabel, 3 decimal places</i>') %>%
  num_row("Sepal.Width", digits=3) %>%
  empty_row("<i>No comparison test used</i>") %>%
  num_row("Petal.Length", rowlabels="Petal Length", comparison=FALSE) %>%
  empty_row("<i>Missing data considered</i>") %>%
  num_row("Petal.Width", rowlabels="Petal Width", missing=TRUE) %>%
  cat_row("Stem.Size", rowlabels="Stem Size", missing=TRUE) %>%
  empty_row("<i>No rowlabels, indent 3 spaces, odds ratio as test</i>") %>%
  binary_row("color", comparison=binary_or, indent=3) %>%
  tbl_out()
tbl1[[17]] %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered")) %>%
  column_spec(c(2:6), width_min = ".8in") %>%
  column_spec(c(7:9), width_min = "1.5in")

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(iris, NULL, missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    num_row("Sepal.Length", rowlabels="Sepal Length") %>%
#    tbl_out() %>%
#    print()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"))

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start(iris, NULL, missing=FALSE, overall=TRUE, comparison=FALSE) %>%
  num_row("Sepal.Length", rowlabels="Sepal Length") %>%
  tbl_out()
tbl1[[8]] %>% 
  tangram_styling() %>%
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

## -----------------------------------------------------------------------------
sepaldat <- iris %>% select(-c(Petal.Length, Petal.Width))
petaldat <- iris %>% select(-c(Sepal.Length, Sepal.Width))

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(sepaldat, "Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    num_row("Sepal.Length", rowlabels="Sepal Length") %>%
#    num_row("Sepal.Width", rowlabels="Sepal Width") %>%
#    empty_row(header="Switch to Petal Dataset") %>%
#    num_row(row_var="Petal.Length", col_var="Species", newdata=petaldat) %>%
#    num_row(row_var="Petal.Width", col_var="Species", newdata=petaldat) %>%
#    tbl_out() %>%
#    print()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"))

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start(sepaldat, "Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
  num_row("Sepal.Length", rowlabels="Sepal Length") %>%
  num_row("Sepal.Width", rowlabels="Sepal Width") %>%
  empty_row(header="Switch to Petal Dataset") %>% 
  num_row(row_var="Petal.Length", col_var="Species", newdata=petaldat, rowlabels="Petal Length") %>%
  num_row(row_var="Petal.Width", col_var="Species", newdata=petaldat, rowlabels="Petal Width") %>%
  tbl_out()
tbl1[[12]] %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>%
  trimws %>%
  kable_styling(c("striped","bordered"))

## -----------------------------------------------------------------------------
petal.small <- iris %>% filter(Petal.Length <= 4.3)
petal.large <- iris %>% filter(Petal.Length > 4.3)

## ---- eval=FALSE--------------------------------------------------------------
#  tbl1 <- tbl_start(iris, "Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
#    empty_row(header="All Data") %>%
#    num_row("Sepal.Length", rowlabels="     Sepal Length") %>%
#    num_row("Sepal.Width", rowlabels="     Sepal Width") %>%
#    empty_row(header="Petal Length less than 4.3") %>%
#    num_row("Sepal.Length", rowlabels="     Sepal Length", col_var="Species", newdata=petal.small) %>%
#    num_row("Sepal.Width", rowlabels="     Sepal Width", col_var="Species", newdata=petal.small) %>%
#    empty_row(header="Petal Length greater than 4.3") %>%
#    num_row("Sepal.Length", rowlabels="     Sepal Length", col_var="Species", newdata=petal.large) %>%
#    num_row("Sepal.Width", rowlabels="     Sepal Width", col_var="Species", newdata=petal.large) %>%
#    tbl_out() %>%
#    print()
#  tbl1 %>%
#    tangram_styling() %>%
#    kable(escape=F, align="l") %>%
#    trimws %>%
#    kable_styling(c("striped","bordered"))

## ---- echo=FALSE--------------------------------------------------------------
tbl1 <- tbl_start(iris, "Species", missing=FALSE, overall=TRUE, comparison=FALSE) %>%
  empty_row(header="All Data") %>%
  num_row("Sepal.Length", rowlabels="     Sepal Length") %>%
  num_row("Sepal.Width", rowlabels="     Sepal Width") %>%
  empty_row(header="Petal Length less than 4.3") %>%
  num_row("Sepal.Length", rowlabels="     Sepal Length", col_var="Species", newdata=petal.small) %>%
  num_row("Sepal.Width", rowlabels="     Sepal Width", col_var="Species", newdata=petal.small) %>%
  empty_row(header="Petal Length greater than 4.3") %>%
  num_row("Sepal.Length", rowlabels="     Sepal Length", col_var="Species", newdata=petal.large) %>%
  num_row("Sepal.Width", rowlabels="     Sepal Width", col_var="Species", newdata=petal.large) %>%
  tbl_out()
tbl1[[16]] %>% 
  tangram_styling() %>% 
  kable(escape=F, align="l") %>% 
  trimws %>% 
  kable_styling(c("striped","bordered"))

