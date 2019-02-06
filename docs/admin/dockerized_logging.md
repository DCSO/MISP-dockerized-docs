# Logging Mechanism of MISP-dockerized



## Which log files are relevant for troubleshooting?

misp-server:
* APACHE2
  * /var/log/apache2/access.log
  * /var/log/apache2/other_vhosts_access.log
  * /var/log/apache2/error.log
* MISP Core
  * /var/www/MISP/app/tmp/logs/error.log
* MISP-Resque
  * /var/www/MISP/app/tmp/logs/resque-*
  * /var/www/MISP/app/tmp/logs/resque-worker-error.log
  * /var/www/MISP/app/tmp/logs/resque-scheduler-error.log

misp-proxy:
* NGINX 
  * access_log /dev/stdout main;
  * error_log /dev/stderr;

    Proxy log format `main`:
    ```bash
        log_format  main  '$host - $remote_addr - $remote_user [$time_local] "$request" '
                        '$status $body_bytes_sent "$http_referer" '
                        '"$http_user_agent" "$http_x_forwarded_for"';
    ```

misp-postfix:
* postfix
  * /var/log/mail.log

misp-modules:
* no special logs.


## Show logs with `docker logs <container_name>`

In the standard you can show your logs with the command: 
```bash
docker logs <container_name>
```
Further Informations: https://docs.docker.com/engine/reference/commandline/logs/.


## Show logs with syslog forwarding

If you want to forward all MISP-dockerized logs to local or remote syslog, delete the following lines from ./config/config.yml file:
    ```bash
    USE_SYSLOG="no"
    SYSLOG_REMOTE_HOST="127.0.0.1"
    ```

The example below activates syslog forwarding to local syslog daemon:
```bash
    ### LOG DRIVER ###
    # for more Information: https://docs.docker.com/compose/compose-file/#logging + https://docs.docker.com/config/containers/logging/syslog/
    logging:
        driver: syslog
        options:
        #syslog-address: "tcp://192.168.0.42:123"
        #syslog-address: "unix:///dev/log"
        #syslog-address: "unix:///tmp/syslog.sock"
        # For Facility: https://tools.ietf.org/html/rfc5424#section-6.2.1
        #syslog-facility: "local7"
        #syslog-tls-cert: "/etc/ca-certificates/custom/cert.pem"
        #syslog-tls-key: "/etc/ca-certificates/custom/key.pem"
        #syslog-tls-skip-verify: "true"
        # For Tags: https://docs.docker.com/config/containers/logging/log_tags/
        tag: "{{.ImageName}}/{{.Name}}/{{.ID}}"
        #syslog-format: "rfc5424micro"
        #labels: "misp-dockerized"
        #env: "os,customer"
        #env-regex: "^(os\|customer)"
```
