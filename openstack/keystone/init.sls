keystone-db-init:
  cmd.run:
    - name: openstack-db --init --service keystone --rootpw ''
    - unless: echo '' | mysql keystone
    - require:
      - pkg: openstack-keystone
      - service: mysqld

openstack-keystone:
  service.running:
    - enable: True
    - require:
      - pkg: openstack-keystone
    - watch:
      - cmd: keystone-db-init
      - file: /etc/keystone
  pkg.installed: []

/etc/keystone:
  file.recurse:
    - source: salt://openstack/keystone/files
    - template: jinja
    - require:
      - pkg: openstack-keystone
