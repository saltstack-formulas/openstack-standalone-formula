{% if grains['os_family'] == 'RedHat' %}
  {% set horizon_pkg = 'openstack-dashboard' %}
{% endif %}

include:
  - apache

horizon:
  pkg.installed:
    - name: {{ horizon_pkg }}
    - watch_in:
      - service: apache

/etc/openstack-dashboard/local_settings:
  file.managed:
    - source: salt://openstack/horizon/files/local_settings
    - template: jinja
