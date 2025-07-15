CREATE DATABASE Walmart_Project;
SHOW databases;
USE Walmart_Project;
drop table root;
Show Tables;
SELECT * FROM walmart;
SELECT COUNT(*) AS Total_Entries FROM walmart;


-- Ques-1 : What are the different payment methods, and how many transactions and items were sold with each method?

SELECT 
    payment_method,
    COUNT(payment_method) AS Count,
    SUM(quantity) AS Total_Qty
FROM
    walmart
GROUP BY payment_method
ORDER BY Total_Qty DESC;


-- Ques-2 : Which category received the highest average rating in each branch?


SELECT * FROM 
	(SELECT 
		Branch,category, AVG(rating) AS Average_rating,
		RANK() over(Partition by Branch order by AVG(rating) DESC) as ranking
	FROM
		walmart
	GROUP BY Branch,category
) as Rank_Table
WHERE ranking = 1
;


-- Ques-3 : What is the busiest day of the week for each branch based on transaction volume?


-- First we need to change the date from text format to date format
select date, str_to_date(date, '%d/%m/%y') as Formatted_date
from walmart;

-- Then we'll be extracting the day name from date
select date, dayname(str_to_date(date, '%d/%m/%y')) as Day_Name
from walmart;

-- Final Solution 
SELECT * FROM 
    (SELECT 
		Branch,
		DAYNAME(STR_TO_DATE(date, '%d/%m/%y')) AS Day_Name,
		COUNT(*) AS No_of_transactions,
		RANK() OVER( PARTITION BY Branch ORDER BY COUNT(*) DESC) as Ranking
	FROM
		walmart
	GROUP BY branch , Day_Name
    ) as Rank_Table
    WHERE Ranking = 1;
    
    
-- Ques-4 : How many items were sold through each payment method?


SELECT 
    payment_method, SUM(quantity)
FROM
    walmart
GROUP BY payment_method
ORDER BY SUM(quantity) DESC;


-- Ques-5 : What are the average, minimum, and maximum ratings for each category in each city?


SELECT 
    category,City,
    AVG(rating) AS Average_Rating,
    MIN(rating) AS Min_Rating,
    MAX(rating) AS Max_Rating
FROM
    walmart
GROUP BY category,City
ORDER BY category,City;


-- Ques-6 : What is the total profit for each category, ranked from highest to lowest?


SELECT 
    category,
    SUM(Total_Price) AS Total_Revenue,
    SUM(Total_Price * profit_margin) AS Total_Profit
FROM
    walmart
GROUP BY category
ORDER BY Total_Profit DESC;


-- Ques-7 : What is the most frequently used payment method in each branch?


SELECT * FROM
	(SELECT 
		Branch, payment_method, COUNT(payment_method) as Payment_Count,
		RANK() OVER(PARTITION BY Branch ORDER BY COUNT(payment_method)DESC) as Ranking
	FROM
		walmart
	GROUP BY Branch , payment_method
    ) as Rank_Table
    WHERE Ranking = 1;
    
    
-- Ques-8 : How many transactions occur in each shift (Morning, Afternoon, Evening) across branches?


-- First we need to change the time from text format to Date & Time format
-- Then we have to extract the hour from that time 
SELECT 
    time, HOUR(STR_TO_DATE(time, '%H:%i:%s')) AS Hour
FROM
    walmart;

-- Final Solution of the question 
SELECT 
    Branch, Shift, COUNT(*) AS Total_Transactions
FROM
    (SELECT 
        Branch,
            time,
            CASE
                WHEN HOUR(STR_TO_DATE(time, '%H:%i:%s')) BETWEEN 6 AND 11 THEN 'Morning'
                WHEN HOUR(STR_TO_DATE(time, '%H:%i:%s')) BETWEEN 12 AND 17 THEN 'Afternoon'
                ELSE 'Evening'
            END AS Shift
    FROM
        walmart) AS hour_table
GROUP BY Branch , Shift
ORDER BY Branch , Total_Transactions DESC;


-- Ques-9 : Which branches experienced the largest decrease in revenue compared to the previous year?


-- Final Solution to the Question using Window Function
SELECT *
FROM (
    SELECT 
        Branch,
        YEAR(STR_TO_DATE(date, '%d/%m/%Y')) AS Year,
        SUM(Total_Price) AS Total_Revenue,
        LAG(SUM(Total_Price)) OVER (PARTITION BY Branch ORDER BY YEAR(STR_TO_DATE(date, '%d/%m/%Y'))) AS Previous_Year_Revenue,
        SUM(Total_Price) - LAG(SUM(Total_Price)) OVER (PARTITION BY Branch ORDER BY YEAR(STR_TO_DATE(date, '%d/%m/%Y'))) AS Revenue_Change
    FROM walmart
    GROUP BY Branch, YEAR(STR_TO_DATE(date, '%d/%m/%Y'))
) AS yearly_revenue
WHERE Revenue_Change < 0
ORDER BY Revenue_Change ASC;