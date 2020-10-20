
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rclasses

## Getting Started

``` r
install.packages('renv')
renv::consent(provided = TRUE)
renv::restore() 
```

## Files Seen in a Package:

`.gitignore` \[file\]

Files names added to this file will be ignored by git. A file which
starts with `.` is called a hidden file, but is really no different than
any other file. Directories can also be ‘hidden’ by adding `.` to the
beginning of the name.

`.Rprofile` \[file\]

Code which runs in R each time the project starts. This is not a file
you should edit, if it exists at all. The only commonly used case that I
am aware of is within the `renv` package which is used in this project.

`renv.lock` \[file\]

A singular file which will restore the environment in which a project
was created.

Rebuild your environment by calling `renv::init()`

`DESCRIPTION` \[file\]

Meta data about a package. Required to update when building a new
package. This file also determines what packages are loaded when calling
your package and specifies the R version required to run the package.

`NAMESPACE` \[file\]

Do not touch, let `roxygen2` update this file for you. When creating a
new package, delete the existing `NAMESPACE` file and let `roxygen2`
create it.

`R` \[folder\]

Do not touch, let `roxygen2` update this file for you. When creating a
new package, delete the existing `NAMESPACE` file and let `roxygen2`
create it.
