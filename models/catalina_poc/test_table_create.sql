{% set currenttime_query %}
SELECT TO_CHAR(CURRENT_TIMESTAMP(),'YYYYMMDDHHMISS') as runcovdate
{% endset %}

{% set results = run_query(currenttime_query) %}

{% if execute %}
    {# Return the first column #}
    {% set runtimeval = results.columns[0][0] %}
{% else %} {% set runtimeval = "abc" %}
{% endif %}

{% set table_name = "catalina_test" + "_" + runtimeval %}

{{ config(alias=table_name, materialized="table") }}

select
    'Koti' as test_column, '{{ env_var("DBT_CLOUD_RUN_ID", "manual") }}' as audit_run_id
