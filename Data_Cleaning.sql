CREATE DATABASE BRIGHTCART_DB;
USE BRIGHTCART_DB;
SELECT * FROM ORDERS;

SELECT COUNT(*) AS TOTAL_ORDERS
FROM ORDERS; 

SELECT MIN(ORDER_DATE) AS FIRST_ORDER , 
MAX(ORDER_DATE) AS LAST_ORDER
FROM ORDERS;

SELECT DISTINCT channel
FROM orders;

-- HOW MANY PRODUCT CATEGORY ARE SOLD
 SELECT DISTINCT PRIMARY_CATEGORY
 FROM ORDERS
 ORDER BY PRIMARY_CATEGORY;
 
-- WHAT PAYMENT METHODS ARE AVAILABLE
SELECT DISTINCT PAYMENT_METHOD
FROM ORDERS;

-- Explore Regions
SELECT DISTINCT REGION
FROM ORDERS;
-- HANDLING MISSING VALUES
SELECT
    SUM(order_id IS NULL) AS missing_order_id,
    SUM(order_date IS NULL) AS missing_order_date,
    SUM(channel IS NULL) AS missing_channel,
    SUM(primary_category IS NULL) AS missing_category,
    SUM(gross_revenue IS NULL) AS missing_gross_revenue,
    SUM(net_revenue IS NULL) AS missing_net_revenue,
    SUM(total_costs IS NULL) AS missing_total_costs,
    SUM(profit IS NULL) AS missing_profit,
    SUM(returned IS NULL) AS missing_returned
FROM orders;    -- NO MISSING VALUES 

-- Duplicate Orders
SELECT ORDER_ID, COUNT(*) AS DUPLICATE_COUNT
FROM ORDERS
GROUP BY ORDER_ID
HAVING COUNT(*)>1;

-- Check for Invalid Values 
-- NEGATIVE REVENUE
SELECT *
FROM ORDERS
WHERE GROSS_REVENUE < 0 OR NET_REVENUE <0;
-- NEGATIVE COST
SELECT *
FROM ORDERS
WHERE PRODUCT_COST< 0 OR SHIPPING_COST < 0 OR PLATFORM_FEE < 0 
	  OR TRANSACTION_FEE < 0 OR TOTAL_COSTS < 0;

-- NEGATIVE PROFIT
SELECT *
FROM orders
WHERE profit < 0;
 
 SELECT COUNT(*)
 FROM orders
WHERE profit < 0;

-- Cost Validation
SELECT order_id, product_cost, shipping_cost, platform_fee, transaction_fee, total_costs, 
		(product_cost + shipping_cost + platform_fee + transaction_fee) AS calculated_cost
FROM orders
WHERE total_costs <> (product_cost + shipping_cost + platform_fee + transaction_fee);

SELECT *
FROM orders
WHERE ROUND(total_costs,2) <>
      ROUND(product_cost + shipping_cost + platform_fee + transaction_fee,2);

-- Executive KPIs ---------
-- KPI 1 - TOTAL GROSS REVENUE: How much revenue did BrightCart generate before discounts and refunds?
SELECT SUM(GROSS_REVENUE) AS TOTAL_GROSS_REVENUE
FROM ORDERS;

-- KPI 2 - Total Net Revenue: How much revenue did BrightCart actually earn? 
 SELECT SUM(NET_REVENUE) AS TOTAL_NET_REVENUE
 FROM ORDERS;
 
 -- KPI 3 - Total Costs: How much did the company spend fulfilling all orders? 
 SELECT SUM(TOTAL_COSTS) AS TOTAL_COST
 FROM ORDERS;

--  KPI 4- Total Profit: How much profit did BrightCart make?
SELECT SUM(PROFIT) AS TOTAL_PROFIT
FROM ORDERS;

-- KPI 5 - Profit Margin:
-- Formula:
-- 			Profit Margin = Total Net Revenue/Total Profit × 100

-- SELECT ROUND(
-- SUM(PROFIT)/SUM(NET_REVENUE) * 100, 2
-- ) AS PROFIT_MARGIN
-- FROM ORDERS;

-- KPI 6 - Average Order Value (AOV)
-- Formula: Net Revenue/Total Orders

SELECT ROUND(AVG(NET_REVENUE),2) AS AVERAGE_ORDER_VALYE
FROM ORDERS;

-- KPI 7 - Average Profit Per Order
SELECT ROUND(AVG(PROFIT),2) AS AVG_PROFIT_PER_ORDER
FROM ORDERS;

-- KPI 8 - Total Refund Amount
SELECT SUM(REFUND_AMOUNT) AS TOTAL_REFUND
FROM ORDERS;

-- KPI 9 - Returned Orders
SELECT COUNT(*) AS RETURNED_ORDERS
FROM ORDERS
WHERE RETURNED = 'YES'; 

--  KPI 10 - Return Rate
-- Formula: Total Orders/Returned Orders ×100

SELECT ROUND(SUM(CASE WHEN returned = 'Yes' THEN 1 ELSE 0 END)* 100.0 / COUNT(*), 2) AS RETURN_RATE
FROM ORDERS;

-- OVERALL KPI's
SELECT
    COUNT(*) AS total_orders,
    SUM(gross_revenue) AS gross_revenue,
    SUM(net_revenue) AS net_revenue,
    SUM(total_costs) AS total_costs,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit)/SUM(net_revenue)*100,2) AS profit_margin,
    ROUND(AVG(net_revenue),2) AS average_order_value,
    ROUND(AVG(profit),2) AS average_profit_per_order,
    SUM(refund_amount) AS total_refunds,
    COUNT(CASE WHEN returned = 'Yes' THEN 1 END) AS returned_orders,
    ROUND(
    COUNT(CASE WHEN returned = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2) AS return_rate
FROM orders; 


























 
-- -------------------------------------------------------------------------------------------------------------------------
-- Total Orders - 2000
-- Analysis Period - 1YR
-- Sales Channels : Mobile App
-- 					Website
-- 					Marketplace
-- 					Social Commerce
-- Product Categories: Beauty
						-- Books
-- 						Clothing
-- 						Electronics
-- 						Food & Beverage
-- 						Home & Kitchen
-- 						Sports
-- 						Toys
-- Payment Methods: Gift Card
-- 					Credit Card
-- 					Debit Card
-- 					Buy Now Pay Later
-- 					PayPal
-- Regions: Northeast
-- 			Midwest
-- 			Southeast
-- 			West Coast
-- 			Southwest



