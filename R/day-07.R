#Van Jackson
#12 August 2020

#Applying joint and pivot functions to plots

library(tidyverse)
url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'
covid = read_csv(url)
head(covid)
region = data.frame(state = state.name, region = state.region)

inner_join(covid, region, by = "state") %>%
  count(region) %>%
  mutate(tot = sum(n))
full_join(covid, region, by = "state") %>%
  count(region) %>%
  mutate(tot = sum(n))
covid %>%
  filter(!state %in% state.name) %>%
  filter(date == max(date)) %>%
  count(state)
covid %>%
  right_join(region, by = "state") %>%
  group_by(region, date) %>%
  summarize(cases  = sum(cases),
            deaths = sum(deaths)) %>%
  pivot_longer(cols = c('cases', 'deaths')) ->
  covid_region
ggplot(covid_region, aes(x = date, y = value)) +
  geom_line(aes(col = region)) +
  facet_grid(name~region, scale = "free_y") +
  theme_linedraw() +
  theme(legend.position = "bottom") +
  theme(legend.position = "NA") +
  labs(title = "Cummulative Cases and Deaths: Region",
       y = "Daily Cumulative Count",
       x = "Date",
       caption = "Daily Exercise 07",
       subtitle = "COVID-19 Data: NY-Times" )

