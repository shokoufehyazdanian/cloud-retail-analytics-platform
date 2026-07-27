WITH source AS (

    SELECT *
    FROM {{ source('retail_raw', 'CALENDAR_RAW') }}

)

SELECT

    "d" AS d,
    "date" AS calendar_date,
    "wm_yr_wk" AS week_id,
    "weekday" AS weekday,
    "wday" AS wday,
    "month" AS month,
    "year" AS year,
    "event_name_1" AS event_name_1,
    "event_type_1" AS event_type_1,
    "event_name_2" AS event_name_2,
    "event_type_2" AS event_type_2,
    "snap_CA" AS snap_CA,
    "snap_TX" AS snap_TX,
    "snap_WI" AS snap_WI

FROM source