rm(list = ls())
gc()
library(ggplot2)

{
  load("G:/painting1203/area_his/1958-2014/cru_area57.RData")
  load("G:/painting1203/area_his/1958-2014/princeton_area57.RData")
  load("G:/painting1203/area_his/1958-2014/terra_area57.RData")
  load("G:/painting1203/area_his/1958-2014/ug57.RData")
}
{
  load("G:/painting1203/area_his/1961-1990/cru_area30.RData")
  load("G:/painting1203/area_his/1961-1990/princeton_area30.RData")
  load("G:/painting1203/area_his/1961-1990/terra_area30.RData")
  load("G:/painting1203/area_his/1961-1990/ug30.RData")
}

Anomaly <- data.frame(CRU =cru_area57 - mean(cru_area30), Princeton = princeton_area57 - mean(princeton_area30),
                      TerraClimate = terra_area57 - mean(terra_area30), GLADS = ug57 - mean(ug30))

mean4 = apply(Anomaly, 1, mean)
max4 = apply(Anomaly, 1, max)
min4 = apply(Anomaly, 1, min)

anomaly <- data.frame(year = 1958:2014, mean = mean4, max = max4, min = min4)

ggplot(anomaly, aes(x = year, y = mean))+
  geom_ribbon(aes(ymin = min, ymax = max,), fill = "#F15FF1")+
  geom_line(colour = "#570088", size = 1)+
  geom_smooth(method = lm)





