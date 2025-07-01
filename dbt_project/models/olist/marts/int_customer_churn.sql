with customer_summary as (
    select * from {{ ref('int_customer_order_summary') }}
),

churn as (
    select
        *,
        case
            when last_order_date < current_date - interval '60 days' then 1
            else 0
        end as is_churned
    from customer_summary
)

select * from churn
