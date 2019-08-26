How to find your current MISP-dockerized version?
==================================================

To find out your current installed MISP-dockerized version you have more than one option.

Options:

1. 
Check if you have a specific Git release activated: :code:`git status|head -n 1` 

2. 
Check if there exists symbol link for the folder current: :code:`ls -la <MISP-dockerized path>`
My result is:

.. code-block:: bash

    lrwxrwxrwx  1 user user     5 Jun 11 10:09 current -> 1.2.0

In this case the version is 1.2.0.

3. 
Check your MISP-dockerized misp-server container: :code:`docker ps -a | grep misp-server`
My result is:

.. code-block:: bash

    bb71f04967b7        dcso/misp-dockerized-server:2.4.nightly-debian-dev   "/entrypoint.sh"         9 minutes ago       Up 8 minutes (healthy)   80/tcp, 443/tcp                            misp-server

Then go to https://dcso.github.io/MISP-dockerized-docs/ and see the MISP-dockerized release to MISP-server mapping.