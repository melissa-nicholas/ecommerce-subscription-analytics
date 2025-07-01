with orders as (
    select * from {{ ref('fct_orders') }}
),

summary as (
    select
        customer_id,
        count(distinct order_id) as num_orders,
        min(order_purchase_ts) as first_order_date,
        max(order_purchase_ts) as last_order_date,
        round(sum(order_value), 2) as total_revenue,
        round(avg(order_value), 2) as avg_order_value
    from orders
    group by customer_id
)

select * from summary
