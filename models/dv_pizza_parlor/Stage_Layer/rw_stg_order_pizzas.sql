{{ config( materialized='view') }}

select
  order_id,
  pizza_id,
  quantity,
  itemtotal,
  current_timestamp() as load_date,
  'orderitems_source' as record_source
from {{ source('dv_pizza_parlor','STG_ORDER_ITEMS') }}
