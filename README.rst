openstack-standalone
====================

Single Server OpenStack Deployment

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

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
``openstack.cinder``
    Installs Cinder

These states depend on the following formulas:

* `apache <https://github.com/saltstack-formulas/apache-formula>`_
* `avahi <https://github.com/saltstack-formulas/avahi-formula>`_
* `epel <https://github.com/saltstack-formulas/epel-formula>`_
* `memcached <https://github.com/saltstack-formulas/memcached-formula>`_
* `mysql <https://github.com/saltstack-formulas/mysql-formula>`_
* `qpid <https://github.com/saltstack-formulas/qpid-formula>`_


Running Tests
=============

This test runner was implemented using the formula-test-harness_ project.

Tests will be run on the following base images:

* ``simplyadrian/allsalt:centos_master_2017.7.2``
* ``simplyadrian/allsalt:debian_master_2017.7.2``
* ``simplyadrian/allsalt:opensuse_master_2017.7.2``
* ``simplyadrian/allsalt:ubuntu_master_2016.11.3``
* ``simplyadrian/allsalt:ubuntu_master_2017.7.2``

Local Setup
-----------

.. code-block:: shell

   pip install -U virtualenv
   virtualenv .venv
   source .venv/bin/activate
   make setup

Run tests
---------

* ``make test-centos_master_2017.7.2``
* ``make test-debian_master_2017.7.2``
* ``make test-opensuse_master_2017.7.2``
* ``make test-ubuntu_master_2016.11.3``
* ``make test-ubuntu_master_2017.7.2``

Run Containers
--------------

* ``make local-centos_master_2017.7.2``
* ``make local-debian_master_2017.7.2``
* ``make local-opensuse_master_2017.7.2``
* ``make local-ubuntu_master_2016.11.3``
* ``make local-ubuntu_master_2017.7.2``


.. _formula-test-harness: https://github.com/intuitivetechnologygroup/formula-test-harness
