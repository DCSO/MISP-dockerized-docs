Available `make` Commands
#########################


Delete the Repository
*********************
To delete everything e.g. to start from scratch you can use this:
:code:`make delete`


.. warning::
    :code:`make delete` delete all volumes, leading to a loss of all your data. Make sure you have saved everything before you run it.


Rebuild from Backup
*******************
If you want to start from scratch or reinitialse your MISP instance:

:code:`
make backup-all
make delete
make install
make restore-all
`


Access the Container
********************
To access the container e.g. to change MISP config.php or proxy config, you can use:
:code:`docker exec -it dcso/[container] bash`
Only available for ubuntu or debian container. It isn't available for alpine container such as misp-proxy or misp-postfix.

For the alpine version:
:code:`
docker exec -it dcso/misp-proxy sh
`

### Usefull Commands
To Delete all local Images:
:code:`
docker system prune -a
`

To delete only all non-tagged (dangling) Images:
:code:`
docker rmi $(docker images -f "dangling=true" -q)
`

List Logs
:code:`
docker logs -f misp-server
`
