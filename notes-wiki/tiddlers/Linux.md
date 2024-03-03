## Reset root password on Linux Mint

### Boot into single user mode
   1. Boot using an Live CD install disk or USB drive
   2. Hit 'e' (the key 'e') when the *Linux Mint... menu item is shown in the GRUB boot menu
   3. Type 'rw init=/bin/bash' after 'ro quiet splash' in the file (this will start the shell in single user mode)
   4. Hit F10 to boot into single user mode

Items 2-4. can actually be bypassed by booting into the live CD and following as below.

### Remove the root password
   5. Mount the drive where the already installed `/etc` directory is located
   6. Edit the `/etc/passwd` file to allow root login without a password<br/>This can be done by removing the 'x' in the `root:x:0:0:root:/root:/bin/bash` line in `/etc/passwd`.<br/>(The 'x' signifies that the `/etc/shadow` file should be used for password checking.  Without the 'x' root can log in without a password.)

### Restore the root password
   7. Restart without the Live CD
   8. Login as root and run the `passwd` command to set up a new password for root.

*Reference:* https://unix.stackexchange.com/questions/76313/change-password-of-a-user-in-etc-shadow

## Samba management
### Set user password
```bash
$ sudo smbpasswd -a <username>
```
*Note:* The `-a` option requires `root` privileges.

### Start/stop/restart server
```bash
$ sudo service smbd start
$ sudo service smbd stop
$ sudo service smbd restart
```

## Compute hash for directory structure
```
$ find <directory> -type f ! -name *.ffs_db -exec sha256sum {} + > directory.sha256
```
 * `-type f`: type is file
 * `! -name *.ffs_db`: exclude these files matching `*.ffs_db`
