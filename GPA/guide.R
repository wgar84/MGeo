require (knitr)
require (rmarkdown)
require (plyr)

render('presGPA.Rmd')
browseURL('presGPA.html', browser='google-chrome')

