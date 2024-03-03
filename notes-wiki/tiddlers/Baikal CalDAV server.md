## Recover forgotten or lost admin password
The password is in `/config/baikal.yaml` in an `sha256` hashed form.  To regenerate it, use:
```
$ php7.4-cli -r 'echo hash("sha256", "admin:auth_realm_string:your_new_password");'
```
The `auth_realm_string` is by default `BaikalDAV`.

Sources: [the original](https://github.com/sabre-io/Baikal/issues/196#issuecomment-62828902) and [the correction](https://github.com/sabre-io/Baikal/issues/196#issuecomment-410232879)