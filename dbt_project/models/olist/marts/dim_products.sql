with products as (
    select * from {{ ref('stg_products_olist') }}
),

final as (
    select
        product_id,
        product_category_name,
        name_length,
        desc_length,
        photos_qty,
        weight_g,
        length_cm,
        height_cm,
        width_cm
    from products
)

select * from final
