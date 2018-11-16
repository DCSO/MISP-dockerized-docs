# MISP-dockerized-proxy
Since Release Candiate 0.3.0 we changed the development process from an Release Canditate change to an feature change development process.


## Changelog for bug.MDD122 - Disable 3DES Cipher in misp-proxy
### Update Informations 
The 3DES ciphers may be vulnerable to CVE-2016-2183, aka the “Sweet32” attack.
For more Information: https://aaronsilber.me/2016/11/02/disable-3des-ssl-ciphers-apache-nginx/
### General Changes
Besides the new proxy version, no general changes were made.
### Fixes & Improvements
- Add MISP-Proxy version 1.0.2-alpine
### Detailed Changes
- We make a minor change on the alpine proxy and changed the ssl-ciphers to disable any 3DES cipher.



## Proxy Changelog for Release Candidate 0.3.0
### Update Informations
In this Release Candidate we add a new container with improved configurations, updated the old one for a bugfix and improved the push and tagging scripts.
### General Changes
We changed the file name convention for the NGINX configuration setup. In 1.0.0 and 1.0.1 we had two NGINX configuration files one for HTTPS and one for HTTP only. Now we have only one HTTPS file.
At build time a self-signed cert is now created. Therefore a HTTP only configuration file is not more required.
Please make sure to disable the NGINX configuration volume to get the new file. Or make a backup. Delete all and start from scratch and restore the backup.


### Fixes & Improvements
- Fix Healthcheck of 1.0.0 and 1.0.1
- Improve push.sh, tagging.sh and notify_hub.docker.com.sh to support internal gitlab-ci
- Fix IP restriction file on 1.0.1
- Add new container 1.0.2

### Detailed Changes
- Fix Healthcheck of 1.0.0 and 1.0.1
  curl Package was not found. Now it is installed at build time.
- Improve push.sh, tagging.sh and notify_hub.docker.com.sh to support internal gitlab-ci
  We change the shell scripts to support a second docker registry. Now the scripts look for a variable with the name `INTERNAL_REGISTRY_HOST`.
- Fix IP restriction file on 1.0.1
  `allow 0.0.0.0;` led to a mistake. The new value is: `allow all;`
- Add new container 1.0.2
  - We add a new container, for new LABEL structure and additional VERSION and NAME environment variable.
  - We prepare our proxy for a monitoring solution in the future
  - We renamed the proxy_vars file
  - We change the logfile path to stdout and stderr


## Changelog for Release Candiate 0.2.0
### Update Informations 
Features of the release:
- Add container 1.0.1-alpine
- Improve build process
- Add proxy support
- Remove hub.docker.com direct build
### General Changes
See above in Update Informations.
### Fixes & Improvements
* Add proxy Version 1.0.1-alpine
* Delete custom hub.docker.com hook files
* Modify build process
### Detailed Changes
- We add the proxy container 1.0.1-alpine, because we add https proxy support
- We changed the general GLOBAL_allow_IPs file
- We removed the custom hub.docker.com hook build scripts because travis-ci build now our container. Therefore the files are not more used.
- We changed our build and push script to an better one.

## Changelog for Release Candiate 0.1.0
### Update Informations 
Features of the release:
- Add container 1.0.0-alpine and 1.0.0-ubuntu
- Add travis-ci to repository
- Add additional information to readme
### General Changes
We add travis-ci to build all proxy container continous.
### Fixes & Improvements
* docker container build automatically via travis-ci
* Add proxy container 1.0.0 on base of alpine and ubuntu
* update Readme file
### Detailed Changes
- Since this release we build the container automatically via travis-ci
- We built from now the 1.0.0-alpine and 1.0.0-ubuntu automatically
- We also add a lot of information to our readme.