Error with SSL certificate
==========================

make deploy makes an error with ssl certificate
------------------------------------------------

Problem
^^^^^^^

.. code-block:: bash

    [emerg] 30#30: cannot load certificate "/etc/nginx/ssl/cert.pem": BIO_new_file() failed (SSL: error:02001002:system library:fopen:No such file or directory:fopen('/etc/nginx/ssl/cert.pem','r') error:2006D080:BIO routines:BIO_new_file:no such file)
    nginx: [emerg] cannot load certificate "/etc/nginx/ssl/cert.pem": BIO_new_file() failed (SSL: error:02001002:system library:fopen:No such file or directory:fopen('/etc/nginx/ssl/cert.pem','r') error:2006D080:BIO routines:BIO_new_file:no such file)
    nginx: configuration file /etc/nginx/nginx.conf test failed

Solution
^^^^^^^^

.. code-block:: bash

    make delete
    make deploy
