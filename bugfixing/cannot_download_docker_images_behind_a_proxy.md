### Cannot download Docker images behind a proxy

First, create a systemd drop-in directory for the docker service:
```bash
$> mkdir /etc/systemd/system/docker.service.d
```

Now create a file called /etc/systemd/system/docker.service.d/http-proxy.conf that adds the HTTP_PROXY environment variable:
```bash
[Service]
Environment="HTTP_PROXY=http://proxy.example.com:80/"
```
If you have internal Docker registries that you need to contact without proxying you can specify them via the NO_PROXY environment variable:
```bash
Environment="HTTP_PROXY=http://proxy.example.com:80/"
Environment="NO_PROXY=localhost,127.0.0.0/8,docker-registry.somecorporation.com"
```
Flush changes:
```bash
$> sudo systemctl daemon-reload
```
Verify that the configuration has been loaded:
```bash
$> sudo systemctl show --property Environment docker
Environment=HTTP_PROXY=http://proxy.example.com:80/
```
Restart Docker:
```bash
$> sudo systemctl restart docker
```

#### Source:
https://stackoverflow.com/questions/23111631/cannot-download-docker-images-behind-a-proxy