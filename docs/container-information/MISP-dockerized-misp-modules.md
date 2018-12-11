# MISP-dockerized-misp-modules

## Supported tags and respective `Dockerfile` links

- [`1`, `1.1`, `1.0.1-debian`, `latest`][2]
- [1.0`, `1.0.0-debian`][1]

[1]: https://github.com/DCSO/MISP-dockerized-misp-modules/blob/master/1.0-debian/Dockerfile
[2]: https://github.com/DCSO/MISP-dockerized-misp-modules/blob/master/1.1-debian/Dockerfile

## Quick reference

-	**Where to file issues**:  
	[https://github.com/DCSO/MISP-dockerized-misp-modules/issues](https://github.com/DCSO/MISP-dockerized-misp-modules/issues)

-	**Maintained by**:  
	[DCSO](https://github.com/DCSO)

-	**Supported Docker versions**:  
	[the latest release](https://github.com/docker/docker-ce/releases/latest)

## What is MISP dockerized?

**MISP dockerized** is a project designed to provide an easy-to-use and easy-to-install'out of the box' MISP instance that includes everything you need to run MISP with minimal host-side requirements. 

**MISP dockerized** uses MISP (Open Source Threat Intelligence Platform - https://github.com/MISP/MISP), which is maintend and developed by the MISP project team (https://www.misp-project.org/)

### Project Information

|                                  |                 |
|-                                 |-                |
| Travis Master                    | [![][101]][102] |
| Docker Size & Layers             | [![][104]][107] |
| Latest Docker Version            | [![][105]][107] |
| Commit for Latest Docker Version | [![][106]][107] |

[101]: https://travis-ci.org/DCSO/MISP-dockerized-misp-modules.svg?branch=master
[102]: https://travis-ci.org/DCSO/MISP-dockerized-misp-modules
[104]: https://images.microbadger.com/badges/image/dcso/misp-dockerized-misp-modules.svg
[105]: https://images.microbadger.com/badges/version/dcso/misp-dockerized-misp-modules.svg
[106]: https://images.microbadger.com/badges/commit/dcso/misp-dockerized-misp-modules.svg
[107]: https://microbadger.com/images/dcso/misp-dockerized-misp-modules




## How to use this image

### Available Environment Variables

| Environment Variables       | Example                          | Type     |
| --------------------------- | -------------------------------- | -------- |
| HTTP_PROXY: ${HTTP_PROXY}   | http://proxy.example.com:3128    | OPTIONAL |
| HTTPS_PROXY: ${HTTPS_PROXY} | http://proxy.example.com:3128    | OPTIONAL |
| NO_PROXY: ${NO_PROXY}       | internal.example.com example.com | OPTIONAL |
| REDIS_FQDN: ${REDIS_FQDN}   | misp-redis                       | OPTIONAL |

### Using with docker-compose
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


### Usign with `docker run`
``` bash
docker run \
    --name misp-misp-modules \
    -e NO_PROXY: ${NO_PROXY}  \
    image: dcso/misp-dockerized-misp-modules \
```


## Documentation
You can also find the [docker file](https://github.com/DCSO/MISP-dockerized-misp-modules/) at Github.


## License

View [license information](https://github.com/DCSO/MISP-dockerized-proxy/blob/master/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.