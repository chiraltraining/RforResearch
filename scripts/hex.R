# load the necessary packages
library(hexSticker) # hexSticker generator
library(magick)     # Advanced image processing
library(sysfonts)   # font selection
library(tidyverse)

library(showtext)
## Loading Google fonts (http://www.google.com/fonts)
font_add_google("Gochi Hand", "gochi")
## Automatically use showtext to render text for future devices
showtext_auto()


# Create your first sticker------------------
img <- image_read('F:/VirtualWeekendWorkshops/VWW01_DataAnalysiswithR/images/Rlogo.png')

sticker(
  subplot = img,
  package = "Learn",
  s_width = 1,
  s_height = 1,
  s_x = 1,
  s_y = 0.85,
  p_size = 20,
  h_fill = '#1881c2',
  h_color = '#003f5c',
  h_size = 1.5,
  url = "Data Analysis with R",
  u_size = 5,
  u_color = 'white',
  spotlight = T,
  l_y = 1,
  l_x = 1,
  l_width = 3,
  l_height = 3,
  l_alpha = 0.3,
  p_color = 'white',
  p_family = "gochi"
) %>% print()
