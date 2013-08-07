keystone-db-init:
    cmd:
        - run
        - name: openstack-db --init --service keystone --rootpw ''
        - unless: echo '' | mysql keystone
        - require:
            - pkg: openstack-keystone
            - service: mysqld

openstack-keystone:
    service:
        - running
        - enable: True
        - require:
            - pkg: openstack-keystone
        - watch:
            - cmd: keystone-db-init
    pkg:
        - installed

/etc/keystone:
    file:
        - recurse
        - source: salt://openstack/keystone
        - require:
            - pkg: openstack-keystone
        - watch_in:
            - service: openstack-keystone
