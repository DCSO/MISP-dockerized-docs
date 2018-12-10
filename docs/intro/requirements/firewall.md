# Firewall Prerequsites

Connections to the following URLs are required during installation. Please make sure that they are available before you start:

| URL                  | Direction    | Protocol | Destination Port |
| -------------------- | ------------ | -------- | ---------------- |
| registry-1.docker.io | outgoing TCP | 443      |
| github.com*          | outgoing     | TCP      | 443              |
| hub.docker.com       | outgoing     | TCP      | 443              |

### Why registry-1.docker.io:
The registry-1.docker.io provides all required containers for MISP-dockerized.

| Container   | based on         | purpose                        |
| ----------- | ---------------- | ------------------------------ |
| misp-redis  | official redis   | scheduled tasks                |
| misp-db     | official mariadb | database to save MISP settings |
| misp-proxy  | alpine           | reverse proxy                  |
| misp-server | ubuntu           | MISP application server        |
| misp-robot  | ubuntu           | deploy & configuration manager |

### Why github.com
The registry-1.docker.io provides all tools, files and scripts needed for the installation of MISP-dockerized.