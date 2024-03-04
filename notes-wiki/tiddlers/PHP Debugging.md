To get PHP debugging going with NetBeans, add this to the `php.ini` file:

```ini
zend_extension=php_xdebug-2.5.5-7.0-vc14-nts-x86_64.dll
xdebug.remote_autostart=1
xdebug.remote_enable=1
xdebug.remote_handler="dbgp"
xdebug.remote_host=localhost
;xdebug.remote_host=192.168.1.5
;xdebug.remote_connect_back=1
xdebug.remote_port=9001
xdebug.remote_mode=req
xdebug.idekey="netbeans-xdebug"
```