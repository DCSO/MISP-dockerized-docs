# MISP-dockerized-monitoring




---
## Feat/MDD 221: Improve Redis and Monitoring Container + Add Netdata v1.16 Container
### Update information 
In this release we changed the docker build tools and add the new Netdata v1.16 version as container.
### General Changes
In general the CI files were changed. This has no user impact.
- Changed Gitlab CI Build tools from default `docker build`  to `kaniko`
- Added a Gitlab CI test job for all container 
- Added a Release Date variable for all container 
- Improved all shellscripts to avoid warnings and errors from shellcheck
- Removed unused CI scripts
### Fixes and Improvements
- Added runtime monitoring jobs for MySQL, Redis, httpcheck and x509check
- Improved httpcheck
### Detailed Changes
- Added runtime monitoring jobs for MySQL, Redis, httpcheck and x509check
  Added an entrypoint which adds runtime jobs. Added x509 cert check job in beta.
- Improved httpcheck
  We added the option to follow redirects and skip TLS trust for selfsigned certificates.

---
## Feat/MDD-154: Adding Monitoring Capabilites with an Netdata Container
### Update Information
Features of the release:
- Added new repository MISP-dockerized-monitoring
- Added new container misp-dockerized-monitoring:v1.15.0
### General Changes
Added this new repository MISP-dockerized-monitoring
### Fixes and Improvements
- Added new container misp-dockerized-monitoring:v1.15.0
### Detailed Change
- Added new repository MISP-dockerized-monitoring
  This repository contains monitoring container to monitor the MISP-dockerized environment.
- Added new container misp-dockerized-monitoring:v1.15.0
  The first container is based at [Netdata](https://netdata.cloud/).