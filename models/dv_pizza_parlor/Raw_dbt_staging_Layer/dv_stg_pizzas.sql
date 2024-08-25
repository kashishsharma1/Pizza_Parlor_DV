{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "rw_stg_pizzas"
derived_columns:
  RECORD_SOURCE: "!pizzas_source"
  END_DATE: "TO_DATE('9999-12-31')"
null_columns:
    required:
    - PIZZA_ID
hashed_columns:
  PIZZA_HK: 
    - "PIZZA_ID"
  PIZZA_HASHDIFF:
    is_hashdiff: true
    columns:
      - "PIZZA_NAME"
      - "SIZE"
      - "PRICE"
      - "LOAD_DATE"
      - "RECORD_SOURCE"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

With staging as (
    {{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=metadata_dict['null_columns'],
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}
)
select * from staging