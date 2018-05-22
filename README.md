MISP dockerized documentation
====
# About
**MISP dockerized** is a project designed to provide an easy-to-use and easy-to-install 'out of the box' MISP instance that includes everything you need to run MISP with minimal host-side requirements. 

**MISP dockerized** uses MISP (Open Source Threat Intelligence Platform - https://github.com/MISP/MISP), which is maintend and developed by the MISP project team (https://www.misp-project.org/)

**THIS PROJECT IS IN BETA PHASE**

### Project Information
<table>
<tr>
  <td>Latest Release</td>
  <td><a href="https://badge.fury.io/gh/DCSO%2FMISP-dockerized"><img src="https://badge.fury.io/gh/DCSO%2FMISP-dockerized.svg" alt="GitHub version" height="18"></a></td>
</tr>
<tr>
  <td>Travis Master</td>
  <td><a href="https://travis-ci.org/DCSO/MISP-dockerized"><img src="https://travis-ci.org/DCSO/MISP-dockerized.svg?branch=master" /></a></td>
</tr>
</table>

### Docker Container Information

| Name | Travis | Docker Size & Layers | Latest Docker Version | Commit | Container License |
|---|---|---|---|---|---|
| misp-proxy | [![](https://travis-ci.org/DCSO/MISP-dockerized-proxy.svg?branch=master)](https://travis-ci.org/DCSO/MISP-dockerized-proxy) | [![](https://images.microbadger.com/badges/image/dcso/misp-proxy.svg)](https://microbadger.com/images/dcso/misp-proxy) | [![](https://images.microbadger.com/badges/version/dcso/misp-proxy.svg)](https://microbadger.com/images/dcso/misp-proxy) | [![](https://images.microbadger.com/badges/commit/dcso/misp-proxy.svg)](https://microbadger.com/images/dcso/misp-proxy) | [![](https://images.microbadger.com/badges/license/dcso/misp-proxy.svg)](https://microbadger.com/images/dcso/misp-proxy) |
| misp-server | [![](https://travis-ci.org/DCSO/MISP-dockerized-server.svg?branch=master)](https://travis-ci.org/DCSO/MISP-dockerized-server)| [![](https://images.microbadger.com/badges/image/dcso/misp-server.svg)](https://microbadger.com/images/dcso/misp-server) | [![](https://images.microbadger.com/badges/version/dcso/misp-server.svg)](https://microbadger.com/images/dcso/misp-server) | [![](https://images.microbadger.com/badges/commit/dcso/misp-server.svg)](https://microbadger.com/images/dcso/misp-server) | [![](https://images.microbadger.com/badges/license/dcso/misp-server.svg)](https://microbadger.com/images/dcso/misp-server) |
| misp-robot | [![](https://travis-ci.org/DCSO/MISP-dockerized-robot.svg?branch=master)](https://travis-ci.org/DCSO/MISP-dockerized-robot)|  [![](https://images.microbadger.com/badges/image/dcso/misp-robot.svg)](https://microbadger.com/images/dcso/misp-robot) | [![](https://images.microbadger.com/badges/version/dcso/misp-robot.svg)](https://microbadger.com/images/dcso/misp-robot) | [![](https://images.microbadger.com/badges/commit/dcso/misp-robot.svg)](https://microbadger.com/images/dcso/misp-robot) | [![](https://images.microbadger.com/badges/license/dcso/misp-robot.svg)](https://microbadger.com/images/dcso/misp-robot) |

# Installation
## Software Prerequsites
For the Installation of MISP dockerized you need at least:

| Component |  minimum Version   |
|----|-----|
| Docker   | 17.03.0-ce |
| Git   | newest Version from Distribution |


## Firewall Prerequsites
For the Installation the followed Connections need to available:

|URL|Direction|Protocol|Destination Port|
|---|---|---|---|
| registry-1.docker.io| outgoing TCP | 443 |
| github.com*| outgoing | TCP | 443 |
| hub.docker.com|outgoing |TCP | 443 |

### Why registry-1.docker.io:
This contains all required docker container:

|Container|based on|purpose|
|---|---|---|
|misp-redis|official redis|scheduled tasks|
|misp-db|official mariadb|database to save MISP settings|
|misp-proxy|alpine|reverse proxy|
|misp-server|ubuntu|MISP application server|
|misp-robot|ubuntu|deploy & configuration manager|

### Why github.com
This contains:
- scripts
- tools


# What's missing
Currently the following things are not yet implemented but are planned
* GnuPG Support
* Postfix
* MISP-Modules

# Additional Informations
## MariaDB and Docker
* https://mariadb.com/kb/en/library/installing-and-using-mariadb-via-docker/
* https://hub.docker.com/r/_/mariadb/
## MISP
* https://github.com/MISP/MISP
* https://www.misp-project.org/

# License

This software is released under a BSD 3-Clause license.
Please have a look at the LICENSE file included in the repository.

Copyright (c) 2018, DCSO Deutsche Cyber-Sicherheitsorganisation GmbH
