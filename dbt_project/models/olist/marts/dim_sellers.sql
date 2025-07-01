with sellers as (
    select * from {{ ref('stg_sellers_olist') }}
),

final as (
    select
        seller_id,
        seller_zip_code_prefix,
        city,
        state
    from sellers
)

select * from final
