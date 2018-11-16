# MISP-dockerized-server
Since Release Candiate 0.3.0 we changed the development process from an Release Canditate change to an feature change development process.

## Changelog for feat.MDD126 - Add MISP Version 2.4.97
### Update Informations 
Features of the release:
- Add MISP-Server Container for MISP release 2.4.97.
  For more information please have a look at the official changelog at https://github.com/MISP/MISP/releases/tag/v2.4.97
- Change to a new gitlab-ci job structure for all misp-server container

### General Changes
Besides the new MISP version, no general changes were made.
### Fixes & Improvements
- Add MISP-Server Container with MISP Version 2.4.97 (DCSO/MISP-dockerized#39)
- Change Gitlab-CI Structure to a more flexible one

### Detailed Changes
- The following base changes were made in addition to the new `misp-server version 2.4.97`:
   - The base image is now **debian stretch** instead of ubuntu 18.04
   - Postfix is now directly installed - the postfix container is no longer necessary 
   - Added Cron.sh shell script that fetches and caches all enabled feeds and pull all remote server events
   - Change from syslog-ng to rsyslog, because in debian the syslog-ng doesn't support wildcard configuration for logfiles.
   - **The external requirement for our Ansible playbook is no longer necessary for this container**

- Gitlab-CI Strucutre
  Include statements in the Gitlab CI main file allow us to improve and simplify our Gitlab CI main file.



## Changelog for feat.MDD91 - Add MISP Version 2.4.96
### Update Informations 
Features of the release:
- Add MISP-Server Container for MISP release 2.4.96.
  For more information please have a look at the official changelog at https://github.com/MISP/MISP/releases/tag/v2.4.96
### General Changes
Besides the new MISP version, no general changes were made.
### Fixes & Improvements
- Add MISP-Server Container with MISP Version 2.4.96
### Detailed Changes
- We add the MISP version 2.4.96 on the container base of 2.4.95.


## Changelog for feat.MDD86 - Add Nightly 2.4 docker container
### Update Informations 
Features of the release:
- Add MISP-Server Container for MISP release 2.4, it is a nightly builded container always on the newest commit.
  For more information please have a look at the official repository from MISP at https://github.com/misp/misp/tree/2.4
### General Changes
Besides the new MISP version, no general changes were made.
### Fixes & Improvements
- Add MISP-Server Container for MISP release 2.4, it is a nightly builded container always on the newest commit.
### Detailed Changes
- The MISP project is very quickly and not for every pull request or commit is made a release. But if you want always the newest code from yesterday you have now the ability to use the following container: `dcso/misp-dockerized-server:2.4.nightly-ubuntu`



## Changelog for Release Candidate 0.3.0
### Update Informations
In this Release Candidate we have added a new container with improved configurations, updated the old one for a bugfix and improved the build scripts for gitlab-ci support.
### General Changes
Besides the new MISP version, no general changes were made.
### Fixes & Improvements
- Added internal gitlab-ci support
- 2.4.88 & 2.4.89
  	- Changed LABEL
- 2.4.90
  	- Changed LABEL
  	- New Apache2 SSL configuration
- 2.4.91
  	- Changed LABEL
  	- New Apache2 SSL configuration
  	- Added new ENV variable
- 2.4.92
  	- Changed LABEL
  	- Added new ENV variable
  	- Improved Dockerfile
  	- Added pip and pip3 version of additional modules
  	- Modified healthcheck
  	- Modified entrypoint files
    - Added Analysis Column via Environment Variable
    - Change PHP Memory via Environment Variable
- Added a new container for MISP Version 2.4.93
- Added a new container for MISP Version 2.4.94
- Added a new container for MISP Version 2.4.95
### Detailed Changes
- Added internal gitlab-ci support
  We have changed the shell scripts to support a second docker registry. Now the script looks for a variable called `INTERNAL_REGISTRY_HOST`.
- 2.4.88 & 2.4.89
  	- Changed LABEL
    We have made the LABELs more variable.
- 2.4.90
  	- Changed LABEL
    We have made the LABELs more variable.
  	- New Apache2 SSL configuration
- 2.4.91
  	- Changed LABEL
    We have made the LABELs more variable.
  	- New Apache2 SSL configuration
  	- Added new ENV variable
- 2.4.92
  	- Changed LABEL
    We have made the LABELs more variable.
  	- Added new ENV variable
  	- Improved Dockerfile
  	- Added pip and pip3 version of additional modules
  	- Modified healthcheck
  	- Modified entrypoint files
- Added a new container for MISP Version 2.4.93
- Added a new container for MISP Version 2.4.94
  - Added syslog-ng to colllect all logfile and extract it to docker standard stdout and stderr stream
- Added a new container for MISP Version 2.4.95
  - Added syslog-ng to colllect all logfile and extract it to docker standard stdout and stderr stream

## Release Candidate 0.2.2
#### Update Informations
In this Release we fixes a lot of bugs.
#### General Changes
Besides the bugfixing, no general changes were made.
#### Fixes & Improvements
* Bugfixing for importing mysql misp scheme
* Bugfixing for mysql create user failure after container restart
* Bugfixing for apache2 configs files
* Change logfiles to output directly to docker [ /dev/stdout ]
#### Detailed Changes
* After start of the container the mysql entrypoint script does not import the MISP database scheme correctly. Therefore it wasn't accessible for the MISP application.
* After start of the container the mysql entrypoint script does not create the required MySQL user. Therefore MISP application can not have any access to the database:
* The apache2 entrypoint scripts has bugs and does not start. Therefore we fixed it.
* On the docker node you can with `docker logs <container_name>` show your logs into the container. This 'logs' are all logs send to /dev/stdout or /dev/stderr. Therefore we symlinked all required logfiles to this files to get the output of all without the requirement of any log software.





## Release Candidate 0.2.1
#### Update Informations
In this Release we clean up the files into the repository.
#### General Changes
Besides the bugfixing, no general changes were made.
#### Fixes & Improvements
* Delete unsued ansible playbook file
#### Detailed Changes
* We delete an unused site.yml ansible playbook file





## Release Candidate 0.2.0
#### Update Informations
In this Release we add an container for MISP version `2.4.88` and `2.4.89`. Additionaly we add travis-ci for an continous integration process.
Also we add labels for Version and MISP tag into the container.
#### General Changes
We added for all container proxy support via environment variables and changed the build and push process and scripts.
#### Fixes & Improvements
* Create new build and deploy process
* Update README.md
* Add proxy support
* Update container MISP 2.4.88 and 2.4.89
* Add new container 2.4.90
* Add new container 2.4.91
* Add new container 2.4.92
* Delete hub.docker.com build hook
#### Detailed Changes
* We created a new improved build and deploy process, which is more flexible and can be used for all container repostories. It add the build time and much more arguments into the docker build task.
* Update README.md
* We add http and https proxy support for all existing containers.
* We updated 2.4.88 and 2.4.89 to support the new argument variables and fixing bugs.
* We add a new container with MISP version 2.4.90
* We add a new container with MISP version 2.4.91 & 2.4.92. In this and all future container we added redis and mysql directly into it. Because it brings failure states if the mysql container is external. We want make this backward if all tests are succeed.
* We deleted the build hook file for hub.docker.com, because now travis-ci build the container and not more hub.docker.com. The reason is travis-ci build more container at the same time and is faster and this without any payment.


## Release Candidate 0.1.0
#### Update Informations
In this Release we add an container for MISP version `2.4.88` and `2.4.89`. Additionaly we add travis-ci for an continous integration process.
Also we add labels for Version and MISP tag into the container.
#### General Changes
We add for all containers new build argument variables and new labels.
#### Fixes & Improvements
* Add Travis-ci
* Update readme file
* Change docker container label
#### Detailed Changes
* All futured Docker container are build automatically via Travis-CI. The Travis-CI build the docker and pushes to hub.docker.com with an '-dev' tag therefore the container is misp-dockerized-server-2.4.88-dev. Only our main repository DCSO/misp-dockerized can this container push into hub.docker.com without dev tag after the main repository test that the whole environment is ready.
* We updated the Readme file to bugfix smaller typos
* We add on the docker container for MISP versin 2.4.88 and 2.4.89 the label version and misp tag to detect the version and misp tag into the docker container itself.
