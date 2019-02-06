# MISP-dockerized-misp-modules
Since release candidate 0.3.0, we changed the development process from an release candidate change to a feature change development process.


## Bug.MDD134: Added MISP-Modules Container Version 1.2 for Gitlab CI
### Update Information 
In the past, we changed the version numbers and forgot the container with the version 1.2, but only in Gitlab CI. In Travis CI it existed. We fixed this situation.
### General Changes
No general changes were made.
### Fixes and Improvements
- Changed the Gitlab CI file in the root of the repository.
### Detailed Changes
- Changed the Gitlab CI file in the root of the repository.
  We added an include statement for the 1.2-debian folder.


## Feat.MDD123: Changed the Container Version Scheme from 3 to 2 digits.
### Update Information
In the past, we decided to use a three-digit version number for small and large changes for this container repository. This has proved unnecessary as the main repository is the central repository for new releases and all changes are already tracked here. We have therefore decided to change the three digit version number in all minor repositories to a two digit version number.
For example: 1.0.1 -> 1.1

The second digit is changed any time we make minor changes. The first digit changes whenever we make major changes, e.g. a new base image.
### General Changes
In general, we changed all versions from three to two digits.
### Fixes and Improvements
- Changed all folder names
- Improved Gitlab CI structure
- Minimized the readme file
### Detailed Changes
- All folders have been renamed, e.g., from 1.0.0-alpine to 1.0-alpine.
- We have made working with Gitlab CI jobs to made it easier with new extensions and includes.
- We have also reduced the readme as much as possible, as the documentation is now available centrally in our own documentation repository: `https://dcso.github.io/MISP-dockerized-docs/`



## Beta Release Candidate 0.3.2
#### Update Information
In this release candidate we added a new container with improved configurations, updated the old one for a bug fix and improved the build scripts for Gitlab CI support.
#### General Changes
We added a new container; no other general changes were made.
#### Fixes and Improvements
- Added internal Gitlab CI support
- Added hub.docker.com token for notification
- Added new container 1.0.1
#### Detailed Changes
- Added internal Gitlab CI support.
  We changed the shell scripts to support a second Docker registry. Now the scripts look for a variable with the name `INTERNAL_REGISTRY_HOST`.  
- Added hub.docker.com token for notification.
  We added a token for Travis CI to inform hub.docker.com about a new image.
- Added new container 1.0.1.
    We added a new LABEL standard and prepared Dockerfile for the next upgrade release.



## Beta Release Candidate 0.3.1
#### Update Information 
Added hub.docker.com token so that Travis CI can update the image automatically.
#### Fixes and Improvements
- Added hub.docker.com trigger token




## Beta Release Candidate 0.3.0
### Update Information 
With this release, we offered the first MISP modules container on a debian base.
### General Changes
We added a standard debian base container with installed MISP modules content from `https://github.com/MISP/misp-modules`.
### Fixes and Improvements
- Added Gitlab CI + Travis CI support