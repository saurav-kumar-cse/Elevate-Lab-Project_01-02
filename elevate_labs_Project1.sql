CREATE TABLE orders (
    Row_ID INTEGER,
    Order_ID TEXT,
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode TEXT,
    Customer_ID TEXT,
    Customer_Name TEXT,
    Segment TEXT,
    Country TEXT,
    City TEXT,
    State TEXT,
    Postal_Code INTEGER,
    Region TEXT,
    Product_ID TEXT,
    Category TEXT,
    Sub_Category TEXT,
    Product_Name TEXT,
    Sales NUMERIC,
    Quantity INTEGER,
    Discount NUMERIC,
    Profit NUMERIC
);


select * from orders

SELECT *
FROM orders
WHERE
    order_id IS NULL OR
    order_date IS NULL OR
    ship_date IS NULL OR
    customer_id IS NULL OR
    sales IS NULL OR
    profit IS NULL;


SELECT COUNT(*) AS rows_with_nulls FROM orders
WHERE "row_id" IS NULL OR "order_id" IS NULL OR "order_date" IS NULL OR "ship_date" IS NULL OR
      "ship_mode" IS NULL OR "customer_id" IS NULL OR "customer_name" IS NULL OR "segment" IS NULL OR
      "country" IS NULL OR "city" IS NULL OR "state" IS NULL OR "postal_code" IS NULL OR
      "region" IS NULL OR "product_id" IS NULL OR "category" IS NULL OR "sub_category" IS NULL OR
      "product_name" IS NULL OR "sales" IS NULL OR "quantity" IS NULL OR "discount" IS NULL OR
      "profit" IS NULL;	

--1. Profit Margin by Category

SELECT 
    Category,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit) / SUM(Sales), 4) AS Profit_Margin
FROM orders
GROUP BY Category
ORDER BY Profit_Margin ASC;

-- 2. Profit Margin by Sub-Category

SELECT 
    Sub_Category,
    Category,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit) / SUM(Sales), 4) AS Profit_Margin	
FROM orders
GROUP BY Sub_Category, Category
ORDER BY Profit_Margin ASC;


---3 -Top Loss-Making and Profit-Making Products

SELECT 
    product_name,
    Category,
	sub_category,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit) / SUM(Sales), 4) AS Profit_Margin
FROM orders
GROUP BY product_name,Category,sub_category
ORDER BY Profit_Margin desc
limit 10

