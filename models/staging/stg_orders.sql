with source as (
    select * from {{ source('raw_data', 'ORDERS_RAW') }}
),

renamed as (
    select
        "Order ID" as order_id,
        "Order Date" as order_date,
        "Customer ID" as customer_id,
        "REGION" as region,
        "SALES" as sales_amount,
        "PROFIT" as profit_amount
    from source
)

select * from renamed