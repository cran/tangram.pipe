## ---- include = FALSE---------------------------------------------------------
suppressPackageStartupMessages(require(tangram.pipe))
suppressPackageStartupMessages(require(knitr))
suppressPackageStartupMessages(require(kableExtra))

## ---- eval = FALSE------------------------------------------------------------
#  num_default(dt, rowlabel, missing, digits)

## -----------------------------------------------------------------------------
iris %>% 
  select(Sepal.Length, Species) %>%
  head() %>%
  kable(escape = F, align = 'c') %>%
  trimws() %>%
  kable_styling(c("striped", "bordered"))

## ---- eval = FALSE------------------------------------------------------------
#  summary_generic(dt = iris %>% select(Sepal.Length, Species),
#                  rowlabel = "Sepal Length (cm)",
#                  missing = TRUE,
#                  digits = 2)

## -----------------------------------------------------------------------------
iris %>%
  select(Sepal.Length, Species) %>%
  num_default(rowlabel = "Sepal Length (cm)", missing = TRUE, digits = 2) %>%
  kable(escape = F, align = 'l') %>%
  trimws() %>%
  kable_styling(c("striped", "bordered"))

iris %>%
  mutate(Stem.Size = sample(c("Small", "Medium", "Medium", "Large"), size=150, replace=TRUE)) %>%
  select(Stem.Size, Species) %>%
  cat_default(rowlabel = "Stem Size", missing = TRUE, digits = 2) %>%
  kable(escape = F, align = 'l') %>%
  trimws() %>%
  kable_styling(c("striped", "bordered"))

## ---- eval = FALSE------------------------------------------------------------
#  binary_default(dt, reference, rowlabel, compact, missing, digits)

