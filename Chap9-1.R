welfare <- welfare %>%
  mutate(ageg=ifelse(age<30, "young",
                     ifelse(age<=59,"middle","old")))
table(welfare$ageg)
qplot(welfare$ageg)

ageg_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))

ageg_income

ggplot(data=ageg_income, aes(x=ageg, y=mean_income)) + geom_col()
ggplot(data=ageg_income, aes(x=ageg, y=mean_income)) + geom_col() + scale_x_discrete(limits=c("young","middle","old"))

sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg, sex) %>%
  summarise(mean_income = mean(income))

sex_income

ggplot(data=sex_income,aes(x=ageg, y=mean_income,fill=sex))+
  geom_col()+
  scale_x_discrete(limits=c("young","middle","old"))

ggplot(data=sex_income,aes(x=ageg, y=mean_income,fill=sex))+
  geom_col(position="dodge")+
  scale_x_discrete(limits=c("young","middle","old"))

sex_age <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age, sex) %>%
  summarise(mean_income = mean(income))

head(sex_age)

ggplot(data=sex_age, aes(x=age, y=mean_income,col=sex)) + geom_line()

class(welfare$code_job)
table(welfare$code_job)

list_job <- read_excel("Koweps_Codebook.xlsx", col_names=T, sheet=2)
head(list_job)
dim(list_job)

welfare <- left_join(welfare,list_job)

welfare %>%
 filter(!is.na(code_job)) %>%
 select(code_job,job) %>%
 head(10)
 
job_income <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))
head(job_income)

top10 <- job_income %>%
  arrange(desc(mean_income)) %>%
  head(10)
top10

ggplot(data=top10,aes(x=reorder(job,mean_income),y=mean_income)) +
  geom_col() +
  coord_flip()

bottom10 <- job_income %>%
  arrange(mean_income) %>%
  head(10)
bottom10

ggplot(data=bottom10, aes(x=reorder(job, -mean_income),
                          y=mean_income)) +
  geom_col() +
  coord_flip() +
  ylim(0,850)