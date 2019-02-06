Upgrading MISP-dockerized
#########################

Switch a live MISP-dockerized instance to a new version of MISP-dockerized.

Advice
======

* **Back up your database**
* Mind any version-specific comments below
* Try out the new version on a test server before doing an upgrade
* `Report any problems or issues to GitHub <issues_>`_

.. _issues: https://github.com/DCSO/MISP-dockerized/issues

Basic Instructions
==================

#. Back up your database, data directory with **make backup-all**.
#. Download the new version of MISP-dockerized with **git pull**.
#. Update the instance: 
    * before 1.0.0: **make upgrade**.
    * after  1.0.0: **make update**.


.. note::

   If there are any modifications in the container itself please remind they are lost after an upgrade.
   If this is the case, take care to maintain your modifications or to build your own docker container on base of MISP-dockerized. 
   Support is only available for official MISP-dockerized container.


From v0.3.4-beta to v1.0.0
==========================

.. warning::

    Normally an upgrade should work from 0.3.4 to 1.0.0. But have in mind you start an Upgrade from an beta version to an production ready version.

.. code-block:: bash

    git checkout origin/master
    git pull
    make install


From v0.3.3-beta to v0.3.4-beta
===============================

.. warning::

   In the docker-compose is a mismatch for the misp-vol-server-MISP-tmp and the misp-vol-server-MISP-attachments volume.
   Please copy first the Data into the Volume and then make an upgrade!

.. code-block:: bash

    git checkout origin/master
    git pull
    make install


From v0.3.2-beta to v0.3.3-beta
===============================

.. warning::

   In the docker-compose is a mismatch for the misp-vol-server-MISP-tmp and the misp-vol-server-MISP-attachments volume.
   Please copy first the Data into the Volume and then make an upgrade!


.. code-block:: bash

    git checkout origin/master
    git pull
    make install



From v0.3.1-beta to v0.3.2-beta
===============================

.. warning::

   In the docker-compose is a mismatch for the misp-vol-server-MISP-tmp and the misp-vol-server-MISP-attachments volume.
   Please copy first the Data into the Volume and then make an upgrade!

.. code-block:: bash

    git checkout origin/master
    git pull
    make install



From v0.3.0-beta to v0.3.1-beta
===============================

.. warning::

   In the docker-compose is a mismatch for the misp-vol-server-MISP-tmp and the misp-vol-server-MISP-attachments volume.
   Please copy first the Data into the Volume and then make an upgrade!


.. code-block:: bash

    git checkout origin/master
    git pull
    make install



From v0.2.0-beta to v0.3.0-beta
===============================

.. warning::

    A direct upgrade is not supported.


From v2.4.88-beta.3 to v0.2.0-beta
=====================================

.. warning::

    A direct upgrade is not supported.

From v2.4.88-beta.2 to v2.4.88-beta.3
=====================================

.. warning::

    A direct upgrade is not supported.



From v2.4.88-beta.1 to v2.4.88-beta.2
=====================================


.. warning::

    A direct upgrade is not supported.



