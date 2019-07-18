# MISP-dockerized-proxy
Since release candidate 0.3.0, we changed the development process from an release candidate change to a feature change development process.


---
## Bug/MDD-224: Rename Container 1.6-alpine to 2.0-alpine for Breaking Changes
### Update Information
This release renamed the `misp-dockerized-proxy:1.6-alpine` container to `misp-dockerized-proxy:2.0-alpine`. The reason is incompatiblity with the current MISP-dockerized 1.1.1 release.
### General Changes
Improvements with the sub Gitlab CI files are done.
### Fixes and Improvements
- Rename container 1.6-alpine to 2.0-alpine
### Detailed Changes
- Rename container 1.6-alpine to 2.0-alpine
  The version 1.6 or better 2.0 added an netdata monitoring endpoint with basic authentication. This requires that the basic auth environment variables are set through MISP-dockerized 1.2.0+. In Release 1.1.1 and before this variables are not set. Therefore the proxy is not backwards compatible.


---
## Bug/MDD-223: Entrypoint of Proxy Container 1.6 has no Execute Permission
### Update Information
This release fixes a small bug in the proxy container 1.6-alpine and improved the sub Gitlab-CI files.
### General Changes
Improvements with the sub Gitlab-CI files are done.
### Fixes and Improvements
- Fixed execute permission from entrypoint script for container 1.6-alpine
### Detailed Changes
- Fixed execute permission from entrypoint script for container 1.6-alpine
  The entrypoint.sh script for the Alpine Linux proxy container version 1.6 had no execute permission, therefore it was not possible to start. We added the permissions and now the proxy container starts correctly.



---
## Feat/MDD-220: Improve Proxy Docker Container
### Update Information
This release added a new misp-dockerized-proxy Docker container.
### General Changes
The general CI files were changed.
- Changed Gitlab CI Build tools from default `docker build`  to `kaniko`
- Added a Gitlab CI test job for all container 
- Added a Release Date variable for all container 
- Removed unused CI scripts
### Fixes and Improvements
- Added new misp-dockerized-proxy:1.6-alpine Docker container
### Detailed Changes
- Added new misp-dockerized-proxy:1.6-alpine Docker container
  This container supports: 
  - Our MISP-dockerized-monitoring as reverse proxy. 
  - The new MISP-dockerized variable scheme.
  - SSL web certificate passphrase option.



---
## Bug/MDD-203: Update CI Files
### Update Information
This release updated the CI and License files.
### General Changes
The general CI files were changed.
### Fixes and Improvements
- Removed top level makefile whis is not more used
- Updated CI files to support new environment variables
- Updated Readme
- Updated Pipeline files for Travis CI and Gitlab CI
### Detailed Changes
- Removed top level makefile whis is not more used
  The functionality of the top level makefile was moved to .ci folder. Now the makefile is unused and can be deleted.
- Updated CI files to support new environment variables
   The URL to notify hub.docker.com has been changed therefore the notify script were updated. Additional to this we improved the other CI files to make a great tagging, uploading and building of the container.
- Updated Readme
  We fixed a link typo.
- Updated Pipeline files for Travis CI and Gitlab CI
   We updated the Travis and Gitlab CI pipeline files to latest version.



---
## Bug.MDD143: Fix for Function "create_certificate" Deadlock Bug
### Update Information 
Proxy version 1.4-alpine creates a file to prevent the misp-server from creating its own certificate. This should be deleted once the creation is complete. Unfortunately the proxy with version 1.4-alpine interrupted the script before removing the file. Therefore it has not been deleted anymore. Since only one file was used for both the proxy and the misp-server this bug results in the Apache2 entrypoint of the misp-server version 2.4.97-2.4.99 also being deadlocked.
### General Changes
No general changes were made.
### Fixes and Improvements
- Added a new misp-proxy version 1.5 with a own PID file for misp-server and misp-proxy.
### Detailed Changes
- We have added an additional PID file, so we now have one that creates the misp-proxy and queries the misp-server and one that is created by the misp-server and queries the misp-proxy. Its own file can overwrite both the proxy and the server. Therefore, going forward, such deadlocks should be a thing of the past.



---
## Bug.MDD141: Wrong Common Name in the Certificate After Installation
### Update Information
We have created a new container version to fix the false common name in the certificate.
### General Changes
No general changes were made.
### Fixes and Improvements
- Added version 1.4-alpine
### Detailed changes
- We have modified the entrypoint script so that the common name is now the same as the FQDN hostname. 
- We added new environment variables for the version and the name.
- We have adapted the Gitlab CI test job so that it will now be executed only if something has changed on this container.



