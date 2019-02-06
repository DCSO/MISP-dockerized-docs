# MISP-dockerized


## Release Candidate 1.0.1
[View release on Github.com](https://github.com/DCSO/MISP-dockerized/releases/tag/v1.0.1)
### About
MISP dockerized is a project designed to provide an easy-to-use and easy-to-install 'out of the box' MISP instance that includes everything you need to run MISP with minimal host-side requirements.

MISP dockerized uses MISP (Open Source Threat Intelligence Platform - https://github.com/MISP/MISP), which is maintained and developed by the MISP project team (https://www.misp-project.org/).

MISP-dockerized provides the following features:
* 3-steps (in 5 minute or less) ready MISP instance
* Built in MISP modules
* Built in mail transport via postfix
* Prehardened TLS configuration
* Default http to https redirect
* Easy-to-use script based backup and restore function
* Prebuilt management commands to ease maintenance efforts
* Periodically built Docker containers
* Automated test framework to test new MISP releases
---
### Update Informations
This release is a minor release and has fixed a bug in the CI files.
### General Changes
No general changes have been made in this release.
### Detailed Changes
#### Main Repository
##### Detailed Changes, Fixes & Improvements
- We fixed a bug in the container tag mechanism for the Travis CI
- we fixed a bug in the container tag mechanism for the Gitlab CI
- Added a new parameter variable 'DEV' for build_config.sh

---

## Release Candidate 1.0.0
[View release on Github.com](https://github.com/DCSO/MISP-dockerized/releases/tag/v1.0.0)
This release represents the first production release of MISP-Dockerized in version 1.0.0.
### About
MISP dockerized is a project designed to provide an easy-to-use and easy-to-install 'out of the box' MISP instance that includes everything you need to run MISP with minimal host-side requirements.

MISP dockerized uses MISP (Open Source Threat Intelligence Platform - https://github.com/MISP/MISP), which is maintained and developed by the MISP project team (https://www.misp-project.org/).

MISP-dockerized provides the following features:
* 3-steps (in 5 minute or less) ready MISP instance
* Built in MISP modules
* Built in mail transport via postfix
* Prehardened TLS configuration
* Default http to https redirect
* Easy-to-use script based backup and restore function
* Prebuilt management commands to ease maintenance efforts
* Periodically built Docker containers
* Automated test framework to test new MISP releases
-----------------------------
### Update Informations
This release includes the new MISP server container version 2.4.99
In addition, we have changed the following:
- the proxy container version to the latest version 1.X
- the robot container version to the latest version 2.X
- the misp-module container version to the latest version 1.X
### General Changes
- We have changed our complete directories. Now you have access to all unsupported and old version of MISP-dockerized.
- There is a new NEW_FRESH_INSTAL.sh script
- We have added a new UPGRADE.sh script
- We have added a new UPDATE.sh script
- Added the new MISP-Server Container with MISP Version 2.4.99 (#39)
### Detailed Changes
#### Main Repository
##### Detailed Changes, Fixes & Improvements
- Deactivated the Ansible script for database and server, because since version 2.4.97 the misp-server container does not require Ansible anymore
- Changed misp-robot from 1.0.3-ubuntu to 2.x-debian
- Changed misp-server from 2.4.94 to 2.4.99
- Removed unused container content in docker-compose.yml
- Added docker-compose.override.yml to add the user configuration
- Removed misp-postfix container, because postfix is now directly installed in the misp-server
- Changed volume paths from misp-server (done since version 0.3.4)
#### Container `misp-dockerized-server`
##### Update Informations
Features of the release:
- Added a new MISP-Server Container for MISP release 2.4.99 on base of 2.4.97. (closes #39)
  For more information please have a look at the official changelog at https://github.com/MISP/MISP/releases/tag/v2.4.99
- Changed to a new gitlab-ci job structure for all misp-server container
- Built in mail transport via postfix
- Built in redis
- Built in rsyslog-ng
- Built in MariaDB
##### Detailed Changes, Fixes & Improvements
- The following base changes were made in addition to the new `misp-server version 2.4.97`:
   - The base image is now **debian stretch** instead of ubuntu 18.04
   - Postfix is now directly installed - the postfix container is no longer necessary 
   - Added a cron shell script that fetches and caches all enabled feeds and pull all remote server events
   - Changed from syslog-ng to rsyslog, because in debian the syslog-ng doesn't support wildcard configuration for logfiles.
   - **The external requirement for our Ansible playbook is no longer necessary for this container**
- Gitlab-CI Strucutre
  Included statements in the Gitlab CI main file allow us to improve and simplify our Gitlab CI main file.
- Added an echo tag  to know from which entrypoint script a message comes.
- Added on the misp-server 2.4.97-2.4.99 functions to create self-signed certificate, private key and DH params file
#### Container `misp-dockerized-robot`
##### Update Informations 
Features of the release:
- Built in Docker
- Built in Ansible
- Built in Test framework
- Docker Container image is based now on debian:stretch-slim

In the past, we decided to use a three-digit version number for small and large changes for this container repository. This has proved unnecessary as the main repository is the central repository for new releases and all changes are already tracked here. We have therefore decided to change the 3-digit version number in all minor repositories to a 2-digit version number.
For example: 1.0.1 -> 1.1

The second digit is changed any time we make minor changes. The first digit changes whenever we make major changes, e.g. a new base image.
##### Detailed Changes, Fixes & Improvements
- Changed from the base image debian:stable-slim to debian:stretch-slim 
- Remove unused robot versions:
    - 1.0.2-debian
    - 1.0.3-debian
    - 1.0.4-ubuntu
- All folders have been renamed, e.g. from 1.0.0.0-alpin to 1.0-alpin.
- We have made working with gitlab-ci easier with new extensions and includes.
- We have also reduced the readme as much as possible, as the documentation is now available centrally in our own documentation repository `https://dcso.github.io/MISP-dockerized-docs/`.
#### Container `misp-dockerized-proxy`
##### Update Informations 
Features of the release:
- Prehardened TLS configuration
- Default http to https redirect
- Built in User defined IP restriction
- Added the ability to create self-signed certificates.

In the past, we decided to use a three-digit version number for small and large changes for this container repository. This has proved unnecessary as the main repository is the central repository for new releases and all changes are already tracked here. We have therefore decided to change the 3-digit version number in all minor repositories to a 2-digit version number.
For example: 1.0.1 -> 1.1

The second digit is changed any time we make minor changes. The first digit changes whenever we make major changes, e.g. a new base image.
##### Detailed Changes, Fixes & Improvements
- Added an own entrypoint script to create user defined files
- Added the possibility to create self-signed certificates
- All folders have been renamed, e.g. from 1.0.0.0-alpin to 1.0-alpin.
- We have made working with gitlab-ci easier with new extensions and includes.
- We have also reduced the readme as much as possible, as the documentation is now available centrally in our own documentation repository `https://dcso.github.io/MISP-dockerized-docs/`.
#### Container `misp-dockerized-misp-modules`
##### Update Informations 
Features of the release:
- Pre-Installed MISP modules

In the past, we decided to use a three-digit version number for small and large changes for this container repository. This has proved unnecessary as the main repository is the central repository for new releases and all changes are already tracked here. We have therefore decided to change the 3-digit version number in all minor repositories to a 2-digit version number.
For example: 1.0.1 -> 1.1

The second digit is changed any time we make minor changes. The first digit changes whenever we make major changes, e.g. a new base image.
##### Detailed Changes, Fixes & Improvements
- Pre-Installed debian stretch MISP modules container
- All folders have been renamed, e.g. from 1.0.0.0-debian to 1.0-debian.
- We have made working with gitlab-ci easier with new extensions and includes.
- We have also reduced the readme as much as possible, as the documentation is now available centrally in our own documentation repository `https://dcso.github.io/MISP-dockerized-docs/`.




## Beta Release Candidate 0.3.4 
[View release on Github.com](https://github.com/DCSO/MISP-dockerized/releases/tag/v0.3.4-beta)
### Update Information
This update fixes an error with incorrectly mounted MISP volumes that caused the required disk space to exceed the normal value. Therefore, before updating, make sure that you have up-to-date backups. We fixed small bugs for the docker-compose, Ansible and build_script.sh.
### General Changes
No general changes have been made in this release.
### Detailed Changes
#### Main Repository
##### Detailed Changes, Fixes and Improvements
- Fixed false volumes in docker-compose
- Fixed a bug that caused a password with special characters like pipe '|' to fail and docker-compose could not be executed.
- Fixed a bug in the Ansible server playbook with incorrectly mounted MISP volumes has been fixed.
- Added `sleep` times into makefile for better user experience



## Beta Release Candidate 0.3.3 
[View release on Github.com](https://github.com/DCSO/MISP-dockerized/releases/tag/v0.3.3-beta)
### Update Information
In this release, we fixed only small bugs that affect the tagging and build process for creating the productive MISP-dockerized images on hub.docker.com and internal Gitlab CI.
### General Changes
No general changes have been made in this release.
### Detailed Changes
#### Main Repository
##### Detailed Changes, Fixes and Improvements
- Fixed Gitlab CI for the repository url parameter to tagging.sh
- Fixed tagging.sh shell script to find the right image and re-tag it


## Beta Release Candidate 0.3.2 
[View release on Github.com](https://github.com/DCSO/MISP-dockerized/releases/tag/v0.3.2-beta)
### Update Information
In this release, we fixed only small bugs that affect the tagging and build process for creating the productive MISP-dockerized images on hub.docker.com and internal Gitlab CI.
### General Changes
No general changes have been made in this release.
### Detailed Changes
#### Main Repository
##### Detailed Changes, Fixes and Improvements
- Modified pull branch for Travis CI from stable to master.
- Modified push.sh shell script to force '-dev' image deletion


## Beta Release Candidate 0.3.1 
[View release on Github.com](https://github.com/DCSO/MISP-dockerized/releases/tag/v0.3.1-beta)
### Update Information
In this release, we fixed only small bugs that affect the tagging and build process for creating the productive MISP-dockerized images on hub.docker.com and internal Gitlab CI.
### General Changes
No general changes have been made in this release.
### Detailed Changes
#### Main Repository
##### Detailed Changes, Fixes and Improvements
- Added alpine packages which are required for internal Gitlab CI
- Modified pull branch for travis from stable to master.
- Modified push.sh shell script to made more clear why it delete images


## Beta Release Candidate 0.3.0 
[View release on Github.com](https://github.com/DCSO/MISP-dockerized/releases/tag/v0.3.0-beta)
### Update Information
In this release we made several improvements to the container and build scripts, which include the first preparations for support of Kubernetes and tools like Gitlab CI, which will help us to create more complex automated tests. We now also offer a new container for MISP modules. Additionally, we have added support for the new MISP versions 2.4.93, 2.4.94 and 2.4.95.

With the new release it is now also possible to load containers from the [DCSO Docker Respository](https://dockerhub.dcso.de/v2), which only needs one network endpoint and is therefore easier to use in enterprise environments behind firewalls and/or proxies.

### General Changes
- The MISP proxy now requires less configuration and is easier to set up, which is easier for us to support as well.
- 1st preparation for a kubernetes installation method
- Added Support for MISP versions 2.4.93, 2.4.94, 2.4.95

### Detailed Changes
#### Main Repository
##### Detailed Changes, Fixes and Improvements
- Added internal Gitlab CI support
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
  	- Normalized Ansible Variables

#### Container `misp-dockerized-server`
##### General/Update Information
In this release candidate we added a new container with improved configuration, updated the old container and improved the build scripts for Gitlab CI support.

##### Detailed Changes, Fixes and Improvements
- Added internal Gitlab CI support
  We have changed the shell scripts to support a second Docker registry. Now the script looks for a variable called `INTERNAL_REGISTRY_HOST`.
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
  	- Added syslog-ng to collect all log file and extract it to Docker standard stdout and stderr stream
- Added a new container for MISP Version 2.4.95
  	- Added syslog-ng to collect all log file and extract it to Docker standard stdout and stderr stream

#### Container `misp-dockerized-robot`
##### General/Update Information
In this release candidate we added a new container with improved configuration, updated the old container and improved the build scripts for Gitlab CI support.

##### Detailed Changes, Fixes and Improvements
- Added internal Gitlab CI support
  We have changed the shell scripts to support a second Docker registry. Now the scripts look for a variable with the name `INTERNAL_REGISTRY_HOST`.  
- Added new container 1.0.3
  We have added a new LABEL standard and prepared dockerfile for the next upgrade release.
- Now a salt will be generated during the installation

#### Container `misp-dockerized-postfix`
##### General/Update Information
In this release candidate we added a new container with improved configuration, updated the old container and improved the build scripts for Gitlab CI support.
##### Detailed Changes, Fixes and Improvements
- Added internal Gitlab CI support
  We have changed the shell scripts to support a second Docker registry. Now the scripts looks for a variable with the name `INTERNAL_REGISTRY_HOST`.  
- 1.0.0
  - Change LABELs on 1.0.0
    We made the LABELs more variable.
  - Remove debugging mode from entrypoint file
    We changed `set -exv` to `set -e`
  - We fixed the syslog-ng configuration
    We fixed mistakes with semicolons.
- Add new container 1.0.1
    We add a new LABEL standard and prepared dockerfile for the next upgrade release.

#### Container `misp-dockerized-proxy`
##### General/Update Information
We have changed the file name convention for the NGINX configuration setup. In 1.0.0 and 1.0.1 we used two NGINX configuration files, one for HTTPS and one only for HTTP. We have changed this and are using now one HTTPS file only.
At build time a self-signed cert is now created. Therefore a HTTP only configuration file is not required anymore.
Please make sure to disable the NGINX configuration volume to get the new file. Or make a backup. Delete all and start from scratch and restore the backup.

##### Detailed Changes, Fixes and Improvements
- Fix Healthcheck of 1.0.0 and 1.0.1
  The cURL Package was not found and is now installed at build time.
- Added internal Gitlab CI support
  We have changed the shell scripts to support a second Docker registry. Now the scripts looks for a variable with the name `INTERNAL_REGISTRY_HOST`.  
- Fixed IP restriction file on 1.0.1
  `allow 0.0.0.0;` led to a mistake. The new value is: `allow all;`
- Added new container 1.0.2
  	- We have added a new container, for new LABEL structure and additional VERSION and NAME environment variable.
  	- We have prepared our proxy for a monitoring solution in the future
  	- We have renamed the proxy_vars file
  	- We have changed the log file path to stdout and stderr

#### Container `misp-dockerized-modules`
##### General/Update Information
A new container which contains the [MISP-Modules|https://github.com/MISP/misp-modules] and is ready for use within the MISP platform.

##### Detailed Changes, Fixes and Improvements
- Added internal Gitlab CI support
  We have changed the shell scripts to support a second Docker registry. Now the scripts look for a variable with the name `INTERNAL_REGISTRY_HOST`.  
- Added hub.docker.com token for notification
  Added token for travis-ci to inform hub.docker.com about a new image.
- Added new container 1.0.1
  We have added a new LABEL standard and prepared dockerfile for the next upgrade release.








## Beta Release Candidate 0.2.0 
[View release on Github.com](https://github.com/DCSO/MISP-dockerized/releases/tag/v0.2.0-beta)
### Update Information 
We have made some major changes in the container and build structure, therefore these version **is not** directly compatible to older versions of **MISP-dockerized**. An update from a old installation is possible but has to be done manually. However, we do not plan to have another breaking change within the beta and with all new release of **MISP-dockerized**, beginning with the upcoming release v0.3.0, all MISP-dockerized versions will have integrated an upgrade script which helps you to update your running instances.

We found that the MISP linked versioning of our releases is somewhat unclear, as we support multiple versions of MISP and have therefore changed the tagging of our releases.

Another significant change results from an error described here: https://github.com/DCSO/MISP-dockerized/issues/19. This is confirmed as an official MISP software bug (https://github.com/MISP/MISP/issues/3244). In order to provide a stable and running instance, we had to change our container structure due to this error. Therefore, the database and redis now run within the `misp-dockerized-server`. We plan to switch back to our original container design as soon as the bug is fixed. 
### General Changes
* New hub.docker.com repositories that we have changed from `misp-<CONTAINER>` to `misp-dockerized-<CONTAINER>`
* Changed the build process for the container
    * The containers were created by github.com and Travis CI using their own repository. The images are uploaded as `misp-dockerized-<CONTAINER>:<version>-<base>-dev` tag and repository to hub.docker.com.
    * The main repository `MISP-dockerized` downloads, test and upload the images as `misp-dockerized-<CONTAINER>:<version>-<base>` (without '-dev')
* Changed the location of Ansible playbooks and shell scripts from MISP-dockerized-robot repository to MISP-dockerized repository
* Improved backup and recovery scripts
### Detailed Changes
#### Changed Ansible Scripts
* Ansible script now creates a self signed certificate if none is found
* Improved the task for copying certificate, private key and Diffie-Hellman parameters to the volume
* Improved import database section
* Improved all Ansible scripts to use Ansible modules if possible 
#### *misp-dockerized-server* container with the following features / changes
* Created new build and deploy process
    * The container create a `<version>-<base>-<dev>` tag and the main repository MISP-dockerized create the `<version>-<base>` tag to push only images that are ready for operation.
* Updated README.md
* Deleted hub.docker.com hooks
* Modified Dockerfile to support HTTPS proxy in MISP server container version 2.4.88 
* Modified Dockerfile to support HTTPS proxy in MISP server container version 2.4.89
* Modified Dockerfile to support HTTPS proxy in MISP server container version 2.4.90 
* Added MISP server version 2.4.91
    * Updated server configuration to support integrated redis and mysql
    * Deleted explicit Dockerfile for hub.docker.com
    * Modified Dockerfile to support HTTPS proxy
    * MISP MySQL scheme is now directly imported
    * New function that sends log files to /dev/stdout, so you can view the logs with `docker logs -f misp-server`
* Added MISP server version 2.4.92
    * Updated server configuration to support integrated redis and mysql
    * Deleted explicit Dockerfile for hub.docker.com
    * Modified Dockerfile to support HTTPS proxy
    * MISP MySQL scheme is now directly imported
    * New function that sends log files to /dev/stdout, so you can view the logs with `docker logs -f misp-server`
####  *misp-dockerized-robot* container with the following features / changes:
* Closed ticket MDD-19: Improved Ansible scripts
* Added rng-tool on 1.0.2 robot version to get a better entropy.
* Added origin robot 1.0.0 and 1.0.1 version
* Added new robot version 1.0.2
    * The new robot now has no Ansible scripts included. The Ansible scripts are mounted via docker-compose through the misp-dockerized repository.
    * Changed folder structure therefore also requires a change in the Playbook
    * Deleted SSH keys and hosts files that are not used anymore
* Updated makefile, build.sh & travis.yml
* All Docker files have been modified to support HTTPS proxy
* Deleted hub.docker.com hooks
* Improved readme
* Improved backup and recovery scripts
* Created new build and deploy process
    * The container create a `<version>-<base>-<dev>` tag and the main repository MISP-dockerized create the `<version>-<base>` tag to push only images that are ready for operation.
#### *misp-dockerized-proxy* container with the following features / changes:
* Added proxy version 1.0.1-alpine
* Added HTTPS proxy environment variable to all versions
* Deleted hub.docker.com hooks
* Created new build and deploy process
    * The container create a `<version>-<base>-<dev>` tag and the main repository MISP-dockerized create the `<version>-<base>` tag to push only images that are ready for operation.
#### **NEW** **misp-dockerized-postfix** container with the following features / changes:
* Added a new Docker container for mail relaying.
  * This close ticket MDD-14 with Postfix as relay.
* Added new Postfix container with version 1.0.0 with Alpine as base image
* Updated README.md
    * Added text in chapter Usage
* Created new build and deploy process
    * The container create a `<version>-<base>-<dev>` tag and the main repository MISP-dockerized create the `<version>-<base>` tag to push only images that are ready for operation.






## Beta Release Candidate 0.1.2 
[View release on Github.com](https://github.com/DCSO/MISP-dockerized/releases/tag/v0.1.2-beta)
### Update Information
- Removed all Docker container from misp-dockerized Git repository to own Docker container repositories:
   - [MISP-dockerized-server
](https://github.com/DCSO/MISP-dockerized-server)
  -  [MISP-dockerized-proxy
](https://github.com/DCSO/MISP-dockerized-proxy)
  -  [MISP-dockerized-robot
](https://github.com/DCSO/MISP-dockerized-robot)
- Removed dependencies on the Docker node:
  - docker-compose
  - Ansible 
### General Changes
No general changes have been made in this release.
### Fixes and Improvements
- Improved makefile
  - Improved help section
  - Removed commands which are not more required
  - Added new commands:
    - `make start`: no other command is required to start the full environment
    - `make configure`: execute Ansible scripts to configure all Docker container in one command
    - `make config-db`: execute Ansible database script
    - `make config-server`: execute Ansible server script
    - `make config-proxy`: execute Ansible proxy script
    - `make backup-robot`: execute backup script for misp-robot
- Improved readme
- Improved backup script 
- Improved script to delete all volumes, networks, images and container
- Added Travis CI as automatic continuous integration
  - Travis CI download '-dev' tagged Docker container from his own repository and test full deployment
  - If test is successfully Travis CI push container to hub.docker.com Docker registry without '-dev' tag.
- Backup script
  - Now you can set your backup path directly via CLI
  - Files from `config` Folder will be saved, too
- Added Docker container version pinning in docker-compose file
- Added check write permissions to `requirements.sh` script
- Removed dependency of docker-compose and Ansible on the Docker node and moved this into an robot container.


## Beta Release Candidate 0.1.1 
[View release on Github.com](https://github.com/DCSO/MISP-dockerized/releases/tag/v0.1.1-beta)
### Update Information 
Minor release for the v2.4.88 MISP server version.
### General Changes
No general changes have been made in this release.
### Fixes and Improvements
Included in the Release:
* Added LICENSE File
* Added logo for the Readme on hub.docker.com
* Added Readme Files for every container
* Fixed MISP server container to build container on hub.docker.com
* Modified build_config.sh to deactivate linking of .env file and copy it 
* Removed starting space for .env file



## Beta Release Candidate 0.1.0 
[View release on Github.com](https://github.com/DCSO/MISP-dockerized/releases/tag/v0.1.0-beta)
### About
MISP dockerized is a project designed to provide an easy-to-use and easy-to-install 'out of the box' MISP instance that includes everything you need to run MISP with minimal host-side requirements.

MISP dockerized uses MISP (Open Source Threat Intelligence Platform - https://github.com/MISP/MISP), which is maintained and developed by the MISP project team (https://www.misp-project.org/).
### Update Information 
Initial major release for the v2.4.88 MISP server version.
Included in the Release:
- dockerfile to build Docker container via hub.docker.com
- docker-compose file
- backup and restore script
- makefile
- configuration script
- Added MISP server container for MISP release 2.4.88.
  For more information, please have a look at the official changelog at https://github.com/MISP/MISP/releases/tag/v2.4.88
### General Changes
We introduced the new MISP-dockerized project.
### Fixes and Improvements
- Added new container for an proxy server, robot server and an misp application server
