with source as (
    select
        "seller_id",
        "seller_zip_code_prefix",
        lower("seller_city") as city,
        upper("seller_state") as state
    from {{ ref('olist_sellers_dataset') }}
)

select * from source
