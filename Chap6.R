exam<-read.csv("csv_exam.csv")
exam %>% filter(class==1)
exam %>% filter(math>50)

exam %>% filter(class==1 & math>=50)
exam %>% filter(english<90|science<50)

exam %>% select(math)
exam %>% select(math, science)
exam %>% select(-math)

exam %>%
  filter(class==1) %>%
  select(english)

exam %>% arrange(math)
exam %>% arrange(desc(math))
exam %>% arrange(class, math)

exam %>%
  mutate(total = math + english + science) %>%
  head

exam         

exam %>% summarise(mean_math = mean(math))
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math))

test1 <- data.frame(id=c(1,2,3,4,5),
                    midterm=c(60,80,70,90,85))
test2 <- data.frame(id=c(1,2,3,4,5),
                    final=c(70,83,65,95,80))

test1
test2
total <- left_join(test1,test2,by="id")
total

group_a <- data.frame(id=c(1,2,3,4,5),
                      test=c(60,80,70,90,85))
group_b <- data.frame(id=c(6,7,8,9,10),
                      test = c(70,83,65,95,80))
group_a
group_b
group_all <- bind_rows(group_a,group_b)
group_all