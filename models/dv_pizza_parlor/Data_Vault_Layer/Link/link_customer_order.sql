{{ config(tags="link",materialized='incremental') }}

{%- set source_model = "dv_stg_customers_orders" -%}
{%- set src_pk = "CUSTOMER_ORDER_HK" -%}
{%- set src_fk = ["CUSTOMER_HK", "ORDER_HK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}
