
# 🛍️ Shopping Behavior Analysis — Excel | SQL | Power BI

## 📖 Project Overview
This end-to-end **data analytics project** explores customer **shopping behavior patterns** using Excel, SQL, and Power BI.  
The goal was to uncover **key sales drivers**, understand **customer demographics**, and identify **seasonal trends** that impact revenue.  

Through this project, I showcased a complete **data analysis workflow** — from raw data exploration to insightful storytelling dashboards.

---

## 🎯 Business Objective
To analyze customer purchase data and answer critical business questions such as:
- Which product categories generate the most revenue?
- How do **gender and age groups** affect shopping behavior?
- Which **seasons and locations** drive the highest sales?
- What is the **average order value** and **seasonal growth rate**?
- Which **payment methods** and **customer segments** are most profitable?

---

## 🧰 Tools & Technologies Used
| Tool | Purpose |
|------|----------|
| **Excel** | Data cleaning, trend analysis, pivot-based dashboards |
| **PostgreSQL (SQL)** | Querying, transformations, and business insights extraction |
| **Power BI** | Interactive dashboard creation and DAX-driven visual analytics |

---

## 🗂️ Dataset
- **File:** `shopping_behavior_updated.csv`  
- **Records:** ~3900 transactions  
- **Columns:** 18 features including demographics, category, purchase amount, season, payment method, and ratings  
- **Source:** Synthetic dataset curated for business analytics learning  

---

## 📊 Key SQL Insights
1. **Total Revenue:** $233,081 generated across all customers.  
2. **Unique Customers:** Over 3900 distinct buyers identified.  
3. **Top Performing Category:** *Clothing* generated the highest total sales.  
4. **Most Popular Season:** *Summer* drives the most transactions.  
5. **Preferred Payment Mode:** *Credit Card* dominates overall purchase activity.  
6. **Age Demographic Insight:** Customers aged **26–35** contribute the largest share of sales.  
7. **Pareto Principle:** Top 20% customers contribute nearly **40%** of total revenue.

🧠 *22 SQL queries were written to extract and validate business metrics — using CTEs, aggregation, correlation, and ranking functions.*

---

## 📈 Power BI Dashboard Overview
The Power BI dashboard provides an interactive, visual representation of customer behavior and revenue performance.

### 🧩 Dashboard Sections:
| Section | Description |
|----------|--------------|
| **KPI Cards** | Displays Total Revenue, Unique Customers, Average Order Value, and Season Growth % |
| **Category Analysis** | Bar chart showing % contribution and rank by total sales |
| **Seasonal Trends** | line chart tracking total sales and growth % across seasons |
| **Customer Demographics** | Sales breakdown by Gender and Age Group |
| **Regional Sales** | Map visualization of city-wise total revenue |
| **Payment Insights** | Bar chart showing sales by payment method |
| **Ratings Overview** | Average review ratings by category |

---

## 📊 DAX Measures Used
| Measure Name | Formula | Description |
|---------------|----------|-------------|
| **Total Sales** | `SUM('shopping_data'[purchase_amount_usd])` | Total revenue generated |
| **Average Order Value** | `DIVIDE(SUM('shopping_data'[purchase_amount_usd]), COUNT('shopping_data'[customer_id]))` | Avg. spend per customer |
| **Sales % Contribution** | `DIVIDE(SUM(Sales), CALCULATE(SUM(Sales), ALL('shopping_data')))*100` | % contribution by segment |
| **Season Growth %** | Seasonal comparison using VAR logic | MoM growth across seasons |
| **Top 20% Contribution** | Pareto calculation via windowing | Revenue from top 20% customers |

---

## 🧾 Excel Dashboard Highlights
- Used **Pivot Tables** for category-wise and gender-based analysis.  
- Added charts showing seasonal and location-based sales patterns.  
- Performed conditional formatting to identify top & low performers.  
- Derived KPIs such as *Total Sales, Average Rating, Discount Impact,* etc.

---

## 🌟 Key Insights from Analysis
- 🧥 **Clothing** is the top-performing category, contributing ~40% of total revenue.  
- 👩 **Female customers aged 26–35** are the highest-spending demographic.  
- 🌞 **Summer** shows peak seasonal performance, with strong growth vs. Spring.  
- 💳 **Credit Card** payments account for majority of purchases.  
- 🏙️ **Urban regions** outperform smaller cities in total sales value.  
- 📈 The **Average Order Value** steadily increases across seasons — suggesting higher engagement during festive periods.  

---

## 🧭 Business Recommendations
- Focus targeted marketing on **female customers (26–35)** in **urban regions**.  
- Increase stock & promotional campaigns during **Summer and Fall seasons**.  
- Offer **credit card discounts** or loyalty programs to boost retention.  
- Consider reviving low-performing categories (e.g., Cosmetics) through bundles or offers.  

---



