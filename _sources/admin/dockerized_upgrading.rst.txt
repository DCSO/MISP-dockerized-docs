Upgrading MISP-dockerized
#########################

Switch a live MISP-dockerized Instance to a new version of MISP-dockerized.

Advice
======

* **Back up your database**
* Mind any version-specific comments below
* Try out the new version on a test server before doing an upgrade
* `Report any problems or issues to GitHub <issues_>`_

.. _issues: https://github.com/DCSO/MISP-dockerized/issues

Basic instructions
==================

#. Back up your database, data directory with **make backup-all**
#. Download the new version of MISP-dockerized with **git pull**
#. Update the instance: 
    * before 1.0.0: **make install**
    * after  1.0.0: **make update**

.. note::

   If there are any modifications in the container itself please remind they are lost after an upgrade.
   If this is the case, take care to maintain your modifications or to build your own docker container on base of MISP-dockerized. 
   Support is only available for official MISP-dockerized container.


From v0.3.4-beta to v1.0.0
==========================



From v0.3.3-beta to v0.3.4-beta
===============================

.. warning::

   In the docker-compose is a mismatch for the misp-vol-server-MISP-tmp and the misp-vol-server-MISP-attachments volume.
   Please copy first the Data into the Volume and then make an upgrade!


From v0.3.2-beta to v0.3.3-beta
===============================



.. warning::

   In the docker-compose is a mismatch for the misp-vol-server-MISP-tmp and the misp-vol-server-MISP-attachments volume.
   Please copy first the Data into the Volume and then make an upgrade!

From v0.3.1-beta to v0.3.2-beta
===============================

.. warning::

   In the docker-compose is a mismatch for the misp-vol-server-MISP-tmp and the misp-vol-server-MISP-attachments volume.
   Please copy first the Data into the Volume and then make an upgrade!

From v0.3.0-beta to v0.3.1-beta
===============================

.. warning::

   In the docker-compose is a mismatch for the misp-vol-server-MISP-tmp and the misp-vol-server-MISP-attachments volume.
   Please copy first the Data into the Volume and then make an upgrade!

From v0.2.0-beta to v0.3.0-beta
===============================

From v2.4.88-beta.3 to v0.2.0-beta
=====================================

From v2.4.88-beta.2 to v2.4.88-beta.3
=====================================

From v2.4.88-beta.1 to v2.4.88-beta.2
=====================================




