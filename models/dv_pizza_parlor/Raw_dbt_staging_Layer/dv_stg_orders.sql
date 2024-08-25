{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "rw_stg_orders"
derived_columns:
  RECORD_SOURCE: "!orders_source"
  END_DATE: "TO_DATE('9999-12-31')"
null_columns:
    required:
    - ORDER_ID
    - CUSTOMER_ID
hashed_columns:
  ORDER_HK: 
    - "ORDER_ID"
  CUSTOMER_HK:
    - "CUSTOMER_ID"
  ORDER_HASHDIFF:
    is_hashdiff: true
    columns:
      - "ORDER_DATE"
      - "TOTAL_AMOUNT"
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