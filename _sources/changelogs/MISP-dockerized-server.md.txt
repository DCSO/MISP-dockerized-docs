# MISP-dockerized-server
Since release candidate 0.3.0, we changed the development process from an release candidate change to a feature change development process.




---

## Bug/MDD-227: MISP Server 2.4.99: AH00534: apache2: Configuration error: More than one MPM loaded.
### Update Information
This release fixes an bug in the 2.4.99 MISP server version and add the server 2.4.112 and 2.4.113.
### General Changes
We change the general CI tools from `docker build` to `kaniko` and we disabled Gitlab CI and use only Travis CI now.
There are no user actions required.
### Fixes and Improvements
- Fixed the bug described in the subject in 2.4.99-2.4.103
- Fixed an bug in server 2.4.104-2.4.113 with misp_cron.sh shellscript
- Added an ENV variable for 2.4.104-2.4.xx
- Added MISP server container 2.4.112-2.4.113 on base of new 2.4.nightly-debian
### Detailed Changes
- Fixed the bug described in the subject in 2.4.99-2.4.103
  We explicit deactivate mpm_event process handler.
- Fixed an bug in server 2.4.104-2.4.113 with misp_cron.sh shellscript
- Added an ENV variable for 2.4.104-2.4.xx
   We added `SERVER_IDS` as ENV variable. So the user can control which server entries should be included in the cron process.
- Added MISP server container 2.4.112 and 2.4.113 on base of new 2.4.nightly-debian
   The same features as 2.4.nightly-debian.





---
## Feat/MDD-151: Added new Base 2.4.nightly-debian + 2.4.104-2.4.111 Container
### Update Information
This release added a new 2.4 nightly MISP server container at the base of debian, changed the build tools and ...
### General Changes
We change the general CI tools from `docker build` to `kaniko`.
There are no user actions required.
### Fixes and Improvements
- New Debian based container for nightly 2.4 builds.
  - Added MSMTP as new mailer daemon instead of postfix
  - Removed unneccesary tools and packages (Redis Server, MariaDB Server, Syslog-ng)
  - Improved Rsyslog
  - Added PHP7.2
  - Added PyMISP script
  - Added binaries
  - Improved Entrypoint scripts
  - Moved content of static files to entrypoint scripts
- Added MISP server container 2.4.104-2.4.111 on base of new 2.4.nightly-debian
### Detailed Changes
- New Debian based container for nightly 2.4 builds.
  - Added MSMTP as new mailer daemon instead of postfix
    MSMTP is more lightweight mailer daemon with less features, but also less complexity.
  - Removed unneccesary tools and packages (Redis Server, MariaDB Server, Monitoring, Syslog-ng)
    Netdata, Redis and MariaDB have their own Docker container. Therefore we removed all packages from these containers. Syslog-ng was replaced through Rsyslog, because Rsyslog can handle wildcard files.
  - Improved Rsyslog
  - Added PHP7.2
    Debian stretch default PHP version is 7.0, but this is not more recommended.
  - Added PyMISP script
    Added PyMISP script and requirements to add own python scripts.
  - Added binaries
    If files should be modified I recreate the file and this is done from a own shellschript binary.
  - Improved Entrypoint scripts
    Colorized output if you has no syslog logging activated.
  - Moved content of static files to entrypoint scripts
- Added MISP server container 2.4.104-2.4.111 on base of new 2.4.nightly-debian
   The same features as 2.4.nightly-debian.



---
## Bug/MDD-199: Repair Global 'tagging.sh' Script
### Update Information
This release fixed a bug in `tagging.sh` script.
### General Changes
The general `tagging.sh` script was changed.
There are no user actions required.
### Fixes and Improvements
- Restricted Docker image souce repository tags to source repository not2push
- Added test Gitlab CI job for 2.4.nightly-ubuntu
- Added tag commands to Gitlab CI test job
### Detailed Changes
- Restricted Docker image souce repository tags to source repository not2push
   The `tagging.sh` save all tags which are pass to the current container name. But this is problematic for the case that we tag first for the one repository and then for the second. Therefore there are new tags which not exists for 'not2push' repository but exists for an custom repository. This runs into an error. Which was fixed now.
