library(tidyverse)

precinct_data <- read.csv("precinct_data.csv")


map1 <- ggplot(precinct_joined) +
  geom_sf(aes(fill = nonwhite_20), color = "white", linewidth = 0.01) +
  labs(title = "Nonwhite % of Population in King County by Precinct") + 
  scale_fill_viridis_c(
    name = "Nonwhite %",
    breaks = c(0, 0.5, 1),
    labels = c("0%", "50%", "100%")
    ) +
  theme(
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    plot.title = element_text(face = "bold"),
    rect = element_blank(),
    legend.title = element_text(vjust = 5, face = "bold")
    )

map1