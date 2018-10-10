
## Backup and Recovery of  MISP-dockerized
### Backup
To back up your instance, **MISP dockerized** comes with a backup and restore script that will do the job for you. To create a backup start:
```
$> ./scripts/backup_restore backup [service]
or 
$> make backup-[service] for example: make backup-all
```
`[service]` is the service you want to create a backup. you can chose between `redis|mysql|server|proxy|all`

### Restore
Works similar to the backup process. Just run the backup and restore script
```
$> ./scripts/backup_restore restore
or
$> make restore
```
