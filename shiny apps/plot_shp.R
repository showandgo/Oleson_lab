# Plot vector shapefile, but only Island of interest
vector <- st_read("data/moku_final.shp")
vector <- st_make_valid(vector)
cols <- carto.pal(pal1 = "red.pal", n1 = 4, pal2 = "green.pal", n2 = 4, middle = TRUE)

plot_sub <- function(island, lc){
  
  sp_subdf <- vector %>% filter(ISLAND == island) %>% select(NAME2, lc) 
#subdf <- as.data.frame(sp_subdf)
  plot(sp_subdf)
  choroLayer(spdf = sp_subdf, 
             breaks = c(-100,-40,-20,-5,0,5,20, 100, 4000),
             var = lc,
             col = cols, 
             border = "grey40", 
             lwd = 0.5,
             legend.pos = "topright",
             legend.horiz = FALSE,
             legend.title.txt = "% Change",
             legend.values.cex = .8)
# legend.pos = "bottomleft",
  labelLayer(spdf = sp_subdf, 
             txt = "NAME2",
             halo = TRUE)
  layoutLayer(title = "% Land Cover Change from 2000-2020", 
              coltitle = "black",
              postitle = "left", 
              tabtitle = TRUE,
              theme = "taupe.pal",
              author = "Author: Louis Chua", 
              sources = "Source: USGS LCMAP", 
              north = FALSE, frame = FALSE, col = NA, scale = NULL)
  north(pos = "topleft")
              
  
  }
  
