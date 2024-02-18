{% set result = get_current_runtime() %}


{% set table_name = "catalina_test" + "_" + result %}


{{ config(alias=table_name, materialized="table") }}

select
    'Koti' as test_column, '{{ env_var("DBT_CLOUD_RUN_ID", "manual") }}' as audit_run_id
