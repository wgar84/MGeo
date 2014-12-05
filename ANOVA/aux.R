require (knitr)
require (rmarkdown)
require (plyr)
require (Morphometrics)
require (geomorph)

render('presANOVA.Rmd')
browseURL('presANOVA.html', browser='google-chrome')

data(plethodon)
plethodon.gpa <- gpagen(plethodon$land)
plth.cs.df <- data.frame (plethodon$species, plethodon $ site, plethodon.gpa $ Csize)
colnames (plth.cs.df) <- c('sp', 'site', 'cs')
plth.symp.cs <- subset (plth.cs.df, site == 'Symp')

plot(plth.symp.cs $ cs, pch = 20,
     col = ifelse (plth.symp.cs $ sp == 'Jord', 'red', 'darkgreen'),
     xlab = 'Indivíduo', ylab = 'Tamanho do Centróide')
arrows(x0 = 1, x1 = 10.5, code = 3, length = 0, col = 'red',  lwd = 3,
       y0 = mean (plth.symp.cs $ cs [1:10]),
       y1 = mean (plth.symp.cs $ cs [1:10]))
arrows(x0 = 10.5, x1 = 20, code = 3, length = 0, col = 'darkgreen',  lwd = 3,
       y0 = mean (plth.symp.cs $ cs [11:20]),
       y1 = mean (plth.symp.cs $ cs [11:20]))
for (i in 1:10)
  arrows(x0 = i, x1 = i, length = 0, col = 'red',  lwd = 1,
       y0 = mean (plth.symp.cs $ cs [1:10]),
         y1 = mean (plth.symp.cs $ cs [i]))
for (i in 1:10)
  arrows(x0 = i+10, x1 = i+10, length = 0, col = 'darkgreen', lwd = 1,
       y0 = mean (plth.symp.cs $ cs [11:20]),
         y1 = mean (plth.symp.cs $ cs [i+10]))

plot(plth.symp.cs $ cs, pch = 20,
     col = ifelse (plth.symp.cs $ sp == 'Jord', 'red', 'darkgreen'),
     xlab = 'Indivíduo', ylab = 'Tamanho do Centróide')
arrows(x0 = 1, x1 = 20, lwd = 4, col = rgb(0, 0, 0, 0.2), length = 0,
       y0 = mean (plth.symp.cs $ cs),
       y1 = mean (plth.symp.cs $ cs))
for (i in 1:20)
  arrows(x0 = i, x1 = i, length = 0, col = rgb(0, 0, 0, 0.2), lwd = 1,
         y0 = plth.symp.cs $ cs [i],
         y1 = mean (plth.symp.cs $ cs))


SS.total <- sum ((mean (plth.symp.cs $ cs) - plth.symp.cs $ cs) ^ 2)

SS.residual <- ddply(plth.symp.cs, .(sp), summarize,
                     'RSS' = sum ((mean(cs) - cs)^2))

SS.residual <- sum (SS.residual $ RSS)

(SS.total - SS.residual) / SS.residual

MSQ.explicado <- (SS.total - SS.residual) / 1
MSQ.residual <- SS.residual / 18

F.value <- MSQ.explicado / MSQ.residual

pf(F.value, 1, 18, lower.tail = FALSE)

anova ()
