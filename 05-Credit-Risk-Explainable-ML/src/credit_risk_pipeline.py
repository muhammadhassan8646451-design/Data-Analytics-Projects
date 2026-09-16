import pandas as pd
import numpy as np
REPAY_COLS=['PAY_0','PAY_2','PAY_3','PAY_4','PAY_5','PAY_6']
BILL_COLS=[f'BILL_AMT{i}' for i in range(1,7)]
PAYMENT_COLS=[f'PAY_AMT{i}' for i in range(1,7)]

def engineer_credit_features(df):
    df=df.copy()
    df['AvgBillAmount']=df[BILL_COLS].mean(axis=1)
    df['AvgPaymentAmount']=df[PAYMENT_COLS].mean(axis=1)
    df['TotalBillAmount']=df[BILL_COLS].sum(axis=1)
    df['TotalPaymentAmount']=df[PAYMENT_COLS].sum(axis=1)
    df['RecentDelinquencyCount']=(df[REPAY_COLS]>0).sum(axis=1)
    df['SevereDelinquencyCount']=(df[REPAY_COLS]>=2).sum(axis=1)
    df['MaxRepaymentDelay']=df[REPAY_COLS].max(axis=1)
    df['AvgRepaymentStatus']=df[REPAY_COLS].mean(axis=1)
    df['RepaymentTrend']=df['PAY_0']-df['PAY_6']
    df['BillUtilization']=df['AvgBillAmount']/df['LIMIT_BAL']
    df['LatestUtilization']=df['BILL_AMT1']/df['LIMIT_BAL']
    df['PaymentToBillRatio']=df['TotalPaymentAmount']/(df['TotalBillAmount'].abs()+1)
    df['RecentPaymentToBillRatio']=df[['PAY_AMT1','PAY_AMT2','PAY_AMT3']].sum(axis=1)/(df[['BILL_AMT1','BILL_AMT2','BILL_AMT3']].sum(axis=1).abs()+1)
    df['BillTrend']=df['BILL_AMT1']-df['BILL_AMT6']
    df['PaymentTrend']=df['PAY_AMT1']-df['PAY_AMT6']
    return df
