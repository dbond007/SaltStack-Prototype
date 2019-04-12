{# The version is set as a grain for the minion on where to get its config #}

{% set structure = salt['grains.get']('structure', 'v1') %}
{% if structure == 'v1' %}

{# Original monolithic Salt top file goes here #}

{% endif %}

{% if structure == 'v2' %}
{% set role = salt['grains.get']('role'. 'None') %}
'G@role:{{ role}}':
  - match: compound
  - 'role.{{ role }}'
{% endif %}
