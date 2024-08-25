{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "rw_stg_customers"
derived_columns:
  RECORD_SOURCE: "!customers_source"
  END_DATE: "TO_DATE('9999-12-31')"
null_columns:
    required:
    - CUSTOMER_ID
hashed_columns:
  CUSTOMER_HK: 
  - "CUSTOMER_ID"
  CUSTOMER_HASHDIFF:
    is_hashdiff: true
    columns:
      - "FIRST_NAME"
      - "LAST_NAME"
      - "EMAIL"
      - "PHONE"
      - "ADDRESS"
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