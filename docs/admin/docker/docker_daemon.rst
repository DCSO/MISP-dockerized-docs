Docker Daemon Advanced Improvement
==================================

Example of `/etc/docker/daemon.json`
------------------------------------
Great settings for docker daemon:

.. code-block:: json
    :linenos:

    {
        "user"
        "max-concurrent-downloads": 50,
        "max-concurrent-uploads": 50,
        "bip": "192.168.20.1/24",
        "log-driver": "json-file",
        "log-opts": {
            "max-size":"10m",
            "max-file":"5"
            }
    }

Explanation:
- set concurrent downloads to 50 downloads at the same time
- set concurrent uploads to 50 uploads at the same time
- set default docker bridge ip gateway to 192.168.20.1/24
- set default log driver to write json into files
- set default log options to:
  
  * a json file has a maximum size of 10MB
  * store only a maximum of 5 json files

Secure the docker container
---------------------------
1. Add a docker user as root or any other admin user:
    useradd -s /usr/sbin/nologin -M -d /dev/null -c "Dockeruser container" docker_container_user
    echo "docker_container_user:231072:65536" >> /etc/subgid
    echo "docker_container_user:231072:65536" >> /etc/subuid
2. change /etc/docker/docker.json
    see above
3. restart docker deamon:
    service dockerd restart


Sources
-------
* https://docs.docker.com/engine/reference/commandline/network_create/#bridge-driver-options
* https://docs.docker.com/network/bridge/#manage-a-user-defined-bridge
* https://docs.docker.com/v17.09/engine/userguide/networking/default_network/custom-docker0/