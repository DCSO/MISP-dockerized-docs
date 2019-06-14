# Use Certificate with passphrase

`This is unsupported!`

This guide is for administrators which want to use password protected certificates. This guide is in special for the [GitHub issue 17](https://github.com/DCSO/MISP-dockerized-proxy/issues/17).

## How to

### via Environment Variable

Go to `config/config.env` and set `SSL_PASSPHRASE_ENABLE="yes"`.
Now make: `make install` or `make build-config && make deploy`
You are ready.
For troubleshooting please look at `docker -f logs misp-proxy` or `docker -f logs misp-server`

### via File

To activate passphrase certificate via file you need to one file one for NGINX and Apache2 will generate his file on base of the another one.

1. Create a new file in `config/ssl/ssl.passphrase`.
   Content of the file is only your password.
2. Go to `config/config.env` and set `SSL_PASSPHRASE_ENABLE="yes"`.
3. Update configuration: `make build-config`
4. Deploy new configuration: `make deploy`

## Troubleshooting

- To restart the container: `docker restart misp-server misp-proxy`

## Further Documentation

- [http://nginx.org/en/docs/http/ngx_http_ssl_module.html#ssl_password_file](http://nginx.org/en/docs/http/ngx_http_ssl_module.html#ssl_password_file)
- [https://httpd.apache.org/docs/current/mod/mod_ssl.html#sslpassphrasedialog](https://httpd.apache.org/docs/current/mod/mod_ssl.html#sslpassphrasedialog)
- [https://cwiki.apache.org/confluence/display/HTTPD/RemoveSSLCertPassPhrase](https://cwiki.apache.org/confluence/display/HTTPD/RemoveSSLCertPassPhrase)
