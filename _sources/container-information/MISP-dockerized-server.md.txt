# [MISP-dockerized-server](https://github.com/DCSO/MISP-dockerized-server)

## Available MISP Versions (Supported Tags and Respective `Dockerfile` Links)

### Supported Builds

| Version                                                                                                  | Release Date | Status    | Notes                             |
| -------------------------------------------------------------------------------------------------------- | ------------ | --------- | --------------------------------- |
| [`2.4.99-debian`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.99-debian/Dockerfile)   | Dec'2018     | supported | Default version for release 1.0.x |
| [`2.4.103-debian`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.103-debian/Dockerfile) | Mar'2019     | supported | Default version for release 1.1.x |
|                                                                                                          |
### Intermediate Builds

| Version                                                                                                          | Release Date | Status      | Notes                                                                                                                                              |
| ---------------------------------------------------------------------------------------------------------------- | ------------ | ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
|                                                                                                                  |
| [`2.4.100-debian`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.100-debian/Dockerfile)         | Jan'2019     | unsupported |                                                                                                                                                    |
| [`2.4.101-debian`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.101-debian/Dockerfile)         | Jan'2019     | unsupported |
|                                                                                                                  |
| [`2.4.102-debian`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.102-debian/Dockerfile)         | Mar'2019     | unsupported |
|                                                                                                                  |
| [`2.4.103-debian`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.103-debian/Dockerfile)         | Mar'2019     | unsupported |
|                                                                                                                  |
| [`2.4.nightly-ubuntu`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.nightly-ubuntu/Dockerfile) | Oct'2018     | unsupported | The nightly version is a build based on the latest development version of MISP-dockerized. This build is experimental and therefore not supported. |


### Beta Builds
The following versions of MISP were used during the beta of MISP-dockerized (v0.X.X). However, we highly recommend upgrading to the current version of MISP-dockerized.

| Version                                                                                                | Release Date | Status      | Notes                                                                                                                                                     |
| ------------------------------------------------------------------------------------------------------ | ------------ | ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [`2.4.88-ubuntu`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.88-ubuntu/Dockerfile) | Apr'2018     | End-Of-Life |                                                                                                                                                           |
| [`2.4.89-ubuntu`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.89-ubuntu/Dockerfile) | Apr'2018     | End-Of-Life |                                                                                                                                                           |
| [`2.4.90-ubuntu`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.90-ubuntu/Dockerfile) | Apr'2018     | End-Of-Life |                                                                                                                                                           |
| [`2.4.91-ubuntu`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.91-ubuntu/Dockerfile) | Jun'2018     | deprecated  |                                                                                                                                                           |
| [`2.4.92-ubuntu`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.92-ubuntu/Dockerfile) | Jun'2018     | deprecated  |                                                                                                                                                           |
| [`2.4.93-ubuntu`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.93-ubuntu/Dockerfile) | Sep'2018     | deprecated  |                                                                                                                                                           |
| [`2.4.94-ubuntu`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.94-ubuntu/Dockerfile) | Sep'2018     | deprecated  |                                                                                                                                                           |
| [`2.4.95-ubuntu`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.95-ubuntu/Dockerfile) | Sep'2018     | deprecated  | MISP Pull mechanism is currently not working. The ticket to that issue can be found here: https://github.com/MISP/MISP/issues/3613#issuecomment-419459107 |
| [`2.4.96-ubuntu`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.96-ubuntu/Dockerfile) | Oct'2018     | deprecated  |                                                                                                                                                           |
| [`2.4.97-debian`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.97-debian/Dockerfile) | Oct'2018     | deprecated  |                                                                                                                                                           |
| [`2.4.98-debian`](https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.98-debian/Dockerfile) | Oct'2018     | deprecated  |                                                                                                                                                           |  |

## Image Information

