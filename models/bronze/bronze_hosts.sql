{{ config( materialized = 'incremental') }}

select * from {{ source('staging','hosts') }}

{% if is_incremental() %}

where CREATED_AT > (select max(CREATED_AT) from {{ this }})

{% endif %}