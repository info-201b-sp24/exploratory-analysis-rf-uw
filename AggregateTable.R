library(tidyverse)

precinct_data <- read.csv("precinct_data.csv")

by_city <- precinct_data %>%
  mutate(swing_12_20 = E_20_PRES_Margin - E_12_PRES_Margin, nonwhite_20 = V_20_VAP_Nonwhite/V_20_VAP_Total) %>%
  group_by(City) %>%
  summarize(
    Voters_20 = sum(V_20_VAP_Total),
    Nonwhite_20 = sum(V_20_VAP_Nonwhite)/sum(V_20_VAP_Total),
    Black_20 = sum(V_20_VAP_Black)/sum(V_20_VAP_Total),
    Hispanic_20 = sum(V_20_VAP_Hispanic)/sum(V_20_VAP_Total),
    Asian_20 = sum(V_20_VAP_Asian)/sum(V_20_VAP_Total),
    margin_12 = sum(E_12_PRES_Margin),
    margin_20 = sum(E_20_PRES_Margin),
    swing_12_20 = sum(swing_12_20),
    ) %>%
  arrange(Nonwhite_20)

print(by_city)