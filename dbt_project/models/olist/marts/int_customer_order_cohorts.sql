with customer_summary as (
    select * from {{ ref('int_customer_order_summary') }}
),

cohort as (
    select
        *,
        date_trunc('month', first_order_date) as cohort_month
    from customer_summary
)

select * from cohort
