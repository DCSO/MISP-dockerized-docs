# MISP-dockerized-server

## Available MISP-Versions (Supported tags and respective `Dockerfile` links)
| Version               | Status   | Status    | Notes                             |
| --------------------- | -------- | --------- | --------------------------------- |
| [`2.4.98-ubuntu`][12] | Dec'2018 | supported |                                   |
| [`2.4.99-ubuntu`][13] | Dec'2018 | supported | Default version for release 1.0.0 |

### Beta Builds
The following versions of MISP where used during the beta of MISP-dockerized (v0.X.X). However, we highly recommend to upgrade to the current version of MISP-dockerized.

| Version                    | Status   | Status                        | Notes                                                                                                                                                     |
| -------------------------- | -------- | ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [`2.4.nightly-ubuntu`][10] | Oct'2018 | unsupported                   | The nightly version is a build based on the latest development version of MISP-dockerized. This build is experimental and therefore not supported.        |
| [`2.4.88-ubuntu`][1]       | Apr'2018 | supported                     |                                                                                                                                                           |
| [`2.4.89-ubuntu`][2]       | Apr'2018 | supported                     |                                                                                                                                                           |
| [`2.4.90-ubuntu`][3]       | Apr'2018 | supported                     |                                                                                                                                                           |
| [`2.4.91-ubuntu`][4]       | Jun'2018 | supported                     |                                                                                                                                                           |
| [`2.4.92-ubuntu`][5]       | Jun'2018 | supported                     |                                                                                                                                                           |
| [`2.4.93-ubuntu`][6]       | Sep'2018 | supported                     |                                                                                                                                                           |
| [`2.4.94-ubuntu`][7]       | Sep'2018 | supported                     |                                                                                                                                                           |
| [`2.4.95-ubuntu`][8]       | Sep'2018 | available but not recommended | MISP Pull mechanism is currently not working. The ticket to that issue can be found here: https://github.com/MISP/MISP/issues/3613#issuecomment-419459107 |
| [`2.4.96-ubuntu`][9]       | Oct'2018 | supported                     |                                                                                                                                                           |
| [`2.4.97-ubuntu`][11]      | Oct'2018 | supported                     |                                                                                                                                                           |



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
[11]: https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.97-debian/Dockerfile
[12]: https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.98-debian/Dockerfile
[13]: https://github.com/DCSO/MISP-dockerized-server/blob/master/2.4.99-debian/Dockerfile


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

### Available Environment Variables

| Environment Variables                       | Example                          | Type                    |
| ------------------------------------------- | -------------------------------- | ----------------------- |
| MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD} | PleaseChangeMe                   | REQUIRED                |
| MYSQL_DATABASE: ${MYSQL_DATABASE}           | misp                             | OPTIONAL                |
| MYSQL_USER: ${MYSQL_USER}                   | misp                             | OPTIONAL                |
| MYSQL_PASSWORD: ${MYSQL_PASSWORD}           | PleaseChangeMe                   | REQUIRED                |
| HTTP_PROXY: ${HTTP_PROXY}                   | http://proxy.example.com:3128    | OPTIONAL                |
| HTTPS_PROXY: ${HTTPS_PROXY}                 | http://proxy.example.com:3128    | OPTIONAL                |
| NO_PROXY: ${NO_PROXY}                       | internal.example.com example.com | OPTIONAL                |
| SENDER_ADDRESS: ${SENDER_ADDRESS}           | no-reply@example.com             | REQUIRED, only for MAIL |
| HOSTNAME: ${myHOSTNAME}                     | misp.example.com                 | REQUIRED                |
| DOMAIN: ${DOMAIN}                           | example.com                      | REQUIRED, only for MAIL |
| HTTP_SERVERADMIN: ${HTTP_SERVERADMIN}       | support@example.com              | REQUIRED                |
| RELAYHOST: ${RELAYHOST}                     | mail.example.com                 | REQUIRED, only for MAIL |
| RELAY_USER: ${RELAY_USER}                   | Mailuser42                       | REQUIRED, only for MAIL |
| RELAY_PASSWORD: ${RELAY_PASSWORD}           | PleaseChangeMe                   | REQUIRED, only for MAIL |
| DOCKER_NETWORK: ${DOCKER_NETWORK}           | 192.168.42.0/24                  | OPTIONAL                |
| DEBUG_PEER: ${DEBUG_PEER}                   | mail.example.com                 | OPTIONAL                |
| PHP_MEMORY: ${PHP_MEMORY}                   | 512M                             | OPTIONAL                |
| REDIS_FQDN: ${REDIS_FQDN}                   | misp-redis                       | OPTIONAL                |

### Using with docker-compose
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


### Usign with `docker run`
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
You can also find the [docker file](https://github.com/DCSO/MISP-dockerized-server/) at Github.


## License

View [license information](https://github.com/DCSO/MISP-dockerized-server/blob/master/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contains other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
