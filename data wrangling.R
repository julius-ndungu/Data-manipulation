library(tidyverse)
volcano <- read.csv("volcano.csv")
volcano <- read_csv("volcano.csv")

#1. Arrange.
table2 %>% 
  arrange(year, count)
?table2
table2 %>% 
  arrange(year,desc(count))
x <- tibble(y = c(1,2,NA,3,4))
x %>% arrange(x)
x %>% arrange(desc(x))

library(gapminder)
gapminder %>% 
  filter(country == "Kenya")
gapminder %>% filter(country %in% c("Kenya","Tanzania")) %>% 
  print(n = 24)






#2. Select
mtcars %>% select(mpg,hp) %>% glimpse()
mtcars %>% 
  select(hp:vs) %>% glimpse()

mtcars %>% select(everything())
mtcars %>% 
  select(-(mpg:disp)) %>% glimpse()
mtcars %>% select(-(2:5)) %>% glimpse()
diamonds %>% 
  select(ends_with("c")) %>% glimpse()
mtcars %>% select(starts_with("c")) %>% glimpse()
mtcars %>% 
  select(contains("c")) %>% glimpse()
mtcars %>% select(!contains("a") & contains("c")) %>% glimpse()
mtcars %>% 
  select(starts_with("c") |
           !ends_with(c("p","t"))) %>% glimpse()
mtcars %>% 
  select(mpg,hp, everything())
mtcars %>% relocate(mpg, hp)
mtcars %>% 
  select(last_col())
mtcars %>% 
  select(last_col(offset = 3))
diamonds %>% select_if(is.numeric)        
mtcars %>% 
  select_at(vars(mpg,hp), toupper) %>% glimpse()
mtcars %>% first()
mtcars %>% last()
mtcars %>% nth(3)
mtcars %>% head(n = 10)
mtcars %>% tail(n = 10)
#3. Mutate
mtcars %>% 
  add_column(new = 1:32)
rectangle <- tibble(length = c(10,20,30),width = c(2,3,4))
rectangle %>% mutate(area = length*width)


mtcars %>% 
  select(1:3) %>% 
  add_column(id = 1:32, .before = T)
mtcars %>% 
  select(1:3) %>% 
  mutate(id = 1:32, .after = cyl)
mtcars %>% 
  select(-(1:4)) %>% 
  rownames_to_column() %>% head()
mtcars %>% 
  mutate_at(vars(cyl, am, gear), factor) %>% glimpse()
mtcars %>% 
  summarise_all(median)
iris %>% 
  mutate_if(is.numeric, log) %>% glimpse()
#filter
mtcars %>% 
  slice(1:3)
mtcars %>% 
  slice_sample(n = 4)
mtcars %>% 
  slice_sample(prop = .1)
mtcars %>% 
  slice_head(n = 3)
mtcars %>% 
  slice_tail(n =3)
mtcars %>% 
  group_by(am) %>% 
  slice_min(mpg,n = 2)
mtcars %>% 
  group_by(am) %>% 
  slice_max(mpg,n = 2)
mtcars %>% 
  group_by(cyl) %>% 
  slice_max(mpg, prop = 0.1)
mtcars %>% 
  distinct(cyl)
mtcars %>% 
  distinct(cyl, am)
mtcars %>% 
  distinct(cyl, am, .keep_all = TRUE)
bla <- tibble(y = c(2,2,NA,3,4,4), y2 = c(2,2,2,NA,4,4))
bla
unique(bla)
distinct_all(bla)
bla %>% 
  add_row(y = 100, y2 = 200)
library(DataExplorer)
create_report(iris,y="Species")



sales <- data.frame(id = 1:10, price = c(10,20,30,40,50,60,70,80,90,100),
                    quantity = c(5,10,15,20,25,30,35,40,45,50))
r <- sales|>mutate(amount=price*quantity)

