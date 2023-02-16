# Plot histogram of values
vector <- st_read("data/moku_final.shp")
vector <- st_make_valid(vector)

plot_hist <- function(island, lc){
  
  sp_subdf <- vector %>% filter(ISLAND == island) %>% select(NAME2, lc)
  subdf <- as.data.frame(sp_subdf)
  
  my_hist <- hist(subdf[,2], breaks=10, plot=F)
  
  my_color= ifelse(my_hist$breaks < -10, rgb(0.8,0.2,0.5,0.5) , 
                   ifelse 
                   (my_hist$breaks >=10, rgb(0.2,0.8,0.5,0.5), rgb(0.2,0.2,0.2,0.2) ))
  
  plot(my_hist, 
       border = F, 
       col = my_color,
       main = "% Change Distribution", 
       xlab = "% Change", 
       ylab = "# of Mokus",
       ylim = c(0,5)
       )
}




