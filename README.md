
# Customer Churn Dashboard

A fully interactive customer churn analytics dashboard built with:

- `dbt` for transformation + modeling
- `DuckDB` as the analytical database
- `Streamlit` for dashboarding
- `Pandas` + `Matplotlib` for analysis & visualizations

## Use Case

This project analyzes a fictional customer base (via the *Customer Personality Analysis* dataset) to:
- Define a churn metric
- Understand patterns in churn behavior across demographics
- Build a lightweight, fast, and cost-free churn dashboard using open-source tools

## Tech Stack

| Layer        | Tool             |
|--------------|------------------|
| Transformation | `dbt` (with DuckDB adapter) |
| Data Source     | CSV (Customer Personality Dataset) |
| Storage Engine  | `DuckDB` (local file) |
| Orchestration   | Manual / ad hoc for now |
| Viz Layer       | `Streamlit` (Python) |

## Project Structure

```
ecommerce-subscription-analytics/
│
├── dbt_project/                  
│   ├── models/
│   │   ├── staging/
│   │   │   ├── stg_customer_personalities.sql
│   │   ├── marts/
│   │   │   ├── fct_customer_personalities.swl
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

## Getting Started

### 1. Clone this repo

```bash
git clone https://github.com/melissa-nicholas/ecommerce-subscription-analytics.git
cd ecommerce-subscription-analytics
```

### 2. Set up your Python environment

```bash
python3 -m venv venv
source venv/bin/activate 
pip install -r requirements.txt
```

### 3. Set up dbt project

```bash
cd dbt_project
dbt build
```

> This builds your staging + mart models into a local DuckDB database.

### 4. Run the Streamlit app

```bash
streamlit run churn_dashboard.py
```

## Dashboard Features

- Interactive filters (education level)
- Churn rate breakdown by:
  - Age group
  - Income group
  - Family size
  - Education level
- Summary metrics (total, churned, churn rate)
- Pie + bar charts
- Insight annotations

## Dataset Info

This project uses the **Customer Personality Analysis** dataset, which contains:

- Demographics (age, income, education, family size)
- Marketing responses
- Product spend behavior

→ Available for free on [Kaggle](https://www.kaggle.com/datasets/imakash3011/customer-personality-analysis).

## Coming Soon

- Olist dataset integration
- dbt + Airflow orchestration
- Real-time KPI version
- Cloud-hosted app (Streamlit Cloud / Hugging Face Spaces)

## Author

**Melissa Nicholas**  
Senior BI Engineer | Data Nerd | Dashboard Whisperer  
[Connect on LinkedIn](https://www.linkedin.com/in/melissa-nicholas-7a143593/)

Built with ❤️ by Melissa Nicholas