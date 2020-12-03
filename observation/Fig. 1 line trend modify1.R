rm(list = ls())
gc()
library(reshape2)
library(ggplot2)
#load data
area <- data.frame(cru = cru_area57, princeton = princeton_area57,
                   terraclimate = terra_area57, gldas = ug57)
mean4 <- apply(area, 1, mean)
max4 <- apply(area, 1, max)
min4 <- apply(area, 1, min)
Area <- data.frame(year = 1958:2014, mean = mean4, max = max4, min = min4)

ggplot(Area, aes(x = year, y = mean)) +
  geom_ribbon(aes(ymin = min, ymax = max), alpha = 0.2, fill = 'blue')+
  geom_line()

#maybe not beautiful,and just show to myself






