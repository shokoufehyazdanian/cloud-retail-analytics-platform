{{ config(
    materialized='incremental',
    unique_key='ID'
) }}

WITH sales AS (

    SELECT *
    FROM {{ ref('stg_sales') }}

),

unpivot_sales AS (

    SELECT

        "id" AS ID,
        "item_id" AS ITEM_ID,
        "dept_id" AS DEPT_ID,
        "store_id" AS STORE_ID,
        "state_id" AS STATE_ID,
        d,
        sales

    FROM sales

    UNPIVOT(
        sales FOR d IN (
            {{ get_sales_columns() }}
        )
    )

)

SELECT *

FROM unpivot_sales


{% if is_incremental() %}

WHERE d > (
    SELECT MAX(d)
    FROM {{ this }}
)

{% endif %}