
-- Data-quality checks to run after importing into MySQL.

SELECT COUNT(*) AS total_rows
FROM orders;

SELECT
    SUM(order_id IS NULL OR order_id = '') AS missing_order_ids,
    SUM(customer_id IS NULL OR customer_id = '') AS missing_customer_ids,
    SUM(product_id IS NULL OR product_id = '') AS missing_product_ids
FROM orders;

SELECT
    SUM(sales <= 0) AS invalid_sales,
    SUM(quantity <= 0) AS invalid_quantities,
    SUM(discount < 0 OR discount > 1) AS invalid_discounts
FROM orders;

SELECT
    order_id,
    product_id,
    customer_id,
    order_date,
    COUNT(*) AS duplicate_count
FROM orders
GROUP BY
    order_id,
    product_id,
    customer_id,
    order_date,
    sales,
    quantity,
    discount,
    profit
HAVING COUNT(*) > 1;
