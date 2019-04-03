# MISP-dockerized-redis



---
## Feat/MDD-170: Added Redis Image 5-alpine3.9
### Update information
We added a new MISP redis image version 5-alpine3.9.
### General changes
In general we added the new redis Git repository to move the redis installation from [MISP server](https://github.com/DCSO/MISP-dockerized-server) to new MISP redis container.
### Fixes and Improvements
- We added a new redis container repository
### Detailed changes
- We added a new redis container on base of official redis:5-alpine3.9 container. It is an Alpine Linux version of the container. Therefore it is very small.
