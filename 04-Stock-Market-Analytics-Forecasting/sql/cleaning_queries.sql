
-- Basic data-quality checks
SELECT ticker, trade_date, COUNT(*) AS row_count
FROM market_data
GROUP BY ticker, trade_date
HAVING COUNT(*) > 1;

SELECT *
FROM market_data
WHERE adj_close <= 0
   OR close_price <= 0
   OR volume < 0;

SELECT
    ticker,
    MIN(trade_date) AS first_date,
    MAX(trade_date) AS last_date,
    COUNT(*) AS trading_days
FROM market_data
GROUP BY ticker;
