with source as (
    select
        "geolocation_zip_code_prefix",
        "geolocation_lat",
        "geolocation_lng",
        "geolocation_city",
        "geolocation_state"
    from {{ ref('olist_geolocation_dataset') }}
)

select * from source
