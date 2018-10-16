Docker Network Help
===================

Stopping Automatic Network Interface Renaming on Docker Host
------------------------------------------------------------
Normally every new docker interface bridge have the same name scheme: `br-<first chars from netowrk ID>`

But this means that every network creation and network deletion a new device is created and deleted.
This can be an issue if you monitor your docker host and his network devices.
Therefore with the option: `-o "com.docker.network.bridge.name"="MISP_backend0"` you can name your interface as you want.

Example for a Docker Network Configuration
------------------------------------------
With the following example you can see a created network with the following options:

* subnet is changed to 172.28.0.0/16
* ip-range is beetween 172.28.5.0-172.28.5.255
* gateway IP is 172.28.5.254
* name the interface **always** `MISP_backend0`

Example:

.. code-block:: bash
  :linenos:

  docker network create \
    --driver=bridge \
    --subnet=172.28.0.0/16 \
    --ip-range=172.28.5.0/24 \
    --gateway=172.28.5.254 \
    -o "com.docker.network.bridge.name"="MISP_backend0" \
    br0



Sources
-------
* https://docs.docker.com/engine/reference/commandline/network_create/#bridge-driver-options
* https://docs.docker.com/network/bridge/#manage-a-user-defined-bridge
* https://docs.docker.com/v17.09/engine/userguide/networking/default_network/custom-docker0/