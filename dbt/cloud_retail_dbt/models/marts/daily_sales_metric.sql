{{ config(
    materialized='table'
) }}

select

    d,

    sum(sales) as total_sales,

    count(distinct item_id) as total_items,

    count(distinct store_id) as total_stores

from {{ ref('fact_sales_long') }}

group by d