library(tidyverse)
homes = readr::read_csv("data/uscities.csv") %>%
  st_as_sf(coords = c("lng", "lat"), crs = 4326) %>%
  filter(city %in% c("Santa Barbara", "Orange"))

st_distance(homes)

st_distance(st_transform(homes, 5070))

library(units)
st_distance(homes)

(st_distance(homes) %>%
    set_units("km") %>%
    drop_units())
