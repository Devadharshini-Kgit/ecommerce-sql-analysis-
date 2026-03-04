-- Step 1: Create & use database
CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

-- Step 2: Create table (only once)
CREATE TABLE IF NOT EXISTS Orders (
    DID VARCHAR(20),
    CID VARCHAR(20),
    Gender VARCHAR(10),
    AgeGroup VARCHAR(20),
    PurchaseDate DATETIME DEFAULT '2026-03-01 00:00:00',
    ProductCategory VARCHAR(50),
    DiscountAvailed VARCHAR(10),
    DiscountAmount DECIMAL(10,2),
    GrossAmount DECIMAL(10,2),
    NetAmount DECIMAL(10,2),
    PurchaseMethod VARCHAR(20),
    Location VARCHAR(50)
);

-- Step 3: Check table
DESCRIBE Orders;

-- Step 4: Total orders
SELECT COUNT(*) AS TotalOrders FROM Orders;

 -- Step 5:Total sales
SELECT 
    SUM(GrossAmount) AS TotalGross,
    SUM(NetAmount) AS TotalNet
FROM Orders;

-- Step:6 Orders by category
SELECT 
    ProductCategory,
    COUNT(*) AS OrdersCount
FROM Orders
GROUP BY ProductCategory
ORDER BY OrdersCount DESC;

-- Step 7: Total discount
SELECT 
    SUM(DiscountAmount) AS TotalDiscount
FROM Orders;

-- Step 8: Orders by age group
SELECT 
    AgeGroup,
    COUNT(*) AS OrdersCount
FROM Orders
GROUP BY AgeGroup
ORDER BY OrdersCount DESC;

-- Step 11: Sample data
SELECT * FROM Orders LIMIT 5;