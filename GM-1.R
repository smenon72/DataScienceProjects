library(ggplot2)
library(dslabs)


data(gapminder)
gapminder  %>%
  filter(continent == "Africa" & year %in% c(1970,2010) & !is.na(gdp) & !is.na(year) & !is.na(infant_mortality)) %>%
  mutate(dollars_per_day = gdp/population/365) %>%
  ggplot(aes(dollars_per_day, infant_mortality, color = region,label = country)) +
  geom_point() +
  scale_x_continuous(trans = "log2") +
  geom_text() +
  facet_grid(year~.)

