# 🚀 Vendor Performance & Inventory Optimization Analysis

## 📌 Overview

This project focuses on analyzing vendor-level sales, purchasing behavior, and inventory efficiency to uncover actionable business insights.

The goal is to help businesses optimize vendor selection, pricing strategies, and inventory management using data-driven decision-making.

---

## 🧠 Problem Statement

Organizations working with multiple vendors often face challenges such as:

* Over-dependence on a few vendors
* Inefficient inventory management
* Capital locked in unsold stock
* Difficulty identifying high-profit opportunities

This project addresses these challenges through comprehensive data analysis.

---

## 🎯 Objectives

* Evaluate vendor and product performance
* Identify high-margin but low-sales products
* Analyze inventory turnover and inefficiencies
* Measure vendor dependency using Pareto analysis
* Optimize bulk purchasing strategies
* Perform statistical validation on profitability differences

---

## 🛠️ Tools & Technologies

* **SQL Server (SSMS)** – Data extraction
* **Python (Pandas, NumPy)** – Data analysis
* **Matplotlib & Seaborn** – Data visualization
* **SciPy** – Statistical analysis
* **Power BI** – Dashboard and reporting

---

## 📂 Dataset

* Source: SQL Server Database (`vendor_sales_summary`)
* Total Records: ~10,000+
* Features include:

  * Vendor details
  * Sales & purchase metrics
  * Profit margins
  * Inventory indicators

---

## 🔍 Key Analysis

### 📊 1. Data Cleaning

Filtered only meaningful data:

* Positive profit
* Valid sales transactions

---

### 📊 2. Exploratory Data Analysis

* Distribution plots
* Outlier detection
* Correlation analysis

**Key Insight:**

* Purchase price has minimal impact on revenue and profit
* Sales and purchase quantities are highly correlated

---

### 📊 3. High-Margin Low-Sales Products

* Identified products with:

  * Low sales (bottom 15%)
  * High margins (top 85%)

**Business Use:**
👉 Opportunity for promotions and pricing adjustments

---

### 📊 4. Top Vendor Analysis

Top vendors dominate a large portion of sales, including:

* DIAGEO NORTH AMERICA
* MARTIGNETTI COMPANIES
* PERNOD RICARD

---

### 📊 5. Pareto Analysis

* Top 10 vendors contribute **~65% of total purchases**

**Insight:**
👉 High dependency risk on a limited vendor base

---

### 📊 6. Bulk Purchasing Impact

| Order Size | Avg Unit Price |
| ---------- | -------------- |
| Small      | $39.05         |
| Medium     | $15.48         |
| Large      | $10.77         |

**Insight:**
👉 Bulk purchasing reduces cost by ~72%

---

### 📊 7. Inventory Analysis

* Identified vendors with low stock turnover
* Highlighted slow-moving inventory

---

### 📊 8. Unsold Inventory

* Total capital locked: **~$2.71M**

**Insight:**
👉 Significant working capital inefficiency

---

### 📊 9. Statistical Analysis

* Conducted hypothesis testing
* Found significant difference in profit margins between:

  * High-performing vendors
  * Low-performing vendors

---

## 💡 Key Business Insights

* High-margin products need better visibility
* Vendor dependency must be reduced
* Inventory management needs optimization
* Bulk purchasing strategies improve profitability
* Low-performing vendors can be scaled with better positioning


---

## 📁 Project Structure

```
Vendor-Performance-Analysis/
│── notebooks/
│── sql/
│── dashboard/
│── README.md
```

---

## 📈 Resume Highlights

* Analyzed 10K+ records to uncover vendor performance trends
* Identified $2.7M+ capital locked in inventory
* Performed Pareto analysis showing 65% vendor dependency
* Applied statistical testing for business decision validation
* Delivered actionable insights for pricing and inventory optimization

---

## 🚀 Future Improvements

* Build predictive model for demand forecasting
* Automate vendor performance scoring
* Integrate real-time dashboard

---

## 🤝 Connect

If you found this useful or want to collaborate, feel free to connect!
