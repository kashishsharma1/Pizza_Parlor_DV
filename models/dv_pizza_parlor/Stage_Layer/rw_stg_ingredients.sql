{{ config( materialized='view') }}

select
  ingredient_id,
  ingredient_name,
  current_timestamp() as load_date,
  'ingredients_source' as record_source
from {{ source('dv_pizza_parlor','STG_INGREDIENTS') }}