- Added test Gitlab CI job for 2.4.nightly-ubuntu
   The 2.4.nightly-ubuntu had no second Gitlab CI job for test, only the build CI job. Therefore we added this test.
- Added tag commands to Gitlab CI test job
   The tag command was not tested at test CI job. Now we fixed this.



---
## Bug/MDD-198: Fixing Gitlab CI to Build All Images
### Update Information
This release fixed small bugs in Gitlab CI files.
### General Changes
The general Gitlab CI files was changed. We activated all images to build in our local Gitlab CI.
### Fixes and Improvements
- Changed Main Gitlab CI file
- Changed 2.4.93 Gitlab CI file
- Changed 2.4.93 Dockerfile to remove all not existing files
### Detailed Changes
- Changed Main Gitlab CI file
   Activate all disabled images to build.
- Changed 2.4.93 Gitlab CI file
  Fix typos in the 2.4.93 Gitlab CI file the base is not debian it is ubuntu.
- Changed 2.4.93 Dockerfile to remove all not existing files
   We copy the content from 2.4.103 Docker container, but as we create 2.4.93 we had no extra postfix installed.



---
## Bug/MDD-197: Fixing Docker MISP Server Container 2.4.93
### Update Information
This release fixed small bugs in MISP server container 2.4.93.
### General Changes
No general changes were made.
### Fixes and Improvements
- Changed Dockerfile
- Changed entrypoint scripts
- Integrate supervisord configuration file into entrypoint
- Sort configuration files into folder
- Added misp_cron and misp_update script
- Integrate php.ini file into entrypoint_apache2.sh
### Detailed Changes
- Changed Dockerfile
  We backported environment and argument variables and the structure for entrypoint scripts.
- Changed entrypoint scripts
- Integrate supervisord configuration file into entrypoint
  entrypoint.sh script write at every start the configuration file.
- Sort configuration files into folder
  To cleanup the files folder we moved various configuration files into own folder.
- Added misp_cron and misp_update script
  Scripts to update MISP for taxonomies, Galaxies, Warninglists and for an cron job to push/pull events.
- Integrate php.ini file into entrypoint_apache2.sh

---
## Feat/MDD-194: Fixed Heavy IO Commands in 2.4.99-2.4.103
### Update Information
This release fixed small bugs.
### General Changes
No general changes were made.
### Fixes and Improvements
- Deleted heavy IO commands as "chmod" and "chown" from Dockerfile
- Changed heavy IO commands as "chmod" and "chown" in entrypoint_apache.sh to an solution via "find"
- Fixed healthcheck.sh script for 2.4.100-2.4.103
- Changed CI before_install script to fit to the new dependencies of docker-compose in Alpine Linux
### Detailed Changes
- Deleted heavy IO commands as "chmod" and "chown" from Dockerfile
  chown and chmod commands cause a high IO load on our CI server to improve this we deleted this commands from our Dockerfiles.
- Changed heavy IO commands as "chmod" and "chown" in entrypoint_apache.sh to an solution via "find"
  chown and chmod commands cause a high IO load on our CI server to improve this we changed this commands to one via find which is faster and require less IO.
- Fixed healthcheck.sh script for 2.4.100-2.4.103
  The healthcheck.sh script search for REDIS_HOST but our variable is called REDIS_FQDN.
- Changed CI before_install script to fit to the new dependencies of docker-compose in Alpine Linux

---
## Bug/MDD-193: Changed 2.4.103
### Update Information
Features of the release:
- Fixed 2.4.103 server image
### General Changes
Besides the modified MISP version (2.4.103), no general changes were made.
### Fixes and Improvements
- Fixed an bug in 2.4.103 Dockerfile
### Detailed Changes
- Fixed an bug in 2.4.103 Dockerfile

