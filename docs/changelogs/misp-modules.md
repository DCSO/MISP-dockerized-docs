# MISP-dockerized-misp-modules

## Release Candidate 0.3.2
#### Update Informations
In this Release Candidate we add a new container with improved configurations, updated the old one for a bugfix and improved the build scripts for gitlab-ci support.
#### General Changes
We add a new container. No other 
#### Fixes & Improvements
- Add internal gitlab-ci support
- Add hub.docker.com token for notification
- Add new container 1.0.1
#### Detailed Changes
- Add internal gitlab-ci support
  We change the shell scripts to support a second docker registry. Now the scripts look for a variable with the name `INTERNAL_REGISTRY_HOST`.  
- Add hub.docker.com token for notification
  Add token for travis-ci to inform hub.docker.com about a new image.
- Add new container 1.0.1
    We add a new LABEL standard and prepared dockerfile for the next upgrade release.



## Release Candidate 0.3.1
#### Update Informations 
Add hub.docker.com Token that Travis-CI can update the image automatically.
#### Fixes & Improvements
- add hub.docker.com trigger token




## Release Candidate 0.3.0
### Update Informations 
With the following release we offer the first misp-modules container on an debian base.
### General Changes
We add a standard debian base container with installed misp-modules content from https://github.com/MISP/misp-modules.
### Fixes & Improvements
- add Gitlab-CI + Travis-CI support