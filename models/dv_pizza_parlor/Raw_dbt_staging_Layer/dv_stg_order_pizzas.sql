{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "rw_stg_order_pizzas" 
derived_columns:
  RECORD_SOURCE: "!orderItems_source"
  END_DATE: "TO_DATE('9999-12-31')"
null_columns:
  required:
    - ORDER_ID
    - PIZZA_ID
hashed_columns:
  ORDER_PIZZAS_ID_HK:
    - "ORDER_ID"
    - "PIZZA_ID"
  ORDER_HK: 
    - "ORDER_ID"
  PIZZA_HK:
    - "PIZZA_ID"
  ORDER_PIZZAS_HASHDIFF:
    is_hashdiff: true
    columns:
      - "QUANTITY"
      - "ITEMTOTAL"
      - "LOAD_DATE"
      - "RECORD_SOURCE"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

WITH staging AS (
    {{ automate_dv.stage(include_source_columns=true,
                         source_model=metadata_dict['source_model'],
                         derived_columns=metadata_dict['derived_columns'],
                         null_columns=metadata_dict['null_columns'],
                         hashed_columns=metadata_dict['hashed_columns'],
                         ranked_columns=none) }}
)
SELECT * FROM staging
