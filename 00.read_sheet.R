#24-0103


# 0 library ----
library(pacman)
p_load("tidyverse", "googlesheets4", "bbplot", 
       "scales","gt", "showtext", "nord", 
       "wesanderson","ggrepel");showtext_auto()

#
read_csv("kobis_all0523.csv")
(read_csv("./csv/yearly/kobis_y2023.csv") -> kobis_y2023)


# 
# # 1 read_sheet ----
# ## y2023 ----
# read_sheet("https://docs.google.com/spreadsheets/d/1dd_S45ub9wBXufJsgFkq_hthUN2Ys5U2LtLl5OjnXvk/edit#gid=288217461", 
#            sheet = "KOBIS_Y2023", skip = 4) -> kobis_y2023
# 
# ## y2022 ----
# read_sheet("https://docs.google.com/spreadsheets/d/1-xXUf1eSpVbkd5Xx51sJdWcPKX2kuh2CMJS0r3R0Gy4/edit#gid=291070119", 
#            sheet = "KOBIS_Y2022", skip = 4) -> kobis_y2022
# 
# ## y2021 ----
# read_sheet("https://docs.google.com/spreadsheets/d/1Mx0M93NGi01kzS_LuI_tiofcrsrG2Dq6oPu91GtTcmw/edit#gid=1474269734", 
#            sheet = "KOBIS_Y2021", skip = 4) -> kobis_y2021
# 
# 
# ## y2020 ----
# read_sheet("https://docs.google.com/spreadsheets/d/1tgiCrxaGtnzXIcP-xnOs4xX4HSwOOJyLlVIKv2oITq4/edit#gid=442409610", 
#            sheet = "KOBIS_Y2020", skip = 4) -> kobis_y2020
# 
# ## y2019 ----
# read_sheet("https://docs.google.com/spreadsheets/d/1D2Z-7f9jropJP4zfBtkZZbETlz8gWYB4FkugXz1uvyE/edit#gid=236768290", 
#            sheet = "KOBIS_Y2019", skip = 4) -> kobis_y2019
# 
# 
# ## y2018 ----
# read_sheet("https://docs.google.com/spreadsheets/d/1bb9gsNv4EMZZk-kMkxJdXaRS9sYmYudNJXyEllmTmsY/edit#gid=1073014948", 
#            sheet = "KOBIS_Y2018", skip = 4) -> kobis_y2018
# 
# 
# ## y2017 ----
# read_sheet("https://docs.google.com/spreadsheets/d/1Tch3wPwBAMHwyYM6Kam-H1ecJvnZTqGoqOJMtl_Fla4/edit#gid=409758008", 
#            sheet = "KOBIS_Y2017", skip = 4) -> kobis_y2017
# 
# 
# ## y2016 ----
# read_sheet("https://docs.google.com/spreadsheets/d/1taaFtTE_Mt8YoHkRAbeVVM2gJtl_zKkof2wGAKRr5V8/edit#gid=1804622933", 
#            sheet = "KOBIS_Y2016", skip = 4) -> kobis_y2016
# 
# 
# ## y2015 ----
# read_sheet("https://docs.google.com/spreadsheets/d/1Glo_3Obi9sv-dPQcUoqRpu4UAUYPzLaclhre1zYHL18/edit#gid=1724033134", 
#            sheet = "KOBIS_Y2015", skip = 4) -> kobis_y2015
# 
# ## y2014 ----
# read_sheet("https://docs.google.com/spreadsheets/d/1EF0eY41R_G-S4893PN6RXqqUfJcwZ_EqMEBfBEp7TnQ/edit#gid=868517859", 
#            sheet = "KOBIS_Y2014", skip = 4) -> kobis_y2014
# 
# 
# ## y2013 ----
# read_sheet("https://docs.google.com/spreadsheets/d/1yyq69Fujjqj38cOFETD9rBV3lDzVUYyJ53hlS951__Y/edit#gid=881099952", 
#            sheet = "KOBIS_Y2013", skip = 4) -> kobis_y2013
# 
# 
# ## y2012 ----
# read_sheet("https://docs.google.com/spreadsheets/d/1D1iHJFaySyS6Z3-lVSIYU32IP_Hz45wEFkrzkDkS4fw/edit#gid=2013518353", 
#            sheet = "KOBIS_Y2012", skip = 4) -> kobis_y2012
# 
# 
# ## y2011 ----
# read_sheet("https://docs.google.com/spreadsheets/d/15cfbo19R8RnD2UDQZpVqWRJcIGI5GvDM7NE39-jqzXA/edit#gid=1214548765", 
#            sheet = "KOBIS_Y2011", skip = 4) -> kobis_y2011
# 
# 
# ## y2010 ----
# read_sheet("https://docs.google.com/spreadsheets/d/15VU8Zcdq3nsCIxw6-OOsJEL2gJQsHhream0IegEGsD4/edit#gid=470076271", 
#            sheet = "KOBIS_Y2010", skip = 4) -> kobis_y2010
# 
# 
# ## y2009 ----
# read_sheet("https://docs.google.com/spreadsheets/d/1qYFRSerAoGXV_-hRem4u35EeOZi2lmK_nilceLUOsVk/edit#gid=301070975", 
#            sheet = "KOBIS_Y2009", skip = 4) -> kobis_y2009
# 
# 
# ## y2008 ----
# read_sheet("https://docs.google.com/spreadsheets/d/1X64NLKsBkbh60Qvy12dlANEeunP346zigooL2K0GCOY/edit#gid=1679502232", 
#            sheet = "KOBIS_Y2008", skip = 4) -> kobis_y2008
# 
# 
# ## y2007 ----
# read_sheet("https://docs.google.com/spreadsheets/d/14MSpXxSl51uvqzKjtY-21iDLnxqWflkTgQRDpfZKtNM/edit#gid=726154909", 
#            sheet = "KOBIS_Y2007", skip = 4) -> kobis_y2007
# 
# 
# ## y2006 ----
# read_sheet("https://docs.google.com/spreadsheets/d/1DUT0l9PsXwqIqkH7SaLU_dh4gXMd6Wk1hY6SQ0yeDqM/edit#gid=736198256", 
#            sheet = "KOBIS_Y2006", skip = 4) -> kobis_y2006
# 
# 
# ## y2005 ----
# read_sheet("https://docs.google.com/spreadsheets/d/1PP1hDyMm2qzLeO_XzZf2ABKWqnWVAkM-58EVqxbxo54/edit#gid=296036072", 
#            sheet = "KOBIS_Y2005", skip = 4) -> kobis_y2005
# 
# 
# 
# 
# #2 edit ----
# ## 2023 ----
# (kobis_y2023 |> 
#   mutate(연도 = year(개봉일),
#          월 = month(개봉일),
#          일 = day(개봉일), .before = 1) |> 
#   select(1:5,7:14,개봉일) |> 
#   drop_na(순위, 영화명) -> kobis_edit_y2023)
# 
# 
# ## 2022 ----
# (kobis_y2022 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2022)
# 
# ## 2021 ----
# (kobis_y2021 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2021)
# 
# ## 2020 ----
# (kobis_y2020 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2020)
# 
# ## 2019 ----
# (kobis_y2019 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2019)
# 
# 
# ## 2018 ----
# (kobis_y2018 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2018)
# 
# 
# ## 2017 ----
# (kobis_y2017 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2017)
# 
# 
# ## 2016 ----
# (kobis_y2016 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2016)
# 
# 
# 
# ## 2015 ----
# (kobis_y2015 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2015)
# 
# 
# ## 2014 ----
# (kobis_y2014 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2014)
# 
# 
# ## 2013 ----
# (kobis_y2013 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2013)
# 
# 
# ## 2012 ----
# (kobis_y2012 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2012)
# 
# 
# ## 2011 ----
# (kobis_y2011 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2011)
# 
# 
# ## 2010 ----
# (kobis_y2010 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2010)
# 
# ## 2009 ----
# (kobis_y2009 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2009)
# 
# ## 2008 ----
# (kobis_y2008 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2008)
# 
# 
# ## 2007 ----
# (kobis_y2007 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2007)
# 
# 
# ## 2006 ----
# (kobis_y2006 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2006)
# 
# 
# ## 2005 ----
# (kobis_y2005 |> 
#     mutate(연도 = year(개봉일),
#            월 = month(개봉일),
#            일 = day(개봉일), .before = 1) |> 
#     select(1:5,7:14,개봉일) |> 
#     drop_na(순위, 영화명) -> kobis_edit_y2005)
# 
# 
# kobis_edit_y2005 |> tail()
# kobis_edit_y2006 |> tail()
# kobis_edit_y2007 |> tail()
# kobis_edit_y2008 |> tail()
# kobis_edit_y2009 |> tail()
# kobis_edit_y2010 |> tail()
# 
# kobis_edit_y2011 |> tail()
# kobis_edit_y2012 |> tail()
# kobis_edit_y2013 |> tail()
# kobis_edit_y2014 |> tail()
# kobis_edit_y2015 |> tail()
# kobis_edit_y2016 |> tail()
# kobis_edit_y2017 |> tail()
# kobis_edit_y2018 |> tail()
# kobis_edit_y2019 |> tail()
# kobis_edit_y2020 |> tail()
# 
# kobis_edit_y2021 |> tail()
# kobis_edit_y2022 |> tail()
# 
# # 3 factor ----
# ## 3-1 순위
# kobis_edit_y2005$순위 |> 
#   as.character() |> 
#   as.double() -> kobis_edit_y2005$순위
# 
# kobis_edit_y2006$순위 |> 
#   as.character() |> 
#   as.double() -> kobis_edit_y2006$순위
# kobis_edit_y2006
# 
# kobis_edit_y2007$순위 |> 
#   as.character() |> 
#   as.double() -> kobis_edit_y2007$순위
# 
# kobis_edit_y2008$순위 |> 
#   as.character() |> 
#   as.double() -> kobis_edit_y2008$순위
# 
# kobis_edit_y2009$순위 |> 
#   as.character() |> 
#   as.double() -> kobis_edit_y2009$순위
# 
# kobis_edit_y2010$순위 |> 
#   as.character() |> 
#   as.double() -> kobis_edit_y2010$순위
# 
# kobis_edit_y2011$순위 |> 
#   as.character() |> 
#   as.double() -> kobis_edit_y2011$순위
# 
# kobis_edit_y2012$순위 |> 
#   as.character() |> 
#   as.double() -> kobis_edit_y2012$순위
# 
# kobis_edit_y2013$순위 |> 
#   as.character() |> 
#   as.double() -> kobis_edit_y2013$순위
# 
# ## 3-2 영화명
# kobis_edit_y2007$영화명 |> 
#   as.character() |> 
#   as.factor() -> kobis_edit_y2007$영화명
# 
# kobis_edit_y2008$영화명 |> 
#   as.character() |> 
#   as.factor() -> kobis_edit_y2008$영화명
# 
# kobis_edit_y2009$영화명 |> 
#   as.character() |> 
#   as.factor() -> kobis_edit_y2009$영화명
# 
# kobis_edit_y2010$영화명 |> 
#   as.character() |> 
#   as.factor() -> kobis_edit_y2010$영화명
# 
# kobis_edit_y2011$영화명 |> 
#   as.character() |> 
#   as.factor() -> kobis_edit_y2011$영화명
# 
# kobis_edit_y2012$영화명 |> 
#   as.character() |> 
#   as.factor() -> kobis_edit_y2012$영화명
# 
# kobis_edit_y2013$영화명 |> 
#   as.character() |> 
#   as.factor() -> kobis_edit_y2013$영화명
# 
# kobis_edit_y2014$영화명 |> 
#   as.character() |> 
#   as.factor() -> kobis_edit_y2014$영화명
# 
# kobis_edit_y2015$영화명 |> 
#   as.character() |> 
#   as.factor() -> kobis_edit_y2015$영화명
# 
# 
# kobis_edit_y2016$영화명 |> 
#   as.character() |> 
#   as.factor() -> kobis_edit_y2016$영화명
# 
# kobis_edit_y2017$영화명 |> 
#   as.character() |> 
#   as.factor() -> kobis_edit_y2017$영화명
# 
# 
# kobis_edit_y2018$영화명 |> 
#   as.character() |> 
#   as.factor() -> kobis_edit_y2018$영화명
# 
# 
# kobis_edit_y2019$영화명 |> 
#   as.character() |> 
#   as.factor() -> kobis_edit_y2019$영화명
# 
# kobis_edit_y2020$영화명 |> 
#   as.character() |> 
#   as.factor() -> kobis_edit_y2020$영화명
# 
# 
# kobis_edit_y2021$영화명 |> 
#   as.character() |> 
#   as.factor() -> kobis_edit_y2021$영화명
# 
# kobis_edit_y2023$영화명 |> 
#   as.character() |> 
#   as.factor() -> kobis_edit_y2023$영화명


