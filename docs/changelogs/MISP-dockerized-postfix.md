#  [DEPRECATED] MISP-dockerized-postfix

Since Release Candiate 0.3.0 we changed the development process from an Release Canditate change to an feature change development process.

`Since MISP-dockerized Version 0.3.4 the Postfix container is not more used. Postfix is installed on MISP-server since 2.4.97.`

## Changelog for Release Candidate 0.3.0
### Update Informations
In this Release Candidate we add a new container with improved configurations, updated the old one for a bugfix and improved the build scripts for gitlab-ci support.
### General Changes
We add a new container 1.0.1.

### Fixes & Improvements
- Add internal gitlab-ci support
- 1.0.0
  - Change LABELs on 1.0.0
  - Remove debugging mode from entrypoint file
  - Bugfixing syslog-ng configuration
- Add new container 1.0.1

### Detailed Changes
- Add internal gitlab-ci support
  We change the shell scripts to support a second docker registry. Now the scripts look for a variable with the name `INTERNAL_REGISTRY_HOST`.  
- 1.0.0
  - Change LABELs on 1.0.0
    We made the LABELs more variable.
  - Remove debugging mode from entrypoint file
    We changed `set -exv` to `set -e`
  - Bugfixing syslog-ng configuration
    We fixed mistakes with semicolons.
- Add new container 1.0.1
    We add a new LABEL standard and prepared dockerfile for the next upgrade release.


## Changelog for Release Candidate 0.2.0 - `New Postfix container for mail relaying`

* This close ticket MDD-14 with Postfix as relay.
* Add new Postfix container with version 1.0.0 with alpine as base
* Delete Hub.docker.com Hooks

### Environment Variables

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

### Using with docker-compose
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

#### .env file for docker-compose variable
If you want to use the postfix container with variables you require a .env file with the following content:
``` bash
#=================================================
# ------------------------------
# Hostname
# ------------------------------
HOSTNAME=misp.example.com
# ------------------------------
# Network Configuration
# ------------------------------
DOCKER_NETWORK="192.168.47.0/28"
BRIDGE_NAME="mispbr0"
# ------------------------------
# Container Configuration
# ------------------------------
POSTFIX_CONTAINER_TAG=1.0.0-alpine-dev
# ------------------------------
# Postfix Configuration
# ------------------------------
DOMAIN=example.com
RELAYHOST=mail.example.com
RELAY_USER=MrDQQUHXeg
RELAY_PASSWORD=g093bJljQUhLzgwK2LYIE77UUGIS
SENDER_ADDRESS=admin@misp.example.com
QUESTION_DEBUG_PEERS=no
DEBUG_PEER=none
##################################################################
```

### Usign with `docker run`
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