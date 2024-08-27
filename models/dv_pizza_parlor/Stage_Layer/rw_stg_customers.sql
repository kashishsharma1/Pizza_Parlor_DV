{{ config( materialized='view' ) }}

select
  customer_id,
  first_name,
  last_name,
  email,
  phone,
  address,
  current_timestamp() as load_date,
  'customers_source' as record_source
from {{ source('dv_pizza_parlor','STG_CUSTOMERS') }}