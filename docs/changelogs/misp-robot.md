# MISP-dockerized-misp-robot
Since Release Candiate 0.3.0 we changed the development process from an Release Canditate change to an feature change development process.


## Changelog for bug.MDD120 - misp-robot version 1.0.4-debian ansible is only available in travis-ci and not in gitlab-ci 
### Update Informations 
Fixed a bug where ansible package are not installed on our internal gitlab-ci. Travis-CI are not affected.
### General Changes
No general changes have been made in this release.
### Fixes & Improvements
- Bugfixing installing ansible package
- Change from Image debian:stable-slim to debian:stretch-slim (is the same, but another tag)
- Exclude unused robot version
### Detailed Changes
- Add `--allow_unauthenticated` parameter to apt-get install for installing ansible
  Ansible package was only available if you choose the container from hub.docker.com, because travis-ci ignored the warning and continured the run command and the build. Gitlab-ci abort the related run task, but abort not the whole build.
- Exclude:
    - 1.0.2-debian
    - 1.0.3-debian
    - 1.0.4-ubuntu
  Since 1.0.4-debian we use now the debian image also for all future robot versions.



## Changelog for bug.MDD120 - misp-robot version 1.0.3-ubuntu could not build by travis-ci and gitlab-ci
### Update Informations 
We add a new container. 
`PLEASE DO NOT USE 1.0.3-ubuntu! IT IS BROKEN!`
### General Changes
No general changes have been made in this release.
### Fixes & Improvements
- Bugfixing 1.0.3-ubuntu and add a new version 1.0.4-debian
### Detailed Changes
- The server role from the ansible script in the MISP-dockerized repository make an error.The problem is the installation of the openssl ansible module which requires pyopenssl. Pyopenssl is installed, but causes the error. With the new container 1.0.4-debian no errors exists.




## Changelog for bug.MDD112 - MISP-robot pipeline failed
### Update Informations 
The robot pipeline failed for the 1.0.2-ubuntu and 1.0.3-ubuntu versions failed.
### General Changes
No general changes have been made in this release.
### Fixes & Improvements
-FIX: locale-gen was not found, therefore the locale-gen command is deactivated
### Detailed Changes
- FIX: In the dockerfile for the version 1.0.2-ubuntu and 1.0.3-ubuntu is the locale-gen command now deactivated.





## Changelog for Release Candidate 0.3.0
### Update Informations
In this Release Candidate we add a new container with improved configurations, updated the old one for a bugfix and improved the build scripts for gitlab-ci support.
### General Changes
No general changes have been made in this release.
### Fixes & Improvements
- Add internal gitlab-ci support
- Add new container 1.0.3
### Detailed Changes
- Add internal gitlab-ci support
  We change the shell scripts to support a second docker registry. Now the scripts look for a variable with the name `INTERNAL_REGISTRY_HOST`.  
- Add new container 1.0.3
    We add a new LABEL standard and prepared dockerfile for the next upgrade release.


## Changelog for Release Candidate 0.2.1
### Update Informations 
Features of the release:
* Add rng-tool on 1.0.2 robot version to get a better entrophy.
### General Changes
No general changes were made.
### Fixes & Improvements
* Add rng-tool on 1.0.2 robot version to get a better entrophy.
### Detailed Changes
- We add rng-tool to get a better entrophy for creating a PGP key.



## Changelog for Release Candidate 0.2.0
### Update Informations 
* Finished Ticket MDD-19 | Improve Ansible scripts
* Add new Robot Version 1.0.2
* Add origin robot 1.0.0 and 1.0.1 version
### General Changes
Besides the new version, no general changes were made.
### Fixes & Improvements
* Finished Ticket MDD-19 | Improve Ansible scripts
* Add new Robot Version 1.0.2
* Add origin robot 1.0.0 and 1.0.1 version
### Detailed Changes
* New robot 1.0.2
    * The new robot has no ansible scripts included. Because the Ansible scripts are mounted via docker-compose through the misp-dockerized repository.
    * Change folder structure therefore it required a change in the playbooks as well
    * Delete SSH Keys and hosts files it is not used and unneeded
* Changes for all robots
    * Update Makefile, build.sh & travis.yml
    * Modify ALL Dockerfiles for HTTPS PROXY Support
    * Modify configuration.sh to update to latest release
    * Delete Hub.docker.com Hooks
    * Improve Readme
* Change for Ansible Scripts:
    * Ansible script create a self signed cert if none is found
    * Update ansible script to create cert if none is found
    * Improve task for copy cert, key and dh params to volume
    * Improved Import Database section
    * Improve all Ansible scripts to use ansible modules if it is possible 




## Changelog for Release Candidate 0.1.0
### Update Informations 
Features of the release:
- Add MISP-Server Container for MISP release 2.4.96.
  For more information please have a look at the official changelog at https://github.com/MISP/MISP/releases/tag/v2.4.96
### General Changes
Besides the new MISP version, no general changes were made.
### Fixes & Improvements
* docker container build automatically via travis-ci
* update Readme file
* bug fixed in the build configuration script
### Detailed Changes

