
CREATE DATABASE IF NOT EXISTS stock_market_analytics;
USE stock_market_analytics;

CREATE TABLE IF NOT EXISTS market_data (
    trade_date DATE NOT NULL,
    ticker VARCHAR(10) NOT NULL,
    open_price DOUBLE,
    high_price DOUBLE,
    low_price DOUBLE,
    close_price DOUBLE,
    adj_close DOUBLE,
    volume BIGINT,
    daily_return DOUBLE,
    log_return DOUBLE,
    cumulative_return DOUBLE,
    ma20 DOUBLE,
    ma50 DOUBLE,
    rolling_vol20 DOUBLE,
    running_peak DOUBLE,
    drawdown DOUBLE,
    volume_change DOUBLE,
    calendar_year INT,
    calendar_month VARCHAR(7),
    month_name VARCHAR(20),
    day_of_week VARCHAR(20),
    PRIMARY KEY (ticker, trade_date)
);

CREATE INDEX idx_market_date ON market_data(trade_date);
CREATE INDEX idx_market_ticker ON market_data(ticker);
