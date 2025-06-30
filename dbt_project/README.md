
# dbt_project

This dbt project models data for customer churn analysis, using DuckDB as the backend. The models are built from a public marketing dataset and include staging, fact, and dimension layers.

## 🧱 Project Structure

- `models/staging/`: Cleans and standardizes raw seed data.
- `models/marts/`: Core business logic for churn analysis, including `fct_customer_personalities`.
- `seeds/`: Raw CSVs used as input.

## 🚀 Running the Project

1. Install dependencies (see main README)
2. Activate virtual environment
3. Navigate to the `dbt_project` folder
4. Run dbt commands:

```bash
dbt seed
dbt run
dbt test
```

## 🔗 Profile Configuration

This project uses a local DuckDB connection. Set up `~/.dbt/profiles.yml` like this:

```yaml
dbt_project:
  target: dev
  outputs:
    dev:
      type: duckdb
      path: /full/path/to/dbt_project/ecommerce.duckdb
```

> Update the path to match your local setup.

---

## 📈 Models Overview

- `stg_customer_personalities`: Staged version of the marketing dataset
- `fct_customer_personalities`: Adds churn flag, age groupings, and more

## 🧪 Tests & Validations

Basic `not_null` and `unique` tests are applied to primary keys and important fields.

---

## 📚 Resources

- [dbt Documentation](https://docs.getdbt.com/)
- [DuckDB](https://duckdb.org/)
