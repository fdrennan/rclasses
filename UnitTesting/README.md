# rclasses


### Getting Started
```
install.packages('renv')
renv::consent(provided = TRUE)
renv::restore() 
```

Files Seen in a Package:

`.gitignore`

Files added to this file will be ignored by git. A file which starts with `.` is 
called a hidden file, but is really no different than any other. Directories 
can also be 'hidden' by adding `.` to the beginning of the file.

`.Rprofile`

Code which runs in R each time the project starts. This is not a file you should
edit, if it exists at all. The only commonly used case that I am aware of is within
the `renv` package.

`renv.lock`

A singular file which will restore the environment in which a project was created 
in.
