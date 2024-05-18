library(tidyverse)

precinct_data <- read.csv("precinct_data.csv")

precinct_data <- precinct_data %>% mutate(
  V_20_VAP_NH_Nonwhite = V_20_VAP_NH_Total - V_20_VAP_NH_White,
  white_20 = V_20_VAP_NH_White/V_20_VAP_NH_Total,
  nonwhite_20 = V_20_VAP_NH_Nonwhite/V_20_VAP_NH_Total,
  black_20 = V_20_VAP_NH_BlackAlone/V_20_VAP_NH_Total,
  hispanic_20 = V_20_VAP_NH_Hispanic/V_20_VAP_NH_Total,
  asian_20 = V_20_VAP_NH_AsianAlone/V_20_VAP_NH_Total,
  pacific_20 = V_20_VAP_NH_PacificAlone/V_20_VAP_NH_Total,
  native_20 =  V_20_VAP_NH_NativeAlone/V_20_VAP_NH_Total,
  multi_20 = V_20_VAP_NH_TwoOrMore/V_20_VAP_NH_Total,
  swing_12_20 = E_20_PRES_Margin - E_12_PRES_Margin
)

summary_info <- list()
summary_info$num_precincts <- nrow(precinct_data)
summary_info$total_voters <- sum(precinct_data$V_20_VAP_NH_Total)
summary_info$nonwhite_voters <- sum(precinct_data$V_20_VAP_NH_Nonwhite)
summary_info$nonwhite_percentage <- summary_info$nonwhite_voters/summary_info$total_voters
summary_info$precinct_mean_pop_20 <- mean(precinct_data$V_20_VAP_Total)
summary_info$county_swing_12_20 <- (sum(precinct_data$E_20_PRES_Dem) - sum(precinct_data$E_20_PRES_Rep))/(sum(precinct_data$E_20_PRES_Dem) + sum(precinct_data$E_20_PRES_Rep)) - (sum(precinct_data$E_12_PRES_Dem) - sum(precinct_data$E_12_PRES_Rep))/(sum(precinct_data$E_12_PRES_Dem) + sum(precinct_data$E_12_PRES_Rep))

print(summary_info)