---
## Feat/MDD-190: Fixed 2.4.93 MISP Server Image
### Update Information
Features of the release:
- Fully worked 2.4.93 MISP server version, but not supported.
### General Changes
Besides the modified MISP version, no general changes were made.
### Fixes and Improvements
- Added entrypoint_workers.sh script
- Changed apache2 misp.ssl configuration
- Changed Dockerfile
- Changed entrypoint_mariadb.sh script
- Changed entrypoint_apache.sh script
- Added Gitlab CI test job for 2.4.93
### Detailed Changes
- Added entrypoint_workers.sh script
  Added a own startscript for resque worker of MISP.
- Changed apache2 misp.ssl configuration
  Disabled X-Content-Type-Options nosniff and X-Frame-Options DENY.
- Changed Dockerfile
  Added all missed dependencies.
- Changed entrypoint_mariadb.sh script
  Improved MariaDB start script and removed the task of importing MISP scheme.
- Changed entrypoint_apache.sh script
- Added Gitlab CI test job for 2.4.93
  Backported CI test job from 2.4.103.

---
## Feat/MDD-189: Improved 2.4.103 MISP Server Image
### Update Information
Features of the release:
- This MISP server 2.4.103 release has an improved mechanism to sync the different start scripts. First start Redis and DB and after this start apache2. Then all other scripts.
### General Changes
Besides the modified MISP version (2.4.103), no general changes were made.
### Fixes and Improvements
- Changed license file
- Added "entrypoint.sh" script for supervisord
- Removed entrypoint_monitoring.sh
- Removed entrypoint_syslog-ng.sh
- Added "entrypoint_worker.sh"
- Changed misp_cron.sh and misp_update.sh
- Changed Dockerfile for 2.4.103 to fit to the official MISP documentation
- Added enviroment variables
- Changed all entrypoint scripts to support green colored start output tag
### Detailed Changes
- Changed License file
  Added current year to License file
- Added "entrypoint.sh" script for supervisord
- Removed entrypoint_monitoring.sh
  It is not more needed.
- Removed entrypoint_syslog-ng.sh
  It is not more needed.
- Added "entrypoint_worker.sh"
  MISP workers get an own entrypoint_worker.sh start script
- Changed misp_cron.sh and misp_update.sh
  Improved misp_cron.sh script and misp_update.sh script at the way how the get their AUTH token from DB
- Changed Dockerfile for 2.4.103 to fit to the official MISP documentation
- Added environent variables:
  - PHP_MEMORY_LIMIT="512M"
  - PHP_MAX_EXECUTION_TIME="600"
  - PHP_UPLOAD_MAX_FILESIZE="50M"
  - PHP_POST_MAX_SIZE="50M"

---
## Feat/MDD-173: Added MISP Version 2.4.103
### Update Information
Features of the release:
- Added MISP server container for MISP release 2.4.103.
  For more information, please have a look at the official changelog at https://github.com/MISP/MISP/releases/tag/v2.4.103.
### General Changes
Besides the new MISP version, we improved the CI scripts for Gitlab and Travis CI.
### Fixes and Improvements
- Added MISP server container with MISP Version 2.4.103
### Detailed Changes
- Added new MISP server 2.4.103 on base of 2.4.97.

---
## Feat/MDD172: Added MISP Version 2.4.102
### Update Information
Features of the release:
- Added MISP server container for MISP release 2.4.102.
  For more information, please have a look at the official changelog at https://github.com/MISP/MISP/releases/tag/v2.4.102.
### General Changes
Besides the new MISP version, no general changes were made.
### Fixes and Improvements
- Added MISP server container with MISP Version 2.4.102
### Detailed Changes
- Added new MISP server 2.4.102 on base of 2.4.97.

---
## Feat/MDD155: Added MISP Version 2.4.101
### Update Information
Features of the release:
- Added MISP server container for MISP release 2.4.101.
  For more information, please have a look at the official changelog at https://github.com/MISP/MISP/releases/tag/v2.4.101
