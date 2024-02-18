{{
    config(
        alias='vw_catalina_ref',materialized='view'
    )
}}

select *, 'dummy' as name, current_timestamp() as created_date from {{ ref('dynamic_table_creation') }}