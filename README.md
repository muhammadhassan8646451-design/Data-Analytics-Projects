# Data Analytics & Data Science Portfolio

![Python](https://img.shields.io/badge/Python-Data%20Analytics-blue)
![SQL](https://img.shields.io/badge/SQL-Analytics-orange)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboards-yellow)
![Machine Learning](https://img.shields.io/badge/Machine%20Learning-scikit--learn-purple)
![Time Series](https://img.shields.io/badge/Time%20Series-Forecasting-darkgreen)
![Explainable ML](https://img.shields.io/badge/Explainable%20ML-Risk%20Analytics-teal)
![Status](https://img.shields.io/badge/Portfolio-Active-brightgreen)
![License](https://img.shields.io/badge/License-MIT-green)

A growing portfolio of end-to-end **Data Analytics, SQL, Machine Learning, Time Series and Power BI** projects.

The repository focuses on complete analytical workflows rather than isolated code snippets: data collection, cleaning, exploratory analysis, feature engineering, SQL, statistical modelling, machine learning, forecasting, explainability, dashboarding and business interpretation.

---

## Portfolio Projects

| # | Project | Main Skills |
|---|---|---|
| 1 | E-Commerce Customer & Sales Analysis | Python, RFM, K-Means, Customer Segmentation |
| 2 | Retail Sales SQL & Power BI | SQL, Power BI, DAX, Business Intelligence |
| 3 | Customer Churn Prediction & Retention Analytics | Python, Machine Learning, Classification, Power BI |
| 4 | Stock Market Analytics & Time Series Forecasting | Python, SQL, Financial Analytics, ARIMA, Power BI |
| 5 | Credit Risk & Explainable Machine Learning | Python, SQL, ML, Risk Scoring, Explainability, Power BI |

---

## 1. E-Commerce Customer & Sales Analysis

**Python | Pandas | RFM | K-Means | Customer Segmentation**

Analysis of a large UK online retail dataset with more than 500,000 transaction records.

### Highlights

- Data cleaning and transaction validation
- Revenue and sales analysis
- Product, country and customer performance
- Monthly revenue trends
- RFM customer analysis
- K-Means customer segmentation
- Customer profile interpretation
- Business recommendations

[View Project 1](./01-Ecommerce-Customer-Sales-Analysis/)

---

## 2. Retail Sales SQL & Power BI

**SQL | Python | Power BI | DAX | Business Intelligence**

End-to-end retail sales analysis using the Sample Superstore dataset.

### Highlights

- SQL database analysis
- Sales and profit KPIs
- Product performance analysis
- Regional and customer analysis
- Discount and profitability analysis
- Four-page Power BI dashboard
- DAX measures
- Power BI source-controlled project

[View Project 2](./02-Retail-Sales-SQL-PowerBI/)

---

## 3. Customer Churn Prediction & Retention Analytics

**Python | Machine Learning | scikit-learn | Classification | Power BI**

Machine-learning project using the IBM Telco Customer Churn dataset.

### Highlights

- **7,043 customers analysed**
- Overall churn rate: **26.54%**
- Logistic Regression
- Decision Tree
- Random Forest
- Gradient Boosting
- Selected model ROC-AUC: approximately **0.837**
- Customer-level churn probability scoring
- Low / Medium / High risk segmentation
- Retention-focused Power BI dashboard
- Model-governance discussion around recall and false negatives

[View Project 3](./03-Customer-Churn-ML-PowerBI/)

---

## 4. Stock Market Analytics & Time Series Forecasting

**Python | SQL | Financial Analytics | Time Series | ARIMA | Power BI**

Historical market analysis covering:

**AAPL, MSFT, NVDA, AMZN, GOOGL, META and SPY**

for the fixed period **2020-2025**.

### Highlights

- Daily and cumulative returns
- Annualised return
- Annualised volatility
- Maximum drawdown
- Moving averages
- Rolling volatility
- Return correlation analysis
- SQLite database
- MySQL-ready SQL scripts
- Naive forecasting baseline
- ARIMA time-series forecasting
- Chronological model evaluation
- Four-page Power BI dashboard

A key modelling result was that the simple naive forecast outperformed the ARIMA model on the selected SPY holdout period, showing the importance of baseline comparison.

[View Project 4](./04-Stock-Market-Analytics-Forecasting/)

---

## 5. Credit Risk & Loan Default Prediction with Explainable ML

**Python | SQL | Machine Learning | Risk Analytics | Explainability | Power BI**

An end-to-end credit-risk analytics project using the UCI **Default of Credit Card Clients** dataset.

### Highlights

- **29,965 clients analysed**
- Overall observed default rate: **22.13%**
- Logistic Regression
- Decision Tree
- Random Forest
- Gradient Boosting
- Model comparison using ROC-AUC, PR-AUC, Precision, Recall and F1
- **Random Forest selected by PR-AUC**
- Selected model ROC-AUC: approximately **0.779**
- Selected model PR-AUC: approximately **0.560**
- Probability-based Low / Medium / High risk bands
- **8,113 High-risk clients**
- High-risk observed default rate: approximately **54.55%**
- Threshold trade-off analysis
- Permutation feature importance
- Sensitive demographic variables excluded from predictive modelling
- Four-page Power BI dashboard
- Responsible-use and model-governance discussion

> This project is educational portfolio analytics only and is not presented as an automated lending approval or rejection system.

[View Project 5](./05-Credit-Risk-Explainable-ML/)

---

## Technical Skills Demonstrated

### Data Analysis

- Data cleaning and validation
- Exploratory Data Analysis
- Feature engineering
- KPI design
- Customer analytics
- Sales analytics
- Financial analytics
- Credit-risk analytics

### Python

- Pandas
- NumPy
- Matplotlib
- scikit-learn
- statsmodels
- yfinance
- joblib

### SQL

- SQLite
- MySQL-ready SQL
- Aggregations
- CTEs
- CASE statements
- Window functions
- Ranking
- Portfolio and business KPI queries

### Machine Learning

- Logistic Regression
- Decision Trees
- Random Forest
- Gradient Boosting
- K-Means clustering
- Classification evaluation
- Probability scoring
- Risk segmentation
- Threshold analysis
- Permutation feature importance

### Model Evaluation

- Accuracy
- Precision
- Recall
- F1
- ROC-AUC
- PR-AUC
- Confusion Matrix
- MAE
- RMSE
- MAPE
- Silhouette Score

### Time Series

- Chronological train/test splits
- Naive forecasting baselines
- ARIMA
- Moving averages
- Rolling volatility
- Forecast evaluation

### Power BI

- Multi-page dashboards
- DAX measures
- KPI cards
- Interactive visuals
- Business dashboards
- PBIX files
- PBIP source-controlled projects

### Git & GitHub

- Structured project repositories
- Professional README files
- Open-source documentation
- Issues and templates
- Releases
- Source-controlled Power BI projects
- Reproducible project structures

---

## Repository Structure

```text
Data-Analytics-Projects/
├── 01-Ecommerce-Customer-Sales-Analysis/
├── 02-Retail-Sales-SQL-PowerBI/
├── 03-Customer-Churn-ML-PowerBI/
├── 04-Stock-Market-Analytics-Forecasting/
├── 05-Credit-Risk-Explainable-ML/
├── .github/
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── LICENSE
└── README.md
```

---

## Portfolio Workflow

Each project is designed to demonstrate a complete analytical workflow:

```text
Raw Data / Public Dataset
          ↓
Cleaning & Validation
          ↓
Exploratory Data Analysis
          ↓
Feature Engineering
          ↓
SQL / Statistical Analysis
          ↓
Machine Learning / Forecasting
          ↓
Model Evaluation
          ↓
Explainability / Risk Interpretation
          ↓
Power BI Dashboard
          ↓
Business Conclusions
          ↓
GitHub Documentation
```

---

## Project Standards

Projects in this repository aim to include:

- reproducible notebooks
- organised source code
- cleaned datasets
- SQL scripts
- analytical outputs
- model evaluation
- visualisations
- business interpretation
- professional README documentation
- Power BI dashboards where appropriate
- clear limitations and responsible-use notes

---

## Author

**Muhammad Hassan**

Data Analyst | Python | SQL | Power BI | Machine Learning | Data Science

---

## License

This repository is licensed under the **MIT License**.
# Data Analytics & Data Science Portfolio

![Python](https://img.shields.io/badge/Python-Data%20Analytics-blue)
![SQL](https://img.shields.io/badge/SQL-Analytics-orange)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboards-yellow)
![Machine Learning](https://img.shields.io/badge/Machine%20Learning-scikit--learn-purple)
![Time Series](https://img.shields.io/badge/Time%20Series-Forecasting-darkgreen)
![Explainable ML](https://img.shields.io/badge/Explainable%20ML-Risk%20Analytics-teal)
![Status](https://img.shields.io/badge/Portfolio-Active-brightgreen)
![License](https://img.shields.io/badge/License-MIT-green)

A growing portfolio of end-to-end **Data Analytics, SQL, Machine Learning, Time Series and Power BI** projects.

The repository focuses on complete analytical workflows rather than isolated code snippets: data collection, cleaning, exploratory analysis, feature engineering, SQL, statistical modelling, machine learning, forecasting, explainability, dashboarding and business interpretation.

---

## Portfolio Projects

| # | Project | Main Skills |
|---|---|---|
| 1 | E-Commerce Customer & Sales Analysis | Python, RFM, K-Means, Customer Segmentation |
| 2 | Retail Sales SQL & Power BI | SQL, Power BI, DAX, Business Intelligence |
| 3 | Customer Churn Prediction & Retention Analytics | Python, Machine Learning, Classification, Power BI |
| 4 | Stock Market Analytics & Time Series Forecasting | Python, SQL, Financial Analytics, ARIMA, Power BI |
| 5 | Credit Risk & Explainable Machine Learning | Python, SQL, ML, Risk Scoring, Explainability, Power BI |

---

## 1. E-Commerce Customer & Sales Analysis

**Python | Pandas | RFM | K-Means | Customer Segmentation**

Analysis of a large UK online retail dataset with more than 500,000 transaction records.

### Highlights

- Data cleaning and transaction validation
- Revenue and sales analysis
- Product, country and customer performance
- Monthly revenue trends
- RFM customer analysis
- K-Means customer segmentation
- Customer profile interpretation
- Business recommendations

[View Project 1](./01-Ecommerce-Customer-Sales-Analysis/)

---

## 2. Retail Sales SQL & Power BI

**SQL | Python | Power BI | DAX | Business Intelligence**

End-to-end retail sales analysis using the Sample Superstore dataset.

### Highlights

- SQL database analysis
- Sales and profit KPIs
- Product performance analysis
- Regional and customer analysis
- Discount and profitability analysis
- Four-page Power BI dashboard
- DAX measures
- Power BI source-controlled project

[View Project 2](./02-Retail-Sales-SQL-PowerBI/)

---

## 3. Customer Churn Prediction & Retention Analytics

**Python | Machine Learning | scikit-learn | Classification | Power BI**

Machine-learning project using the IBM Telco Customer Churn dataset.

### Highlights

- **7,043 customers analysed**
- Overall churn rate: **26.54%**
- Logistic Regression
- Decision Tree
- Random Forest
- Gradient Boosting
- Selected model ROC-AUC: approximately **0.837**
- Customer-level churn probability scoring
- Low / Medium / High risk segmentation
- Retention-focused Power BI dashboard
- Model-governance discussion around recall and false negatives

[View Project 3](./03-Customer-Churn-ML-PowerBI/)

---

## 4. Stock Market Analytics & Time Series Forecasting

**Python | SQL | Financial Analytics | Time Series | ARIMA | Power BI**

Historical market analysis covering:

**AAPL, MSFT, NVDA, AMZN, GOOGL, META and SPY**

for the fixed period **2020-2025**.

### Highlights

- Daily and cumulative returns
- Annualised return
- Annualised volatility
- Maximum drawdown
- Moving averages
- Rolling volatility
- Return correlation analysis
- SQLite database
- MySQL-ready SQL scripts
- Naive forecasting baseline
- ARIMA time-series forecasting
- Chronological model evaluation
- Four-page Power BI dashboard

A key modelling result was that the simple naive forecast outperformed the ARIMA model on the selected SPY holdout period, showing the importance of baseline comparison.

[View Project 4](./04-Stock-Market-Analytics-Forecasting/)

---

## 5. Credit Risk & Loan Default Prediction with Explainable ML

**Python | SQL | Machine Learning | Risk Analytics | Explainability | Power BI**

An end-to-end credit-risk analytics project using the UCI **Default of Credit Card Clients** dataset.

### Highlights

- **29,965 clients analysed**
- Overall observed default rate: **22.13%**
- Logistic Regression
- Decision Tree
- Random Forest
- Gradient Boosting
- Model comparison using ROC-AUC, PR-AUC, Precision, Recall and F1
- **Random Forest selected by PR-AUC**
- Selected model ROC-AUC: approximately **0.779**
- Selected model PR-AUC: approximately **0.560**
- Probability-based Low / Medium / High risk bands
- **8,113 High-risk clients**
- High-risk observed default rate: approximately **54.55%**
- Threshold trade-off analysis
- Permutation feature importance
- Sensitive demographic variables excluded from predictive modelling
- Four-page Power BI dashboard
- Responsible-use and model-governance discussion

> This project is educational portfolio analytics only and is not presented as an automated lending approval or rejection system.

[View Project 5](./05-Credit-Risk-Explainable-ML/)

---

## Technical Skills Demonstrated

### Data Analysis

- Data cleaning and validation
- Exploratory Data Analysis
- Feature engineering
- KPI design
- Customer analytics
- Sales analytics
- Financial analytics
- Credit-risk analytics

### Python

- Pandas
- NumPy
- Matplotlib
- scikit-learn
- statsmodels
- yfinance
- joblib

### SQL

- SQLite
- MySQL-ready SQL
- Aggregations
- CTEs
- CASE statements
- Window functions
- Ranking
- Portfolio and business KPI queries

### Machine Learning

- Logistic Regression
- Decision Trees
- Random Forest
- Gradient Boosting
- K-Means clustering
- Classification evaluation
- Probability scoring
- Risk segmentation
- Threshold analysis
- Permutation feature importance

### Model Evaluation

- Accuracy
- Precision
- Recall
- F1
- ROC-AUC
- PR-AUC
- Confusion Matrix
- MAE
- RMSE
- MAPE
- Silhouette Score

### Time Series

- Chronological train/test splits
- Naive forecasting baselines
- ARIMA
- Moving averages
- Rolling volatility
- Forecast evaluation

### Power BI

- Multi-page dashboards
- DAX measures
- KPI cards
- Interactive visuals
- Business dashboards
- PBIX files
- PBIP source-controlled projects

### Git & GitHub

- Structured project repositories
- Professional README files
- Open-source documentation
- Issues and templates
- Releases
- Source-controlled Power BI projects
- Reproducible project structures

---

## Repository Structure

```text
Data-Analytics-Projects/
├── 01-Ecommerce-Customer-Sales-Analysis/
├── 02-Retail-Sales-SQL-PowerBI/
├── 03-Customer-Churn-ML-PowerBI/
├── 04-Stock-Market-Analytics-Forecasting/
├── 05-Credit-Risk-Explainable-ML/
├── .github/
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── LICENSE
└── README.md
```

---

## Portfolio Workflow

Each project is designed to demonstrate a complete analytical workflow:

```text
Raw Data / Public Dataset
          ↓
Cleaning & Validation
          ↓
Exploratory Data Analysis
          ↓
Feature Engineering
          ↓
SQL / Statistical Analysis
          ↓
Machine Learning / Forecasting
          ↓
Model Evaluation
          ↓
Explainability / Risk Interpretation
          ↓
Power BI Dashboard
          ↓
Business Conclusions
          ↓
GitHub Documentation
```

---

## Project Standards

Projects in this repository aim to include:

- reproducible notebooks
- organised source code
- cleaned datasets
- SQL scripts
- analytical outputs
- model evaluation
- visualisations
- business interpretation
- professional README documentation
- Power BI dashboards where appropriate
- clear limitations and responsible-use notes

---

## Author

**Muhammad Hassan**

Data Analyst | Python | SQL | Power BI | Machine Learning | Data Science

---

## License

This repository is licensed under the **MIT License**.
