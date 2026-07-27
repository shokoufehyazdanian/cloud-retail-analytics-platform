{{ config(
    materialized='table'
) }}

WITH sales AS (

    SELECT *
    FROM {{ ref('fact_sales_long') }}

),

calendar AS (

    SELECT *
    FROM {{ ref('stg_calendar') }}

),

prices AS (

    SELECT *
    FROM {{ ref('stg_prices') }}

)

SELECT

    sales.id,
    sales.item_id,
    sales.dept_id,
    sales.store_id,
    sales.state_id,

    calendar.calendar_date,
    calendar.week_id,
    calendar.weekday,
    calendar.month,
    calendar.year,

    calendar.event_name_1,
    calendar.event_type_1,
    calendar.event_name_2,
    calendar.event_type_2,

    calendar.snap_ca,
    calendar.snap_tx,
    calendar.snap_wi,

    prices.sell_price,

    sales.sales

FROM sales

LEFT JOIN calendar
    ON sales.d = calendar.d

LEFT JOIN prices
    ON sales.item_id = prices.item_id
   AND sales.store_id = prices.store_id
   AND calendar.week_id = prices.week_id