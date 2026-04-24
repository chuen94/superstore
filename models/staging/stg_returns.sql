select
    "Order ID" as order_id,
    "RETURNED" as is_returned
from {{ source('raw_data', 'RETURNS_RAW') }}
