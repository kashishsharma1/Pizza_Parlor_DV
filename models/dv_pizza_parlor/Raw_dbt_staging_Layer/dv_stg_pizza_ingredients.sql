{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "rw_stg_pizza_ingredients"
derived_columns:
  RECORD_SOURCE: "!pizzaIngredient_source"
  END_DATE: "TO_DATE('9999-12-31')"
hashed_columns:
  PIZZA_INGREDIENT_HK:
    - "PIZZA_ID"
    - "INGREDIENT_ID"
  PIZZA_HK:
    - "PIZZA_ID"
  INGREDIENT_HK: 
    - "INGREDIENT_ID"
 
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}
