a<-1
b=2
c=3
d<-4

a+b
b+c

var1<-c(1,2,3,4,6)
var2<-c(1:5)
var3<-seq(1,5)
var4<-seq(1,10,by=2)

var1+2
var1+var2

str1<-"a"
str2<-"text"
str3<-"Hello World"
str4<-c("a","b","c")
str5<-c("Hello","World","is","good!")

x<-c(1,2,3)
mean(x)
max(x)
min(x)
paste(str5)
paste(str5,collapse=",")
paste(str5,collapse=" ")
str5_paste <- paste(str5,collapse=" ")

install.packages("ggplot2")
library(ggplot2)

x<-c("a","a","b","c")
qplot(x)
ggplot(x)

qplot(data = mpg, x = hwy)
qplot(data = mpg, x = drv, y = hwy)
qplot(data=mpg, x=drv, y = hwy, geom="line")
qplot(data=mpg, x=drv, y=hwy, geom="boxplot")
qplot(data=mpg, x=drv, y=hwy, geom="boxplot", color=drv)

?qplot
