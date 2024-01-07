#24-0101
#rm(list = ls())

#
library(pacman)
p_load("tidyverse", "googlesheets4", "bbplot", "scales",
       "gt", "showtext", "nord", "wesanderson",
       "ggrepel"); showtext_auto()

# 1 read_sheet----
## 1-1 sheet
(read_sheet("https://docs.google.com/spreadsheets/d/1B6GGsf7i4-aGHe8zOYIKysFFxQNUf8qPZHXmw9rCMD0/edit#gid=453119655",
           sheet = "KOBIS_2004_2023", skip = 3) -> kobis1_1csv)
  ## xls 파일 error -> "파일 > Google Sheet 로 저장" 

#kobis1_1csv
#kobis1_1csv |> colnames()
#kobis1_1csv |> view()

## 1-2 사본 만들기
kobis1_1csv -> kobis1_2사본

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

(kobis1_2사본 |> slice(-1) -> kobis1_3rename)

  ## factor ----
(kobis1_3rename$연도 |> as.integer() -> kobis1_3rename$연도)
(kobis1_3rename$한국_매출액 |> 
  as.numeric() -> kobis1_3rename$한국_매출액)
(kobis1_3rename$전체_관객수 |> 
  as.integer() -> kobis1_3rename$전체_관객수)

#
(kobis1_3rename |> 
  drop_na(연도) -> kobis1_4drop_na연도)

kobis1_4drop_na연도 |> 
  ggplot(aes(x = factor(연도), 
             y = 전체_관객수/100000000)) +
  geom_bar(stat = "identity", 
          fill = ifelse(kobis1_4drop_na연도$연도 %in% 
                         c("2005", "2023"), 
                        "#E53458", "#474747")) +
  geom_hline(yintercept = 
               kobis1_3rename$전체_관객수[20]/100000000,
             linetype = 2, size = 2, color = "#04967F") +
  bbc_style() +
  geom_label(aes(label = round(전체_관객수/100000000,2)), 
             size = 7) +
  #scale_fill_manual(values = )
  geom_hline(yintercept = 0, size = 1.5) +
  ggtitle("국내 극장관객수 추이 (단위 1억 명)", 
          "2.27억명을 향해 다시 도약하는 영화산업") +
  theme(axis.text.x = element_text(hjust = .9, angle = 45,
                                   size = 22))

kobis1_4drop_na연도 |> 
  filter(연도 == "2019") |> gt()


# color ====
#"#04967F"
#장소
c("고양" = "#E5E9F0",
  "국립극장" = "#DB6774",
  "노들섬" = "#d8d8d8",
  "부산" = "#4F93B8",
  "서교" = "#AF967D",
  "서울역" = "#D6BBCF",
  "성수" = "#E1AF64",
  "여의도" = "#C0D8D8",
  "을지" = "#A8A8A8",
  "의성" = "#5E81AC", 
  "인사" = "#A3BE8C",
  '파아프' = "#90A8C0",
  "혜화"  = "#F0D8C0") -> mrcplace

# True & False
c("1" = "#5E81AC", 
  "0" = "#BF616A") -> mrclogic

# 시장
c("작은시장" = "#A8A890",
  "농부시장" = "#D08770",
  "미식주간마켓" = "#B48EAD",
  "쉐어마켓" = "#C0D8D8",
  "작은시장" = "#EBCB8B",  
  "작은커피장" = "#90A8C0",
  "채소시장" = "#A3BE8C") -> mrcmarket

#팀
c("미국" = "#46C42F", #94D664 
  "일본" = "#E53458", ##E53434
  "한국" = "#349EE5",
  "수공예팀" = "#BF7830",
  "이벤트팀" = "#7947F7" #F7A449
) -> mrcteam


c("미국" = "#2AA638", #94D664 
  "일본" = "#E53458", ##E53434
  "한국" = "#0047A0") -> kobis_country
  


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


















