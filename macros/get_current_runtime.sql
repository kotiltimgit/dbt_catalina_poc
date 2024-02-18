{% macro get_current_runtime() %}
    {% if execute %}
        {% set current_runtime = run_query(
            " SELECT TO_CHAR(CURRENT_TIMESTAMP(),'YYYYMMDDHHMISS') as runcovdate "
        ).columns[0][0] %}
    {% else %} {% set current_runtime = "99990101" %}
    {% endif %}

    {% do return(current_runtime) %}
{% endmacro %}
