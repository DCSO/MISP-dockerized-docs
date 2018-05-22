## Firewall Prerequsites
For the Installation the followed Connections need to available:

| URL                  | Direction    | Protocol | Destination Port |
| -------------------- | ------------ | -------- | ---------------- |
| registry-1.docker.io | outgoing TCP | 443      |
| github.com*          | outgoing     | TCP      | 443              |
| hub.docker.com       | outgoing     | TCP      | 443              |

### Why registry-1.docker.io:
This contains all required docker container:

| Container   | based on         | purpose                        |
| ----------- | ---------------- | ------------------------------ |
| misp-redis  | official redis   | scheduled tasks                |
| misp-db     | official mariadb | database to save MISP settings |
| misp-proxy  | alpine           | reverse proxy                  |
| misp-server | ubuntu           | MISP application server        |
| misp-robot  | ubuntu           | deploy & configuration manager |

### Why github.com
This contains:
- scripts
- tools