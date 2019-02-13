# Firewall Prerequisites

#### Customers which have access to DCSO MISP
Connections to the following URLs are required during installation. Please make sure that they are available before you start:

| URL               | Direction | Protocol | Destination Port |
| ----------------- | --------- | -------- | ---------------- |
| dockerhub.dcso.de | outgoing  | TCP      | 443              |
| github.com*       | outgoing  | TCP      | 443              |
| misp.dcso.de      | outgoing  | TCP      | 443              |


#### Non-Customers
Connections to the following URLs are required during installation. Please make sure that they are available before you start:

| URL                   | Direction | Protocol | Destination Port |
| --------------------- | --------- | -------- | ---------------- |
| *.docker.io           | outgoing  | TCP      | 443              |
| github.com*           | outgoing  | TCP      | 443              |
| <URL of syncing MISP> | outgoing  | TCP      | 443              |


### Why *.docker.io:
The *.docker.io provides all required containers for MISP-dockerized.

| Container    | based on         | purpose                        |
| ------------ | ---------------- | ------------------------------ |
| misp-redis   | official Redis   | Queue                          |
| misp-db      | official MariaDB | Database to save MISP settings |
| misp-proxy   | Alpine Linux     | Reverse proxy                  |
| misp-server  | debian:stretch   | MISP application server        |
| misp-modules | debian:stretch   | MISP modules component         |
| misp-robot   | debian:stretch   | Deploy & configuration manager |


### Why github.com
The Github.com provides all tools, files and scripts needed for the installation of MISP-dockerized and MISP itself.