CREATE DATABASE myntra_analysis;
USE myntra_analysis;
CREATE TABLE myntra_products (
Product_id INT,
BrandName VARCHAR(255),
Category VARCHAR(255),
Individual_category VARCHAR(255),
category_by_Gender VARCHAR(50),
DiscountPrice FLOAT,
OriginalPrice FLOAT,
DiscountOffer VARCHAR(50),
Ratings FLOAT,
Reviews INT,
DiscountPercent FLOAT,
PriceCategory VARCHAR(50)
);
SELECT COUNT(*) FROM myntra_products;
SELECT *FROM myntra_products LIMIT 10;
SELECT
Category,
COUNT(*) AS total_products,
ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM myntra_products),2) AS market_share
FROM myntra_products
GROUP BY Category
ORDER BY market_share DESC;
SELECT 
BrandName,
COUNT(*) AS total_products
FROM myntra_products
GROUP BY BrandName
ORDER BY total_products DESC
LIMIT 10;
SELECT 
Category,
AVG(DiscountPercent) AS avg_discount
FROM myntra_products
GROUP BY Category
ORDER BY avg_discount DESC;
SELECT 
CASE 
WHEN DiscountPercent < 20 THEN 'Low Discount'
WHEN DiscountPercent BETWEEN 20 AND 50 THEN 'Medium Discount'
ELSE 'High Discount'
END AS discount_group,
AVG(Ratings) AS avg_rating,
AVG(Reviews) AS avg_reviews
FROM myntra_products
GROUP BY discount_group;
SELECT 
BrandName,
COUNT(*) AS premium_products
FROM myntra_products
WHERE PriceCategory = 'Premium'
GROUP BY BrandName
ORDER BY premium_products DESC
LIMIT 10;
SELECT 
BrandName,
AVG(Ratings) AS avg_rating,
SUM(Reviews) AS total_reviews
FROM myntra_products
GROUP BY BrandName
ORDER BY avg_rating DESC
LIMIT 10;
SELECT 
BrandName,
COUNT(*) AS total_products,
RANK() OVER (ORDER BY COUNT(*) DESC) AS brand_rank
FROM myntra_products
GROUP BY BrandName;