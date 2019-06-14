# MISP-dockerized-db


---
## Bug/MDD-219: Fix Gitlab CI
### Update Information
This release fixed the Gitlab CI files.
### General Changes
The general Gitlab CI files were changed.
### Fixes and Improvements
- Removed stage lines
- Added test CI Job
- Added Release Date variable
### Detailed Changes
- Removed stage lines
  Which stages exists are included in the template.
- Added test CI Job
  We added an CI test job to make this repository more like all other repositories.
- Added Release Date variable
  We added a variable release date to know when was the image published first.

---
## Feat/MDD-169: Added Official MariaDB container verison 10.4.5-bionic
### Update Information
This release added a new misp-dockerized-db Docker container. Which is a retagged [library/mariadb:10.4.5-bionic](https://hub.docker.com/_/mariadb) Docker container.
### General Changes
The general CI files were changed.
### Fixes and Improvements
- Added new misp-dockerized-db:10.4.5-bionic Docker container
### Detailed Changes
- Added new misp-dockerized-db:10.4.5-bionic Docker container
  To extract the database from misp-server container we create this repository. This Docker container is the official hub.docker.com MariaDB container in version 10.4.5-bionic.