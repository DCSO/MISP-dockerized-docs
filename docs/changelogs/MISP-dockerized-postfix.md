#  [Deprecated] MISP-dockerized-postfix
Since release candidate 0.3.0, we changed the development process from an release candidate change to a feature change development process.

`Since MISP-dockerized version 0.3.4, the Postfix container is no longer used. Postfix is installed on MISP-server since 2.4.97.`



---
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




---
## Beta Release Candidate 0.3.0
### Update Informations
In this release candidate we added a new container with improved configurations, updated the old one for a bugfix and improved the build scripts for Gitlab CI support.
### General Changes
We added a new container 1.0.1.
### Fixes and Improvements
- Added internal Gitlab CI support
- 1.0.0
  - Changed LABELs on 1.0.0
  - Removed debugging mode from entrypoint file
  - Bug fixing of syslog-ng configuration
- Add new container 1.0.1

### Detailed Changes
- Added internal Gitlab CI support.
  We changed the shell scripts to support a second Docker registry. Now the scripts look for a variable with the name `INTERNAL_REGISTRY_HOST`.  
- 1.0.0
  - Changed LABELs on 1.0.0.
    We made the LABELs more variable.
  - Removed debugging mode from entrypoint file.
    We changed `set -exv` to `set -e`
  - Bug fixing of syslog-ng configuration.
    We fixed mistakes with semicolons.
- Added new container 1.0.1
    We added a new LABEL standard and prepared Dockerfile for the next upgrade release.




---
## Beta Release Candidate 0.2.0
`New Postfix container for mail relaying`
* This closed ticket MDD-14 with Postfix as relay.
* Added new Postfix container with version 1.0.0 with Alpine as base
* Deleted hub.docker.com hooks
