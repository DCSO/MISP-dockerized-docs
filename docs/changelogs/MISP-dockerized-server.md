# MISP-dockerized-server
Since release candidate 0.3.0, we changed the development process from an release candidate change to a feature change development process.

---
## Feat/MDD155: Add MISP Version 2.4.101
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
