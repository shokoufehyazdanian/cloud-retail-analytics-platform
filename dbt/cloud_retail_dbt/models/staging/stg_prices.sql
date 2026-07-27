WITH source AS (

    SELECT *
    FROM {{ source('retail_raw', 'PRICES_RAW') }}

)

SELECT

    "store_id" AS store_id,
    "item_id" AS item_id,
    "wm_yr_wk" AS week_id,
    "sell_price" AS sell_price

FROM source