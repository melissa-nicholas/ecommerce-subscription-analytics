with orders as (
  select * from {{ ref('stg_orders_olist') }}
),

items as (
  select * from {{ ref('stg_order_items_olist') }}
),

final as (
  select
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_ts,
    o.estimated_delivery_date,
    count(distinct i.product_id) as num_products,
    sum(i.price) as order_value,
    sum(i.freight) as freight_cost
  from orders as o
  left join items as i on o.order_id = i.order_id
  group by 1, 2, 3, 4, 5
)

select * from final
