
# 🧠 Data Pipeline dbt AWS Demo  

[![dbt CI](https://github.com/reshmavarghese15/data-pipeline-dbt-aws-demo/actions/workflows/dbt_ci.yml/badge.svg)](https://github.com/reshmavarghese15/data-pipeline-dbt-aws-demo/actions)
[![Built with dbt](https://img.shields.io/badge/Built%20with-dbt-FF694B?logo=dbt)](https://docs.getdbt.com/)
[![Run Locally](https://img.shields.io/badge/Run%20Locally-Command%20Line-2ea44f?style=flat&logo=gnometerminal&logoColor=white)](#️-setup--run)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE)

> A lightweight end-to-end dbt demo pipeline using SQLite — perfect for learning, analytics, and AWS-style data transformations.

---

## 📚 Table of Contents
- [🚀 Project Overview](#-project-overview)
- [🧩 Data Flow](#-data-flow)
- [📁 Project Structure](#-project-structure)
- [🛠️ Setup & Run](#️-setup--run)
- [📊 Models Summary](#-models-summary)
- [✅ Example Output](#-example-output)
- [💡 Future Improvements](#-future-improvements)
- [📚 Resources](#-resources)

---

## 🚀 Project Overview

This project simulates a small e-commerce dataset with customers, products, orders, and order items.
It demonstrates how to use dbt for:

- 🗂️ Data ingestion (via dbt seed)

- 🧮 Data transformation (via SQL models)

- 📊 Aggregation and reporting (customer spend summaries)

- ✅ Data validation checks

---

## 🧩 Data Flow

CSV Seeds → dbt Seed → Staging Models → Transform Models → Summary Tables

**Flow in this project:**

```text
customers.csv, products.csv, orders.csv, order_items.csv
        ↓
     dbt seed
        ↓
 my_orders_summary.sql
        ↓
customer_sales_summary.sql

```


## 📁 **Project Structure**

```text
data_pipeline_dbt_aws_demo/
│
├── seeds/
│ ├── customers.csv
│ ├── products.csv
│ ├── orders.csv
│ └── order_items.csv
│
├── models/
│ └── example/
│ ├── my_orders_summary.sql
│ ├── customer_sales_summary.sql
│ └── check_data_counts.sql
│
├── dbt_project.yml
└── README.md

```
---

## 🛠️ Setup & Run

1. Install dependencies
   
```bash
python -m venv venv
source venv/bin/activate  # or venv\Scripts\activate on Windows
pip install dbt-sqlite
```


2. Run dbt seed (to load CSVs into SQLite)

```bash
dbt seed --full-refresh
```

3. Run models (to build transformations)

```bash
dbt run
```
4.  List all built objects

```bash
dbt ls
```

---

## 📊 Models Summary


| Model                    | Description                                                                                                                                     |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `check_data_counts`      | Validates all seed tables were loaded correctly.                                                                                                |
| `my_orders_summary`      | Combines customers, orders, order items, and products into a detailed transactional dataset with quantity, category, and total amount per item. |
| `customer_sales_summary` | Aggregates total spend, total orders, and average order value per customer.                                                                     |


## ✅ Example Output

**`check_data_counts`**

| table_name  | record_count |
| ----------- | ------------ |
| customers   | 3            |
| order_items | 4            |
| orders      | 3            |
| products    | 3            |


**`my_orders_summary`**

| order_id | customer_id | customer_name | product_id | product_name | category    | price | quantity | total_amount | order_date |
| -------- | ----------- | ------------- | ---------- | ------------ | ----------- | ----- | -------- | ------------ | ---------- |
| 1        | 1           | Alice         | 1          | Laptop       | Electronics | 1200  | 1        | 1200         | 2024-04-01 |
| 1        | 1           | Alice         | 3          | Chair        | Furniture   | 150   | 2        | 300          | 2024-04-01 |
| 2        | 2           | Bob           | 2          | Phone        | Electronics | 800   | 1        | 800          | 2024-04-03 |
| 3        | 1           | Alice         | 1          | Laptop       | Electronics | 1200  | 1        | 1200         | 2024-04-04 |


**`customer_sales_summary`**

| customer_id | customer_name | total_orders | total_spend | avg_order_value |
| ----------- | ------------- | ------------ | ----------- | --------------- |
| 1           | Alice         | 2            | 2700        | 1350.0          |
| 2           | Bob           | 1            | 800         | 800.0           |


---

## 💡 Future Improvements

This project serves as a foundation for modern analytics pipelines.
Next steps could include:

- ☁️ Migrate from SQLite to Snowflake or Redshift for production-grade scalability

- 🔄 Enhance CI/CD workflows (e.g., run tests on pull requests, nightly dbt runs)

- 🧪 Add advanced dbt tests — referential integrity, freshness, and schema-level constraints

- 📈 Integrate dashboards (Power BI, Tableau, or Streamlit) to visualize dbt model outputs

- 🪶 Add incremental models to simulate real-world batch and streaming data

- 🔐 Parameterize environments (dev/prod profiles) for multi-environment orchestration

---

## 📚 Resources

- [dbt Documentation](https://docs.getdbt.com/docs/introduction)
- [dbt Discourse Community](https://discourse.getdbt.com/)
- [dbt Slack](https://community.getdbt.com/)
- [dbt Blog](https://blog.getdbt.com/)

---

📖 **Read the full Medium article:**  
[How I Built a Mini Data Pipeline Using dbt + SQLite](https://medium.com/@reshma.varghese.tech/how-i-built-a-mini-data-pipeline-using-dbt-sqlite-e3692288f974)

---
✨ *Created as a hands-on data pipeline demo using dbt + SQLite.* 🚀
