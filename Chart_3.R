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

# Creates a categorical variable to track which of the three largest minority racial groups is the largest in each precinct
precinct_data <- precinct_data %>% 
  mutate(
    minority_plurality = case_when(
     hispanic_20 > white_20 & hispanic_20 > black_20 & hispanic_20 > asian_20 ~ "Hispanic",
     black_20 > hispanic_20 & black_20 > white_20 & black_20 > asian_20 & black_20 ~ "Black",
     asian_20 > hispanic_20 & asian_20 > black_20 & asian_20 > white_20 & asian_20 ~ "Asian",
     .default = "Other"
    )
  )

# Creates the plot
plot3 <- precinct_data %>% filter(minority_plurality != "Other") %>%
  ggplot(aes(x = nonwhite_20, y = swing_12_20)) +
    geom_point(size = 0.4) +
    facet_wrap(minority_plurality ~ .) +
    labs(
      title = "2012-2020 Presidential Margin Swing by Nonwhite Population",
      x = "Nonwhite % of Voting Age Population",
      y = "Swing from 2012 to 2020") +
    scale_y_continuous(limits = c(-0.5, 0.5)) +
    scale_x_continuous(limits = c(0.5, 1)) +
    geom_hline(yintercept = 0, alpha = 0.3,  linetype = "longdash") +
    geom_smooth(method = lm, color = "dodgerblue3", alpha = 0.3, size = 0.5) +
    theme_light()

plot3
