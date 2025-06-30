with personalities as (
    select *
    from {{ ref('stg_customer_personalities') }}
),

final as (
    select
        customer_id,
        year_birth,
        signup_date,
        education,
        marital_status,
        income,
        kidhome,
        teenhome,
        recency,
        accepted_cmp1,
        accepted_cmp2,
        accepted_cmp3,
        accepted_cmp4,
        accepted_cmp5,
        response,
        num_deals_purchases,
        num_web_purchases,
        num_catalog_purchases,
        num_store_purchases,
        complain,
        accepted_cmp1 + accepted_cmp2 + accepted_cmp3 + accepted_cmp4 + accepted_cmp5 as total_accepted_campaigns
    from personalities
)

select * from final
