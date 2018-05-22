Docker Network Help
====

``` bash
docker network create \
  --driver=bridge \
  --subnet=172.28.0.0/16 \
  --ip-range=172.28.5.0/24 \
  --gateway=172.28.5.254 \
  -o "com.docker.network.bridge.name"="MISP_backend0" \
  br0
```

# rename network interface on docker host
Normally every new docker interface bridge have the same name scheme: "br-<first chars from netowrk ID>"

But this means that every network creation and network deletion a new device is created and deleted.
This can be an issue if you monitor your docker host and his network devices.
Therefore with the option: `-o "com.docker.network.bridge.name"="MISP_backend0"` you can name your interface as you want.


# Source
* https://docs.docker.com/engine/reference/commandline/network_create/#bridge-driver-options
* https://docs.docker.com/network/bridge/#manage-a-user-defined-bridge
* https://docs.docker.com/v17.09/engine/userguide/networking/default_network/custom-docker0/