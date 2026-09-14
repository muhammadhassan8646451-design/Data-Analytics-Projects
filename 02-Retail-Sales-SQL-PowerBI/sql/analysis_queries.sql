
USE retail_sales_analytics;

-- Q1: Total sales, profit and profit margin
SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(100 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct
FROM orders;

-- Q2: Orders and customers
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(quantity) AS total_quantity
FROM orders;

-- Q3: Average order value
SELECT
    ROUND(
        SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0),
        2
    ) AS average_order_value
FROM orders;

-- Q4: Top 10 products by sales
SELECT
    product_id,
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    SUM(quantity) AS units_sold
FROM orders
GROUP BY product_id, product_name
ORDER BY total_sales DESC
LIMIT 10;

-- Q5: Top 10 products by profit
SELECT
    product_id,
    product_name,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(sales), 2) AS total_sales
FROM orders
GROUP BY product_id, product_name
ORDER BY total_profit DESC
LIMIT 10;

-- Q6: High-sales loss-making products
SELECT
    product_id,
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(100 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct
FROM orders
GROUP BY product_id, product_name
HAVING SUM(profit) < 0
ORDER BY total_sales DESC
LIMIT 15;

-- Q7: Category and sub-category performance
SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(100 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct
FROM orders
GROUP BY category, sub_category
ORDER BY total_sales DESC;

-- Q8: Customer segment performance
SELECT
    segment,
    COUNT(DISTINCT customer_id) AS customers,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(100 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct
FROM orders
GROUP BY segment
ORDER BY total_sales DESC;

-- Q9: Top customers by lifetime sales
SELECT
    customer_id,
    customer_name,
    segment,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(sales), 2) AS lifetime_sales,
    ROUND(SUM(profit), 2) AS lifetime_profit
FROM orders
GROUP BY customer_id, customer_name, segment
ORDER BY lifetime_sales DESC
LIMIT 10;

-- Q10: Customers with most orders
SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0), 2) AS average_order_value
FROM orders
GROUP BY customer_id, customer_name
ORDER BY total_orders DESC, total_sales DESC
LIMIT 15;

-- Q11: Regional sales
SELECT
    region,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY region
ORDER BY total_sales DESC;

-- Q12: Regional profit margin
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(100 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct
FROM orders
GROUP BY region
ORDER BY profit_margin_pct DESC;

-- Q13: Loss-making locations
SELECT
    state,
    city,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(100 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct
FROM orders
GROUP BY state, city
HAVING SUM(profit) < 0
ORDER BY total_profit ASC
LIMIT 20;

-- Q14: Monthly sales and profit
SELECT
    order_month,
    ROUND(SUM(sales), 2) AS monthly_sales,
    ROUND(SUM(profit), 2) AS monthly_profit,
    COUNT(DISTINCT order_id) AS orders
FROM orders
GROUP BY order_month
ORDER BY order_month;

-- Q15: Month-over-month growth
WITH monthly AS (
    SELECT
        order_month,
        SUM(sales) AS monthly_sales
    FROM orders
    GROUP BY order_month
),
previous_month AS (
    SELECT
        order_month,
        monthly_sales,
        LAG(monthly_sales) OVER (ORDER BY order_month) AS previous_month_sales
    FROM monthly
)
SELECT
    order_month,
    ROUND(monthly_sales, 2) AS monthly_sales,
    ROUND(previous_month_sales, 2) AS previous_month_sales,
    ROUND(
        100 * (monthly_sales - previous_month_sales)
        / NULLIF(previous_month_sales, 0),
        2
    ) AS mom_growth_pct
FROM previous_month
ORDER BY order_month;

-- Q16: Highest average profit per order by month
WITH order_totals AS (
    SELECT
        order_id,
        order_month,
        SUM(profit) AS order_profit
    FROM orders
    GROUP BY order_id, order_month
)
SELECT
    order_month,
    ROUND(AVG(order_profit), 2) AS avg_profit_per_order,
    COUNT(*) AS orders
FROM order_totals
GROUP BY order_month
ORDER BY avg_profit_per_order DESC
LIMIT 12;

-- Q17: Discount and profitability
SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.10 THEN '1-10%'
        WHEN discount <= 0.20 THEN '11-20%'
        WHEN discount <= 0.30 THEN '21-30%'
        WHEN discount <= 0.50 THEN '31-50%'
        ELSE 'Above 50%'
    END AS discount_band,
    COUNT(*) AS transaction_lines,
    ROUND(AVG(discount) * 100, 2) AS avg_discount_pct,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(100 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct
FROM orders
GROUP BY discount_band
ORDER BY avg_discount_pct;

-- Q18: Profitable vs loss-making orders
WITH order_profit AS (
    SELECT
        order_id,
        SUM(profit) AS total_order_profit
    FROM orders
    GROUP BY order_id
),
classified AS (
    SELECT
        CASE
            WHEN total_order_profit > 0 THEN 'Profitable'
            WHEN total_order_profit < 0 THEN 'Loss-Making'
            ELSE 'Break-Even'
        END AS order_status
    FROM order_profit
)
SELECT
    order_status,
    COUNT(*) AS orders,
    ROUND(
        100 * COUNT(*) / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_orders
FROM classified
GROUP BY order_status
ORDER BY orders DESC;

-- Q19: Rank products within category
WITH product_sales AS (
    SELECT
        category,
        product_id,
        product_name,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY category, product_id, product_name
),
ranked AS (
    SELECT
        category,
        product_id,
        product_name,
        total_sales,
        RANK() OVER (
            PARTITION BY category
            ORDER BY total_sales DESC
        ) AS sales_rank
    FROM product_sales
)
SELECT
    category,
    product_id,
    product_name,
    ROUND(total_sales, 2) AS total_sales,
    sales_rank
FROM ranked
WHERE sales_rank <= 5
ORDER BY category, sales_rank;

-- Q20: Shipping mode performance
SELECT
    ship_mode,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(AVG(shipping_days), 2) AS avg_shipping_days,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(100 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct
FROM orders
GROUP BY ship_mode
ORDER BY profit_margin_pct DESC;
