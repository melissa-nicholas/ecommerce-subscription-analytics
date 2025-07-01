
# dbt_project

This dbt project models data for customer churn analysis, using DuckDB as the backend. The models are built from a public marketing dataset and include staging, fact, and dimension layers.

## Project Structure

- `models/olist/staging/`: Cleans and standardizes raw seed data.
- `models/olist/marts/`: Core business logic for customer engagement, including 
`int_customer_engagements`.
- `models/personality/staging/`: Cleans and standardizes raw seed data.
- `models/personality/marts/`: Core business logic for churn analysis, including `fct_customer_personalities`.
- `seeds/`: Raw CSVs used as input.

## Running the Project

1. Install dependencies (see main README)
2. Activate virtual environment
3. Navigate to the `dbt_project` folder
4. Run dbt commands:

```bash
dbt seed
dbt run
dbt test
```

## Profile Configuration

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

## Models Overview

- `stg_customer_personalities`: Staged version of the marketing dataset
- `fct_customer_personalities`: Fact model includes business logic
- `int_customer_churn`: Customer summary with churn flag added
- `int_customer_engagements`: Combines summary with churn and cohorts
- `int_customer_cohorts`: Customer summary by cohort
- `int_customer_order_summary`: Customer summary information

## Tests & Validations

Basic `not_null` and `unique` tests are applied to primary keys.

---

## Resources

- [dbt Documentation](https://docs.getdbt.com/)
- [DuckDB](https://duckdb.org/)
