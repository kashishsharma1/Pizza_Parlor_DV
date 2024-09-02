{{ config(tags="sat",materialized='incremental') }}

{%- set source_model = "dv_stg_orders" -%}
{%- set src_pk = "ORDER_HK" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}
{%- set src_hashdiff = "ORDER_HASHDIFF" -%}
{%- set src_payload = ["ORDER_DATE", "TOTAL_AMOUNT", "LOAD_DATE"] -%}

{{ automate_dv.sat(src_pk=src_pk, src_ldts=src_ldts,
            src_source=src_source, src_hashdiff=src_hashdiff
            , source_model=source_model, src_payload=src_payload) }}
