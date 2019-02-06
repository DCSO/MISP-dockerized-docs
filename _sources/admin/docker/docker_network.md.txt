# Docker Container Network Tips

## Stopping Automatic Network Interface Renaming on Docker Host

Normally every new Docker interface bridge has the same name scheme: `br-<first chars from network ID>`

But this means with every network creation and network deletion a new network device is created and deleted.
This can be an issue if you monitor your Docker host and its network devices.
Therefore with the following option, you can name your interface as you want: 
* `-o "com.docker.network.bridge.name"="MISP_backend0"`


## Example of a Docker Network Configuration

In the following example, you can see a created network with the following options:

* Subnet is changed to 172.28.0.0/16
* IP-range is between 172.28.5.0 and 172.28.5.255
* Gateway IP is 172.28.5.254
* Name of the interface **always** `MISP_backend0`

Example:
``` bash
  docker network create \
    --driver=bridge \
    --subnet=172.28.0.0/16 \
    --ip-range=172.28.5.0/24 \
    --gateway=172.28.5.254 \
    -o "com.docker.network.bridge.name"="MISP_backend0" \
    br0
```


## Sources

* https://docs.docker.com/engine/reference/commandline/network_create/#bridge-driver-options
* https://docs.docker.com/network/bridge/#manage-a-user-defined-bridge
* https://docs.docker.com/v17.09/engine/userguide/networking/default_network/custom-docker0/