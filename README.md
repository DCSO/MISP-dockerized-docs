MISP dockerized documentation
====

# About
**MISP dockerized** is a project designed to provide an easy-to-use and easy-to-install 'out of the box' MISP instance that includes everything you need to run MISP with minimal host-side requirements. 

**MISP dockerized** uses MISP (Open Source Threat Intelligence Platform - https://github.com/MISP/MISP), which is maintend and developed by the MISP project team (https://www.misp-project.org/)

**THIS PROJECT IS IN BETA PHASE**

### Project Information

|||
|-|-|
| Travis Master | [![][10]][3]  |

[3]: https://travis-ci.org/DCSO/MISP-dockerized
[10]: https://travis-ci.org/DCSO/MISP-dockerized.svg?branch=master

### Docker Container Information

| Name         | Travis        | Docker Size & Layers | Latest Docker Version | Commit        |
| ------------ | ------------- | -------------------- | --------------------- | ------------- |  
| misp-proxy   | [![][1]][2]   | [![][4]][7]          | [![][5]][7]           | [![][6]][7]   |  
| misp-server  | [![][8]][9]   | [![][11]][14]        | [![][12]][14]         | [![][13]][14] |  
| misp-robot   | [![][15]][16] | [![][18]][21]        | [![][19]][21]         | [![][20]][21] |  
| misp-postfix | [![][22]][23] | [![][25]][28]        | [![][26]][28]         | [![][27]][28] |  


[1]: https://travis-ci.org/DCSO/MISP-dockerized-proxy.svg?branch=master
[2]: https://travis-ci.org/DCSO/MISP-dockerized-proxy
[4]: https://images.microbadger.com/badges/image/dcso/misp-proxy.svg
[5]: https://images.microbadger.com/badges/version/dcso/misp-proxy.svg
[6]: https://images.microbadger.com/badges/commit/dcso/misp-proxy.svg
[7]: https://microbadger.com/images/dcso/misp-proxy

[8]: https://travis-ci.org/DCSO/MISP-dockerized-server.svg?branch=master
[9]: https://travis-ci.org/DCSO/MISP-dockerized-server
[11]: https://images.microbadger.com/badges/image/dcso/misp-server.svg
[12]: https://images.microbadger.com/badges/version/dcso/misp-server.svg
[13]: https://images.microbadger.com/badges/commit/dcso/misp-server.svg
[14]: https://microbadger.com/images/dcso/misp-server

[15]: https://travis-ci.org/DCSO/MISP-dockerized-robot.svg?branch=master
[16]: https://travis-ci.org/DCSO/MISP-dockerized-robot
[18]: https://images.microbadger.com/badges/image/dcso/misp-robot.svg
[19]: https://images.microbadger.com/badges/version/dcso/misp-robot.svg
[20]: https://images.microbadger.com/badges/commit/dcso/misp-robot.svg
[21]: https://microbadger.com/images/dcso/misp-robot

[22]: https://travis-ci.org/DCSO/MISP-dockerized-postfix.svg?branch=master
[23]: https://travis-ci.org/DCSO/MISP-dockerized-postfix
[25]: https://images.microbadger.com/badges/image/dcso/misp-postfix.svg
[26]: https://images.microbadger.com/badges/version/dcso/misp-postfix.svg
[27]: https://images.microbadger.com/badges/commit/dcso/misp-postfix.svg
[28]: https://microbadger.com/images/dcso/misp-postfix

# Installation

## The 4 Step Installation Guide
See [quick-start](./quick-start/README.md)


# Help

## Backup and Recovery
See [backup-restore](./help/backup-restore.md)

# General Help
See [Help](.help/README.md)


# License

This software is released under a BSD 3-Clause license.
Please have a look at the LICENSE file included in the repository.

Copyright (c) 2018, DCSO Deutsche Cyber-Sicherheitsorganisation GmbH
