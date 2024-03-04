## Basic /etc/httpd.conf 
```sh
#
# Macros
#
ext_addr="*"
domain="mydomain.com"

#
# Global Options
#
prefork 2

#
# Servers
#

# A minimal default server

server $domain {
    listen on $ext_addr port 80
    block return 301 "https://$SERVER_NAME$REQUEST_URI"
}

server $domain {
    listen on $ext_addr tls port 443

    tls {
        certificate "/etc/ssl/mydomain.crt"
        key "/etc/ssl/private/mydomain.key"
    }

    location "/links/cache/*"     { block }
    location "/links/data/*"      { block }
    location "/links/pagecache/*" { block }
    location "/links/tmp/*"       { block }

    location "/links/"            { directory index "index.php" }
    location "/links/index.php"   { fastcgi socket "/run/php-fpm.sock" }
}
```

## Renew SSL Certificate
```bash
$ doas /etc/rc.d/httpd stop
$ doas letsencrypt certonly --standalone -d <domain.name>
$ doas /etc/rc.d/httpd start
```

If not `root` you need to run this with `doas` prepended.

### References 
* https://letsencrypt.org/

## References
* [First Thoughts on the New OpenBSD httpd Webserver](http://protoc.org/blog/2014/11/23/first-thoughts-on-the-new-openbsd-httpd-server)
* [httpd.conf man page](http://man.openbsd.org/OpenBSD-current/man5/httpd.conf.5)
* [http --> https redirect](https://github.com/reyk/httpd/wiki/Setting-up-HTTPS-site-with-HTTP-redirect-fallback)