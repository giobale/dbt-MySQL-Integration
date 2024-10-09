{{ config(materialized='table') }}

with top_3_countries as (

    select country, total_value
    from {{ref('country_value')}}
    order by total_value desc
    limit 3

)

select *
from top_3_countries