# Ecommerce Analytics with dbt + DuckDB

## 📖 Project Summary
This project demonstrates a full analytics pipeline I built using **dbt** with **DuckDB** as the local database.  
The goal was to transform raw e‑commerce data (orders, customers, products) into clean, tested, and documented analytical tables ready for business insights.

---

## 🧩 What I built
- **Seeds**: Loaded raw CSV files (`raw_orders.csv`, `raw_customers.csv`, `raw_products.csv`) into DuckDB.
- **Staging models (`stg_`)**: Standardized and cleaned the raw data, renaming columns and casting types.
- **Intermediate models (`int_`)**: Joined staging tables and enriched them with business logic, such as classifying orders by value tiers.
- **Marts (`dim_`, `fct_`)**: Delivered final analytical tables:
  - `dim_customers`: customer dimension with unique IDs, names, emails, and cities.
  - `dim_products`: product dimension with categories, prices, and costs.
  - `fct_orders`: fact table of orders including totals, discounts, and order tiers.
- **Tests**: Implemented automated data quality checks (unique, not_null, relationships, accepted_range).
- **Documentation**: Generated interactive documentation with lineage graphs and column descriptions using `dbt docs`.

---

## 📊 Results
- ✅ Successful `dbt build` with all models and tests passing (28 tests in total).  
- ✅ Automated lineage graph showing the flow from raw seeds → staging → intermediate → marts.  
- ✅ Dimension and fact tables materialized in DuckDB, ready for analysis.  
- ✅ Clear documentation of columns and business logic (e.g., `order_tier` classification).

---


## ⚙️ Tech Stack
- **dbt-duckdb** (local dbt adapter)
- **DuckDB** (analytical database)
- **SQL + Jinja** (transformations)
- **dbt-utils** (generic tests)

---

## 🚀 How to Run
Clone the repository and install dependencies:

```bash
# Install dbt-duckdb
pip install dbt-duckdb

# Verify installation
dbt --version

# Initialize DuckDB profile (~/.dbt/profiles.yml)
ecommerce_analytics:
  target: dev
  outputs:
    dev:
      type: duckdb
      path: 'ecommerce.duckdb'
      threads: 4

# Run seds
dbt seed
dbt run
dbt test
dbt build

# Generate docs
dbt docs generate
dbt docs serve --port 8081


👤 Author
Gabriel Gil 