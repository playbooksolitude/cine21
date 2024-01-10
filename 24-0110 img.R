#24-0110 wedn 

#img

library(ggimg)
library(ggplot2)
library(dplyr)
library(showtext); showtext_auto()

(mutate(posters,
        path = file.path(system.file("extdata", 
                                     package="ggimg"), 
                         img)) -> posters) 


#
ggplot(posters) +
  geom_rect_img(aes(
    xmin = year - 0.5,
    xmax = year + 0.5,
    ymin = stars - 0.5,
    ymax = stars + 0.5,
    img = path
  )) +
  ggtitle("IMDB 영화 별점", " ") +
  theme_minimal() +
  theme(axis.text = element_text(size = 22),
        axis.title = element_text(size = 22))
