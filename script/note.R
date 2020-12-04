#header = FALSE 首行没有列名
#name()为列命名
#sep 设置分隔符
#bar chart
#stat = 'identity' 提取横坐标x对应y值  stat = ‘bin’表示x对应落到该x的样本数
#在条形图中，position = ‘dodge’，是将多变量条形图不叠加
#在条形图中，可以用colour给条形图边框填充颜色
#rank函数是按从小到大排列
#reorder() 按照条形图的高度进行排序
#subset 获取子集
#width 调整条形图的条的宽度
#position_dodge(0.9)调整多变量两个条形图之间的宽度，默认值是0.9
#desc 将向量转换为降序排序
#geom_text(aes(),vjust) 给条形图添加数据标签
#vjust 竖直调整数据标签位置
#arrange(data, first, second)用于排序，首先考虑first，其次按second
#cumsum() 前n项和
#ddply(data, variable, transform, newnol = function(data)) 给data新增一列，就最后
#panel.grid.major.y = element_blank() 删除水平网格线
#legend.position = c(1,0.5) 调整图例的位置
#------------------------------------------------我是条形图和折线图的分隔线
#ylim(low, high) 调整y轴的范围
#scale_y_log10() 取对数
#scale_colour_brewer(palette = '') 调用调色板
#position_dodge(0.2) 错开位置
#area chart use geom_chart
#利用geom_ribbon(aes(ymin = , ymax = ),colour = ,fill = ,alpha = )添加置信域
#使用coord_flip()来翻转坐标轴
#使用scale_y_continuous(limits = c(0,10),breaks = c(1,5,8,10)) 调整坐标轴
#调转y轴的顺序 scale_y_reverse()
#调整离散型变量的位置 scale_x_discrete(limits = c('trt1', 'trt2', 'ctrl'))
#设置背景刻度线的位置 scale_y_continuous(breaks = c())
#换标签的名字scale_y_continuous(breaks = c(), labels = c())
#使用xlab()或ylab()来修改坐标轴标签的文本
#使用\n换行
#使用theme(axis.title.x = element_blank())隐藏x轴标签。








