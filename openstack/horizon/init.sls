{% set pkg = salt['grains.filter_by']({
  'Debian': {
    'name': 'openstack-dashboard',
    'wsgi_conf': '/etc/apache2/conf.d/openstack-dashboard.conf',
  },
  'RedHat': {
    'name': 'openstack-dashboard',
    'wsgi_conf': '/etc/httpd/conf.d/openstack-dashboard.conf',
  },
}) %}

include:
  - apache
  - apache.mod_wsgi

horizon:
  pkg.installed:
    - name: {{ pkg.name }}
    - watch_in:
      - service: apache

/etc/openstack-dashboard/local_settings:
  file.managed:
    - source: salt://openstack/horizon/files/local_settings
    - template: jinja
    - require:
      - pkg: horizon

horizon-config:
  file:
    - managed
    - name: {{ pkg.wsgi_conf }}
    - source: salt://openstack/horizon/files/openstack-dashboard.conf
