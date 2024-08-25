{{ config( materialized='view') }}

select
  pizza_id,
  pizza_name,
  size,
  price,
  current_timestamp() as load_date,
  'pizzas_source' as record_source
from {{ source('dv_pizza_parlor','STG_PIZZAS') }};
