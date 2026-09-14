
CREATE DATABASE IF NOT EXISTS retail_sales_analytics;
USE retail_sales_analytics;

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(150),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    product_name VARCHAR(255),
    sales DECIMAL(14,4),
    quantity INT,
    discount DECIMAL(8,4),
    profit DECIMAL(14,4),
    order_year INT,
    order_quarter VARCHAR(10),
    order_month VARCHAR(10),
    shipping_days INT,
    profit_margin_pct DECIMAL(12,4)
);

CREATE INDEX idx_orders_order_id ON orders(order_id);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_product_id ON orders(product_id);
CREATE INDEX idx_orders_order_date ON orders(order_date);
CREATE INDEX idx_orders_region ON orders(region);

-- Import project_2_outputs/data/superstore_cleaned.csv
-- using MySQL Workbench's Table Data Import Wizard.
