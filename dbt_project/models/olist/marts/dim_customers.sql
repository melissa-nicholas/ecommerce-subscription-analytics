with customers as (
    select * from {{ ref('stg_customers_olist') }}
),

final as (
    select
        customer_id,
        customer_unique_id,
        zip_code_prefix,
        city,
        state
    from customers
)

select * from final
