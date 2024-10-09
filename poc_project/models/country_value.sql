{{ config(materialized='table') }}

with country_value as (
    select user_country as country,
           sum(value) as total_value
    from poc_db.poc_orders
    group by user_country
)

select *
from country_value 

