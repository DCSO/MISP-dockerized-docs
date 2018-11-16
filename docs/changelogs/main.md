Changelog MISP-dockerized
=========================




## Changelog for Release Candidate 0.3.4
### Update Informations
This update fixes an error with incorrectly mounted MISP volumes that caused the required disk space to exceed the normal value. Therefore, before updating, make sure that you have up-to-date backups. We have also made small bugfixes for the Docker-compose, ansible and build_script.sh.
### General Changes
No general changes have been made in this release.
### Detailed Changes
#### Main Repository
##### Detailed Changes, Fixes & Improvements
- FIX: False volumes in docker-compose
- FIX: Fixed a bug that caused a password with special characters like pip | to fail and docker-compose could not be executed.
- FIX: A bug in the Ansible Server Playbook with incorrectly mounted MISP volumes has been fixed.
- ADD: Add `sleep` times into makefile for better user experience





## Changelog for Release Candidate 0.3.3
### Update Informations
In this release, we have only made small bug fixes that affect the tagging and build process for creating the productive MISP dockered images on hub.docker.com and internal gitlab-ci.

### General Changes
No general changes have been made in this release.

### Detailed Changes
#### Main Repository
##### Detailed Changes, Fixes & Improvements
- FIX: Modified gitlab-ci for the repository url parameter to tagging.sh
- FIX: Modified tagging.sh shell script to find the right image and retag it



## Changelog for Release Candidate 0.3.2
### Update Informations
In this release, we have only made small bug fixes that affect the tagging and build process for creating the productive MISP dockered images on hub.docker.com and internal gitlab-ci.

### General Changes
No general changes have been made in this release.

### Detailed Changes
#### Main Repository
##### Detailed Changes, Fixes & Improvements
- FIX: Modified pull branch for travis from stable to master.
- Modified push.sh shell script to force -dev image deletion





## Changelog for Release Candidate 0.3.1
### Update Informations
In this release, we have only made small bug fixes that affect the tagging and build process for creating the productive MISP dockered images on hub.docker.com and internal gitlab-ci.

### General Changes
No general changes have been made in this release.

### Detailed Changes
#### Main Repository
##### Detailed Changes, Fixes & Improvements
- FIX: Added alpine packages which are required for internal gitlab-ci
- FIX: Modified pull branch for travis from stable to master.
- Modified push.sh shell script to made more clear why it delete images






## Changelog for Release Candidate 0.3.0
### Update Informations
In this release we have made several small improvements to the container and build scripts, which include the first preparations for support of Kubernetes and tools like gitlab-ci, which will help us to create more complex automated tests. We now also offer a new container for MISP modules. Additionally, we have added support for the new MISP versions 2.4.93, 2.4.94 and 2.4.95.

With the new release it is now also possible to load containers from the DCSO Docker Respository, which only needs one network endpoint and is therefore easier to use in enterprise environments behind firewalls and/or proxies.

### General Changes
- The MISP proxy now requires less configuration and is easier to set up, which is easier for us to support as well.
- 1st preparation for a kubernetes installation method
- Added Support for MISP versions 2.4.93, 2.4.94, 2.4.95

### Detailed Changes
#### Main Repository
##### Detailed Changes, Fixes & Improvements
- Added internal gitlab-ci support
- Added support for different Docker registries that can be selected during installation.
- Added an Syslog Example for the Docker Host to extract the MISP-dockerized logs from all other.
- Modified Docker-compose	
	- restart on-failure to restart unless-stopped
  	- Added MISP-Modules Container
  	- Added Environment Variables
  	- Added Syslog driver options
- Modified Shell scripts
  	- Deactivated Image deletion on `make delete`
  	- Pull first Images, then start via docker-compose
  	- Modified requirements script to disable every user interaction
  	- Added an upgrade script
- Modified Ansible Playbook
  	- Improved PGP and S/MIME Options
  	- Normalized ansible Variables

#### Container `misp-dockerized-server`
##### General/Update Informations
In this Release Candidate we have added a new container with improved configurations, updated the old one for a bugfix and improved the build scripts for gitlab-ci support.

##### Detailed Changes, Fixes & Improvements
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

#### Container `misp-dockerized-robot`
##### General/Update Informations
In this Release Candidate we have added a new container with improved configurations, updated the old one for a bugfix and improved the build scripts for gitlab-ci support.

##### Detailed Changes, Fixes & Improvements
- Added internal gitlab-ci support
  We have changed the shell scripts to support a second docker registry. Now the scripts look for a variable with the name `INTERNAL_REGISTRY_HOST`.  
- Added new container 1.0.3
  We have added a new LABEL standard and prepared dockerfile for the next upgrade release.
- Now a salt will be generated during the installation

