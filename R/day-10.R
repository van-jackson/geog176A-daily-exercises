install.packages("sf")
install.packages("stars")
install.packages("units")
install.packages("raster")
install.packages("mapview")
install.packages("leaflet")
install.packages("gdalUtilities")

install.packages("whitebox", repos="http://R-Forge.R-project.org")

remotes::install_github("ropensci/getlandsat")
remotes::install_github("ropensci/USAboundaries")
remotes::install_github("ropensci/USAboundariesData")
remotes::install_github("ropenscilabs/rnaturalearthdata")



day10exer = USAboundaries::us_states() %>%
  filter(!state_name %in% c("Puerto Rico",
                            "Alaska",
                            "Hawaii"))


us_preserve_ml = st_combine(day10exer) %>%
  st_cast("MULTILINESTRING")

us_dissolve_ml = st_union(day10exer) %>%
  st_cast("MULTILINESTRING")

USAboundaries::us_states()

plot(us_preserve_ml)
plot(us_dissolve_ml)
