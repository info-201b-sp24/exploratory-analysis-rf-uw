library(tidyverse)
library(sf)

precinct_data <- read.csv("precinct_data.csv")
precinct_shapes <- read_sf("precinctshapes/precinct_shapes.shp")

precinct_joined <- inner_join(precinct_shapes, precinct_data, by = "NAME")

map2 <- ggplot(precinct_joined) +
  geom_sf(aes(fill = swing_12_20), color = "white", linewidth = 0.01) +
  scale_fill_gradient2(
    breaks = c(-0.5, 0, 0.5),
    labels = c("R + 50", "No Change", "D + 50"),
    limits = c(-0.5, 0.5),
    name = "Margin Swing"
  ) +
  theme(
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    plot.title = element_text(face = "bold"),
    rect = element_blank(),
    legend.title = element_text(vjust = 5, face = "bold")
  )

map2

