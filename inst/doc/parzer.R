## ----echo=FALSE---------------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  warning = FALSE,
  message = FALSE
)

## ----echo=FALSE, comment=NA, results='asis'-----------------------------------
cat(paste(" -", paste(sprintf("`%s`", sort(getNamespaceExports("parzer"))), collapse = "\n - ")))

## ----eval=FALSE---------------------------------------------------------------
#  remotes::install_github("ropensci/parzer")

## -----------------------------------------------------------------------------
library("parzer")

## ----warning=TRUE-------------------------------------------------------------
parse_lat("45N54.2356")
parse_lat("-45.98739874")
parse_lat("40.123°")
parse_lat("40.123N")
parse_lat("N45 04.25764")

# bad values -> NaN
parse_lat("191.89")

# many inputs
x <- c("40.123°", "40.123N74.123W", "191.89", 12, "N45 04.25764")
parse_lat(x)

# parse_lat("N455698735", "HDDMMmmmmm") # custom formats not ready yet

## ----warning=TRUE-------------------------------------------------------------
parse_lon("45W54.2356")
parse_lon("-45.98739874")
parse_lon("40.123°")
parse_lon("74.123W")
parse_lon("W45 04.25764")

# bad values
parse_lon("361")

# many inputs
x <- c("45W54.2356", "181", 45, 45.234234, "-45.98739874")
parse_lon(x)

# parse_lon("N455698735", "HDDMMmmmmm") # custom formats not ready yet

## -----------------------------------------------------------------------------
lons <- c("45W54.2356", "181", 45, 45.234234, "-45.98739874")
lats <- c("40.123°", "40.123N", "191.89", 12, "N45 04.25764")
parse_lon_lat(lons, lats)

## ----warning=FALSE------------------------------------------------------------
parse_parts_lat("45N54.2356")
parse_parts_lon("-74.6411133")
# many inputs
x <- c("40.123°", "40.123N74.123W", "191.89", 12, "N45 04.25764")
parse_parts_lon(x)

## -----------------------------------------------------------------------------
parse_hemisphere("74.123E", "45N54.2356")
parse_hemisphere("-120", "40.4183318")
parse_hemisphere("-120", "-40.4183318")
parse_hemisphere("120", "-40.4183318")

## -----------------------------------------------------------------------------
coords <- c(45.23323, "40:25:6N", "40° 25´ 5.994\" N")
pz_degree(lat = coords)
pz_minute(lat = coords)
pz_second(lat = coords)

coords <- c(15.23323, "40:25:6E", "192° 25´ 5.994\" E")
pz_degree(lon = coords)
pz_minute(lon = coords)
pz_second(lon = coords)

## -----------------------------------------------------------------------------
pz_d(31)
pz_d(31) + pz_m(44)
pz_d(31) - pz_m(44)
pz_d(31) + pz_m(44) + pz_s(59)
pz_d(-121) + pz_m(1) + pz_s(33)

