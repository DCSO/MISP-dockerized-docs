# [MISP-dockerized-redis](https://github.com/DCSO/MISP-dockerized-redis)

## Supported Tags and Respective `Dockerfile` Links

- [`5-alpine3.9-dev`][5]

[1]: https://hub.docker.com/_/redis

## Quick reference

-	**Where to file issues**:  
	[https://github.com/DCSO/MISP-dockerized-redis/issues](https://github.com/DCSO/MISP-dockerized-redis/issues)

-	**Maintained by**:  
	[DCSO](https://github.com/DCSO)

-	**Supported Docker versions**:  
	[The latest release](https://github.com/docker/docker-ce/releases/latest)


### Project Information


|                                  |                                                                                                                                                              |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Travis Master                    | [![](https://travis-ci.org/DCSO/MISP-dockerized-redis.svg?branch=master)](https://travis-ci.org/DCSO/MISP-dockerized-redis)                    |
| Docker Size & Layers             | [![](https://images.microbadger.com/badges/image/dcso/misp-dockerized-redis.svg)](https://microbadger.com/images/dcso/misp-dockerized-redis)   |
| Latest Docker Version            | [![](https://images.microbadger.com/badges/version/dcso/misp-dockerized-redis.svg)](https://microbadger.com/images/dcso/misp-dockerized-redis) |
| Commit for Latest Docker Version | [![](https://images.microbadger.com/badges/commit/dcso/misp-dockerized-redis.svg)](https://microbadger.com/images/dcso/misp-dockerized-redis)  |



## How to Use This Image

### Using With `docker-compose`
``` bash
services:
  ### MISP-Robot ###
  misp-redis:
    image: dcso/misp-dockerized-redis:${MISP_REDIS_TAG}
    container_name: misp-redis
    networks:
      misp-backend:
        aliases:
        - misp-redis
```


### Using With `docker run`
``` bash
docker run \
    --name misp-redis \
    image: dcso/misp-dockerized-redis \
```


## Documentation
You can also find the [Dockerfile](https://github.com/DCSO/MISP-dockerized-redis/) at Github.com.


## License

View [license information](https://github.com/DCSO/MISP-dockerized-redis/blob/master/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contain other software that may be under other licenses (such as Bash, etc., from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
