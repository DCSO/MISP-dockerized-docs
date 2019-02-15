# MISP-dockerized-redis


---
## Feat/MDD-170: Add Redis Container Version 1.0-alpine
### Update information 
We added a new MISP redis image version 1.0-alpine.
### General changes
In general we added the new redis Git repository to move the redis installation from [MISP server](https://github.com/DCSO/MISP-dockerized-server) to new MISP redis container.
### Fixes and Improvements
- We added a new redis container repository
### Detailed changes
- We added a new redis container on base of official redis:5.0.3-alpine3.9 container. It is an Alpine Linux version of the container. Therefore it is very small.
- We added an healthcheck.sh script, this test if the redis application is working correctly.
- We added our LABEL structure.
- No proxy variables are added, because the container should not be able to communicate to the outside.