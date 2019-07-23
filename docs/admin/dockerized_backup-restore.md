
## Backup and Recovery of MISP-dockerized

### Backup

To back up your instance, **MISP-dockerized** provides a backup and restore script that will do the job for you. To create a backup start:
```
./current/scripts/backup_restore backup [service]
or 
cd <MISP-dockerized GIT repo>/current
make backup-[service] for example: make backup-all
or
make -C <MISP-dockerized GIT repo>/current backup-[service] for example: make -C /opt/MISP-dockerized/current backup-all
```
`[service]` is the service you want to create a backup. You can chose between `redis|mysql|server|proxy|all`

### Restore
This works similarly to the backup process. Just run the backup and restore script
```
./current/scripts/backup_restore restore
or
cd <MISP-dockerized GIT repo>/current
make restore [service] for example: make restore mysql
or
make -C <MISP-dockerized GIT repo>/current backup-[service] for example: make -C /opt/MISP-dockerized/current restore mysql
```
`[service]` is the service you want to create a backup. You can chose between `redis|mysql|server|proxy|all`
