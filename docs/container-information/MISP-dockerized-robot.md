# [MISP-dockerized-robot](https://github.com/DCSO/MISP-dockerized-robot)

## Supported Tags and Respective `Dockerfile` Links

- [`2`, `2.0`, `1.0.4-debian`, `latest`][5]
- [`1`, `1.3`, `1.0.3-ubuntu`][4]
- [`1.2`, `1.0.2-ubuntu`][3]
- [`1.1`, `1.0.1-ubuntu`][2]
- [`1.0`, `1.0.0-ubuntu`][1]

[1]: https://github.com/DCSO/MISP-dockerized-robot/blob/master/1.0-ubuntu/Dockerfile
[2]: https://github.com/DCSO/MISP-dockerized-robot/blob/master/1.1-ubuntu/Dockerfile
[3]: https://github.com/DCSO/MISP-dockerized-robot/blob/master/1.2-ubuntu/Dockerfile
[4]: https://github.com/DCSO/MISP-dockerized-robot/blob/master/1.3-ubuntu/Dockerfile
[5]: https://github.com/DCSO/MISP-dockerized-robot/blob/master/2.0-debian/Dockerfile

## Quick reference

-	**Where to file issues**:  
	[https://github.com/DCSO/MISP-dockerized-robot/issues](https://github.com/DCSO/MISP-dockerized-robot/issues)

-	**Maintained by**:  
	[DCSO](https://github.com/DCSO)

-	**Supported Docker versions**:  
	[The latest release](https://github.com/docker/docker-ce/releases/latest)


### Project Information


|                                  |                                                                                                                                                              |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Travis Master                    | [![](https://travis-ci.org/DCSO/MISP-dockerized-robot.svg?branch=master)](https://travis-ci.org/DCSO/MISP-dockerized-robot)                    |
| Docker Size & Layers             | [![](https://images.microbadger.com/badges/image/dcso/misp-dockerized-robot.svg)](https://microbadger.com/images/dcso/misp-dockerized-robot)   |
| Latest Docker Version            | [![](https://images.microbadger.com/badges/version/dcso/misp-dockerized-robot.svg)](https://microbadger.com/images/dcso/misp-dockerized-robot) |
| Commit for Latest Docker Version | [![](https://images.microbadger.com/badges/commit/dcso/misp-dockerized-robot.svg)](https://microbadger.com/images/dcso/misp-dockerized-robot)  |



## How to Use This Image

### Available Environment Variables

| Environment Variables                       | Example                          | Type                    |
| ------------------------------------------- | -------------------------------- | ----------------------- |
| HTTP_PROXY: ${HTTP_PROXY}                   | http://proxy.example.com:3128    | OPTIONAL                |
| HTTPS_PROXY: ${HTTPS_PROXY}                 | http://proxy.example.com:3128    | OPTIONAL                |
| NO_PROXY: ${NO_PROXY}                       | internal.example.com example.com | OPTIONAL                |


### Using With `docker-compose`
``` bash
services:
  ### MISP-Robot ###
  misp-robot:
    image: dcso/misp-dockerized-robot:${MISP_ROBOT_TAG}
    container_name: misp-robot
    environment:
      NO_PROXY: ${NO_PROXY} 
    volumes:
    - <GIT REPO PATH>/MISP-dockerized:/srv/MISP-dockerized:rw
    - misp-vol-db-data:/srv/misp-db:rw
    - misp-vol-pgp:/srv/misp-pgp:rw
    - misp-vol-proxy-conf:/srv/misp-proxy/conf.d:rw
    - misp-vol-redis-data:/srv/misp-redis:rw
    - misp-vol-server-MISP-cakeresque-config:/srv/misp-server/MISP/CakeResque/Config:rw
    - misp-vol-server-MISP-app-Config:/srv/misp-server/MISP/Config:rw
    - misp-vol-server-MISP-attachments:/srv/misp-server/MISP/app/files:rw
    - misp-vol-server-MISP-tmp:/srv/misp-server/MISP/app/tmp:rw
    - misp-vol-server-apache2-config-sites-enabled:/srv/misp-server/apache2/sites-enabled:rw
    - misp-vol-smime:/srv/misp-smime:rw
    - misp-vol-ssl:/srv/misp-ssl:rw
    - /var/run/docker.sock:/var/run/docker.sock:ro
    networks:
      misp-backend:
        aliases:
        - misp-robot

```


### Using With `docker run`
``` bash
docker run \
    --name misp-robot \
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
    image: dcso/misp-dockerized-robot \
```


## Documentation
You can also find the [Dockerfile](https://github.com/DCSO/MISP-dockerized-robot/) at Github.com.


## License

View [license information](https://github.com/DCSO/MISP-dockerized-robot/blob/master/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contain other software that may be under other licenses (such as Bash, etc., from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
