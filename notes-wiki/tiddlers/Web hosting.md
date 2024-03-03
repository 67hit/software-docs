## .htaccess

### Redirect from `http` to `https`
```
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}
```

### Do not list directories
```
Options -Indexes
DirectoryIndex index.html index.php
```

### Redirect to error page
```
ErrorDocument 404 /404.html
```


## Self signed certificate for `nginx`
```
$ sudo -s
# cd /etc/nginx
# openssl req -new -x509 -nodes -out server.crt -keyout server.key
# chmod 600 server.key
```
Add the ssl section as new site:
```
server {
    listen               443;
    ssl                  on; 
    ssl_certificate      /etc/nginx/server.crt;
    ssl_certificate_key  /etc/nginx/server.key;
    ...
}
```
After updating the config file, restart nginx (or just reload the configuration).
```
# service nginx restart
```

### Note
This will have to be tweaked to get a certificate with appropriate validity dates.