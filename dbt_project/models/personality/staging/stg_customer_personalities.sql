with source as (

    select
        "ID" as customer_id,
        "Year_Birth" as year_birth,
        "Dt_Customer" as signup_date,
        "Education" as education,
        "Marital_Status" as marital_status,
        "Income" as income,
        "Kidhome" as kidhome,
        "Teenhome" as teenhome,
        "Recency" as recency,
        "AcceptedCmp1" as accepted_cmp1,
        "AcceptedCmp2" as accepted_cmp2,
        "AcceptedCmp3" as accepted_cmp3,
        "AcceptedCmp4" as accepted_cmp4,
        "AcceptedCmp5" as accepted_cmp5,
        "Response" as response,
        "NumDealsPurchases" as num_deals_purchases,
        "NumWebPurchases" as num_web_purchases,
        "NumCatalogPurchases" as num_catalog_purchases,
        "NumStorePurchases" as num_store_purchases,
        "Complain" as complain,
    from {{ ref('customer_personality') }}

)

select * from source
