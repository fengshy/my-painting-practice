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









