# 🛍️ Walmart Business Insights – SQL + Python Project

This project presents a structured business analysis of Walmart’s transactional dataset using **SQL** and **Python (Pandas)**. The goal is to extract **insightful patterns** about revenue trends, customer behavior, shift patterns, branch performance, and payment preferences that can help Walmart optimize operations and drive data-backed decisions.

---

## 📌 Project Objective

To analyze Walmart's retail transaction data and answer key business questions such as:
- What is the busiest shift across branches?
- Which categories perform best in each branch?
- Which payment method is most used in each city?
- How has revenue changed year-over-year?
- What insights can Walmart act on to improve customer experience and sales?

---

## 🖼 Preview

![Walmart EDA Preview](https://github.com/Tushark6038/Walmart-Sales-Analysis-End-to-End-Project-using-Python-SQL/blob/102dd6d0d548b7b49cc6d1efc0d4e4761219024d/Preview.jpg)

---

## 📂 Project Resources

- 🔗 [Raw Dataset (CSV/XLS)](https://github.com/Tushark6038/Walmart-Sales-Analysis-End-to-End-Project-using-Python-SQL/blob/35119404c9bcda02f71b399a7df342e16d447b00/Walmart.csv)
- 🔗 [Cleaned Dataset (XLS)](https://github.com/Tushark6038/Walmart-Sales-Analysis-End-to-End-Project-using-Python-SQL/blob/35119404c9bcda02f71b399a7df342e16d447b00/Walmart_Cleaned_Data.csv)
- 🔗 [Business Questions](https://github.com/Tushark6038/Walmart-Sales-Analysis-End-to-End-Project-using-Python-SQL/blob/102dd6d0d548b7b49cc6d1efc0d4e4761219024d/Walmart%20Business%20Problems.pdf)
- 🔗 [SQL FIle](https://github.com/Tushark6038/Walmart-Sales-Analysis-End-to-End-Project-using-Python-SQL/blob/40ae6cc141e610862232802a0a9b50f096aad8a8/Walmart%20SQL%20File.sql)

---

## 🛠 Tools & Technologies Used

- **SQL (MySQL)** – Querying and business logic
- **Python (Pandas)** – Data cleaning, date parsing
- **Jupyter Notebook**
- **Excel** – Initial exploration

---

## 🔍 Business Questions Answered

### 1. **Which payment method is most frequently used in each branch?**
Used `RANK()` and `COUNT()` in SQL to identify the most common payment method per branch.

### 2. **Which category has the highest average rating in each branch?**
Grouped ratings by branch and category, applied `RANK()` to highlight the best-performing ones.

### 3. **Which day of the week is busiest for each branch?**
Extracted `DAYNAME()` from dates and ranked by total transactions.

### 4. **How many transactions occur in each shift (Morning, Afternoon, Evening)?**
Derived shift logic using SQL `CASE` and `HOUR()`, then counted transactions grouped by branch and shift.

### 5. **Which branches had a revenue drop compared to the previous year?**
Used `LAG()` to compare year-over-year branch revenue and filtered for negative changes.

---

## 📊 Sample Business Insights

- 🕐 **Evening** was the busiest shift overall, especially in Branch C.
- 💳 **Cash** is the most used payment method in Branch A, while **eWallets** dominate Branch B.
- 📉 **Branch A** showed a significant drop in revenue from 2022 to 2023.
- 🛒 **Food & Beverages** category received the highest customer ratings in all three branches.
- 🔁 Monday and Friday are the busiest days for transactions across multiple branches.

---

## ✅ Conclusion

This project demonstrates how structured SQL queries and simple Python logic can provide powerful business insights from transactional data. It not only helps identify what’s working, but also highlights areas for operational improvements — such as optimizing shifts, understanding category performance, and responding to revenue trends.

---

## 🚀 Next Steps

- Visualize key insights using Tableau or Power BI
- Automate shift classification and reporting using Python
- Extend to include customer demographics (if available)

---

## 📬 Contact

Feel free to connect if you have feedback or want to collaborate on business analytics projects.

📧 tushar.k6038@gmail.com  
🌐 [LinkedIn](https://www.linkedin.com/in/tushar-kumar-4362a324b/)

---

⭐ **If you found this analysis helpful, consider starring the repo!**
