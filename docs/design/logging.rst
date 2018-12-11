Logging
#######

Docker normally does the logging for us completely. That means there is a /dev/stdout and a /dev/stderr device. 
These two "files" can now be used to output logfiles via the docker mechanisms. 
This also means that you don't have any logfiles in the container to look in. 
In some cases this doesn't work if you don't have control over where the logfiles are created. Then only a syslog-ng or rsyslog daemon helps.
In the case of Postfix (email server) even a syslog daemon is urgently needed. Because the deamon doesn't work otherwise.
