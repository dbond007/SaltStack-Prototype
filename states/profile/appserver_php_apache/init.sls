include:
  - 'formula.php'
  - 'formula.apache'

extend:
  formula.apache.service:
    # autorestart apache when php config changes
    - watch:
      - file: 'formula.php.config'
Profile nginx_ssl_terminator
nginx_ssl_terminator init.sls
include:
  - 'formula.nginx'

extend:
  formula.nginx.config:
    file.managed:
      - source: 'profile.ssl_terminator.files.config_template'