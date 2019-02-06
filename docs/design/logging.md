# Logging


Docker normally does the logging for us completely. That means there is a **/dev/stdout** and a **/dev/stderr** device. 
These two "files" can now be used to output logfiles via the Docker mechanisms. 
This also means that you do not have any logfiles in the container. 
In some cases, this does not work if you do not have control over where the logfiles are created. Then only a syslog-ng or rsyslog daemon helps.
In the case of Postfix (email server), even a syslog daemon is urgently needed, as the daemon does not work otherwise.
