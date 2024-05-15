# Для датасета mtcars визуализировать:
# распределение qsec в виде гладкой линии и гистограммы (hist, plot-density-polygon)
# для гистограммы: подписать имена оси x, заголовок, подзаголовок, заполнить цветом гистограмму, задать другим цветом границы столбцов гистограммы. Увеличить размер шрифтов для осей в 2 раза (подписи и тики).

library(ggplot2)
library(gridExtra)

# Распределение qsec в виде гладкой линии и гистограммы
# Распределение qsec в виде гладкой линии и гистограммы
p1 <- ggplot(mtcars, aes(x = qsec)) +
  geom_density(color = "blue", fill = "blue", alpha = 0.3) +
  labs(x = "qsec", y = "Density", title = "Density Plot of qsec") +
  theme_minimal()
p1

p2 <- ggplot(mtcars, aes(x = qsec)) +
  geom_histogram(color = "black", fill = "skyblue", bins = 10) +
  labs(x = "qsec", y = "Frequency", 
       title = "Histogram of qsec",
       subtitle = "Distribution of qsec") +
  theme(axis.title = element_text(size = rel(2)),
        axis.text = element_text(size = rel(2)),
        plot.title = element_text(size = rel(1.5)),
        plot.subtitle = element_text(size = rel(1.2)))
p2


# 2
#точечный график, на котором будет отображаться зависимость mpg от disp (plot). Задать свой цвет, форму элементов для каждого значения cyl. Размер элементов должен быть равен 2.

p3 <- ggplot(mtcars, aes(x = disp, y = mpg, color = factor(cyl), shape = factor(cyl))) +
  geom_point(size = 2) +
  scale_color_manual(values = c("red", "green", "blue")) +
  scale_shape_manual(values = c(16, 17, 18)) +
  labs(x = "Displacement", y = "Miles Per Gallon", 
       title = "Scatter Plot",
       color = "Cylinders", shape = "Cylinders") +
  theme_minimal()
p3

# 3
# боксплоты+джиттерплоты mpg для каждого значения cyl(три боксплота на 1 графике, джиттерплоты наложены на боксплоты). Надписи по оси абсцисс развернуть под углом 90 градусов

p4 <- ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot(aes(fill = factor(cyl)), outlier.shape = NA) +
  geom_jitter(width = 0.2, size = 2, color = "black") +
  scale_fill_manual(values = c("red", "green", "blue")) +
  labs(x = "Number of Cylinders", y = "Miles Per Gallon", 
       title = "Boxplots and Jitter Plots") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
p4

# доп уровень
# Построить график c 4 панелями, использовав графики, сделанные ранее: распределение в виде гладкой линии, гистограмму, боксплоты и точечный график.
# Добавить буквы A B C В на соотв. панели(верхний левый угол
p_combined <- grid.arrange(
  p1 + annotate("text", x = Inf, y = Inf, label = "A", vjust = 1.5, hjust = 1.5, size = 5, colour = "black"),
  p2 + annotate("text", x = Inf, y = Inf, label = "B", vjust = 1.5, hjust = 1.5, size = 5, colour = "black"),
  p4 + annotate("text", x = Inf, y = Inf, label = "C", vjust = 1.5, hjust = 1.5, size = 5, colour = "black"),
  p3 + annotate("text", x = Inf, y = Inf, label = "D", vjust = 1.5, hjust = 1.5, size = 5, colour = "black"),
  ncol = 2
)

