# MISP-dockerized-redis


---
## Feat/MDD 221: Improve Redis and Monitoring Container
### Update information 
In this release we changed the docker build tools.
### General Changes
In general the CI files were changed. This has no user impact.
- Changed Gitlab CI Build tools from default `docker build`  to `kaniko`
- Added a Gitlab CI test job for all container 
- Added a Release Date variable for all container 
- Improved all shellscripts to avoid warnings and errors from shellcheck
- Removed unused CI scripts
### Fixes and Improvements
- No changes at container level.
### Detailed Changes
- No changes at container level.



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
