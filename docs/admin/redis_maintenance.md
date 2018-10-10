Redis Maintenance
=================

If you need to delete manually redis jobs from database do the following steps:
1. login in your database:
    - `docker exec -ti misp-db bash`
    - `mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h misp-db`
    - `use misp;`
2. show the required jobs table:
    - `select * from jobs;`
3. test delete statement with select statement:
    - `select * from jobs where status=0;`
4. delete jobs:
    - `delete from jobs where status=0;`
5. exit from database:
    - exit mysql client: `exit`
    - exit misp-db container: `exit`
6. login to redis:
    - `docker exec -ti misp-redis bash`
7. flush redis db:
    - `redis-cli flushall`
8. restart worker:
    - go to Administration -> Server Settings & Maintenance -> Workers
    - press `Restart all workers` on the bottom of the page
