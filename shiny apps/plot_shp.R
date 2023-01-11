# Plot vector shapefile, but only Island of interest

vector <- shapefile("data/Moku_NEW.shp")

plot_sub <- function(island){
  plot(vector[vector$ISLAND == island,])
}


