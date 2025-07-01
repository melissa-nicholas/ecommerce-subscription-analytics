with source as (
    select
        "customer_id",
        "customer_unique_id",
        "customer_zip_code_prefix" as zip_code_prefix,
        lower("customer_city") as city,
        upper("customer_state") as state
    from {{ ref('olist_customers_dataset')}}
)

select * from source 
