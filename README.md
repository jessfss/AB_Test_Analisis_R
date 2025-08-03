# ShoeFly.com A/B Testing — Aggregate Analysis in R

This repository contains an exercise designed to practice aggregate data analysis in R using a simulated A/B test scenario for ShoeFly.com, an online shoe retailer. The objective is to analyze ad performance across platforms and days of the week using basic R operations like grouping, summarizing, and filtering.

## Project Description

ShoeFly.com ran an A/B test with two versions of an advertisement (Ad A and Ad B). These ads were placed in emails and as banner ads on Facebook, Twitter, and Google. The goal of this analysis is to determine:

- Which ad platform is generating the most views and clicks
- The click-through rates (CTR) per platform
- Performance comparison between Ad A and Ad B
- Daily performance trends of each ad version

The exercise focuses on practicing data aggregation techniques in R using `dplyr` functions.

## Data

The dataset `ad_clicks` contains the following columns:

| Column Name           | Description                                                   |
|-----------------------|---------------------------------------------------------------|
| `user_id`              | Unique identifier for each user                              |
| `utm_source`           | Platform where the ad was shown (email, facebook, google, twitter) |
| `day`                  | Day of the week when the ad was seen                         |
| `ad_click_timestamp`   | Timestamp when the ad was clicked (NA if not clicked)         |
| `ad_clicked`           | Boolean indicating if the ad was clicked (TRUE/FALSE)         |
| `experimental_group`   | Which ad version was shown (A or B)                           |

## Tasks Performed

1. **Data Inspection**: Viewed the first few rows of the dataset to understand column structure.
2. **Views by Platform**: Counted the total number of views per `utm_source`.
3. **Clicks by Platform**: Counted the number of clicks and non-clicks per `utm_source`.
4. **Click-Through Rate (CTR) Calculation**: Calculated the percentage of users who clicked ads from each platform.
5. **Filtered Click Rates**: Extracted CTR data only for clicked ads to evaluate platform effectiveness.
6. **Experimental Group Split**: Verified that users were evenly distributed between experimental groups A and B.
7. **Click Performance by Ad Version**: Compared overall click counts between Ad A and Ad B.
8. **Data Segmentation by Experimental Group**: Created separate datasets for users who saw Ad A and Ad B.
9. **Clicks by Day**: Grouped data by day and click status to observe daily trends.
10. **Daily CTR Calculation**: Calculated daily CTR for each experimental group.
11. **Final Comparison**: Filtered results to only clicked ads and compared daily CTR between Ad A and Ad B.

## Findings

- Facebook and Google had the highest click-through rates.
- Ad A consistently outperformed Ad B on most days except Tuesday.
- Based on the data, Ad A is recommended as the better-performing ad for ShoeFly.com.

## Purpose

This exercise is a practical walkthrough designed to teach aggregation functions in R, such as `group_by()`, `summarize()`, `mutate()`, and `filter()`. It demonstrates how to compute grouped statistics and perform comparative analysis in an A/B testing context.


