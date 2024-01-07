#24-0107 sun 17:42

# 0 library ----
library(pacman)
p_load("tidyverse", "googlesheets4", "bbplot", 
       "scales","gt", "showtext", "nord", 
       "wesanderson","ggrepel");showtext_auto()


#
kobis_y2023$대표국적 |> 
  fct_relevel(
  c("한국", "미국", "일본")) -> kobis_y2023$대표국적




## 1-1 2023 top 20 그래프 ----
kobis_y2023 |> names()
kobis_y2023 |> head()
kobis_y2023 |> 
  filter(순위 %in% c(1:20)) |> 
  ggplot(aes(x = 영화명 |> fct_reorder(관객수), 
             y = 매출액/100000000)) +
  geom_bar(stat = "identity",
           aes(fill = 대표국적)) +
  geom_label(aes(label = paste(round(매출액/100000000,0),
                               "억")), size = 8) +
  geom_text(aes(label = comma(관객수), y = 50), size = 5) +
  coord_flip() +
  bbc_style() +
  scale_fill_manual(values = kobis_country) +
  scale_y_continuous(labels = comma, limits = c(0,1300), 
                     breaks = c(300,600,900,1200)) +
  ggtitle("2023년 1~12월 박스오피스 Top 20", 
          "극장관객수, 누적매출액") +
  theme(panel.grid.major.x = element_line(color = "grey"),
        panel.grid.major.y = element_blank(), 
        axis.text.x = element_text(size = 28))


## 1-1_edit 2023 top 20 그래프 ----
kobis_y2023 |> 
  filter(순위 %in% c(1:20)) |> 
  ggplot(aes(x = 영화명 |> fct_reorder(관객수), 
             y = 매출액/100000000)) +
  geom_bar(stat = "identity",
           aes(fill = 대표국적)) +
  geom_label(aes(label = paste(round(매출액/100000000,0),
                               "억")), 
            size = 8, 
            position = position_stack()) +
  geom_text(aes(label = paste(round(관객수/10000,0),"만명"), 
                y = 60), size = 5, color = "white") +
  coord_flip() +
  bbc_style() +
  scale_fill_manual(values = kobis_country) +
  scale_y_continuous(labels = comma, limits = c(0,1300), 
                     breaks = c(300,600,900,1200)) +
  ggtitle("2023년 1~12월 박스오피스 Top 20", 
          "극장관객수, 누적매출액") +
  theme(panel.grid.major.x = element_line(color = "grey"),
        panel.grid.major.y = element_blank(), 
        axis.text.x = element_text(size = 28))

#
kobis_y2022 |> 
  filter(str_detect(영화명, "한산"))

kobis_y2022 |> 
  filter(str_detect(영화명, "미션")) |> 
  select(1:2)


# test 3
#read_csv("kobis_all0523.csv") -> kobisall_1csv
kobis_y2023 |> 
  filter(순위 %in% c(1:20)) |> 
  ggplot(aes(x = 영화명 |> fct_reorder(관객수), 
             y = 매출액/100000000)) +
  geom_bar(stat = "identity",
           aes(fill = 대표국적)) +
  geom_label(aes(label = paste(round(매출액/100000000,0),
                               "억")), 
             size = 8, 
             position = position_stack()) +
  geom_text(aes(label = paste(round(관객수/10000,0),"만명"), 
                y = 60), size = 5, color = "white") +
  coord_flip() +
  bbc_style() +
  #facet_grid(대표국적~., scales = "free") +
  scale_fill_manual(values = kobis_country) +
  scale_y_continuous(labels = comma, limits = c(0,1300), 
                     breaks = c(300,600,900,1200)) +
  ggtitle("2023년 1~12월 박스오피스 Top 20", 
          "극장관객수, 누적매출액") +
  theme(panel.grid.major.x = element_line(color = "grey"),
        panel.grid.major.y = element_blank(), 
        axis.text.x = element_text(size = 28))

# test 3-1
kobis_y2023 |> 
  filter(순위 %in% c(1:20)) |> 
  ggplot(aes(x = 영화명 |> fct_reorder(관객수), 
             y = 매출액/100000000)) +
  geom_bar(stat = "identity",
           aes(fill = 대표국적),
           show.legend = F) +
  geom_label(aes(label = paste(round(매출액/100000000,0),
                               "억")), 
             size = 8, 
             position = position_stack()) +
  geom_text(aes(label = paste(round(관객수/10000,0),"만명"), 
                y = 60), size = 5, color = "white") +
  coord_flip() +
  bbc_style() +
  facet_grid(대표국적~., scales = "free") +
  scale_fill_manual(values = kobis_country) +
  scale_y_continuous(labels = comma, limits = c(0,1300), 
                     breaks = c(300,600,900,1200)) +
  ggtitle("2023년 1~12월 박스오피스 Top 20", 
          "극장관객수, 누적매출액") +
  theme(panel.grid.major.x = element_line(color = "grey"),
        panel.grid.major.y = element_blank(), 
        axis.text.x = element_text(size = 28), 
        strip.text.y = element_text(angle = 0, hjust = .5),
        strip.background.y = element_rect(fill = "grey"))

# test 4 ----
kobis_y2023 |> 
  filter(순위 < 21) |> 
  select(1:7) |> 
  gt()

kobis_y2023 |> 
  mutate(cum_sum = cumsum(매출액_점유율)*100) |> 
  select(1:7, cum_sum) |> 
  gt()


# 전체 영화 누적매출
kobis_y2023 |> 
  filter(관객수 > 100) |> 
  group_by(대표국적) |> 
  mutate(cum_sum = cumsum(매출액_점유율)*100) |> 
  filter(대표국적 %in% c("한국", "미국", "일본"), 
         관객수 > 10000) |> 
  reframe(대표국적, 영화명, cum_sum) 


#
kobis_y2023 |> 
  group_by(대표국적) |> 
  reframe(매출액기여 = sum(매출액)) |> 
  mutate(
    비율 = round(prop.table(매출액기여),4)*100) |> 
  arrange(desc(매출액기여)) |> 
  mutate(순위 = row_number(desc(매출액기여)),
         비율 = paste0(비율, "%")) |> 
  filter(순위 < 21)


#




































