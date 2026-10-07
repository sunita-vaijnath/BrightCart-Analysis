-- Category & Channel Profitability Analysis
 -- Category_Profitability
 -- Description:
-- Analyze revenue, costs, profit and profit margin by product category.
-----------------------------------------------------------------------------------------------
-- Revenue by Category : How much revenue does each category generate?
select primary_category , round(sum(net_revenue),2) as total_revenue
from orders
group by primary_category
order by total_revenue desc;

-- Category Profitability: How much profit does each category generate? 
select primary_category, 
	round(sum(net_revenue),2) as total_revenue,
    round(sum(total_costs),2)as total_cost,
	round(sum(profit),2) as total_profit
from orders
group by primary_category
order by total_profit desc;

-- Profit Margin by Category
-- Formula
-- 			Profit Margin = Revenue/Profit ×100 
select primary_category,
		round(sum(net_revenue),2) as total_revenue,
        round(sum(total_costs),2) as total_cost,
        round(sum(profit),2) as total_profit,
        round(sum(profit) * 100.0 / sum(net_revenue), 2) as profit_margin
from orders
group by primary_category
order by profit_margin desc;

-----------------------------------------------------------------------------------------------------------

--  Average Discount by Category
SELECT PRIMARY_CATEGORY,
		ROUND(AVG(DISCOUNT_PCT),2) AS AVG_DISCOUNT_PCT,
		ROUND(SUM(DISCOUNT_AMOUNT),2)AS TOTAL_DISCOUNT
FROM ORDERS
GROUP BY PRIMARY_CATEGORY
ORDER BY AVG_DISCOUNT_PCT DESC;

-- Average Shipping Cost by Category
SELECT PRIMARY_CATEGORY,
round(AVG(SHIPPING_COST),2) AS AVG_SHIPPING_COST
FROM orders
GROUP BY primary_category
ORDER BY avg_shipping_cost DESC;

-- Average Product Cost by Category
SELECT  primary_category,
    ROUND(AVG(product_cost),2) AS avg_product_cost
FROM orders
GROUP BY primary_category
ORDER BY avg_product_cost DESC;

-- 
-- Return Analysis by Category
SELECT
    primary_category,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN returned = 'Yes' THEN 1 END) AS returned_orders,
    ROUND(
        COUNT(CASE WHEN returned = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS return_rate
FROM orders
GROUP BY primary_category
ORDER BY return_rate DESC;

use brightcart_db;








