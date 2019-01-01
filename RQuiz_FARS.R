library(gamclass)
data(FARS)
library(dplyr)
library(stringr)
library(rebus)

# How many cases within the FARS dataset have the age as "not reported"

help(FARS)


age_not_reported <- FARS %>%
  filter(age ==998) # data dictionary says 998 = "not reported"

# How many cases within the FARS dataset have the same modelyr and year of accident? 

modelyr_match_year <- FARS %>%
  filter(modelyr == year) %>%
  select(caseid, modelyr, year)

# The "injury" column in the FARS dataset indicates the number of people who had an injury in each incident. In 1998, how many people had an injury where the air bags were present (column: airbagAvail) but not deployed (column: airbagDeploy). Please ignore cases where level is "NA-code"

airbag_injuries_98 <- FARS %>%
  filter(year == 1998) %>%
  filter(airbagAvail == "yes") %>%
  filter(airbagDeploy == "no") %>%
  summarise(injuries = sum(injury))

# How many cases in the FARS dataset have a "caseid" starting with "48" and has a pattern "48:x:y" where x and y are integers?
#str_extract(homicide$Victim, pattern = zero_or_more(DGT) %R% END)
#library(dplyr)
#data %>% 
#  filter(substr(zip, 1,3)!=721)

caseid_48 <- FARS %>%
  filter(substr(caseid, 1, 2) == 48)
