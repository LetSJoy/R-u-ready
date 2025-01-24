df <- data.frame(sex=c("M","F",NA,"M","F"),
                 score=c(5,4,3,4,NA))
df

is.na(df)
table(is.na(df))

df %>% filter(is.na(score))
df %>% filter(!is.na(score))
df %>% filter(!is.na(score) & !is.na(sex))
na.omit(df)

mean(df$score)
mean(df$score, na.rm=T)

exam[c(3,8,15),"math"] <- NA
exam

outlier <- data.frame(sex=c(1,2,1,3,2,1),
                      score=c(5,4,3,4,2,6))
table(outlier$sex)
table(outlier$score)

outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier$score <- ifelse(outlier$score >= 6, NA, outlier$score)
outlier

boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats
mpg$hwy <- ifelse(mpg$hwy <12 | mpg$hwy >37, NA, mpg$hwy)
mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm=T))