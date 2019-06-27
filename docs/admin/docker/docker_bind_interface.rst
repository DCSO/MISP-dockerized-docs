Activate Interface Binding for MISP Network Bridge Device
##########################################################
If you have more than one interface your bridge interface can be mapped to the false device interface.
To prevent this you can add an option at the network part. 
The option is called: :code:`com.docker.network.bridge.host_binding_ipv4: "x.x.x.x`. 
More information about this you can find at https://docs.docker.com/v17.09/engine/userguide/networking/default_network/binding/.

For MISP-dockerized we add an option to our build-config script. 
Therefore if you make :code:`make install` or :code:`make build-config` you were asked if you want to add an ip or not.
Default Docker select the first interface.

After you had configured your IP, you need to activate this setting in the :code:`docker-compose.override.yml` file. 
Which is at the version (or current) directory in the MISP-dockerized path.
Please remove the comment at the line: :code:`com.docker.network.bridge.host_binding_ipv4: "x.x.x.x"`.

Old docker-compose.override.yml:
.. code-block:: bash

    networks: 
    misp-backend:
        driver_opts:
        com.docker.network.bridge.name: "mispbr0"
        # com.docker.network.bridge.host_binding_ipv4: "0.0.0.0"
        ipam:
        config:
        - subnet: "192.168.47.0/28"


New docker-compose.override.yml:
.. code-block:: bash

    networks: 
    misp-backend:
        driver_opts:
        com.docker.network.bridge.name: "mispbr0"
        com.docker.network.bridge.host_binding_ipv4: "0.0.0.0"
        ...

For more Information please write us or add your own contribution.

