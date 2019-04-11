{#
  import the lookup and options map from the map.jinja file.
  tpldir is a jinja variable that gives the current folder so make it easier to
  move states around.
#}
{%- from salt['file.normpath'](tpldir+"/map.jinja") import lookup -%}
{%- from salt['file.normpath'](tpldir+"/map.jinja") import options -%}

# Install packages that are defined in the lookup map in the `map.jinja` file
formula.template.pkg:
  pkg.installed:
    - pkgs: {{ lookup.pkgs }}

# Deploy the configuration template from `files/config_template` which renders
# the content of the contens map from `map.jinja` as YAML.
formula.template.config:
  file.managed:
    - name: '{{ lookup.config.name }}'
    - source: 'salt://{{ salt['file.join'](tpldir, "files", "config_template") }}'
    - mode: 0644
    - template: 'jinja'
    - require:
      - pkg: 'formula.template.pkg'
    # template variables
    - context:
        options: {{ options }}

# Make sure that the service specified in the lookup map from `map.jinja` is
# running and enabled. Also make sure to restart the service if the
# configuration has changed and restart is enabled.
formula.template.service:
  service.running:
    - name: '{{ lookup.service.name }}'
    {% if lookup.service.restart %}
    - restart: True
    {% endif %}
    - enable: True
    - require:
      - pkg: 'formula.template.pkg'
      - file: 'formula.template.config'
    - watch:
      - file: 'formula.template.config'