- Added improved CI scripts
### General Changes
Besides the new MISP version, we improved the CI scripts for Gitlab and Travis CI.
### Fixes and Improvements
- Added MISP server container with MISP Version 2.4.101
- Added improved CI scripts
### Detailed Changes
- Added new MISP server 2.4.101 on base of 2.4.97.
- Gitlab CI can now build the server image for internal Docker registry and hub.docker.com registry.


---
## Bug.MDD143: Fix for Function "create_certificate" Deadlock Bug
### Update Information
Proxy version 1.4-alpine creates a file to prevent the `misp-server` from creating its own certificate. This should be deleted once the creation is complete. Unfortunately the proxy with version 1.4-alpine interrupted the script before removing the file. Therefore, it has not been deleted. Since only one file was used for both the `misp-proxy` and the `misp-server`, this bug results in the Apache2 entrypoint of the `misp-server` version 2.4.97-2.4.99 also being deadlocked.
### General Changes
No general changes were made.
### Fixes and Improvements
- Added on the `misp-server` 2.4.97-2.4.99 an own PID file for `misp-server` and `misp-proxy`
### Detailed Changes
- We have added an additional PID file, so we now have one that creates the `misp-proxy` and queries the `misp-server` and one that is created by the `misp-server` and queries the `misp-proxy`. Its own file can overwrite both the proxy and the server. Therefore, going forward, such deadlocks should be a thing of the past.


---
## Bug.MDD141: Wrong Common Name in the Certificate After Installation
### Update  
We changed existing container versions to fix the false common name in the certificate.
### General Changes
No general changes were made.
### Corrections and Improvements
- Changed version 2.4.97-debian
- Changed version 2.4.98-debian
- Changed version 2.4.99-debian
### Detailed Changes
- We have modified the entrypoint script so that the common name is now the same as the FQDN hostname. 
- We have adapted the Gitlab CI test job so that it will now be executed only if something has changed on this container.


---
## Feat.MDD139: Added MISP Version 2.4.99
### Update Information
Features of the release:
- Added MISP server container for MISP release 2.4.99.
  For more information, please have a look at the official changelog at https://github.com/MISP/MISP/releases/tag/v2.4.99
- Added Gitlab CI test job
### General Changes
Besides the new MISP version, no general changes were made.
### Fixes and Improvements
- Added MISP server container with MISP Version 2.4.99
- Added Gitlab CI test job
### Detailed Changes
- Added new MISP server 2.4.99 on base of 2.4.97.
- Gitlab CI can now test the server before it is merged to master.


---
## Feat.MDD132: Added MISP Version 2.4.98
### Update Informations
Features of the release:
- Added MISP server container for MISP release 2.4.98.
  For more information, please have a look at the official changelog at https://github.com/MISP/MISP/releases/tag/v2.4.98
- Changed few files for 2.4.97
### General Changes
Besides the new MISP version, no general changes were made.
### Fixes and Improvements
- Added MISP server container with MISP version 2.4.98
- Changed few files for entrypoint files of Apache2 and Postfix
### Detailed Changes
- Added new MISP server 2.4.98 on base of 2.4.97
- Changed entrypoint files of MISP server 2.4.97 for Apache2 and Postfix
  We improved the Postfix configuration, so that the Postfix configuration are newly written on every container start. We also fixed a bug for MISP application configuration for GnuPGP homedir path.


---
## Feat.MDD126: Added MISP Version 2.4.97
### Update Informations 
Features of the release:
- Added MISP server container for MISP release 2.4.97.
  For more information, please have a look at the official changelog at https://github.com/MISP/MISP/releases/tag/v2.4.97
