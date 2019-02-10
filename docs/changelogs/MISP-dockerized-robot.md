# MISP-dockerized-robot
Since release candidate 0.3.0, we changed the development process from an release candidate change to a feature change development process.





---
## Bug.MDD174: Travis CI and Gitlab CI does not Build and Push the Images Correctly
### Update information 
We added a new misp-robot version 2.3-debian and cleaned the CI helper scripts.
### General changes
In general we improved the CI scripts and changed the push CI function from Travis CI to Gitlab CI.
### Corrections & Improvements
- Improved test.sh script
### Detailed changes
In general:
- We cleaned the .travis folder and moved the required scripts to .ci folder.
- Travis CI now only builds images from pull requests
- The internal Gitlab CI now pushes images to hub.docker.com instead of Travis CI
- We improved the CI scripts to made it more dynamic.
  - The build script build now only images for hub.docker.com and build_date envionment variable is changed from %Y-%m-%dT%H:%M:%SZ to %Y-%m-%d.
  - The tag script now requires a docker registry URL and retag all existing images from this one container for the specific URL
  - The push script requires now a URL, user and password and pushes all image variants of it container and this specific tagged docker registry
  - We fixed the Git repository URL function to get the container name from git repository

For new containers:
- We fixed the while loop to test if misp-server is ready.




---
## Bug.MDD149: Added New MISP Robot Container Version 2.2
### Update information 
We added a new MISP robot version 2.2-debian. 
### General changes
No general changes were made.
### Corrections & Improvements
- Improved test.sh script
### Detailed changes
- We added a while loop in the test.sh script to check if misp-server is ready or not.
- We added the 'ping' command to the container.




---
## Feat.MDD138: Added New MISP Robot Container Version 2.1
### Update information 
We added a new MISP robot version 2.1-debian. 
### General changes
No general changes were made.
### Corrections & Improvements
- Added scripts from the MAIN MISP-dockerized repository that are only needed within the MISP-dockerized environment.
- Added test script for an automated test if the MISP-dockerized environment are ready.
### Detailed changes
- We moved all scripts which are not required on the host to misp-robot
- We added /srv/script/test.sh script which use the MISP-dockerized-testbench framework



---
## Feat.MDD123: Changed the Container Version Scheme from 3 to 2 digits.
### Update Information
In the past, we decided to use a three-digit version number for small and large changes for this container repository. This has proved unnecessary as the main repository is the central repository for new releases and all changes are already tracked here. We have therefore decided to change the three digit version number in all minor repositories to a two digit version number.
For example: 1.0.1 -> 1.1

The second digit is changed any time we make minor changes. The first digit changes whenever we make major changes, e.g. a new base image.
### General changes
In general, we changed all versions from three to two digits.
### Corrections & Improvements
- Changed all folder names
- Improved Gitlab CI structure
- Minimized the readme file
### Detailed Changes
- All folders have been renamed, e.g., from 1.0.0-alpine to 1.0-alpine.
- We have made working with Gitlab CI jobs to made it easier with new extensions and includes.
- We have also reduced the readme as much as possible, as the documentation is now available centrally in our own documentation repository `https://dcso.github.io/MISP-dockerized-docs/`.



---
## Bug.MDD120: MISP-Robot Version `1.0.4-debian` Ansible Is Only Available in Travis CI and Not in Gitlab CI 
### Update Information
Fixed a bug where the Ansible package is not installed on our internal Gitlab CI. Travis CI are not affected.
### General Changes
No general changes have been made in this release.
### Fixes and Improvements
- Bug fixed the installing of Ansible package
- Changed from image debian:stable-slim to debian:stretch-slim. It is the same, but another tag.
- Excluded unused robot version
### Detailed Changes
- Added `--allow_unauthenticated` parameter to apt-get install for installing Ansible.
    Ansible package was only available if you chose the container from hub.docker.com because Travis CI ignored the warning and continued the run command and the build. Gitlab CI aborted the related run task, but did not abort the whole build.
- Excluded:
    - 1.0.2-debian
    - 1.0.3-debian
    - 1.0.4-ubuntu
  Since 1.0.4-debian, we now use the debian image also for all future robot versions.



---
## Bug.MDD120: MISP-Robot Version `1.0.3-ubuntu` Could Not Build by Travis CI and Gitlab CI
### Update Information
We added a new container. 
`PLEASE DO NOT USE 1.0.3-ubuntu! IT IS BROKEN!`
### General Changes
No general changes have been made in this release.
### Fixes and Improvements
- Bug fixed 1.0.3-ubuntu and added a new version 1.0.4-debian
### Detailed Changes
- The server role from the Ansible script in the MISP-dockerized repository makes an error. The problem is the installation of the openssl Ansible module which requires pyopenssl. Pyopenssl is installed, but causes the error. With the new container 1.0.4-debian, no errors exist.



---
## Bug.MDD112: MISP-Robot Pipeline Failed
### Update Information
The robot pipeline failed for the 1.0.2-ubuntu and 1.0.3-ubuntu versions.
### General Changes
No general changes have been made in this release.
### Fixes and Improvements
-Fixed: `locale-gen` was not found, Therefore the `locale-gen` command is deactivated.
### Detailed Changes
- Fixed: In the Dockerfile for the version 1.0.2-ubuntu and 1.0.3-ubuntu, the `locale-gen` command is now deactivated.




---
## Beta Release Candidate 0.3.0
### Update Information
In this release candidate we added a new container with improved configurations, updated the old one for a bug fix and improved the build scripts for Gitlab CI support.
### General Changes
No general changes have been made in this release.
### Fixes and Improvements
- Added internal Gitlab CI support
- Added new container 1.0.3
### Detailed Changes
- Added internal Gitlab CI support
    We changed the shell scripts to support a second Docker registry. Now the scripts look for a variable with the name `INTERNAL_REGISTRY_HOST`.  
- Added new container 1.0.3
    We added a new LABEL standard and prepared Dockerfile for the next upgrade release.

---
## Beta Release Candidate 0.2.1
### Update Information
Features of the release:
* Added rng-tool on 1.0.2 robot version to get a better entropy.
### General Changes
No general changes were made.
### Fixes and Improvements
* Added rng-tool on 1.0.2 robot version to get a better entropy.
### Detailed Changes
- We added rng-tool to get a better entropy for creating a PGP key.


---
## Beta Release Candidate 0.2.0
### Update Information
* Finished ticket MDD-19: Improve Ansible scripts
* Added new robot version 1.0.2
* Added origin robot 1.0.0 and 1.0.1 version
### General Changes
Besides the new version, no general changes were made.
### Fixes and Improvements
* Finished ticket MDD-19: Improve Ansible scripts
* Add new robot version 1.0.2
* Add origin robot 1.0.0 and 1.0.1 version
### Detailed Changes
* New robot 1.0.2
    * The new robot has no Ansible scripts included because the Ansible scripts are mounted via docker-compose through the misp-dockerized repository.
    * Changed folder structure. Therefore, it required a change in the playbooks was required as well.
    * Deleted SSH keys and hosts files. They are not used and unneeded.
* Changes for all robots
    * Updated makefile, build.sh and travis.yml
    * Modified ALL Dockerfile for HTTPS proxy support
    * Modified configuration.sh to update to latest release
    * Deleted hub.docker.com hooks
    * Improved readme
* Changes for Ansible scripts:
    * Ansible script creates a self signed cert if none is found
    * Updated Ansible script to create cert if none is found
    * Improved task for copy cert, key and dh params to volume
    * Improved import database section
    * Improved all Ansible scripts to use Ansible modules if possible 
---