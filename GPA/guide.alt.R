require (knitr)
require (rmarkdown)
require (plyr)
require (Morphometrics)

render('presGPA.Rmd', 'all')
browseURL('presGPA.html', browser='google-chrome')

browseURL('webGL/index.html', browser='firefox')

mil.tri <- array (0, c(3, 2, 10000))

mil.tri [2, 1, ] <- -1
mil.tri [3, 1, ] <- 1
mil.tri [2, 2, ] <- -1
mil.tri [3, 2, ] <- -1

theta <- rep (seq(0, 2*pi, length.out = 100), times = 100)
rho <- rep (seq(0, 1, length.out = 100), each = 100)

mil.tri [1, 2, ] <- 1 + rho * sin (theta)
mil.tri [1, 1, ] <- rho * cos (theta)

plot(t (mil.tri [1, , ]), pch = 20, col = rainbow (10000), xlab = 'X', ylab = 'Y',
     xlim = c(-1, 1), ylim = c(-1, 2), asp = 1)
points(mil.tri [2:3, , 4034], type = 'b', pch = 20, cex = 2, lwd = 8)
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

plot(tri.pca $ x [, 1:2], col = rainbow(10000), pch = 20 )

Norm.tan <- aaply(tri.pca $ x [, 1:2], 1, Norm)
ProcD <- tri.gpa $ rho

plot (Norm.tan ~ ProcD, pch = 20, col = rainbow(10000)) ### Ortogonal
abline(a=0, b = 1)

mil.stereo.gpa <- procGPA(mil.tri, tangentcoords='partial')

mil.stereo.pca <- prcomp (t(mil.stereo.gpa $ tan), retx = TRUE)

plot (mil.stereo.pca $ x [, 1:2], col = rainbow (10000), pch = 20)

Norm.stereo <- aaply (mil.stereo.pca $ x [, 1:2], 1, Norm)

plot (Norm.stereo ~ ProcD, pch = 20, col = rainbow(10000)) ### Ortogonal
abline(a=0, b = 1)
