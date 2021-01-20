# Figures for ggOceanMaps_workshop.Rmd
# 2020-01-20 // Mikko Vihtakari, Institute of Marine Research

# Definitions

width <- 16*0.4
height <- 9
lat.lims <- c(-4e6, 3e6)
lon.min <- -2e6
lon.max <- lon.min + diff(lat.lims)*width/height

# load packages

library(ggOceanMaps)

# Title background figure ####

png("Figures/title_background.png", width = width, height = height, units = "cm", res = 300)
basemap(limits = c(lon.min, lon.max, lat.lims), shapefiles = "Arctic", grid.col = NA, bathymetry = TRUE, legends = FALSE, land.col = "#545b5c") + theme_void()
dev.off()

# ggOceanMaps projections figure ####

p <- basemap(shapefiles = "Decimal", lat.interval = 10, lon.interval = 45, grid.col = NA) +
  geom_spatial_polygon(data = data.frame(lon = c(-180, 180, 180, -180), lat = c(-30, -30, 30, 30)),
                       aes(x = lon, y = lat), fill = "darkolivegreen4", color = NA, alpha = 0.5) +
  geom_spatial_polygon(data = data.frame(lon = c(-180, 180, 180, -180), lat = c(-60, -60, -30, -30)),
                       aes(x = lon, y = lat), fill = "blue", color = NA, alpha = 0.5) + 
  geom_spatial_polygon(data = data.frame(lon = c(-180, 180, 180, -180), lat = c(-90, -90, -60, -60)),
                       aes(x = lon, y = lat), fill = "blue4", color = NA, alpha = 0.5) +
  geom_spatial_polygon(data = data.frame(lon = c(-180, 180, 180, -180), lat = c(60, 60, 30, 30)),
                       aes(x = lon, y = lat), fill = "red", color = NA, alpha = 0.5) + 
  geom_spatial_polygon(data = data.frame(lon = c(-180, 180, 180, -180), lat = c(90, 90, 60, 60)),
                       aes(x = lon, y = lat), fill = "red4", color = NA, alpha = 0.5) +
  geom_spatial_text(data = 
                      data.frame(label = c("max lat (limits[4])", "min lat (limits[3])", "min&max\nlat (limits[3:4])", "max lat (limits[3])", "min lat (limits[4])"), 
                                 lon = rep(-120, 5), 
                                 lat = c(75, 45, 0, -45, -75),
                                 color = c("red4", "red", "darkolivegreen4", "blue", "blue4")), 
                    aes(x = lon, y = lat, label = label, color = I(color)), fontface = 2, size = FS(12)) +
  theme(axis.title.x = element_blank())

png("Figures/ggOceanMaps_projections.png", width = 16, height = 9, units = "cm", res = 300)
print(p)
dev.off()

# Back cover map ####

png("Figures/backcover.png", width = 16, height = 9, units = "cm", res = 300)
basemap(limits = c(-2e6, 2e6, -3e6, -3e6 + 9/16*4e6), shapefiles = "Arctic", bathymetry = TRUE, glaciers = TRUE, legends = FALSE) + theme_void()
dev.off()


