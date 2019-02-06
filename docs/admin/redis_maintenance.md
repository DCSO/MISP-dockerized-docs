# Redis Maintenance

If you need to delete manually redis jobs from database do the following steps:
1. Log in to your database:
    ```bash
    docker exec -ti misp-server bash        #  docker exec -ti misp-db bash
    mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST
    use misp;
    ```
2. Show the required jobs table:
    - `select * from jobs;`
3. Test delete statement with select statement:
    - `select * from jobs where status=0;`
4. Delete jobs:
    - `delete from jobs where status=0;`
5. Exit from database:
    - Exit mysql client: `exit`
    - Exit misp-db container: `exit`
6. Log in to redis:
    - `docker exec -ti misp-redis bash`
7. Flush redis db:
    - `redis-cli flushall`
8. Restart worker:
    - Go to: Administration -> Server Settings & Maintenance -> Workers
    - Press `"Restart all workers"` on the bottom of the page
