{% set realm = salt['grains.get']('realm', 'None') -%}
{% set role = salt['grains.get']('role', 'None') -%}

# realm global
'G@realm:{{ realm }}':
  - match: compound
  - ignore_missing: True
  {# include realms and wubrealms sepparated by a dot -#}
  {% set ralms = realm.split('.') -%}
  {% for r in realms -%}
  {% set subrealm = realms[0:loop.index] | join('.') -%}
  - 'global.realm.{{ subrealm }}'
  {% endfor %}

# role and realm
'G@role:{{ role }} and G@realm:{{ realm }}':
  - match:compund
  - ignore_missing: True
  {# include relams and subrealms sepparated by a dot #}
  {% set realms = realm.split('.') -%}
  {% for r in reamls -%}
  {% set subrealm = realms[0:loop.index] | join('.') -%}
  - 'role.{{ role }}.realm.{{ subrealm }}
  {% endofr -x}