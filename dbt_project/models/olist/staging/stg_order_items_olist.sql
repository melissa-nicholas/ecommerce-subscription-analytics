with source as (
    select
        "order_id",
        "order_item_id",
        "product_id",
        "seller_id",
        cast("shipping_limit_date" as timestamp) as shipping_limit_ts,
        cast("price" as float) as price,
        cast("freight_value" as float) as freight
    from {{ ref('olist_order_items_dataset') }}
)

select * from source
