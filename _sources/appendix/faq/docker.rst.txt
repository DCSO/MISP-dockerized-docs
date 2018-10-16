Cannot download Docker images behind a proxy
-------------------------------------------------

First, create a systemd drop-in directory for the docker service:

.. code-block:: bash
  :linenos:

    $> mkdir /etc/systemd/system/docker.service.d

Now create a file called ``/etc/systemd/system/docker.service.d/http-proxy.conf`` that adds the HTTP_PROXY environment variable:

.. code-block:: bash
  :linenos:

    [Service]
    Environment="HTTP_PROXY=http://proxy.example.com:80/"
    Environment="HTTPS_PROXY=http://proxy.example.com:80/"


If you have internal Docker registries that you need to contact without proxying you can specify them via the NO_PROXY environment variable:

.. code-block:: bash
  :linenos:

    ...
    Environment="NO_PROXY=localhost,127.0.0.0/8,docker-registry.somecorporation.com"
    ...

Flush changes:

.. code-block:: bash
  :linenos:

    $> sudo systemctl daemon-reload

Verify that the configuration has been loaded:

.. code-block:: bash
  :linenos:

    $> sudo systemctl show --property Environment docker
    
Restart Docker:

.. code-block:: bash
  :linenos:

    $> sudo systemctl restart docker

Sources
-------
https://stackoverflow.com/questions/23111631/cannot-download-docker-images-behind-a-proxy