- Changed to a new Gitlab CI job structure for all `misp-server` containers.
### General Changes
Besides the new MISP version, no general changes were made.
### Fixes and Improvements
- Added MISP server container with MISP version 2.4.97 (DCSO/MISP-dockerized#39)
- Changed Gitlab CI structure to a more flexible one
### Detailed Changes
- The following base changes were made in addition to the new **misp-server version 2.4.97**:
   - The base image is now **debian stretch** instead of ubuntu 18.04.
   - Postfix is now directly installed. The Postfix container is no longer necessary.
   - Added cron.sh shell script that fetches and caches all enabled feeds and pulls all remote server events
   - Changed from syslog-ng to rsyslog, because in debian the syslog-ng does not support wildcard configuration for log files.
   - **The external requirement for our Ansible playbook is no longer necessary for this container**
- Gitlab CI structure: Include statements in the Gitlab CI main file allow us to improve and simplify our Gitlab CI main file.


---
## Feat.MDD91: Added MISP Version 2.4.96
### Update Informations 
Features of the release:
- Added MISP server container for MISP release 2.4.96.
  For more information, please have a look at the official changelog at https://github.com/MISP/MISP/releases/tag/v2.4.96
### General Changes
Besides the new MISP version, no general changes were made.
### Fixes and Improvements
- Added MISP server container with MISP version 2.4.96
### Detailed Changes
- We added the MISP version 2.4.96 on the container base of 2.4.95.

---
## Feat.MDD86: Add Nightly 2.4 docker container
### Update Informations 
Features of the release:
- Added MISP server container for MISP release 2.4. It is a nightly builded container always on the newest commit.
  For more information, please have a look at the official repository from MISP at https://github.com/misp/misp/tree/2.4
### General Changes
Besides the new MISP version, no general changes were made.
### Fixes and Improvements
- Added MISP server container for MISP release 2.4. It is a nightly builded container always on the newest commit.
### Detailed Changes
- The MISP project is being developed very quickly and a release is not made for every pull request or commit is made. However, if you always want the newest code, you can now use the following container: `dcso/misp-dockerized-server:2.4.nightly-ubuntu-dev`


---
## Beta Release Candidate 0.3.0
### Update Information
In this release candidate we have added a new container with improved configurations, updated the old one for a bug fix and improved the build scripts for Gitlab CI support.
### General Changes
Besides the new MISP version, no general changes were made.
### Fixes and Improvements
- Added internal Gitlab CI support
- 2.4.88 and 2.4.89
  	- Changed LABEL instruction in dockerfile
- 2.4.90
  	- Changed LABEL instruction in dockerfile
  	- New Apache2 SSL configuration
- 2.4.91
  	- Changed LABEL instruction in dockerfile
  	- New Apache2 SSL configuration
  	- Added new ENV instruction in dockerfile
- 2.4.92
  	- Changed LABEL instruction in dockerfile
  	- Added new ENV instruction in dockerfile
  	- Improved Dockerfile
  	- Added pip and pip3 version of additional modules
  	- Modified healthcheck
  	- Modified entrypoint files
    - Added analysis column via environment variable
    - Change PHP memory via environment variable
- Added a new container for MISP version 2.4.93
- Added a new container for MISP version 2.4.94
- Added a new container for MISP version 2.4.95
### Detailed Changes
- Added internal Gitlab CI support:
  We have changed the shell scripts to support a second docker registry. Now the script looks for a variable called `INTERNAL_REGISTRY_HOST`.
- 2.4.88 and 2.4.89
  	- Changed LABEL instruction in dockerfile:
    	We have made the LABELs more variable.
- 2.4.90
  	- Changed LABEL instruction in dockerfile
    	We have made the LABELs more variable.
  	- New Apache2 SSL configuration
- 2.4.91
  	- Changed LABEL instruction in dockerfile
    We have made the LABELs more variable.
  	- New Apache2 SSL configuration
  	- Added new ENV instruction in dockerfile
- 2.4.92
  	- Changed LABEL instruction in dockerfile
    We have made the LABELs more variable.
  	- Added new ENV instruction in dockerfile
  	- Improved Dockerfile
  	- Added pip and pip3 version of additional modules
  	- Modified healthcheck
  	- Modified entrypoint files
- Added a new container for MISP version 2.4.93
- Added a new container for MISP version 2.4.94
  - Added syslog-ng to collect all log file and extracted it to Docker standard stdout and stderr stream
- Added a new container for MISP version 2.4.95
  - Added syslog-ng to collect all log file and extracted it to Docker standard stdout and stderr stream


---
## Beta Release Candidate 0.2.2
#### Update Informations
In this release, we fixed a lot of bugs.
#### General Changes
Besides the fixed bug, no general changes were made.
#### Fixes and Improvements
* Fixed importing mysql misp scheme
* Fixed mysql create user failure after container restart
* Fixed Apache2 configuration files
* Changed log files to output directly to Docker [ /dev/stdout ]
#### Detailed Changes
* After the start of the container, the mysql entrypoint script did not import the MISP database scheme correctly. Therefore it was not accessible for the MISP application.
* After the start of the container the mysql entrypoint script did not create the required MySQL user. Therefore, MISP application could not have any access to the database.
* The Apache2 entrypoint scripts had bugs and did not start. Therefore, we fixed it.
* On the Docker node you could with **`docker logs <container_name>`**, show your logs in the container. These "logs" were all logs sent to /dev/stdout or /dev/stderr. Therefore, we linked all required log files to these files to get the output of all without the requirement of any log software.


---
## Beta Release Candidate 0.2.1
#### Update Informations
In this release we cleaned up the files into the repository.
#### General Changes
Besides the fixed bug, no general changes were made.
#### Fixes and Improvements
* Deleted unused Ansible playbook file
#### Detailed Changes
* We deleted an unused site.yml Ansible playbook file


---
## Beta Release Candidate 0.2.0
#### Update Informations
In this release we added a container for MISP version `2.4.88` and `2.4.89`. Additionally we added travis-ci for a continuous integration process.
Also, we added labels for versions and MISP tags into the container.
#### General Changes
We added for all container proxy support via environment variables and changed the build and push process and scripts.
#### Fixes and Improvements
* Created new build and deploy process
* Updated README.md
* Added proxy support
* Updated container MISP 2.4.88 and 2.4.89
* Added new container 2.4.90
* Added new container 2.4.91
* Added new container 2.4.92
* Deleted hub.docker.com build hook
#### Detailed Changes
* We created a new, improved build and deploy process, which is more flexible and can be used for all container repositories. It adds the build time and many more arguments into the Docker build task.
* Updated README.md
* We added HTTP and HTTPS proxy support for all existing containers.
* We updated 2.4.88 and 2.4.89 to support the new argument variables and fixing bugs.
* We added a new container with MISP version 2.4.90
* We added a new container with MISP version 2.4.91 and 2.4.92. We added redis and mysql directly into this and all future containers because, if the mysql container is external, it results in failure states.
* We deleted the build hook file for hub.docker.com because now Travis CI builds the container, no longer hub.docker.com. The reason is Travis CI builds more containers at the same time, is faster, and does not require any payment.


---
## Beta Release Candidate 0.1.0
#### Update Informations
In this release we added a container for MISP version `2.4.88` and `2.4.89`. Additionally we added Travis CI for a continuous integration process.
Also, we added labels for versions and MISP tags into the container.
#### General Changes
We added for all containers new build argument variables and new labels.
#### Fixes and Improvements
* Added Travis CI
* Updated "readme" file
* Changed Docker container label
#### Detailed Changes
* All future Docker containers are to be built automatically via Travis CI. The Travis CI builds the Docker and pushes to hub.docker.com with a "-dev" tag; therefore, the container is misp-dockerized-server-2.4.88-dev. Only our main repository DCSO/MISP-dockerized can push this container into hub.docker.com without a "-dev" tag after the main repository test that the whole environment is ready.
* We updated the readme file to fix smaller typos
* On the Docker container for MISP version 2.4.88 and 2.4.89, we added the label version and MISP tag to detect the version and MISP tag into the Docker container itself.
