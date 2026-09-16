SELECT COUNT(*) clients,SUM(default_flag) defaults,AVG(default_flag) default_rate,SUM(limit_bal) total_credit_limit FROM credit_risk;
SELECT pay_0,COUNT(*) clients,AVG(default_flag) default_rate FROM credit_risk GROUP BY pay_0 ORDER BY default_rate DESC;
SELECT recent_delinquency_count,COUNT(*) clients,AVG(default_flag) default_rate,SUM(limit_bal) total_credit_limit FROM credit_risk GROUP BY recent_delinquency_count;
SELECT default_flag,AVG(avg_bill_amount) avg_bill_amount,AVG(avg_payment_amount) avg_payment_amount,AVG(payment_to_bill_ratio) avg_payment_to_bill_ratio FROM credit_risk GROUP BY default_flag;
SELECT client_id,limit_bal,default_flag,RANK() OVER (ORDER BY limit_bal DESC) credit_limit_rank FROM credit_risk ORDER BY credit_limit_rank LIMIT 100;
