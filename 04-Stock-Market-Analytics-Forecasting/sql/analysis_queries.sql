
-- 1. Latest historical price
WITH ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY ticker
            ORDER BY trade_date DESC
        ) AS rn
    FROM market_data
)
SELECT ticker, trade_date, adj_close
FROM ranked
WHERE rn = 1
ORDER BY ticker;

-- 2. Best and worst daily return
SELECT
    ticker,
    MAX(daily_return) AS best_daily_return,
    MIN(daily_return) AS worst_daily_return
FROM market_data
GROUP BY ticker;

-- 3. Average volume
SELECT
    ticker,
    AVG(volume) AS avg_daily_volume
FROM market_data
GROUP BY ticker
ORDER BY avg_daily_volume DESC;

-- 4. Positive vs negative days
SELECT
    ticker,
    SUM(CASE WHEN daily_return > 0 THEN 1 ELSE 0 END) AS positive_days,
    SUM(CASE WHEN daily_return < 0 THEN 1 ELSE 0 END) AS negative_days
FROM market_data
GROUP BY ticker;

-- 5. Days above 50-day moving average
SELECT
    ticker,
    SUM(CASE WHEN adj_close > ma50 THEN 1 ELSE 0 END) AS days_above_ma50,
    COUNT(ma50) AS valid_ma50_days,
    1.0 * SUM(CASE WHEN adj_close > ma50 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(ma50), 0) AS pct_above_ma50
FROM market_data
GROUP BY ticker
ORDER BY pct_above_ma50 DESC;

-- 6. Large move days
SELECT
    ticker,
    COUNT(*) AS return_days,
    SUM(CASE WHEN ABS(daily_return) > 0.03 THEN 1 ELSE 0 END) AS large_move_days,
    1.0 * SUM(CASE WHEN ABS(daily_return) > 0.03 THEN 1 ELSE 0 END)
        / COUNT(*) AS large_move_pct
FROM market_data
WHERE daily_return IS NOT NULL
GROUP BY ticker
ORDER BY large_move_pct DESC;

-- 7. Day-of-week average return
SELECT
    ticker,
    day_of_week,
    AVG(daily_return) AS average_daily_return
FROM market_data
WHERE daily_return IS NOT NULL
GROUP BY ticker, day_of_week
ORDER BY ticker, average_daily_return DESC;

-- 8. Top volume days
SELECT
    trade_date,
    ticker,
    volume,
    adj_close
FROM market_data
ORDER BY volume DESC
LIMIT 10;
