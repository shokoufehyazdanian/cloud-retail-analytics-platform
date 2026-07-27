{{ config(
    materialized='view'
) }}

WITH source AS (

    SELECT *
    FROM {{ source('retail_raw', 'SALES_RAW') }}

)

SELECT

    "id" AS id,
    "item_id" AS item_id,
    "dept_id" AS dept_id,
    "store_id" AS store_id,
    "state_id" AS state_id,

    *

FROM source