# [Deprecated] [MISP-dockerized-postfix](https://github.com/DCSO/MISP-dockerized-postfix)
`Since MISP-dockerized version 0.3.4, the Postfix container is no longer used. Postfix is installed on misp-server container since 2.4.97.`


## Supported Tags and Respective `Dockerfile` Links

- [`1.0.1-alpine`, `latest`][2]
- [`1.0.0-alpine`][1]

[1]: https://github.com/DCSO/MISP-dockerized-postfix/blob/master/1.0.0-alpine/Dockerfile
[2]: https://github.com/DCSO/MISP-dockerized-postfix/blob/master/1.0.1-alpine/Dockerfile

## Quick Reference

-	**Where to file issues**:  
	[https://github.com/DCSO/MISP-dockerized-postfix/issues](https://github.com/DCSO/MISP-dockerized-postfix/issues)

-	**Maintained by**:  
	[DCSO](https://github.com/DCSO)

-	**Supported Docker versions**:  
	[The latest release](https://github.com/docker/docker-ce/releases/latest)

### Project Information

|                                  |                                                                                                                                                              |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Travis Master                    | [![](https://travis-ci.org/DCSO/MISP-dockerized-postfix.svg?branch=master)](https://travis-ci.org/DCSO/MISP-dockerized-postfix)                    |
| Docker Size & Layers             | [![](https://images.microbadger.com/badges/image/dcso/misp-dockerized-postfix.svg)](https://microbadger.com/images/dcso/misp-dockerized-postfix)   |
| Latest Docker Version            | [![](https://images.microbadger.com/badges/version/dcso/misp-dockerized-postfix.svg)](https://microbadger.com/images/dcso/misp-dockerized-postfix) |
| Commit for Latest Docker Version | [![](https://images.microbadger.com/badges/commit/dcso/misp-dockerized-postfix.svg)](https://microbadger.com/images/dcso/misp-dockerized-postfix)  |



## How to Use this Image

### Usage

For the usage please read the [MISP-dockerized](https://github.com/DCSO/MISP-dockerized) Git repository.

#### Environment Variables

| Variable | Default Value | Description|
|---|---|---|
HOSTNAME|misp|Hostname for the Mailserver | 
|DOMAIN|example.com| Domain for Outgoing Mail |
|SENDER_ADDRESS|admin@example.com|Sender for local postfix outgoing Mails|
|RELAYHOST|smtp.example.com:587|Relahost to Send Mails|
|RELAY_USER|misp|Username for the authentication on the Relayhost|
|RELAY_PASSWORD|ChangeMe| Password for the authentication on the Relayhost|
|DOCKER_NETWORK|192.168.47.0/28|Restrict access to postfix to this IP-range|
|DEBUG_PEER|none| If you need debugging log for a specified host set this to the domain, FQDN or ip address|

#### Using With `docker-compose`
``` bash
services:
  ### Postfix ###
  misp-postfix:
    image: dcso/misp-dockerized-postfix:${POSTFIX_CONTAINER_TAG}
    container_name: misp-postfix
    restart: on-failure
    environment:
      HOSTNAME: ${HOSTNAME}
      DOMAIN: ${DOMAIN}
      SENDER_ADDRESS: ${SENDER_ADDRESS}
      RELAYHOST: ${RELAYHOST}
      RELAY_USER: ${RELAY_USER}
      RELAY_PASSWORD: ${RELAY_PASSWORD}
      DOCKER_NETWORK: ${DOCKER_NETWORK}
      DEBUG_PEER: ${DEBUG_PEER}
    networks:
      misp-backend:
        aliases:
          - misp-postfix

```

#### Using with `docker run`
``` bash
docker run \
    --name misp-postfix \
    -e HOSTNAME: ${HOSTNAME} \
    -e DOMAIN: ${DOMAIN} \
    -e SENDER_ADDRESS: ${SENDER_ADDRESS} \
    -e RELAYHOST: ${RELAYHOST} \
    -e RELAY_USER: ${RELAY_USER} \
    -e RELAY_PASSWORD: ${RELAY_PASSWORD} \
    -e  DOCKER_NETWORK: ${DOCKER_NETWORK} \
    -e  DEBUG_PEER: ${DEBUG_PEER} \
    image: dcso/misp-dockerized-postfix
```


## Documentation
You can also find the [Dockerfile](https://github.com/DCSO/MISP-dockerized-postfix/) at Github.com.


## License

View [license information](https://github.com/DCSO/MISP-dockerized-proxy/blob/master/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contain other software that may be under other licenses (such as Bash, etc., from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
