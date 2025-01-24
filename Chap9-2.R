job_male <- welfare %>%
  filter(!is.na(job) & sex == "male") %>%
  group_by(job) %>%
  summarise(n=n()) %>%
  arrange(desc(n)) %>%
  head(10)
job_male

job_female <- welfare %>%
  filter(!is.na(job) & sex == "female") %>%
  group_by(job) %>%
  summarise(n=n()) %>%
  arrange(desc(n)) %>%
  head(10)
job_female

ggplot(data = job_male, aes(x=reorder(job,n),y=n)) +
  geom_col() +
  coord_flip()

ggplot(data = job_female, aes(x=reorder(job,n),y=n)) +
  geom_col() +
  coord_flip()

class(welfare$religion)
table(welfare$religion)
welfare$religion <- ifelse(welfare$religion == 1, "yes", "no")
table(welfare$religion)
qplot(welfare$religion)
ggplot(data=welfare,aes(x=religion)) + geom_bar()

class(welfare$marriage)
table(welfare$marriage)
welfare$group_marriage <- ifelse(welfare$marriage == 1, "marriage",
                                 ifelse(welfare$marriage == 3, "divorce",NA))
table(welfare$group_marriage)
ggplot(data = welfare, aes(x=group_marriage)) + geom_bar()

religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(religion,group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100,1))
religion_marriage

religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  count(religion, group_marriage) %>%
  group_by(religion) %>%
  mutate(pct = round(n/sum(n)*100,1))
religion_marriage

divorce <- religion_marriage %>%
  filter(group_marriage == "divorce") %>%
  select(religion,pct)
divorce

ggplot(data=divorce,aes(x=religion,y=pct)) + geom_col()

ageg_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  count(ageg,group_marriage) %>%
  group_by(ageg) %>%
  mutate(pct = round(n/sum(n)*100,1))
ageg_marriage

ageg_divorce <- ageg_marriage %>%
  filter(ageg!="young" & group_marriage == "divorce") %>%
  select(ageg, pct)
ageg_divorce
ggplot(data=ageg_divorce,aes(x=ageg,y=pct)) + geom_col()

ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != "young") %>%
  count(ageg,religion,group_marriage) %>%
  group_by(ageg,religion) %>%
  mutate(pct = round(n/sum(n)*100,1))
ageg_religion_marriage

df_divorce <- ageg_religion_marriage %>%
  filter(group_marriage == "divorce") %>%
  select(ageg,religion,pct)
df_divorce

ggplot(data=df_divorce,aes(x=ageg,y=pct,fill=religion)) +
  geom_col(position="dodge")

class(welfare$code_region)
table(welfare$code_region)
list_region <- data.frame(code_region = c(1:7),
                          region = c("서울",
                                     "수도권(인천/경기)",
                                     "부산/경남/울산",
                                     "대구/경북",
                                     "대전/충남",
                                     "강원/충북",
                                     "광주/전남/전북/제주도"))
list_region
welfare <- left_join(welfare,list_region,by=join_by(code_region))
welfare %>%
  select(code_region,region) %>%
  head

region_ageg <- welfare %>%
  count(region,ageg) %>%
  group_by(region) %>%
  mutate(pct = round(n/sum(n)*100,2))
region_ageg

ggplot(data=region_ageg,aes(x=region,y=pct,fill = ageg)) +
  geom_col() +
  coord_flip()

list_order_old <- region_ageg %>%
  filter(ageg=="old") %>%
  arrange(pct)
list_order_old
order <- list_order_old$region
order

ggplot(data = region_ageg, aes(x=region,y=pct,fill=ageg))+
  geom_col()+
  coord_flip()+
  scale_x_discrete(limits=order)

class(region_ageg$ageg)
levels(region_ageg$ageg)
region_ageg$ageg <- factor(region_ageg$ageg,levels = c("old","middle","young"))
ggplot(data=region_ageg,aes(x=region,y=pct,fill=ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits=order)