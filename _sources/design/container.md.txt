# Container

According to Docker best practices, only one process should run per container. Unfortunately, this is currently not possible because the MISP server has to perform a lot of tasks.
We will change this in the future. However, this will take some time.

We currently have the following containers in our area:
- a reverse proxy -> misp-proxy
- an application web server -> misp-server
- the MISP-Modules server -> misp-modules
- a robot server, Ansible+Mysql+... -> misp-robot

The reverse proxy is the only container that is accessible from the outside. All others expose no port. 
Therefore, you can follow a clearly visible log on the reverse proxy and what is called on the MISP API via the reverse proxy.