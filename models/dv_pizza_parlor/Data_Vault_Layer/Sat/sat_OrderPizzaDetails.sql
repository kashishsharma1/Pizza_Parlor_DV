{{ config(tags="sat",materialized='incremental') }}

{%- set source_model = "dv_stg_order_pizzas" -%}
{%- set src_pk = "ORDER_PIZZAS_HK" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}
{%- set src_hashdiff = "ORDER_PIZZAS_HASHDIFF" -%}
{%- set src_payload = ["QUANTITY", "ITEMTOTAL", "LOAD_DATE"] -%}

{{ automate_dv.sat(src_pk=src_pk, src_ldts=src_ldts,
            src_source=src_source, src_hashdiff=src_hashdiff,
            source_model=source_model, src_payload=src_payload) }}
