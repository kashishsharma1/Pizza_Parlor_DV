{{ config( materialized='view') }}

select
  pizza_id,
  ingredient_id,
  current_timestamp() as load_date,
  'pizzaIngredients_source' as record_source
from {{ source('dv_pizza_parlor','STG_PIZZA_INGREDIENTS') }}
