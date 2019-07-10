# Docker Basic Commands and Help

### Make Docker Autostart at Startup
```bash
systemctl enable docker.service
```

### Access the Container
To access the container (e.g., to change MISP config.php), you can use:
```bash
docker exec -it [container-name] bash
```
Container variants: `misp-robot` `misp-server` `misp-modules`

If no bash is available, use sh:
```bash
docker exec -it misp-proxy sh
```
Container variants: `misp-proxy`


### Useful Commands
To delete all local images:
```bash
docker system prune -a
```

To delete only all non-tagged (dangling) images:
```bash
docker rmi $(docker images -f "dangling=true" -q)
```

List logs
```bash
docker logs -f misp-server
```


One-liner to stop all of Docker containers:
```bash
docker stop $(docker ps -a -q)
```

One liner to remove all of Docker containers:
```bash
docker rm $(docker ps -a -q)
```

### Get a Terminal Overview of Docker Containers

See the following two github projects if you need a Gui Terminal application:
- https://github.com/skanehira/docui
- https://github.com/jesseduffield/lazydocker