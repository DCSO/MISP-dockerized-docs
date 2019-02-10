# MISP-dockerized-proxy
Since release candidate 0.3.0, we changed the development process from an release candidate change to a feature change development process.

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
---
