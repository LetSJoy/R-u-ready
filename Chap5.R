exam <- read.csv("csv_exam.csv")
head(exam)
head(exam,10)
tail(exam)
tail(exam,10)
View(exam)

install.packages("ggplot2")

mpg<-as.data.frame(ggplot2::mpg)

head(mpg)

tail(mpg)

dim(mpg)

str(mpg)

summary(mpg)

df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))
df_raw

install.packages("dplyr")
library(dplyr)

df_new <- df_raw
df_new
df_new<-rename(df_new,v2 = var2)
df_new

df <- data.frame(var1=c(4,3,8),
                 var2=c(2,6,1))
df$var_sum = df$var1 + df$var2
df

mpg$total <- (mpg$cty + mpg$hwy)/2
mpg$test <- ifelse(mpg$total>=20, "pass","fail")
mpg
library(ggplot2)
qplot(mpg$test)
