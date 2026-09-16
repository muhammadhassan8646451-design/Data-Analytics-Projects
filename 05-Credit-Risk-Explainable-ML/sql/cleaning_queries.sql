SELECT COUNT(*) AS total_rows FROM credit_risk;
SELECT client_id, COUNT(*) AS duplicate_count FROM credit_risk GROUP BY client_id HAVING COUNT(*) > 1;
SELECT * FROM credit_risk WHERE limit_bal <= 0 OR age < 18 OR default_flag NOT IN (0,1);
