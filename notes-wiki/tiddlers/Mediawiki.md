## Access control

* [Preventing access](https://www.mediawiki.org/wiki/Manual:Preventing_access)

### Related extensions

* [Lockdown](https://www.mediawiki.org/wiki/Extension:Lockdown)

## MySQL Backup
### Backup script
```sh
#!/bin/sh

ZIP=/bin/bzip2
MYSQLDUMP=/usr/bin/mysqldump
options="--quick --single-transaction"
path=$HOME/backup/wiki
hostname=HOSTNAME
db=DATABASE
user=USERNAME
passwd=PASSWORD

datestamp=`date +%F_%H-%M-%S`

backupname="$db"_"$datestamp".sql

echo -n "Backing up database $db... "

$MYSQLDUMP $options -h $hostname -u $user --password=$passwd $db > $path/$backupname
$ZIP $path/$backupname

echo Done.
```


## Setup

### SMTP
This goes into `LocalSettings.php` after local smtp mail has been [set up](openbsd/openbsd-setup#smtpd-setup).

```php
$wgSMTP = array (
        'host' => '127.0.0.1',
        'IDHost' => 'localhost',
        'port' => 25,
        'auth' => false
);
```

On OpenBSD smtpd (OpenSMTPD) is used.


## Extract html
Use: `action=render`; eg `index.php?title=Article_title&action=render` (From [StackOverflow](https://stackoverflow.com/questions/1844428/invoking-the-mediawiki-page-parser-to-get-html).)