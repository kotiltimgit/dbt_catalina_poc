{% set now = modules.datetime.datetime.now().strftime("%Y%m%d%H%M%S") %}
{% set table_name = "catalina_test" + "_" + now %}
{{ config(alias=table_name, materialized="table") }}

select
    'Koti' as test_column, '{{ env_var("DBT_CLOUD_RUN_ID", "manual") }}' as audit_run_id