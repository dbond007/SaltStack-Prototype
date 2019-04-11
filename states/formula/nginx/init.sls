{%- from salt['file.join'](tpldir,"map.jinja")
  import lookup -%}

formula.nginx.pkg:
  pkg.installed:
    - pkgs: {{ lookup.pkgs }}

formula.nginx.service:
  service.running:
    - name: '{{ lookup.service.name }}'
    - require:
      - pkg: 'formula.nginx.pkg'
      - file: 'formula.nginx.config'

formula.nginx.config:
  file.managed:
    - name: '{{ lookup.config.name }}'
    - source: 'salt://{{ salt['file.join'](tpldir, "files", "template") }}'
    - template: 'jinja'
    - context:
      - tpldir: {{ tpldir }}