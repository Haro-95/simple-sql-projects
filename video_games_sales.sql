-- SQL Analysis Script for Video Game Sales Dataset
-- Author: Haro-95
-- Version: 1.0


-- Section 1: Import table and the .csv file

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


-- Query to import the .csv file
COPY video_games_sales FROM '/your/path/to/the/file/vgsales.csv' DELIMITER ',' CSV HEADER;


-- Section 2: Queries

-- Q1: What were top 10 best-selling games from 2006 to 2010?
SELECT name, year, eu_sales 
FROM video_games_sales
Group by name, year, eu_sales
HAVING year != 'N/A' 
AND year BETWEEN '2006' AND '2010'
ORDER BY eu_sales DESC
LIMIT 10


-- Q2: What was the total number of games sold in 2014 for EU?
SELECT year,SUM(eu_sales)
FROM video_games_sales
GROUP BY year
HAVING year = '2014'


-- Q3: What was the best-selling PSP game in Japan for 2009?
SELECT name, jp_sales 
FROM video_games_sales
WHERE year = '2009' AND platform = 'PSP'
ORDER BY jp_sales DESC
LIMIT 1

-- Q4: List all sport games for PS4 from Electronic Arts with sales more than 2.5M sales for EU
SELECT name, eu_sales FROM video_games_sales
WHERE publisher = 'Electronic Arts'
AND genre = 'Sports'
AND platform = 'PS4'
ORDER BY eu_sales DESC