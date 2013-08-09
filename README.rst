openstack-standalone
====================

Single Server OpenStack Deployment

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/topics/conventions/formulas.html>`_.

Available states
----------------

``openstack``
    Installs Nova, Glance, and Keystone
``openstack.nova``
    Installs Nova
``openstack.glance``
    Installs Glance
``openstack.keystone``
    Installs Keystone

These formulas depend on the following formulas:

* `apache <https://github.com/saltstack-formulas/apache-formula>`_
* `avahi <https://github.com/saltstack-formulas/avahi-formula>`_
* `epel <https://github.com/saltstack-formulas/epel-formula>`_
* `memcached <https://github.com/saltstack-formulas/memcached-formula>`_
* `mysql <https://github.com/saltstack-formulas/mysql-formula>`_
* `qpid <https://github.com/saltstack-formulas/qpid-formula>`_
