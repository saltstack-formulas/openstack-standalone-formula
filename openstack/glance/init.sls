include:
  - mysql.service

openstack-glance:
  pkg:
    - installed

glance-db-init:
  cmd:
    - run
    - name: openstack-db --init --service glance --rootpw ''
    - unless: echo '' | mysql glance
    - require:
      - pkg: openstack-glance
     - service: mysqld

glance-services:
  service:
    - running
    - enable: True
    - pkgs:
      - openstack-glance-api
      - openstack-glance-registry
    - require:
      - pkg: openstack-glance
      - cmd: glance-db-init
    - watch:
      - file: /etc/glance

/etc/glance:
  file:
    - recurse
    - source: salt://openstack/glance/files
    - template: jinja
    - require:
      - pkg: openstack-glance
