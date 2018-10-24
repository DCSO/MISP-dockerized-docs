.. MISP-dockerized documentation master file, created by
   sphinx-quickstart on Mon Sep 10 09:24:33 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to MISP-dockerized's |version| documentation!
=====================================================
**MISP dockerized** is a project designed to provide an easy-to-use and easy-to-install 'out of the box' MISP instance that includes everything you need to run MISP with minimal host-side requirements. 

**MISP dockerized** uses MISP (Open Source Threat Intelligence Platform - https://github.com/MISP/MISP), which is maintend and developed by the MISP project team (https://www.misp-project.org/).

.. warning::
    THIS PROJECT IS IN BETA PHASE


.. toctree::
   :maxdepth: 2    
    
   intro/index
   admin/index
   .. design/index
   .. contribute/index
   .. appendix/index
   changelogs/index



MISP-dockerized Main Project Information
----------------------------------------

.. |MISP-dockerized| image:: https://travis-ci.org/DCSO/MISP-dockerized.svg?branch=master
    :target: https://travis-ci.org/DCSO/MISP-dockerized  
    :align: middle


+---------------+-------------------+
| Travis Master | |MISP-dockerized| |
+---------------+-------------------+


Docker Container Information
-----------------------------

.. |MISP-dockerized-proxy| image:: https://travis-ci.org/DCSO/MISP-dockerized-proxy.svg?branch=master
    :target: https://travis-ci.org/DCSO/MISP-dockerized-proxy
    :align: middle

.. |MISP-dockerized-proxy-image| image:: https://images.microbadger.com/badges/image/dcso/misp-dockerized-proxy.svg
    :target: https://microbadger.com/images/dcso/misp-dockerized-proxy
    :align: middle

.. |MISP-dockerized-proxy-version| image:: https://images.microbadger.com/badges/version/dcso/misp-dockerized-proxy.svg
    :target: https://microbadger.com/images/dcso/misp-dockerized-proxy
    :align: middle

.. |MISP-dockerized-proxy-commit| image:: https://images.microbadger.com/badges/commit/dcso/misp-dockerized-proxy.svg
    :target: https://microbadger.com/images/dcso/misp-dockerized-proxy
    :align: middle


.. |MISP-dockerized-server| image:: https://travis-ci.org/DCSO/MISP-dockerized-server.svg?branch=master
    :target: https://travis-ci.org/DCSO/MISP-dockerized-server
    :align: middle

.. |MISP-dockerized-server-image| image:: https://images.microbadger.com/badges/image/dcso/misp-dockerized-server.svg
    :target: https://microbadger.com/images/dcso/misp-dockerized-server
    :align: middle

.. |MISP-dockerized-server-version| image:: https://images.microbadger.com/badges/version/dcso/misp-dockerized-server.svg
    :target: https://microbadger.com/images/dcso/misp-dockerized-server
    :align: middle

.. |MISP-dockerized-server-commit| image:: https://images.microbadger.com/badges/commit/dcso/misp-dockerized-server.svg
    :target: https://microbadger.com/images/dcso/misp-dockerized-server
    :align: middle


.. |MISP-dockerized-robot| image:: https://travis-ci.org/DCSO/MISP-dockerized-robot.svg?branch=master
    :target: https://travis-ci.org/DCSO/MISP-dockerized-robot
    :align: middle

.. |MISP-dockerized-robot-image| image:: https://images.microbadger.com/badges/image/dcso/misp-dockerized-robot.svg
    :target: https://microbadger.com/images/dcso/misp-dockerized-robot
    :align: middle

.. |MISP-dockerized-robot-version| image:: https://images.microbadger.com/badges/version/dcso/misp-dockerized-robot.svg
    :target: https://microbadger.com/images/dcso/misp-dockerized-robot
    :align: middle

.. |MISP-dockerized-robot-commit| image:: https://images.microbadger.com/badges/commit/dcso/misp-dockerized-robot.svg
    :target: https://microbadger.com/images/dcso/misp-dockerized-robot
    :align: middle


.. |MISP-dockerized-postfix| image:: https://travis-ci.org/DCSO/MISP-dockerized-postfix.svg?branch=master
    :target: https://travis-ci.org/DCSO/MISP-dockerized-postfix
    :align: middle

.. |MISP-dockerized-postfix-image| image:: https://images.microbadger.com/badges/image/dcso/misp-dockerized-postfix.svg
    :target: https://microbadger.com/images/dcso/misp-dockerized-postfix
    :align: middle

.. |MISP-dockerized-postfix-version| image:: https://images.microbadger.com/badges/version/dcso/misp-dockerized-postfix.svg
    :target: https://microbadger.com/images/dcso/misp-dockerized-postfix
    :align: middle

.. |MISP-dockerized-postfix-commit| image:: https://images.microbadger.com/badges/commit/dcso/misp-dockerized-postfix.svg
    :target: https://microbadger.com/images/dcso/misp-dockerized-postfix
    :align: middle


.. |MISP-dockerized-modules| image:: https://travis-ci.org/DCSO/MISP-dockerized-misp-modules.svg?branch=master
    :target: https://travis-ci.org/DCSO/MISP-dockerized-misp-modules
    :align: middle

.. |MISP-dockerized-modules-image| image:: https://images.microbadger.com/badges/image/dcso/misp-dockerized-misp-modules.svg
    :target: https://microbadger.com/images/dcso/misp-dockerized-misp-modules
    :scale: 100%
    :align: middle

.. |MISP-dockerized-modules-version| image:: https://images.microbadger.com/badges/version/dcso/misp-dockerized-misp-modules.svg
    :target: https://microbadger.com/images/dcso/misp-dockerized-misp-modules
    :align: middle

.. |MISP-dockerized-modules-commit| image:: https://images.microbadger.com/badges/commit/dcso/misp-dockerized-misp-modules.svg
    :target: https://microbadger.com/images/dcso/misp-dockerized-misp-modules
    :align: middle


.. list-table:: Docker Container Travis Information
   :header-rows: 1
   :align: left

   * - Name
     - Travis
   * - MISP-dockerized-server
     - |MISP-dockerized-server|
   * - MISP-dockerized-proxy
     - |MISP-dockerized-proxy|
   * - MISP-dockerized-postfix     
     - |MISP-dockerized-postfix|
   * - MISP-dockerized-modules     
     - |MISP-dockerized-modules|
   * - MISP-dockerized-robot
     - |MISP-dockerized-robot|

.. list-table:: Docker Container Latest Image Information
   :header-rows: 1
   :align: left

   * - Name
     - Latest Image
   * - MISP-dockerized-server
     - |MISP-dockerized-server-image|
   * - MISP-dockerized-proxy
     - |MISP-dockerized-proxy-image|
   * - MISP-dockerized-postfix     
     - |MISP-dockerized-postfix-image|
   * - MISP-dockerized-modules     
     - |MISP-dockerized-modules-image|
   * - MISP-dockerized-robot
     - |MISP-dockerized-robot-image|

.. list-table:: Docker Container Latest Version Information
   :header-rows: 1
   :align: left

   * - Name
     - Latest Version
   * - MISP-dockerized-server
     - |MISP-dockerized-server-version|
   * - MISP-dockerized-proxy
     - |MISP-dockerized-proxy-version|
   * - MISP-dockerized-postfix     
     - |MISP-dockerized-postfix-version|
   * - MISP-dockerized-modules     
     - |MISP-dockerized-modules-version|
   * - MISP-dockerized-robot
     - |MISP-dockerized-robot-version|

.. list-table:: Docker Container Latest Commit Information
   :header-rows: 1
   :align: left

   * - Name
     - Latest Commit
   * - MISP-dockerized-server
     - |MISP-dockerized-server-commit|
   * - MISP-dockerized-proxy
     - |MISP-dockerized-proxy-commit|
   * - MISP-dockerized-postfix     
     - |MISP-dockerized-postfix-commit|
   * - MISP-dockerized-modules     
     - |MISP-dockerized-modules-commit|
   * - MISP-dockerized-robot
     - |MISP-dockerized-robot-commit|


.. Indices and tables
==================

.. * :ref:`genindex`
.. * :ref:`modindex`
.. * :ref:`search`


