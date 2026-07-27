{% macro get_sales_columns() %}

{% set columns = [] %}

{% for i in range(1,1914) %}

    {% do columns.append('"d_' ~ i ~ '"') %}

{% endfor %}

{{ columns | join(',') }}

{% endmacro %}