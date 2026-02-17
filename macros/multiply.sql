{% macro multiply(col1,col2,precision) %}

    round( {{col1}} * {{col2}}, {{preciosion}} )

{% endmacro %}