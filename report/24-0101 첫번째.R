#24-0101
#rm(list = ls())

#
library(googlesheets4)
library(tidyverse)
library(showtext)
showtext_auto()
library(gt)
library(scales)
library(bbplot)


# 1 read_sheet----
## 1-1 sheet
(read_sheet("https://docs.google.com/spreadsheets/d/1B6GGsf7i4-aGHe8zOYIKysFFxQNUf8qPZHXmw9rCMD0/edit#gid=453119655",
           sheet = "KOBIS_2004_2023", skip = 3) -> kobis1_1csv)
  ## xls 파일 error -> "파일 > Google Sheet 로 저장" 

kobis1_1csv
kobis1_1csv |> colnames()
#kobis1_1csv |> view()

## 1-2 사본 만들기
kobis1_1csv -> kobis1_2사본
kobis1_2사본

## 1-3 rename
kobis1_2사본 |> 
  colnames() <- c("연도", "한국_개봉편수", "한국_상영편수", 
                  "한국_매출액", "한국_관객수", 
                  "한국_점유율", 
                  "외국_개봉편수", "외국_상영편수", 
                  "외국_매출액", "외국_관객수", 
                  "외국_점유율", 
                  "전체_개봉편수", "전체_상영편수", 
                  "전체_매출액", "전체_관객수")

#kobis1_2사본 |> slice(-1) |> view()
kobis1_2사본 |> slice(-1) -> kobis1_3rename

#
kobis1_3rename |> view()
kobis1_3rename |> glimpse()

  ## factor ----
kobis1_3rename$연도 |> as.integer() -> kobis1_3rename$연도
kobis1_3rename$한국_매출액 |> 
  as.numeric() -> kobis1_3rename$한국_매출액
kobis1_3rename$전체_관객수 |> 
  as.integer() -> kobis1_3rename$전체_관객수

#
kobis1_3rename |> 
  drop_na(연도) |> 
  ggplot(aes(x = factor(연도), 
             y = 전체_관객수/1000000)) +
  geom_bar(stat = "identity") +
  bbc_style() +
  #scale_fill_manual(values = )
  geom_hline(yintercept = 
               kobis1_3rename$전체_관객수[20]/1000000) +
  geom_hline(yintercept = 0, size = 1.5) +
  ggtitle("국내 극장관객수 추이(단위 100만명)", 
          "코로나 이후 다시 성장하는 영화산업") +
  theme(axis.text.x = element_text(angle = 45))


  #1-2-1 mutate
kobis1_2한국$국가 <- factor("한국")
kobis1_2외국$국가 <- factor("외국")
kobis1_2전체$국가 <- factor("전체")

kobis1_2외국
kobis1_2전체




## 2-1 sheet
(read_sheet("https://docs.google.com/spreadsheets/d/1B6GGsf7i4-aGHe8zOYIKysFFxQNUf8qPZHXmw9rCMD0/edit#gid=453119655",
            sheet = "KOBIS_2004_2023", 
            skip = 3, col_names = F) -> kobis3_1csv)

kobis3_1csv |> view()
kobis3_1csv |> slice(2) |> view()
kobis3_1csv |> slice(2) -> kobis3_1csv |> colnames()
kobis3_1csv |> colnames()
kobis3_1csv |> view()


# billboard %>%
#   pivot_longer(
#     cols = starts_with("wk"),
#     names_to = "week",
#     names_prefix = "wk",
#     values_to = "rank",
#     values_drop_na = TRUE) |> print(n = 20)
# 
# 
# ## 3-1 sheet
# (read_sheet("https://docs.google.com/spreadsheets/d/1B6GGsf7i4-aGHe8zOYIKysFFxQNUf8qPZHXmw9rCMD0/edit#gid=453119655",
#             sheet = "KOBIS_2004_2023", 
#             skip = 4) -> kobis3_1csv)
# 
# kobis3_1csv


















