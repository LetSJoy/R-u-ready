install.packages("ggiraphExtra")
library(ggiraphExtra)

str(USArrests)
head(USArrests)

library(tibble)

crime <- rownames_to_column(USArrests, var = "state")
crime$state <- tolower(crime$state)

str(crime)

library(ggplot2)
states_map <- map_data("state")
str(states_map)

ggChoropleth(data=crime,
             aes(fill = Murder,
                 map_id = state),
             map = states_map)

ggChoropleth(data=crime,
             aes(fill = Murder,
                 map_id = state),
             map = states_map,
             interactive = T)

install.packages("stringi")
install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")
library(kormaps2014)
str(korpop1)
library(dplyr)

korpop1 <-rename(korpop1,
                 pop = 총인구_명,
                 name = 행정구역별_읍면동)
str(kormap1)

ggChoropleth(data = korpop1,
             aes(fill = pop,
                 map_id = code,
                 tooltip = name),
             map = kormap1,
             interactive = T)

str(tbc)

ggChoropleth(data = tbc,
             aes(fill = NewPts,
                 map_id = code,
                 tooltip = name),
             map = kormap1,
             interactive = T)