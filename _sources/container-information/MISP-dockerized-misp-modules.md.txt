# [MISP-dockerized-misp-modules](https://github.com/DCSO/MISP-dockerized-misp-modules)

## Supported Tags and Respective `Dockerfile` Links

- [`1`, `1.1`, `1.0.1-debian`, `latest`][2]
- [`1.0`, `1.0.0-debian`][1]

[1]: https://github.com/DCSO/MISP-dockerized-misp-modules/blob/master/1.0-debian/Dockerfile
[2]: https://github.com/DCSO/MISP-dockerized-misp-modules/blob/master/1.1-debian/Dockerfile

## Quick Reference

-	**Where to file issues**:  
	[https://github.com/DCSO/MISP-dockerized-misp-modules/issues](https://github.com/DCSO/MISP-dockerized-misp-modules/issues)

-	**Maintained by**:  
	[DCSO](https://github.com/DCSO)

-	**Supported Docker versions**:  
	[The latest release](https://github.com/docker/docker-ce/releases/latest)

### Project Information

|                                  |                                                                                                                                                              |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Travis Master                    | [![](https://travis-ci.org/DCSO/MISP-dockerized-misp-modules.svg?branch=master)](https://travis-ci.org/DCSO/MISP-dockerized-misp-modules)                    |
| Docker Size & Layers             | [![](https://images.microbadger.com/badges/image/dcso/misp-dockerized-misp-modules.svg)](https://microbadger.com/images/dcso/misp-dockerized-misp-modules)   |
| Latest Docker Version            | [![](https://images.microbadger.com/badges/version/dcso/misp-dockerized-misp-modules.svg)](https://microbadger.com/images/dcso/misp-dockerized-misp-modules) |
| Commit for Latest Docker Version | [![](https://images.microbadger.com/badges/commit/dcso/misp-dockerized-misp-modules.svg)](https://microbadger.com/images/dcso/misp-dockerized-misp-modules)  |


## How to Use This Image

### Available Environment Variables

| Environment Variables       | Example                          | Type     |
| --------------------------- | -------------------------------- | -------- |
| HTTP_PROXY: ${HTTP_PROXY}   | http://proxy.example.com:3128    | OPTIONAL |
| HTTPS_PROXY: ${HTTPS_PROXY} | http://proxy.example.com:3128    | OPTIONAL |
| NO_PROXY: ${NO_PROXY}       | internal.example.com example.com | OPTIONAL |
| REDIS_FQDN: ${REDIS_FQDN}   | misp-redis                       | OPTIONAL |

### Using With `docker-compose`
``` bash
services:
  ### MISP-misp-modules ###
  misp-modules:
    image: dcso/misp-dockerized-misp-modules:${MISP_misp-modules_TAG}
    container_name: misp-modules
    environment: 
      REDIS_FQDN: ${REDIS_FQDN}
      HTTP_PROXY: ${HTTP_PROXY}
      HTTPS_PROXY: ${HTTPS_PROXY}
      NO_PROXY: ${NO_PROXY}
    networks:
      misp-backend:
        aliases:
        - misp-modules
```


### Using With `docker run`
``` bash
docker run \
    --name misp-misp-modules \
    -e NO_PROXY: ${NO_PROXY}  \
    image: dcso/misp-dockerized-misp-modules \
```


## Documentation
You can also find the [Dockerfile](https://github.com/DCSO/MISP-dockerized-misp-modules/) at Github.com.


## License

View [license information](https://github.com/DCSO/MISP-dockerized-proxy/blob/master/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contain other software that may be under other licenses (such as Bash, etc., from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