#### Container `misp-dockerized-postfix`
##### General/Update Informations
In this Release Candidate we have added a new container with improved configurations, updated the old one for a bugfix and improved the build scripts for gitlab-ci support.
##### Detailed Changes, Fixes & Improvements
- Added internal gitlab-ci support
  We have changed the shell scripts to support a second docker registry. Now the scripts looks for a variable with the name `INTERNAL_REGISTRY_HOST`.  
- 1.0.0
  - Change LABELs on 1.0.0
    We made the LABELs more variable.
  - Remove debugging mode from entrypoint file
    We changed `set -exv` to `set -e`
  - Bugfixing syslog-ng configuration
    We fixed mistakes with semicolons.
- Add new container 1.0.1
    We add a new LABEL standard and prepared dockerfile for the next upgrade release.

#### Container `misp-dockerized-proxy`
##### General/Update Informations
We have changed the file name convention for the NGINX configuration setup. In 1.0.0 and 1.0.1 we used two NGINX configuration files, one for HTTPS and one only for HTTP. We have changed this and are using now one HTTPS file only.
At build time a self-signed cert is now created. Therefore a HTTP only configuration file is not required anymore.
Please make sure to disable the NGINX configuration volume to get the new file. Or make a backup. Delete all and start from scratch and restore the backup.

##### Detailed Changes, Fixes & Improvements
- Fix Healthcheck of 1.0.0 and 1.0.1
  The cURL Package was not found and is now installed at build time.
- Added internal gitlab-ci support
  We have changed the shell scripts to support a second docker registry. Now the scripts looks for a variable with the name `INTERNAL_REGISTRY_HOST`.  
- Fixed IP restriction file on 1.0.1
  `allow 0.0.0.0;` led to a mistake. The new value is: `allow all;`
- Added new container 1.0.2
  	- We have added a new container, for new LABEL structure and additional VERSION and NAME environment variable.
  	- We have prepared our proxy for a monitoring solution in the future
  	- We have renamed the proxy_vars file
  	- We have changed the logfile path to stdout and stderr

