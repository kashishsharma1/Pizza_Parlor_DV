{{ config(tags="sat",materialized='incremental') }}

{%- set source_model = "dv_stg_ingredients" -%}
{%- set src_pk = "INGREDIENT_HK" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}
{%- set src_hashdiff = "INGREDIENT_HASHDIFF" -%}
{%- set src_payload = ["INGREDIENT_NAME", "LOAD_DATE"] -%}

{{ automate_dv.sat(src_pk=src_pk, src_ldts=src_ldts,
            src_source=src_source, src_hashdiff=src_hashdiff,
            source_model=source_model, src_payload=src_payload) }}
