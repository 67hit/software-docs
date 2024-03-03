## Webserver

### Basic /etc/httpd.conf 
```sh
#
# Macros
#
ext_addr="*"
domain="toplevel.domain"

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
        certificate "/etc/ssl/toplevel.crt"
        key "/etc/ssl/private/toplevel.key"
    }

    location "/links/cache/*"     { block }
    location "/links/data/*"      { block }
    location "/links/pagecache/*" { block }
    location "/links/tmp/*"       { block }

    location "/links/"            { directory index "index.php" }
    location "/links/index.php"   { fastcgi socket "/run/php-fpm.sock" }
}
```

### Certificate
* Generate self-signed certificate (TODO)

### References
* [First Thoughts on the New OpenBSD httpd Webserver](http://protoc.org/blog/2014/11/23/first-thoughts-on-the-new-openbsd-httpd-server/)
* [httpd.conf man page](http://man.openbsd.org/OpenBSD-current/man5/httpd.conf.5)
* [http >> https redirect](https://github.com/reyk/httpd/wiki/Setting-up-HTTPS-site-with-HTTP-redirect-fallback)


## Network  card replacement warning
If you put in a card with the same chip of an already existing card, the old may become renamed!  E.g. the old fxp0 may become the new fxp1 and the new card the fxp0.  Corresponding changes will be needed in the configurations.

### Potentially affected configuration files
* /etc/hostname.xxx 
* /etc/pf.conf (for interface definitions)
* /etc/rc.conf.local (for dhcp related items)

## Set up ddclient
### Configuration:
```
syslog=yes
protocol=dyndns2
use=if if=em0
ssl=yes
server=updates.opendns.com
login=<name>
password='<password>'
home
```

### Running with `rcctl`
```
# rcctl set ddclient flags -daemon <update seconds> -verbose
```
The `-verbose` flag will record all updates in `/var/log/daemon` (not necessary).
Then:
```
# rcctl start ddclient
```
