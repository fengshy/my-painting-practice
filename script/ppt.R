#learning in 20201201
library(RColorBrewer)
display.brewer.all()
cols <- brewer.pal(n = 11, name = "RdYlGn")
pie(rep(1,11), col = cols, labels = "", border = NA)
my.colorbar <- colorRampPalette(colors = cols)
cols2 <- my.colorbar(500)
pie(rep(1,500), col = cols2, labels = "", border = NA)
rep(1,10)
rep(1:10, each = 3)
rep(1:10, time = 3)

#bar chart
rm(list = ls())
library(RColorBrewer)
library(tidyverse)
path <- paste("E:/Rpptdata/daily precipitation/data/58519.csv",sep = "")
prcp <- read.csv(file = path, header = TRUE, stringsAsFactors = FALSE)
year <- str_sub(prcp$date, start = 1, end = 4)
year <- as.numeric(year)
year.unique <- unique(year)[-1]
counts <- sapply(X = year.unique, function(x){
  ind <- which(year == x)   #position
  group <- cut(prcp$precip[ind], breaks = c(10,24.9,49.9,100,10000),
               include.lowest = TRUE, labels = c('moderate','big','heavy','storm'))
  nums <- table(group)
  nums
})

counts <- t(counts)  #t mean zhuan zhi
#insert the review the apply sapply and lapply
#apply(m, dimcode, f, fargs) m juzhen dimcode weidu f function fargs canshuji of function
#lapply() mean list apply         lapply(list, function)
#sapply() mean simplified apply return juzhen or vector     sapply(list, function)
#table use to count
storm <- data.frame(year = year.unique, counts)

ggplot(data = storm[1:10,], mapping = aes(x = year, y = moderate))+
  geom_bar(stat = "identity", fill = brewer.pal(9, 'Set1')[1],
           colour = brewer.pal(9, 'Set1')[2], lwd = 0.5)
# fill is 内里填充，colour 是边框颜色， lwd 是边框的粗细
#---------------单变量看上面，双变量看下面，同时绘制中雨和大雨天数条形图

storm2 <- data.frame(year =  rep(storm$year[1:10], times = 2),
                     counts = c(storm$moderate[1:10], storm$big[1:10]),
                     types = rep(c('moderate','big'),each = 10))
ggplot(data = storm2, mapping = aes(x = year, y = counts, fill = types))+
  geom_bar(stat = 'identity', position = 'dodge', width = 0.6)+
  scale_fill_brewer(palette = 'Set1')
# this position = 'dodge' 是分开还是叠一块儿
#---------------------------------------条形图get，下面是折线图

#line chart
ggplot(data = storm, mapping = aes(x = year, y = moderate)) +
  geom_line()

ggplot(storm, aes(year, moderate))+
  geom_line() + geom_point()

#---------双变量
storm3 <- gather(data = storm[,1:3], key = 'group', value = 'counts', -year)
ggplot(data = storm3, mapping = aes(x = year, y = counts, group = group, color = group))+
  geom_line()+geom_point(size = 2, shape = 21)
# get 'gather'
storm4 <- gather(storm, key = 'raintype', value = 'value',-year)
ggplot(data = storm4, mapping = aes(x = year, y = value, group = raintype, color = raintype))+
  geom_line()+geom_point()
#---------------------------折线图get

#area graph
storm4 <- gather(storm, key = 'group', value = 'counts',-year)
storm4$group <- factor(storm4$group, ordered = TRUE, levels = c('moderate','big','heavy','storm'))
#排序
ggplot(data = storm4, mapping = aes(x = year, y = counts, fill = group))+
  geom_area(color = 'black', size = 0.2, alpha = 0.4)+
  scale_fill_brewer(palette = 'Blues')

ggplot(data = storm, mapping = aes(x = year, y = moderate))+geom_area(color = 'blue',fill = 'red', alpha = 1)
#----------------------面积图get

#箱型图
ggplot(data = storm4, mapping = aes(x = group, y = counts))+
  geom_boxplot()

ggplot(data = storm4, mapping = aes(x = group, y = counts))+
  geom_boxplot(outlier.size = 1.5, outlier.shape = 21, notch = TRUE)+
  stat_summary(fun.y = 'mean', geom = 'point', shape = 23, size = 3)
#-------------------need read 箱线图？？？？？？

#san dian tu
ggplot(data = storm, mapping = aes(x = year, y = moderate))+
  geom_point(shape = 22)

ggplot(data = storm3, mapping = aes(x = year, y = counts, color = group))+
  geom_point()

ggplot(data = storm3, mapping = aes(x = year, y = counts, shape = group, color = group))+
  geom_point() + scale_color_brewer(palette = 'Set1')

# 依据属性变化
ggplot(data = storm, mapping = aes(x = year, y = moderate, color = year))+
  geom_point()+ scale_color_gradient(low = 'red', high = 'blue', breaks = seq(1951,2018,10))

ggplot(data = storm, mapping = aes(x = year, y = moderate, size = year))+
  geom_point()+
  scale_size_continuous(range = c(1,10), breaks = seq(1951,2018,10))

# add a lm
p <- ggplot(data = storm, mapping = aes(x = year, y = moderate))
p <- p+geom_point()
p1 <- p+stat_smooth(method = lm, level = 0.95)
p2 <- p+stat_smooth(method = lm, level = 0.99)

# add a loess 非线性拟合
p1 <- p+stat_smooth(method = loess, level = 0.95)
p2 <- p+stat_smooth(method = loess, level = 0.99)

#双变量线性和非线性拟合
p <- ggplot(data = storm3, mapping = aes(x = year, y = counts, color = group))
p <- p+geom_point()
p <- p + scale_color_brewer(palette = 'Set1')
p1 <- p + geom_smooth(method = lm, level = 0.95)
p2 <- p + geom_smooth(method = loess, level = 0.99)

#多变量分面展示 'facet_grid'
p <- ggplot(data = storm4, mapping = aes(x = year, y = counts))
p <- p + geom_point()
p1 <- p + facet_grid(group~.)
p2 <- p + facet_grid(.~group)











