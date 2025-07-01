with customer_summary as (
    select * from {{ ref('int_customer_order_summary') }}
),

cohorts as (
    select * from {{ ref('int_customer_order_cohorts') }}
),

churn as (
    select * from {{ ref('int_customer_churn') }}
),

final as (
    select
        c.customer_id,
        c.num_orders,
        c.first_order_date,
        c.last_order_date,
        c.total_revenue,
        c.avg_order_value,
        h.cohort_month,
        ch.is_churned
    from customer_summary as c
    left join cohorts as h on c.customer_id = h.customer_id
    left join churn as ch on c.customer_id = ch.customer_id
)

select * from final
