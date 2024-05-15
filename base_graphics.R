#1
# Для датасета mtcars визуализировать:
# распределение qsec в виде гладкой линии и гистограммы (hist, plot-density-polygon)
# для гистограммы: подписать имена оси x, заголовок, подзаголовок, заполнить цветом гистограмму, задать другим цветом границы столбцов гистограммы. Увеличить размер шрифтов для осей в 2 раза (подписи и тики).


hist(mtcars$qsec,
    col = "steelblue", border = 'red',
    main = "Hist of qsec", sub = "subtitle",
    xlab = "qsec",
    ylab = "counts",
    cex.axis = 2)

plot(density(mtcars$qsec),
    xlab = "qsec",
    ylab = "counts",
    main = "Density plot of qsec",
    sub = "subtitle")

# 2
#точечный график, на котором будет отображаться зависимость mpg от disp (plot). Задать свой цвет, форму элементов для каждого значения cyl. Размер элементов должен быть равен 2.

cyls <- c(mtcars$cyl)[!duplicated(c(mtcars$cyl))]  # 3 вида 
colors <- c("#00AFBB", "#E7B800", "#FC4E07")


plot(mtcars$mpg, mtcars$disp,  
     main = "Plot mpg over disp",  
     sub = "subtitle",  xlab = "mpg", ylab = "disp",  
     cex = 2,
     pch = cyls,
     col = colors)


# 4
# боксплоты+джиттерплоты mpg для каждого значения cyl(три боксплота на 1 графике, джиттерплоты наложены на боксплоты). Надписи по оси абсцисс развернуть под углом 90 градусов

boxplot(mtcars$mpg ~ mtcars$cyl,
        main = "Plot of mpg by cyls",
        xlab = "mpg",
        ylab = "cyls", 
        col = c("#00AFBB", "#E7B800", "#FC4E07"), 
        xaxt='n')
axis(side = 1, labels = FALSE)
text(x = 1:3,
     y = par("usr")[3] - 2.5,
     labels = c(4, 6, 8),
     xpd = NA,
     srt = 90)
stripchart(mtcars$mpg ~ mtcars$cyl,
           vertical = TRUE, 
           method = "jitter", 
           add = TRUE,
           pch = 16,
           xaxt = "n")



# доп уровень
# Построить график c 4 панелями, использовав графики, сделанные ранее: распределение в виде гладкой линии, гистограмму, боксплоты и точечный график.
# Добавить буквы A B C В на соотв. панели(верхний левый угол
                                        


#set 4 panels
par(mfrow=c(2,2))

#create hist
hist(mtcars$qsec,
     col = "steelblue", border = 'red',
     main = "Hist of qsec", sub = "subtitle",
     xlab = "qsec",
     ylab = "counts",
     cex.axis = 2)
mtext("A.", side = 3, adj = -0.3, line = 2)

#create dens plot
plot(density(mtcars$qsec),
     xlab = "qsec",
     ylab = "counts",
     main = "Density plot of qsec",
     sub = "subtitle")
mtext("B.", side = 3, adj = -0.3, line = 2)

#create corr plot
plot(mtcars$mpg, mtcars$disp,  
     main = "Plot mpg over disp",  
     sub = "subtitle",  xlab = "mpg", ylab = "disp",  
     cex = 2,
     pch = cyls,
     col = colors)
mtext("C.",side = 3, adj = -0.3, line = 2)

#create boxplot + jitt
boxplot(mtcars$mpg ~ mtcars$cyl,
        main = "Plot of mpg by cyls",
        xlab = "mpg",
        ylab = "cyls", 
        col = c("#00AFBB", "#E7B800", "#FC4E07"), 
        xaxt='n')
axis(side = 1, labels = FALSE)
text(x = 1:3,
     y = par("usr")[3] - 3,
     labels = c(4, 6, 8),
     xpd = NA,
     srt = 90)
stripchart(mtcars$mpg ~ mtcars$cyl,
           vertical = TRUE, 
           method = "jitter", 
           add = TRUE,
           pch = 16,
           xaxt = "n")
mtext("D.", side = 3, adj = -0.3, line = 2)
