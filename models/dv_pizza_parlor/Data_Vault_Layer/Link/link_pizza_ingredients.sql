{{ config(tags="link",materialized='incremental') }}

{%- set source_model = "dv_stg_pizza_ingredients" -%}
{%- set src_pk = "PIZZA_INGREDIENT_HK" -%}
{%- set src_fk = ["PIZZA_HK", "INGREDIENT_HK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}