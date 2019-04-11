include:
  - 'formula.nginx'

extend:
  formula.nginx.config:
    file.managed:
      - source: 'profile.ssl_terminator.files.config_template'