|                                  |                                                                                                                                                  |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| Travis Master                    | [![](https://travis-ci.org/DCSO/MISP-dockerized-server.svg?branch=master)](https://travis-ci.org/DCSO/MISP-dockerized-server)                    |
| Docker Size & Layers             | [![](https://images.microbadger.com/badges/image/dcso/misp-dockerized-server.svg)](https://microbadger.com/images/dcso/misp-dockerized-server)   |
| Latest Docker Version            | [![](https://images.microbadger.com/badges/version/dcso/misp-dockerized-server.svg)](https://microbadger.com/images/dcso/misp-dockerized-server) |
| Commit for Latest Docker Version | [![](https://images.microbadger.com/badges/commit/dcso/misp-dockerized-server.svg)](https://microbadger.com/images/dcso/misp-dockerized-server)  |

## Integrated MISP Modules 

- since 2.4.92:
    - pyzmq
    - pymisp
    - ssdeep
    - pydeep
    - python-magic
    - lief
    - maec


## Quick Reference

-	**Where to file issues**:  
	[https://github.com/DCSO/MISP-dockerized-server/issues](https://github.com/DCSO/MISP-dockerized-server/issues)

-	**Maintained by**:  
	[DCSO](https://github.com/DCSO)

-	**Supported Docker versions**:  
	[The latest release](https://github.com/docker/docker-ce/releases/latest)


## How to Use this Image

### Available Environment Variables

| Environment Variables | Example                                            | Type                            | Component  |
| --------------------- | -------------------------------------------------- | ------------------------------- | ---------- |
| MYSQL_ROOT_PASSWORD   | PleaseChangeMe                                     | REQUIRED                        | DB         |
| MYSQL_DATABASE        | misp                                               | OPTIONAL                        | DB         |
| MYSQL_USER            | misp                                               | OPTIONAL                        | DB         |
| MYSQL_PASSWORD        | PleaseChangeMe                                     | REQUIRED                        | DB         |
| REDIS_FQDN            | misp-redis                                         | OPTIONAL                        | Redis      |
| HTTP_PROXY            | http://proxy.example.com:3128                      | OPTIONAL                        | Base       |
| HTTPS_PROXY           | http://proxy.example.com:3128                      | OPTIONAL                        | Base       |
| NO_PROXY              | internal.example.com example.com                   | OPTIONAL                        | Base       |
| SENDER_ADDRESS        | no-reply@example.com                               | REQUIRED, only for MAIL         | Mail       |
| DOMAIN                | example.com                                        | REQUIRED, only for MAIL         | Mail       |
| HTTP_SERVERADMIN      | support@example.com                                | REQUIRED                        | Web        |
| RELAYHOST             | mail.example.com                                   | REQUIRED, only for MAIL         | Mail       |
| RELAY_USER            | Mailuser42                                         | REQUIRED, only for MAIL         | Mail       |
| RELAY_PASSWORD        | PleaseChangeMe                                     | REQUIRED, only for MAIL         | Mail       |
| DOCKER_NETWORK        | 192.168.42.0/24                                    | OPTIONAL                        | Mail       |
| DEBUG_PEER            | mail.example.com                                   | OPTIONAL                        | Mail       |
| PHP_MEMORY            | 512M                                               | OPTIONAL                        | PHP        |
| HOSTNAME              | misp.example.com                                   | DEPRECATED                      | MISP       |
| MISP_FQDN             | misp.example.com                                   | REQUIRED if MISP_URL is empty   | MISP       |
| MISP_URL              | https://misp.example.com                           | REQUIRED if MISP_FQDN is empty. | MISP       |
| MISP_HTTPS_PORT       | 443                                                | REQUIRED                        | MISP       |
| MISP_encoding         | utf8                                               | REQUIRED                        | MISP       |
| MISP_SALT             | Fl9DW5Zc3WMV0fKZi5RXDEJTpfVqSmumvbISZKxkzLaeNqHnYD | REQUIRED                        | MISP       |
| ADD_ANALYZE_COLUMN    | no, yes                                            | OPTIONAL                        | Entrypoint |
| USE_PGP               | no, yes                                            | OPTIONAL                        | Entrypoint |
| USE_SMIME             | no, yes                                            | OPTIONAL                        | Entrypoint |



### Using With `docker-compose`
``` bash
services:
  ### MISP-Server ###
  misp-server:
    image: dcso/misp-dockerized-server:${MISP_CONTAINER_TAG}
    container_name: misp-server
    restart: on-failure
    # ports:
    #   - "8080:80" # DEBUG only
    #   - "8443:443" # DEBUG only
    environment:
      # DB
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
      # PROXY
      HTTP_PROXY: ${HTTP_PROXY}
      HTTPS_PROXY: ${HTTPS_PROXY}
      NO_PROXY: ${NO_PROXY}
      # POSTFIX
      SENDER_ADDRESS: ${SENDER_ADDRESS}
      HOSTNAME: ${myHOSTNAME}
      DOMAIN: ${DOMAIN}
      HTTP_SERVERADMIN: ${HTTP_SERVERADMIN}
      RELAYHOST: ${RELAYHOST}
      RELAY_USER: ${RELAY_USER}
      RELAY_PASSWORD: ${RELAY_PASSWORD}
      DOCKER_NETWORK: ${DOCKER_NETWORK}
      DEBUG_PEER: ${DEBUG_PEER}
      # PHP
      PHP_MEMORY: ${PHP_MEMORY}
    volumes:
    ###### mips-server ######
    # Apache2 Configuration
    - misp-vol-server-apache2-config-sites-enabled:/etc/apache2/sites-enabled
    # Volume with Certificates
    - misp-vol-ssl:/etc/apache2/ssl
    # Volume with PGP Key
    - misp-vol-pgp:/var/www/MISP/.gnupg
    # Volume with S/MIME Certificate and Key
    - misp-vol-smime:/var/www/MISP/.smime
    # Redis Volume
    - misp-vol-redis-data:/redis_data_dir
    # MISP Configurations:
    - misp-vol-server-MISP-app-Config:/var/www/MISP/app/Config
    - misp-vol-server-MISP-cakeresque-config:/var/www/MISP/app/Plugin/CakeResque/Config
    - misp-vol-server-MISP-tmp:/var/www/MISP/app/tmp
    - misp-vol-server-MISP-attachments:/var/www/MISP/app/files
    ###### misp-redis ######
    - misp-vol-redis-data:/data/
    ###### misp-db ######
    - misp-vol-db-data:/var/lib/mysql/"
    networks:
      misp-backend:
        aliases:
        - misp-server

```


### Using With `docker run`
``` bash
docker run \
    --name misp-server \
    -e MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD} \
    -e MYSQL_DATABASE: ${MYSQL_DATABASE} \
    -e MYSQL_USER: ${MYSQL_USER} \
    -e MYSQL_PASSWORD: ${MYSQL_PASSWORD} \
    -v misp-vol-server-apache2-config-sites-enabled:/etc/apache2/sites-enabled \
    -v misp-vol-ssl:/etc/apache2/ssl \
    -v misp-vol-pgp:/var/www/MISP/.gnupg \
    -v misp-vol-smime:/var/www/MISP/.smime \
    -v misp-vol-redis-data:/redis_data_dir \
    -v misp-vol-server-MISP-app-Config:/var/www/MISP/app/Config \
    -v misp-vol-server-MISP-cakeresque-config:/var/www/MISP/app/Plugin/CakeResque/Config \
    -v misp-vol-server-MISP-tmp:/var/www/MISP/app/tmp \
    -v misp-vol-server-MISP-attachments:/var/www/MISP/app/files \
    -v misp-vol-redis-data:/data/ \
    -v misp-vol-db-data:/var/lib/mysql/ \
    image: dcso/misp-dockerized-server \
```

### Documentation
You can also find the [Dockerfile](https://github.com/DCSO/MISP-dockerized-server/) at Github.com.


## License

View [license information](https://github.com/DCSO/MISP-dockerized-server/blob/master/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contain other software that may be under other licenses (such as Bash, etc., from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
