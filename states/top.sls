## version set as a grain for the minion


{% set structure = salt['grains.get']('structure', 'v1') %}
{% if structure == 'v1' %}


{% endif %}

{% if structure == 'v2' %}
{% set role = salt['grains.get']('role'. 'None') %}
'G@role:{{ role}}':
  - match: compound
  - 'role.{{ role }}'
{% endif %}