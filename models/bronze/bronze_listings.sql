{{ config(materialized = 'incremental') }}

select * from {{ source('staging','listings') }}

{% if is_incremental() %}
    where CREATED_AT > (select max(CREATED_AT) from {{ this }})
{% endif %}