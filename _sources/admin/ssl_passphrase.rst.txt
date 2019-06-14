Use SSL Certificate with Passphrase
####################################

.. warning::

    This guide is only valid for MISP-dockerized 1.2.0+.


.. info::

    This is not our recommended way and therefore unsupported.


This guide is for administrators which want to use password protected certificates. This guide is in special for the `GitHub issue 17`_.

.. _Github issue 17: https://github.com/DCSO/MISP-dockerized-proxy/issues/17

How to ...
============

... via Environment Variable
*****************************

Go to :code:`config/config.env` and set :code:`SSL_PASSPHRASE_ENABLE="yes"`.
Now make: :code:`make install` or :code:`make build-config && make deploy`
You are ready.
For troubleshooting please look at `docker -f logs misp-proxy` or `docker -f logs misp-server`

... via File
**************

To activate passphrase certificate via file you need to one file one for NGINX and Apache2 will generate his file on base of the another one.

1. Create a new file in :code:`config/ssl/ssl.passphrase`.
   Content of the file is only your password.
2. Go to :code:`config/config.env` and set :code:`SSL_PASSPHRASE_ENABLE="yes"`.
3. Update configuration: :code:`make build-config`
4. Deploy new configuration: :code:`make deploy`

Troubleshooting
===============

- To restart the container: :code:`docker restart misp-server misp-proxy`

Further Documentation
======================

- `NGINX SSL password file`_
- `Apache2 SSL passphrasedialog`_
- `Apache2 SSL Remove SSL cert passphrase`_


.. _NGINX SSL password file: http://nginx.org/en/docs/http/ngx_http_ssl_module.html#ssl_password_file
.. _Apache2 SSL passphrasedialog: https://httpd.apache.org/docs/current/mod/mod_ssl.html#sslpassphrasedialog
.. _Apache2 SSL Remove SSL cert passphrase: https://cwiki.apache.org/confluence/display/HTTPD/RemoveSSLCertPassPhrase