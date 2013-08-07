{% if grains['os_family'] == 'RedHat' %}
  {% set cinder_pkgs = ['openstack-cinder', 'openstack-cinder-doc'] %}
{% elif grains['os_family'] == 'Debian' %}
  {% set cinder_pkgs = ['openstack-cinder', 'openstack-cinder-doc'] %}
{% endif %}

include:
  - iscsi

cinder-pkgs:
  pkg.installed:
    - pkgs:
    {% for pkg in cinder_pkgs %}
      - {{ pkg }}
    {% endfor %}
    - watch_in:
      - service: tgt

/etc/cinder:
  file.recurse:
    - source: salt://openstack/cinder/files
    - template: jinja
    - watch_in:
      - service: tgt

cinder-manage:
  cmd.wait:
    - name: cinder-manage db sync
    - watch:
      - pkg: cinder-pkgs
      - file: /etc/cinder

cinder-services:
  service.running:
    - names:
      - cinder-volume
      - cinder-api
      - cinder-scheduler
