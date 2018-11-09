# MISP-dockerized-server

## Available MISP-Versions (Supported tags and respective `Dockerfile` links)

| Version                         | Status   | Status                        | Notes                                                                                                                                                     |
| ------------------------------- | -------- | ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [`2.4.nightly-ubuntu`][10]      | Oct'2018 | unsupported                   |
|                                 |
| [`2.4.88-ubuntu`][1]            | Apr'2018 | supported                 until June 2019     |                                                                                                                                                           |
| [`2.4.89-ubuntu`][2]            | Apr'2018 | supported                     |                                                                                                                                                           |
| [`2.4.90-ubuntu`][3]            | Apr'2018 | supported                     |                                                                                                                                                           |
| [`2.4.91-ubuntu`][4]            | Jun'2018 | supported                     |                                                                                                                                                           |
| [`2.4.92-ubuntu`][5]            | Jun'2018 | supported                     |                                                                                                                                                           |
| [`2.4.93-ubuntu`][6]            | Sep'2018 | supported                     |                                                                                                                                                           |
| [`2.4.94-ubuntu`][7]            | Sep'2018 | supported                     |                                                                                                                                                           |
| [`2.4.95-ubuntu`][8]            | Sep'2018 | available but not recommended | MISP Pull mechanism is currently not working. The ticket to that issue can be found here: https://github.com/MISP/MISP/issues/3613#issuecomment-419459107 |
| [`2.4.96-ubuntu`][9]            | Oct'2018 | supported                     |
| [`2.4.97-ubuntu`, `latest`][11] | Oct'2018 | supported                     |

[1]: https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.88-ubuntu/Dockerfile
[2]: https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.89-ubuntu/Dockerfile
[3]: https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.90-ubuntu/Dockerfile
[4]: https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.91-ubuntu/Dockerfile
[5]: https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.92-ubuntu/Dockerfile
[6]: https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.93-ubuntu/Dockerfile
[7]: https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.94-ubuntu/Dockerfile
[8]: https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.95-ubuntu/Dockerfile
[9]: https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.96-ubuntu/Dockerfile
[10]: https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.nightly-ubuntu/Dockerfile
[11]: https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.97-ubuntu/Dockerfile


## Image Information

|                                   |                 |
|-                                  |-                |
| Travis Master                     | [![][101]][102] |
| Docker Size & Layers              | [![][104]][107] |
| Latest Docker Version             | [![][105]][107] |
| Commit for Latest Docker Version  | [![][106]][107] |

[101]: https://travis-ci.org/DCSO/MISP-dockerized-server.svg?branch=master
[102]: https://travis-ci.org/DCSO/MISP-dockerized-server
[103]: https://images.microbadger.com/badges/license/dcso/misp-dockerized-server.svg
[104]: https://images.microbadger.com/badges/image/dcso/misp-dockerized-server.svg
[105]: https://images.microbadger.com/badges/version/dcso/misp-dockerized-server.svg
[106]: https://images.microbadger.com/badges/commit/dcso/misp-dockerized-server.svg
[107]: https://microbadger.com/images/dcso/misp-dockerized-server

## Integrated MISP Modules 

- since 2.4.92:
    - pyzmq
    - pymisp
    - ssdeep
    - pydeep
    - python-magic
    - lief
    - maec


## Quick reference

-	**Where to file issues**:  
	[https://github.com/DCSO/MISP-dockerized-server/issues](https://github.com/DCSO/MISP-dockerized-server/issues)

-	**Maintained by**:  
	[DCSO](https://github.com/DCSO)

-	**Supported Docker versions**:  
	[the latest release](https://github.com/docker/docker-ce/releases/latest)


## How to use this image

### Using with docker-compose
``` bash
services:
  ### MISP-Server ###
  misp-server:
    image: dcso/misp-dockerized-server:${MISP_CONTAINER_TAG}
    container_name: misp-server
    depends_on:
      - "misp-postfix"
    restart: on-failure  
    tty: true
    stdin_open: true
    # ports:
    #   - "8080:80" # DEBUG only
    #   - "8443:443" # DEBUG only
    environment:
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
      CMD_MYSQL: mysqld
      CMD_APACHE:
      CMD_REDIS: redis-server --appendonly yes
    volumes:
    # DB
    - misp-vol-db-data:/var/lib/mysql/
    # Logfile
    - misp-vol-server-logs:/var/log/apache2/
    # Apache2 Configuration
    - misp-vol-server-apache2-config-sites-enabled:/etc/apache2/sites-enabled:ro
    - misp-vol-ssl:/etc/apache2/ssl:ro
    # MISP Configurations:
    - misp-vol-server-MISP-app-Config:/var/www/MISP/app/Config
    - misp-vol-server-MISP-cakeresque-config:/var/www/MISP/app/Plugin/CakeResque/Config
    - misp-vol-server-MISP-tmp:/var/www/MISP/tmp
    - misp-vol-server-MISP-attachments:/var/www/MISP/attachments
    networks:
      misp-backend:
        aliases:
        - misp-server

```

#### .env file for docker-compose variable
If you want to use the postfix container with variables you require a .env file with the following content:
``` bash
#=================================================
# ------------------------------
# Container Configuration
# ------------------------------
MISP_CONTAINER_TAG=x.x.x-ubuntu
# ------------------------------
# DB configuration
# ------------------------------
MYSQL_DATABASE=misp
MYSQL_USER=misp
MYSQL_PASSWORD=<PW>
MYSQL_ROOT_PASSWORD=<PW>
##################################################################
```

### Usign with `docker run`
``` bash
docker run \
    --name misp-server \
    -e MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD} \
    -e MYSQL_DATABASE: ${MYSQL_DATABASE} \
    -e MYSQL_USER: ${MYSQL_USER} \
    -e MYSQL_PASSWORD: ${MYSQL_PASSWORD} \
    -e CMD_MYSQL: mysqld \
    -e CMD_APACHE: \
    -e CMD_REDIS: redis-server --appendonly yes \
    -v misp-vol-db-data:/var/lib/mysql/ \
    -v misp-vol-server-logs:/var/log/apache2/ \
    -v misp-vol-server-apache2-config-sites-enabled:/etc/apache2/sites-enabled:ro \
    -v misp-vol-ssl:/etc/apache2/ssl:ro \
    -v misp-vol-server-MISP-app-Config:/var/www/MISP/app/Config \
    -v misp-vol-server-MISP-cakeresque-config:/var/www/MISP/app/Plugin/CakeResque/Config \
    -v misp-vol-server-MISP-tmp:/var/www/MISP/tmp \
    -v misp-vol-server-MISP-attachments:/var/www/MISP/attachments \
    image: dcso/misp-dockerized-server \
```

### Documentation
You can also find the [docker file](https://github.com/DCSO/MISP-dockerized-server/) at Github.


## License

View [license information](https://github.com/DCSO/MISP-dockerized-server/blob/master/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.