#### Container `misp-dockerized-modules`
##### General/Update Informations
A new container which contains the [MISP-Modules|https://github.com/MISP/misp-modules] and is ready for use within the MISP platform.

##### Detailed Changes, Fixes & Improvements
- Added internal gitlab-ci support
  We have changed the shell scripts to support a second docker registry. Now the scripts look for a variable with the name `INTERNAL_REGISTRY_HOST`.  
- Added hub.docker.com token for notification
  Added token for travis-ci to inform hub.docker.com about a new image.
- Added new container 1.0.1
  We have added a new LABEL standard and prepared dockerfile for the next upgrade release.








## Changelog for Beta Release Candidate 0.2.0
### Update Informations 
We have made some major changes in the container and build structure, therefore these version __is not__ directly compatible to older versions of __MISP-dockerized__. An update from a old installation is possible but has to be done manually. However, we do not plan to have another breaking change within the beta and with all new release of __MISP-dockerized__, beginning with the upcoming release v0.3.0, all MISP-dockerized versions will have integrated an upgrade script which helps you to update your running instances.

We have found that the MISP-linked versioning of our releases is somewhat unclear, as we support multiple versions of MISP (for a list of available and supported versions, see the readme file) and have therefore changed the tagging of our releases.

Another significant change results from an error described here: https://github.com/DCSO/MISP-dockerized/issues/19. This is confirmed as an official MISP software bug (https://github.com/MISP/MISP/issues/3244). In order to provide a stable and running instance, we had to change our container structure due to this error. Therefore, the database and Redis now run within the `misp-dockerized-server`. We plan to switch back to our original container design in the next releases as soon as the bug is fixed. 

### General Changes
* New hub.docker.com repositories that we have changed from `misp-<CONTAINER>` to `misp-dockerized-<CONTAINER>`
* Changed the build process for the container
    * now the containers were created by github and travis using their own repository and uploaded as `misp-dockerized-<CONTAINER>:<version>-<base>-dev` tag to hub.docker.com
    * The main repository `MISP-dockerized` tests the images and uploaded them as `misp-dockerized-<CONTAINER>:<version>-<base>` (without '-dev')
* Changed the location of ansible playbooks and shell scripts from MISP-dockerized-robot repository to MISP-dockerized repository
* Improved Backup and Recovery scripts

### Detailed Changes
#### Changed Ansible Scripts
* Ansible script now creates a self signed certificate if none is found
* Improved the task for copying certificate, private key and Diffie-Hellman parameters to the volume
* Improved import database section
* Improved all ansible scripts to use ansible modules if possible 

#### `misp-dockerized-server` container with the following features / changes
* Created a new build and deployment process
    * Now the container creates a `version-base-dev` tag and the main repository MISP-dockerized create the `version-base` tag to push only images that are ready for operation.
* Updated README.md
    * Add sections in usage
* Deleted hub.docker.com hooks
* Modified MISP 2.4.88 
    * Modified Dockerfile to support HTTPS PROXY
* Modified MISP 2.4.89
    * Modified Dockerfile to support HTTPS PROXY
* Added MISP 2.4.90
    * Modified Dockerfile to support HTTPS PROXY
* Added MISP 2.4.91
    * Updated Server Configuration to support integrated redis and mysql
    * Modified Dockerfile to HTTPS PROXY Support
    * MISP MySQL scheme is now directly imported
    * New function that sends logfiles to /dev/stdout, so you can view the logs with `docker logs -f misp-server`
* Added MISP 2.4.92
    * Updated Server Configuration to support integrated redis and mysql
    * Modified Dockerfile to support HTTPS PROXY
    * Deleted Dockerfile for hub.docker.com; no build hook is available
    * Modified all Dockerfiles to support HTTPS PROXY
    * MISP MySQL scheme is now directly imported
    * New function that sends logfiles to /dev/stdout, so you can view the logs with `docker logs -f misp-server`

####  `misp-dockerized-robot` container with the following features / changes:
* Ticket MDD-19 finished | Improved ansible scripts
* Added rng-tool on 1.0.2 robot version to get a better entropy.
* Added origin robot 1.0.0 and 1.0.1 version
* Added new Robot Version 1.0.2
    * The new robot now has no ansible scripts included. The ansible scripts are mounted via docker-compose through the misp-dockerized repository.
    * Changed folder structure therefore also requires a change in the Playbook
    * Deleted SSH Keys and hosts files that are not used anymore
* Updated Makefile, build.sh & travis.yml
* All docker files have been modified to support HTTPS PROXY
* Deleted hub.docker.com hooks
* Improved Readme
* Improved Backup and Recovery scripts
* Create new build and deploy process
    * Now the container create a `version-base-dev` tag and the main repository MISP-dockerized create the `version-base` tag to push only images that are ready for operation.


#### `misp-dockerized-proxy` container with the following features / changes:
* Added Proxy Version 1.0.1-alpine
* Added HTTPS Proxy Environment Variable to all versions
* Deleted hub.docker.com hooks
* Create new build and deploy process
    * Now the container create a `version-base-dev` tag and the main repository MISP-dockerized create the `version-base` tag to push only images that are ready for operation.

#### `NEW` `misp-dockerized-postfix` container with the following features / changes:
* Added a new docker container for mail relaying.
* This close ticket MDD-14 with Postfix as relay.
* Added new Postfix container with version 1.0.0 with alpine as base image
* Updated README.md
    * Add sections in Usage
* Created new build and deploy process
    * Now the container create a `version-base-dev` tag and the main repository MISP-dockerized create the `version-base` tag to push only images that are ready for operation.






## Changelog for Release Candidate 0.1.2
## Main Changes
- Removed all docker container from misp-dockerized repository to own docker container repositories:
   - [MISP-dockerized-server
](https://github.com/DCSO/MISP-dockerized-server)
  -  [MISP-dockerized-proxy
](https://github.com/DCSO/MISP-dockerized-proxy)
  -  [MISP-dockerized-robot
](https://github.com/DCSO/MISP-dockerized-robot)
- remove dependency on the docker node:
  - docker-compose
  - ansible 

## Bugfixes and smaller improvements
- Improve Makefile
  - improve help section
  - removed commands which are not more required
  - add new commands:
    - `make start`: no other command is required to start the full environment
    - `make configure`: execute ansible scripts to configure all docker container in one command
    - `make config-db`: execute ansible database script
    - `make config-server`: execute ansible server script
    - `make config-proxy`: execute ansible proxy script
    - `make backup-robot`: execute backup script for misp-robot
- Improve Readme
- Improve Backup Script 
- Improve script to delete all volumes, networks, images and container

## Enhancements
- Add travis-ci as automatic continious integration
  - download dev docker container and test full deployment method
  - if test is successfully travis-ci push container to offical docker registry.
- Backup Script
  - Now you can set your backup path directly via CLI
  - Files from `config` Folder will be saved, too
- Docker container versions pinned in docker-compose file
- Add check write permissions to `requirements.sh` script
- All scripts not required to run on docker node moved into misp-robot docker container


## Changelog for Release Candidate 0.1.1
### Update Informations 
Beta release for the v2.4.88 MISP upstream version.
### General Changes
No general changes.
### Fixes & Improvements
Included in the Release:
* add LICENSE File
* add logo for the Readme on hub.docker.com
* add Readme Files for every container
* Bug fixing for misp-server to build the container on hub.docker.com
* mod build_config.sh to deactivate linking of .env file and copy it 
* remove starting space for .env file



## Changelog for Release Candidate 0.1.0
### Update Informations 
Initial release for the v2.4.88 MISP upstream version.
Included in the Release:
- dockerfile to build docker container via hub.docker.com
- docker-compose file
- backup and restore script
- makefile
- build configuration script
### General Changes
We introduced the new MISP-dockerized.
### Fixes & Improvements
- Add new Environment which contains an proxy, robot and misp application server
