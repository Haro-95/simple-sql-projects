







# Video Game Sales Analysis

A simple SQL analysis script for a video game sales dataset.

## Purpose

This project analyze a video games sales using SQL queries. It provides information about top-selling games, total sales, and details about specific regions and games. Keep in mind that all sales information is in millions (e.g. 3.0 represents 3 million).


# Setup

1. **Import Table and Data**

   ```bash
   -- Query to create the table
   
    CREATE TABLE video_games_sales (
    Rank INTEGER,
    Name VARCHAR(255),
    Platform VARCHAR(50),
    Year VARCHAR(10),
    Genre VARCHAR(50),
    Publisher VARCHAR(255),
    NA_Sales NUMERIC,
    EU_Sales NUMERIC,
    JP_Sales NUMERIC,
    Other_Sales NUMERIC,
    Global_Sales NUMERIC
    );

```bash
-- Query to import the .csv file

COPY video_games_sales FROM '/your/path/to/the/file/vgsales.csv' 
DELIMITER ',' CSV HEADER;
```
2. **Queries and Results**

#### Q1: Top 10 Best-Selling Games (2006-2010)

```
SELECT name, year, eu_sales 
FROM video_games_sales
WHERE year BETWEEN '2006' AND '2010'
ORDER BY eu_sales DESC
LIMIT 10;
```
#### Expected Result:

| name                       | year | eu_sales |
|----------------------------|------|----------|
|Wii Sports                  | 2006 | 29.02    |
|Mario Kart Wii              | 2008 | 12.88    |
|Wii Sports Resort           | 2009 | 11.01    |
|New Super Mario Bros.       | 2006 | 9.23     |
|Wii Play                    | 2006 | 9.2      |
|Wii Fit Plus                | 2009 | 8.59     |
|Wii Fit                     | 2007 | 8.03     |
|New Super Mario Bros. Wii   | 2009 | 7.06     |
|The Sims 3                  | 2009 | 6.42     |
|Kinect Adventures!          | 2010 | 4.94     |


#### Q2: Total EU Sales in 2014

```
SELECT SUM(eu_sales) AS total_eu_sales
FROM video_games_sales
WHERE year = '2014';

```
#### Expected Result:

| total_eu_sales |
|----------------|
|125.65          |

#### Q3: Best-Selling PSP Game in Japan (2009)

```
SELECT name, jp_sales 
FROM video_games_sales
WHERE year = '2009' AND platform = 'PSP'
ORDER BY jp_sales DESC
LIMIT 1;
```
#### Expected Result:

| name                       | jp_sales |
|----------------------------|----------|
|Phantasy Star Portable 2    | 0.62     |


#### Q4: All sports games from 'Electronic Arts' for PS4 with sales more than 2.5M for EU

```
SELECT name, eu_sales 
FROM video_games_sales
WHERE publisher = 'Electronic Arts'
AND genre = 'Sports'
AND platform = 'PS4'
AND eu_sales > 2.5
ORDER BY eu_sales DESC;

```
#### Expected Result:

| name                       | eu_sales |
|----------------------------|----------|
|FIFA 16                     | 6.06     |
|FIFA 15                     | 4.29     |
|FIFA 17                     | 3.75     |

