# MISP-dockerized-proxy

## Supported tags and respective `Dockerfile` links

- [`1`, `1.2`, `1.0.2-alpine`, `latest`][3]
- [`1.1`,`1.0.1-alpine`][2]
- [`1.1`,`1.0.0-alpine`][1]

[1]: https://github.com/DCSO/MISP-dockerized-proxy/blob/master/1.0-alpine/Dockerfile
[2]: https://github.com/DCSO/MISP-dockerized-proxy/blob/master/1.1-alpine/Dockerfile
[3]: https://github.com/DCSO/MISP-dockerized-proxy/blob/master/1.2-alpine/Dockerfile

## Quick reference

-	**Where to file issues**:  
	[https://github.com/DCSO/MISP-dockerized-proxy/issues](https://github.com/DCSO/MISP-dockerized-proxy/issues)

-	**Maintained by**:  
	[DCSO](https://github.com/DCSO)

-	**Supported Docker versions**:  
	[the latest release](https://github.com/docker/docker-ce/releases/latest)

## What is MISP dockerized?

**MISP dockerized** is a project designed to provide an easy-to-use and easy-to-install'out of the box' MISP instance that includes everything you need to run MISP with minimal host-side requirements. 

**MISP dockerized** uses MISP (Open Source Threat Intelligence Platform - https://github.com/MISP/MISP), which is maintend and developed by the MISP project team (https://www.misp-project.org/)

### Project Information

| | |
|-|-|
| Travis Master | [![][101]][102] |
| Docker Size & Layers | [![][104]][107]|
| Latest Docker Version | [![][105]][107]|
| Commit for Latest Docker Version | [![][106]][107]|

[101]: https://travis-ci.org/DCSO/MISP-dockerized-proxy.svg?branch=master
[102]: https://travis-ci.org/DCSO/MISP-dockerized-proxy
[104]: https://images.microbadger.com/badges/image/dcso/misp-dockerized-proxy.svg
[105]: https://images.microbadger.com/badges/version/dcso/misp-dockerized-proxy.svg
[106]: https://images.microbadger.com/badges/commit/dcso/misp-dockerized-proxy.svg
[107]: https://microbadger.com/images/dcso/misp-dockerized-proxy


## How to use this image

### Available Environment Variables

| Environment Variables                 | Example                            | Type     |
| ------------------------------------- | ---------------------------------- | -------- |
| HOSTNAME: ${myHOSTNAME}               | misp.example.com                   | REQUIRED |
| HTTP_SERVERADMIN: ${HTTP_SERVERADMIN} | support@example.com                | REQUIRED |
| HTTP_PROXY: ${HTTP_PROXY}             | http://proxy.example.com:3128      | OPTIONAL |
| HTTPS_PROXY: ${HTTPS_PROXY}           | http://proxy.example.com:3128      | OPTIONAL |
| NO_PROXY: ${NO_PROXY}                 | internal.example.com example.com   | OPTIONAL |
| IP: ${HTTP_ALLOWED_IP}                | 192.157.12.2 8.8.8.8 172.16.0.0/16 | OPTIONAL |

### Using with docker-compose
``` bash
services:
  ### MISP-proxy ###
  misp-proxy:
    image: dcso/misp-dockerized-proxy:${MISP_proxy_TAG}
    container_name: misp-proxy
    environment:
      HOSTNAME: ${myHOSTNAME}
      HTTP_SERVERADMIN: ${HTTP_SERVERADMIN}
      HTTP_PROXY: ${HTTP_PROXY}
      HTTPS_PROXY: ${HTTPS_PROXY}
      NO_PROXY: ${NO_PROXY}
      IP: ${HTTP_ALLOWED_IP}
    volumes:
    - misp-vol-proxy-conf:/etc/nginx/conf.d:rw
    - misp-vol-ssl:/etc/nginx/ssl:rw
    networks:
      misp-backend:
        aliases:
        - misp-proxy

```


### Usign with `docker run`
``` bash
docker run \
    --name misp-proxy \
    -e NO_PROXY: ${NO_PROXY}  \
    -v misp-vol-db-data:/srv/misp-db:rw \
    -v misp-vol-pgp:/srv/misp-pgp:rw\
    -v misp-vol-proxy-conf:/srv/misp-proxy/conf.d:rw\
    -v misp-vol-redis-data:/srv/misp-redis:rw\
    -v misp-vol-server-MISP-cakeresque-config:/srv/misp-server/MISP/CakeResque/Config:rw\
    -v misp-vol-server-MISP-app-Config:/srv/misp-server/MISP/Config:rw\
    -v misp-vol-server-MISP-attachments:/srv/misp-server/MISP/app/files:rw\
    -v misp-vol-server-MISP-tmp:/srv/misp-server/MISP/app/tmp:rw\
    -v misp-vol-server-apache2-config-sites-enabled:/srv/misp-server/apache2/sites-enabled:rw\
    -v misp-vol-smime:/srv/misp-smime:rw\
    -v misp-vol-ssl:/srv/misp-ssl:rw\
    -v /var/run/docker.sock:/var/run/docker.sock:ro\
    image: dcso/misp-dockerized-proxy \
```

### Documentation
You can also find the [docker file](https://github.com/DCSO/MISP-dockerized-proxy/) at Github.


## License

View [license information](https://github.com/DCSO/MISP-dockerized-proxy/blob/master/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.