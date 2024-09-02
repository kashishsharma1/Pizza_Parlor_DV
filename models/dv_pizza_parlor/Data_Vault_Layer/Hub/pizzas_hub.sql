{{ config(tags="hub",materialized='incremental') }}

{%- set source_model = "dv_stg_pizzas" -%}
{%- set src_pk = "PIZZA_HK" -%}
{%- set src_nk = "PIZZA_ID" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                   src_source=src_source, source_model=source_model) }}
