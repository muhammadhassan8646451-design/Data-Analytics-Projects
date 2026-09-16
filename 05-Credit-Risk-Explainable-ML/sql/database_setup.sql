CREATE DATABASE IF NOT EXISTS credit_risk_analytics;
USE credit_risk_analytics;

CREATE TABLE IF NOT EXISTS credit_risk (
 client_id INT PRIMARY KEY,
 limit_bal DOUBLE,
 sex INT,
 education INT,
 marriage INT,
 age INT,
 pay_0 INT, pay_2 INT, pay_3 INT, pay_4 INT, pay_5 INT, pay_6 INT,
 bill_amt1 DOUBLE, bill_amt2 DOUBLE, bill_amt3 DOUBLE, bill_amt4 DOUBLE, bill_amt5 DOUBLE, bill_amt6 DOUBLE,
 pay_amt1 DOUBLE, pay_amt2 DOUBLE, pay_amt3 DOUBLE, pay_amt4 DOUBLE, pay_amt5 DOUBLE, pay_amt6 DOUBLE,
 default_flag INT,
 avg_bill_amount DOUBLE,
 avg_payment_amount DOUBLE,
 recent_delinquency_count INT,
 severe_delinquency_count INT,
 max_repayment_delay INT,
 avg_repayment_status DOUBLE,
 repayment_trend DOUBLE,
 bill_utilization DOUBLE,
 latest_utilization DOUBLE,
 payment_to_bill_ratio DOUBLE,
 recent_payment_to_bill_ratio DOUBLE
);
