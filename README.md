# E-Commerce Analytics with dbt + DuckDB

A fully interactive customer analytics and churn dashboard project built using:

- `dbt` for data modeling and transformation
- `DuckDB` as the analytical engine (local + fast)
- `Streamlit` for dashboarding
- `Pandas`, `Matplotlib`, and `Jupyter` for analysis

This repo contains two complementary projects:
- **Olist E-Commerce Analytics**
- **Customer Personality Churn Analysis**

---

## Project 1: Olist E-Commerce Analytics

Uses the [Olist dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) to:
- Build a star schema with `dim_` and `fct_` tables
- Calculate revenue, AOV, freight, etc.
- Generate intermediate models for churn, cohorts, LTV, and engagement

### Models Overview

- `stg_*`: Clean + standardize raw Olist tables
- `dim_*`: Dimensions (customers, products, sellers)
- `fct_orders`: Order-level facts
- `int_customer_*`: Churn, cohort, engagement layers

---

## Project 2: Customer Personality Churn Dashboard

Uses the [Customer Personality Analysis dataset](https://www.kaggle.com/datasets/imakash3011/customer-personality-analysis) to:
- Define churn
- Analyze churn patterns by demographic group
- Build an interactive churn dashboard in Streamlit

### Dashboard Features

- Filters by education level
- Churn rate breakdown by:
  - Age group
  - Income group
  - Family size
- Summary metrics + pie/bar charts
- Annotated insights

---

## Tech Stack

| Layer        | Tool                  |
|--------------|------------------------|
| Transformation | `dbt` with DuckDB    |
| Storage        | DuckDB `.duckdb` file|
| Viz Layer      | `Streamlit`, `Matplotlib` |
| Analysis       | `Pandas`, `Jupyter Notebooks` |

---

## Project Structure

```
ecommerce-subscription-analytics/
│
├── dbt_project/                  
│   ├── models/
│   │   ├── olist/
│   │   │   ├── marts/
│   │   │   │   ├──int_customer_order_summary.sql
│   │   │   │   ├──int_customer_order_cohorts.sql
│   │   │   │   ├──etc...
│   │   │   ├── staging/
│   │   ├── personality/
│   │   │   ├── marts/
│   │   │   ├── staging/
│   └── ecommerce.duckdb         
│
├── analysis/  
│   ├── 01_explore_customer_data.ipynb
│   ├── 02_churn_flag_and_retention.ipynb                
│
├── churn_dashboard.py           
├── requirements.txt             
└── README.md                    
```

---

##  How to Run Locally

### 1. Clone and set up

```bash
git clone https://github.com/melissa-nicholas/ecommerce-subscription-analytics.git
cd ecommerce-subscription-analytics
python3 -m venv venv
source venv/bin/activate 
pip install -r requirements.txt
```

### 2. Build dbt models

```bash
cd dbt_project
dbt build
```

### 3. Run the Streamlit dashboard

```bash
streamlit run churn_dashboard.py
```

---

## Coming Soon

- Airflow orchestration layer
- Real-time KPI updates
- Streamlit Cloud or Hugging Face hosting
- Dashboard for Olist data
- LTV, retention curve modeling, and subscriptions dashboard

---

## Author

**Built with ❤️ by Melissa Nicholas**  
Senior BI Engineer | Data Nerd | Dashboard Whisperer  
[Connect on LinkedIn](https://www.linkedin.com/in/melissa-nicholas-7a143593/)
