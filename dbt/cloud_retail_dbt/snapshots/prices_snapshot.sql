{% snapshot prices_snapshot %}

{{
    config(
        target_schema='SNAPSHOTS',
        unique_key='item_id || store_id || week_id',
        strategy='check',
        check_cols=['sell_price']
    )
}}

SELECT

    STORE_ID,
    ITEM_ID,
    WEEK_ID,
    SELL_PRICE

FROM {{ ref('stg_prices') }}

{% endsnapshot %}