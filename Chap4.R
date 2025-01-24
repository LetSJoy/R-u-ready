english <- c(90,80,60,70)
math <- c(50,60,100,20)

df_midterm <- data.frame(english,math)
df_midterm

class<-c(1,1,2,2)

df_midterm <- data.frame(english,math,class)
df_midterm

mean(df_midterm$english)
mean(df_midterm$math)

df_midterm <- data.frame(english = c(90,80,60,70),
                         math = c(50,60,100,20),
                         class = c(1,1,2,2))
df_midterm

install.packages("readxl")
library(readxl)

df_exam <- read_excel("excel_exam.xlsx")
df_exam

mean(df_exam$english)
mean(df_exam$science)

df_csv_exam = read.csv("csv_exam.csv")
df_csv_exam

df_midterm
write.csv(df_midterm, file="df_midterm.csv")

save(df_midterm, file = "df_midterm.rda")
rm(df_midterm)

df_midterm
load("df_midterm.rda")
df_midterm
