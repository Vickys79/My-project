pacman::p_load(
  tidyverse, # the tidyverse framework
  skimr# quickly providing a broad overview of a data frame
)
str(table1)
glimpse(table1)
#skim(table1)
starwars %>%
  select(name, height, mass)
starwars %>%
  group_by(gender) %>%
  summarize(
    avg_height = mean(height, na.rm = TRUE) %>% round(2)
  )
table4a
table4a %>%
  pivot_longer(
    cols = c("1999", "2000"), # Selected columns
    names_to = "year", # Shorter columns (the columns going to be in one column called year)
    values_to = "cases"
  ) # Longer rows (the values are going to be in a separate column called named cases)
billboard
billboard %>%
  pivot_longer(
    cols = starts_with("wk"), # Use regular expressions
    names_to = "week",
    values_to = "rank",
    values_drop_na = TRUE # Drop NAs
  )
table2
table2 %>%
  pivot_wider(
    names_from = type, # first
    values_from = count # second
  )

table3
table3 %>%
  separate(rate,
           into = c("cases", "population"),
           sep = "/"
  )

glimpse(mtcars)
dplyr::arrange(mtcars, mpg) # Low to High (default)
#dplyr::arrange(mtcars, desc(mpg)) # High to Row
df <- mtcars %>% rename(milepergalon = mpg)
glimpse(df)
starwars %>%
  dplyr::filter(sex == "female") %>%
  arrange(desc(height))
starwars %>%
  dplyr::filter(height < 180 & height > 160) 
starwars %>%
  dplyr::filter(hair_color %in% c("black", "brown"))
starwars %>%
  arrange(desc(height)) %>%
  slice(1:6)

names(msleep)
# Only numeric
msleep %>%
  dplyr::select(where(is.numeric))
messy_data <- tibble::tribble(
  ~"ColNum1", ~"COLNUM2", ~"COL & NUM3",
  1, 2, 3
)

messy_data

pacman::p_load(janitor)

janitor::clean_names(messy_data)

msleep %>%
  filter(order == "Primates", sleep_total > 10) %>%
  select(name, sleep_rem, sleep_cycle, sleep_total) %>%
  arrange(name) %>%
  mutate(sleep_total_min = sleep_total * 60)

tablea <- msleep %>%
  group_by(order) %>%
  summarise(
    n = n(),
    mean_sleep = mean(sleep_total),
    sd_sleep = sd(sleep_total)
  )
tablea

pacman::p_load(
  kableExtra,
  flextable
)

# For HTML and LaTeX
tablea %>% kableExtra::kable()

msleep %>%
  group_by(order) %>%
  summarise(mean_sleep = mean(sleep_total))

#create data frame
df1 <- data.frame(a = c('a', 'b', 'c', 'd', 'e', 'f'),
                  b = c(12, 14, 14, 18, 22, 23))

df2 <- data.frame(a = c('a', 'a', 'a', 'b', 'b', 'b'),
                  c = c(23, 24, 33, 34, 37, 41))

df3 <- data.frame(a = c('d', 'e', 'f', 'g', 'h', 'i'),
                  d = c(23, 24, 33, 34, 37, 41))
combined_data <- df1 %>%
  left_join(df2, by='a') %>%
  left_join(df3, by='a')
combined_data