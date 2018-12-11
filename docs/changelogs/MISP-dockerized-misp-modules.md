# MISP-dockerized-misp-modules
Since Release Candiate 0.3.0 we changed the development process from an Release Canditate change to an feature change development process.


## Changelog for bug.MDD134 - Add MISP-Modules Container Version 1.2 for gitlab-ci
### Update information 
In the past, we changed the version numbers and we forgot the Container with the version 1.2, but only in gitlab-ci. In Travis-CI it is existent. Now we fix this situation.

### General changes
No general change.
### Corrections & Improvements
- change the .gitlab-ci file in the root of the repository
### Detailed changes
- change the .gitlab-ci file in the root of the repository
  We add an include statement for the 1.2-debian folder.


## Changelog for feat.MDD123 - Changed the container version scheme from three (3) to two (2) digits.
### Update information 
In the past, we decided to use a three-digit version number for small and large changes for this container repository. This has proved unnecessary as the main repository is the central repository for new releases and all changes are already tracked here. We have therefore decided to change the 3-digit version number in all minor repositories to a 2-digit version number.
For example: 1.0.1 -> 1.1

The second digit is changed any time we make minor changes. The first digit changes whenever we make major changes, e.g. a new base image.

### General changes
In general, we change all versions from three to two digits....
### Corrections & Improvements
- ALL folder names changed
- Improved Gitlab-ci structure
- Minimization of the readme file
### Detailed changes
- All folders have been renamed, e.g. from 1.0.0.0-alpin to 1.0-alpin.
- We have made working with gitlab-ci easier with new extensions and includes.
- We have also reduced the readme as much as possible, as the documentation is now available centrally in our own documentation repository `https://dcso.github.io/MISP-dockerized-docs/`.



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