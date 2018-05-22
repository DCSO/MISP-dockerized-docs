Tips for Docker Deamon
====

Great settings for docker daemon:
``` json
{
    "max-concurrent-downloads": 50,
    "max-concurrent-uploads": 50,
    "bip": "192.168.20.1/24",
    "log-driver": "json-file",
    "log-opts": {
        "max-size":"10m",
        "max-file":"5"
        }
   }
```



# Source
* https://docs.docker.com/engine/reference/commandline/network_create/#bridge-driver-options
* https://docs.docker.com/network/bridge/#manage-a-user-defined-bridge
* https://docs.docker.com/v17.09/engine/userguide/networking/default_network/custom-docker0/