## write_csv ----
# kobis_edit_y2005 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2005.csv")
# 
# kobis_edit_y2006 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2006.csv")
# 
# 
# kobis_edit_y2007 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2007.csv")
# 
# kobis_edit_y2008 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2008.csv")
# 
# kobis_edit_y2009 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2009.csv")
# 
# kobis_edit_y2010 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2010.csv")
# 
# kobis_edit_y2011 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2011.csv")
# 
# kobis_edit_y2012 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2012.csv")
# 
# kobis_edit_y2013 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2013.csv")
# 
# kobis_edit_y2014 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2014.csv")
# 
# kobis_edit_y2015 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2015.csv")
# 
# kobis_edit_y2016 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2016.csv")
# 
# kobis_edit_y2017 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2017.csv")
# 
# kobis_edit_y2018 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2018.csv")
# 
# kobis_edit_y2019 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2019.csv")
# 
# kobis_edit_y2020 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2020.csv")
# 
# kobis_edit_y2021 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2021.csv")
# 
# kobis_edit_y2022 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2022.csv")
# 
# kobis_edit_y2023 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("./csv/yearly/kobis_y2023.csv")


# ## join  ---- 
# ### join 1 ----
# kobis_edit_y2005 |> 
#   full_join(kobis_edit_y2006) -> kobis_05_06
# 
# kobis_edit_y2007 |> 
#   full_join(kobis_edit_y2008) -> kobis_07_08
# 
# ##
# kobis_edit_y2009 |> 
#   full_join(kobis_edit_y2010) -> kobis_09_10
# 
# kobis_edit_y2011 |> 
#   full_join(kobis_edit_y2012) -> kobis_11_12
# 
# ##
# kobis_edit_y2013 |> 
#   full_join(kobis_edit_y2014) -> kobis_13_14
# 
# kobis_edit_y2015 |> 
#   full_join(kobis_edit_y2016) -> kobis_15_16
# 
# kobis_edit_y2017 |> 
#   full_join(kobis_edit_y2018) -> kobis_17_18
# 
# kobis_edit_y2019 |> 
#   full_join(kobis_edit_y2020) -> kobis_19_20
# 
# kobis_edit_y2021 |> 
#   full_join(kobis_edit_y2022) -> kobis_21_22
# 
# ### join 2 ---- 
# kobis_05_06 |> 
#   full_join(kobis_07_08) -> kobis_depth_0506_0708
# 
# kobis_09_10 |> 
#   full_join(kobis_11_12) -> kobis_depth_0910_1112
# 
# ##
# kobis_13_14 |> 
#   full_join(kobis_15_16) -> kobis_depth_1314_1516
# 
# kobis_17_18 |> 
#   full_join(kobis_19_20) -> kobis_depth_1718_1920
# 
# kobis_21_22 |> 
#   full_join(kobis_edit_y2023) -> kobis_depth_2122_23
# 
# 
# ### join 3 ----
# kobis_depth_0506_0708 |> 
#   full_join(kobis_depth_0910_1112) -> kobis_2depth_0512
# 
# kobis_depth_1314_1516 |> 
#   full_join(kobis_depth_1718_1920) -> kobis_2depth_1320
# 
# 
# ### join 4 ----
# kobis_2depth_0512 |> 
#   full_join(kobis_2depth_1320) -> kobis_3depth_0520
# 
# kobis_3depth_0520 |> 
#   full_join(kobis_depth_2122_23) -> kobis_all0523
# 
# 
# ### join 5 write_csv ----
# kobis_2depth_0512 |> write_csv("kobis_05to12Y")
# kobis_2depth_1320 |> write_csv("kobis_13to20Y")
# kobis_depth_2122_23 |> write_csv("kobis_21to23Y")
# 
# kobis_all0523 |> 
#   rename(매출액_점유율 = `매출액 점유율`) |> 
#   write_csv("kobis_all0523.csv")



