{{ config(materialized='incremental') }}

{%- set source_model = "dv_stg_order_pizzas" -%}
{%- set src_pk = "ORDER_PIZZAS_ID_HK" -%}
{%- set src_fk = ["ORDER_HK", "PIZZA_HK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk,
            src_ldts=src_ldts, src_source=src_source,
            source_model=source_model) }}
