## -----------------------------------------------------------------------------
#| label: packages
#| collapse: true
#| eval: false
# if (!requireNamespace("sf")) install.packages("sf")
# if (!requireNamespace("leaflet")) install.packages("leaflet")

## -----------------------------------------------------------------------------
#| label: loading_parzer
#| eval: true
library(parzer)

## -----------------------------------------------------------------------------
#| label: has_spatial
#| include: false
# The sf and leaflet chunks only run when both suggested packages are installed
has_spatial <- requireNamespace("sf", quietly = TRUE) &&
  requireNamespace("leaflet", quietly = TRUE)


## -----------------------------------------------------------------------------
#| label: lats_lons
lats <- c(
  "46.4183",
  "46.4383° N",
  "46.5683° N",
  "46° 27´ 5.4\" N",
  "46° 25.56’",
  "N46°24’4.333"
)
lons <- c(
  "25.7391",
  "E25°34’6.4533",
  "25.3391° E",
  "25.8391° E",
  "25° 35.56’",
  "E25°34’4.333"
)


## -----------------------------------------------------------------------------
#| label: creating_dat
#| collapse: true
dat <- data.frame(
  longitude = parse_lon(lons),
  latitude = parse_lat(lats)
)
dat


## -----------------------------------------------------------------------------
#| label: adding_variables_to_dat
#| collapse: true
dat$shape <- c("round", "square", "triangle", "round", "square", "square")
dat$color <- c("blue", "yellow", "green", "red", "green", "yellow")
dat




## -----------------------------------------------------------------------------
#| label: map_center
center_lon <- mean(dat$longitude)
center_lat <- mean(dat$latitude)

