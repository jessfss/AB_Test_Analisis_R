---
title: "Aggregates in R"
output: html_notebook
---

```{r message = FALSE, error = TRUE}
# Load packages
library(readr)
library(dplyr)
```

```{r message = FALSE, error = TRUE}
# Load ad clicks data
ad_clicks <- read_csv("ad_clicks.csv")
```

```{r error = TRUE}
# 1. Inspect ad_clicks
head(ad_clicks)
```

```{r error = TRUE}
# 2. Define views_by_utm
views_by_utm <- ad_clicks %>%
  group_by(utm_source) %>%
  summarize(count = n())

views_by_utm
```

```{r error = TRUE}
# 3. Define clicks_by_utm
clicks_by_utm <- ad_clicks %>%
  group_by(utm_source, ad_clicked) %>%
  summarize(count = n())

clicks_by_utm
```

```{r error = TRUE}
# 4/5. Define percentage_by_utm
percentage_by_utm <- clicks_by_utm %>%
  group_by(utm_source) %>%
  mutate(percentage = count / sum(count)) %>%  # count = users clicked/not clicked, sum(count) = total views
  filter(ad_clicked == TRUE)                   # Only keep rows where ads were clicked

percentage_by_utm
```

```{r error = TRUE}
# 6. Define experimental_split
experimental_split <- ad_clicks %>%
  group_by(experimental_group) %>%
  summarize(count = n())

experimental_split
```

```{r error = TRUE}
# 7. Define clicks_by_experiment
clicks_by_experiment <- ad_clicks %>%
  group_by(ad_clicked, experimental_group) %>%
  summarize(count = n())

clicks_by_experiment
```

```{r error = TRUE}
# 8a. Define a_clicks
a_clicks <- ad_clicks %>%
  group_by(ad_clicked, experimental_group) %>%
  summarize(count = n()) %>%
  filter(experimental_group == "A")

a_clicks

# 8b. Define b_clicks
b_clicks <- ad_clicks %>%
  group_by(ad_clicked, experimental_group) %>%
  summarize(count = n()) %>%
  filter(experimental_group == "B")

b_clicks
```

```{r error = TRUE}
# 9a. Define a_clicks_by_day
a_clicks_by_day <- ad_clicks %>%
  filter(experimental_group == "A") %>%
  group_by(day, ad_clicked) %>%
  summarize(count = n(), .groups = 'drop')

a_clicks_by_day

# 9b. Define b_clicks_by_day
b_clicks_by_day <- ad_clicks %>%
  filter(experimental_group == "B") %>%
  group_by(day, ad_clicked) %>%
  summarize(count = n(), .groups = 'drop')

b_clicks_by_day
```

```{r error = TRUE}
# 10a/11. Define a_percentage_by_day
a_percentage_by_day <- a_clicks_by_day %>%
  group_by(day) %>%
  mutate(percentage = count / sum(count)) %>%
  filter(ad_clicked == TRUE)

a_percentage_by_day

# 10b/11. Define b_percentage_by_day
b_percentage_by_day <- b_clicks_by_day %>%
  group_by(day) %>%
  mutate(percentage = count / sum(count)) %>%
  filter(ad_clicked == TRUE)

b_percentage_by_day

# Ad A outperformed Ad B on every day of the week except Tuesday.
