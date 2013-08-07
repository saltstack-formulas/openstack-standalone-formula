include:
  - apache

horizon:
  pkg.installed:
    - name: openstack-dashboard
    - watch_in:
      - service: apache

/etc/openstack-dashboard/local_settings:
  file.managed:
    - source: salt://openstack/horizon/files/local_settings
    - template: jinja
    - require:
      - pkg: horizon
