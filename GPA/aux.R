require (knitr)
require (rmarkdown)
require (plyr)
require (Morphometrics)

render('presGPA.Rmd')
browseURL('presGPA.html', browser='google-chrome')

mil.tri <- array (0, c(3, 2, 10000))

mil.tri [2, 1, ] <- -0.5
mil.tri [3, 1, ] <- 0.5

mil.tri [1, 2, ] <- rep (seq(0, 1, length.out = 100), times = 100)
mil.tri [1, 1, ] <- rep (seq(-1, 1, length.out = 100), each = 100)

plot(t (mil.tri [1, , ]), pch = 20, col = rainbow (10000), xlab = 'X', ylab = 'Y')
points(x = c(-.5, .5), y = c(0, 0), type = 'b', pch = 20, cex = 2, lwd = 8)
points (mil.tri [1:2, , 4034], type = 'b', pch = 20, cex = 2, lwd = 8)
points (mil.tri [c(1,3), , 4034], type = 'b', pch = 20, cex = 2, lwd = 8)

tri.gpa <- procGPA(mil.tri)

tri.uss <- aaply (tri.gpa $ rotated, 3, function (X) X / centroid.size (X))
tri.uss <- aperm (tri.uss, c(2, 3, 1))

tri.uss <- two.d.array (tri.uss)
tri.pca <- prcomp (tri.uss, retx = TRUE)

plot3d(tri.pca $ x [, 1:3], col = rainbow(10000),
       xlab = '', ylab = '', zlab = '', box = FALSE)
aspect3d('iso')
writeWebGL()

browseURL('webGL/index.html', browser='firefox')