---
## Feat.MDD137: Add Container Version 1.3-Alpine
### Update Information 
We have created a new proxy version to eliminate the Ansible playbook.
### General Changes
No general changes were made.
### Fixes and Improvements
- Added version 1.3-alpine
### Detailed changes
- We also added a new entrypoint.sh script to do the tasks from Ansible. 
- We have moved the start from a fixed installation to a more flexible one through the entrypoint script. Therefore it can be customized during runtime with your HTTP server administration email address and your FQDN in the subject of the email. 
- We added a maintenance mode. It can be activated via `make enable-maintenance` in the MISP-dockerized master repository and deactivated via `make disable-maintenance`. These two commands enable / disable the default https Nginx configuration and enable the maintenance configuration. The misp-proxy container is then restarted once.
- We have adapted the healthcheck so that there are no problems with a self-signed certificate.



---
## Feat.MDD123: Changed the Container Version Scheme from 3 to 2 digits.
### Update information 
In the past, we decided to use a three digit version number for small and large changes for this container repository. This has proved unnecessary as the main repository is the central repository for new releases and all changes are already tracked here. We have therefore decided to change the three digit version number in all minor repositories to a three digit version number.
For example: 1.0.1 -> 1.1
The second digit is changed any time we make minor changes. The first digit changes whenever we make major changes, e.g. a new base image.
### General Changes
In general, we changed all versions from three to two digits.
### Fixes and Improvements
- Changed all folder names
- Improved Gitlab CI structure
- Minimized the readme file
### Detailed changes
- All folders have been renamed, e.g. from 1.0.0.0-alpine to 1.0-alpine.
- We have made working with Gitlab CI jobs to made it easier with new extensions and includes.
- We have also reduced the readme as much as possible, as the documentation is now available centrally in our own documentation repository `https://dcso.github.io/MISP-dockerized-docs/`.




---
## Bug.MDD122: Disable 3DES Cipher in `misp-proxy`
### Update Information 
The 3DES ciphers may be vulnerable to CVE-2016-2183, also known as the “Sweet32"-attack.
For more Information, see: https://aaronsilber.me/2016/11/02/disable-3des-ssl-ciphers-apache-nginx/
### General Changes
Besides the new proxy version, no general changes were made.
### Fixes and Improvements
- Added MISP-Proxy version 1.0.2-alpine
### Detailed Changes
- We made a minor change on the Alpine proxy and changed the SSL ciphers to disable any 3DES cipher.




---
## Beta Release Candidate 0.3.0
### Update Information
In this release candidate we added a new container with improved configurations, updated the old one for a bug fix, and improved the push and tagging scripts.
### General Changes
We changed the file name convention for the NGINX configuration setup. In 1.0.0 and 1.0.1m we had two NGINX configuration files: one for HTTPS and one for HTTP only. Now we have only one HTTPS file.
At running time, a self-signed cert is now created. Therefore, a HTTP only configuration file is no longer required.
Please make sure to disable the NGINX configuration volume to get the new file. Alternatively, make a backup, delete all, start from scratch and restore the backup.
### Fixes and Improvements
- Fixed healthcheck of 1.0.0 and 1.0.1
- Improved push.sh, tagging.sh, and notify_hub.docker.com.sh to support internal Gitlab CI
- Fixed IP restriction file on 1.0.1
- Added new container 1.0.2
### Detailed Changes
- Fixed healthcheck of 1.0.0 and 1.0.1
  curl Package was not found. Now it is installed at build time.
- Improved push.sh, tagging.sh and, notify_hub.docker.com.sh to support internal Gitlab CI
  We changed the shell scripts to support a second Docker registry. Now the scripts look for a variable with the name `INTERNAL_REGISTRY_HOST`.
- Fixed IP restriction file on 1.0.1
  `allow 0.0.0.0;` led to a mistake. The new value is: `allow all;`
- Added new container 1.0.2
  - We added a new container, for new LABEL structure and additional VERSION and NAME environment variable.
  - We prepared our proxy for a monitoring solution in the future
  - We renamed the proxy_vars file
  - We changed the log file path to stdout and stderr





---
## Beta Release Candidate 0.2.0
### Update Information 
Features of the release:
- Added container 1.0.1-alpine
- Improved build process
- Added proxy support
- Removed hub.docker.com direct build
### General Changes
See "Update Information" above.
### Fixes and Improvements
* Added proxy version 1.0.1-alpine
* Deleted custom hub.docker.com hook files
* Modified build process
### Detailed Changes
- We added the proxy container 1.0.1-alpine, because we added HTTPS proxy support.
- We changed the general GLOBAL_allow_IPs file.
- We removed the custom hub.docker.com hook build scripts because Travis CI now builds our container. Therefore, the files are no longer used.
- We changed our build and push script to a better one.






---
## Beta Release Candidate 0.1.0
### Update Information 
Features of the release:
- Added container 1.0.0-alpine and 1.0.0-ubuntu
- Added Travis CI to repository
- Added additional information to readme
### General Changes
We added Travis CI to build all proxy containers continuously.
### Fixes and Improvements
* Docker container built automatically via Travis CI
* Added proxy container 1.0.0 on base of Alpine and Ubuntu
* Updated readme file
### Detailed Changes
- Since this release, we built the container automatically via Travis CI
- We built from now the 1.0.0-alpine and 1.0.0-ubuntu automatically
- We also added a lot of information to our readme.
