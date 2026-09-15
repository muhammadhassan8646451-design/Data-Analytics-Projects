# Retail Sales SQL & Power BI Analysis

![SQL](https://img.shields.io/badge/SQL-Analytics-blue)
![MySQL](https://img.shields.io/badge/MySQL-Database-orange)
![Power BI](https://img.shields.io/badge/Power%20BI-Business%20Intelligence-yellow)
![Python](https://img.shields.io/badge/Python-Data%20Processing-blue)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)
![License](https://img.shields.io/badge/License-MIT-green)

An end-to-end retail business intelligence project combining SQL analysis, Python-based data preparation and a four-page Power BI dashboard.

## Executive KPIs

- Total Sales: **~$2.30M**
- Total Profit: **~$286.40K**
- Profit Margin: **~12.47%**
- Total Orders: **~5K**
- Total Customers: **793**
- Average Order Value: **~$458.6**

## Power BI Dashboard

The finished Power BI report contains four pages:

1. **Executive Overview** — KPI cards, monthly trends, regional sales and category performance.
2. **Product Performance** — product, category and sub-category sales/profit analysis.
3. **Customer & Regional Analysis** — customers, segments, states, regions and shipping performance.
4. **Discount & Profitability** — discount bands, margins and loss-focused analysis.

## Technologies

SQL, MySQL, SQLite, Power BI, DAX, Python, Pandas, Matplotlib, Google Colab, Git and GitHub.

## Repository Structure

```text
02-Retail-Sales-SQL-PowerBI/
├── README.md
├── data/
│   └── superstore_cleaned.csv
├── sql/
│   ├── database_setup.sql
│   ├── cleaning_queries.sql
│   └── analysis_queries.sql
├── notebooks/
│   └── Hassan_Project_2_SQL_PowerBI_READY.ipynb
├── powerbi/
│   ├── superstore_powerbi.csv
│   ├── powerbi_dax_measures.txt
│   └── PowerBI_Project/
│       ├── Retail_Sales_SQL_PowerBI.pbip
│       ├── Retail_Sales_SQL_PowerBI.Report/
│       └── Retail_Sales_SQL_PowerBI.SemanticModel/
├── images/
└── reports/
    └── business_findings.txt
```

## SQL Analysis

The project covers KPI analysis, product performance, customers, regions, monthly trends, discounting and profitability. Advanced SQL techniques include CTEs, window functions, `RANK()`, `LAG()`, `CASE`, conditional aggregation and month-over-month analysis.

## Power BI Measures

The semantic model includes measures for Total Sales, Total Profit, Profit Margin %, Total Orders, Total Customers, Average Order Value, Total Quantity, Average Discount %, Average Shipping Days and transaction profitability.

## Data Quality

The workflow removes invalid IDs/dates, non-positive sales and quantities, invalid discount values and duplicate records. Negative profits are deliberately retained because they represent genuine loss-making transactions.

## How to Open the Power BI Project

Open:

```text
powerbi/PowerBI_Project/Retail_Sales_SQL_PowerBI.pbip
```

Refresh the data when Power BI Desktop opens. The project uses the public Sample Superstore dataset.

## Business Recommendations

- Protect high-performing products and categories.
- Review products and locations that generate sales but weak or negative profit.
- Prioritise valuable repeat customers.
- Evaluate regions using profitability rather than sales alone.
- Review aggressive discount levels associated with poor margins.
- Track month-over-month performance and investigate unusual declines.
- Use the Power BI dashboard for recurring management monitoring.

## Skills Demonstrated

SQL, database design, data cleaning, CTEs, window functions, customer analytics, product analytics, regional analysis, profitability analysis, DAX, Power BI modelling, business intelligence, data visualisation, Git and technical documentation.

## Author

**Muhammad Hassan**

Data Analyst | Python | SQL | Power BI | Machine Learning | Open Source

## License

MIT License.
