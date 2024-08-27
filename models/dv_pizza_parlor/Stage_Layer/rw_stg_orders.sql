{{ config( materialized='view') }}

select
  order_id,
  customer_id,
  order_date,
  total_amount,
  current_timestamp() as load_date,
  'orders_source' as record_source
from {{ source('dv_pizza_parlor','STG_ORDERS') }}
