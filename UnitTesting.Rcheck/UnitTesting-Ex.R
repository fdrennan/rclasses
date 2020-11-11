pkgname <- "UnitTesting"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('UnitTesting')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("as_factor_dataframe")
### * as_factor_dataframe

flush(stderr()); flush(stdout())

### Name: as_factor_dataframe
### Title: as_factor_dataframe
### Aliases: as_factor_dataframe

### ** Examples


as_factor_dataframe(model_results_df, c('pred', 'actual'))




### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
