## Add user to wheel group 
```
# usermod -G wheel <username>
```

## Basic setup
Update `/etc/myname`

## Basic pf.conf 
```shell
tcp_in = "{ 22 80 443 }"
tcp_out = "{ 25 }"

block all
pass out quick on vio0 proto { tcp, udp } from any to any
pass in quick on vio0 proto tcp from any to port $tcp_in
```

## Basic doas.conf
```shell
permit setenv { PKG_PATH ENV PS1 SSH_AUTH_SOCK } :wheel
```

Note: `setenv` replaced `keepenv`

## Custom DNS in dhclient.conf
Add line:
```shell
prepend domain-name-servers 208.67.222.222, 208.67.220.220, 8.8.8.8, 8.8.4.4;
```
This will add the custom name servers to `/etc/resolv.conf`.  (The first two are OpenDNS, the last two are Google.)

## Update .profile
Added `PKG_PATH`:
```shell
# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
PKG_PATH=http://mirrors.gigenet.com/pub/OpenBSD/$(uname -r)/packages/$(machine -a)/
PS1='$(print -n $PWD"$ ")'
export PATH HOME TERM PKG_PATH PS1
```

## Install some packages
```bash
$ doas pkg_add wget
$ doas pkg_add automake
```
`automake` and `autoconf` may be needed for build some open source code

### What needs to be added:
```
wget
git
autossh
lynxno-ip
ddclient
elm
```

This will pull in more to end up with the list below.

### Currently installed
```
obsd65$ pkg_info
autossh-1.4g        SSH monitoring
bzip2-1.0.6p9       block-sorting file compressor, unencumbered
curl-7.64.1         get files from FTP, Gopher, HTTP or HTTPS servers
cvsps-2.1p2         generate patchsets from CVS repositories
ddclient-3.8.3p1    Dynamic DNS service update client
elm-2.4ME+66p2      once-popular mail user agent
fossil-2.8v0-static simple distributed software configuration management
gettext-0.19.8.1p3  GNU gettext runtime libraries and programs
git-2.21.0          GIT - Tree History Storage Tool
intel-firmware-20190514p0v0 microcode update binaries for Intel CPUs
libiconv-1.14p3     character set conversion library
libidn2-2.0.0p0     implementation of IDNA2008 internationalized domain names
libpsl-0.20.2       public suffix list library
libunistring-0.9.7  manipulate Unicode strings
lynx-2.8.9rel1      text web browser
nghttp2-1.37.0      library for HTTP/2
no-ip-2.1.9p5       No-IP.com Dynamic DNS client
p5-Digest-SHA1-2.13p4 module to calculate SHA1 digests
p5-Error-0.17025    error/exception handling in an OO-ish way
p5-IO-Socket-SSL-2.060 Perl SSL sockets with IO::Socket interface
p5-Net-SSLeay-1.85p2 perl module for using OpenSSL
pcre2-10.32         perl-compatible regular expression library, version 2
quirks-3.124        exceptions to pkg_add rules
rsync-3.1.3         mirroring/synchronization over low bandwidth links
wget-1.20.2         retrieve files from the web via HTTP, HTTPS and FTP
```

## smtpd setup
See [this](http://www.liljedahl.me/openbsd-and-smtpd/) for more details.
### /etc/mail/smtpd.conf 
```shell
listen on 127.0.0.1 port 25 hostname mydomain.com

expire 4h

table aliases db:/etc/mail/aliases.db
table secrets db:/etc/mail/secrets.db

accept for local alias <aliases> deliver to mbox
accept from local for any relay via tls+auth://yahoolabel@smtp.yahoo.com:587 auth <secrets>
```

### secrets
```shell
yahoolabel smtpuser@yahoo.com:password
```

need to run
```
# makemap secrets
```
to generate `secrets.db`

## References 
* [A Beginner's Guide To Firewalling with pf](https://srobb.net/pf.html)
* [Firewalling with OpenBSD's PF packet filter](http://home.nuug.no/~peter/pf/en/)

## Circumwent W\^X protection if necessary 
Starting OpenBSD 6.0 W\^X is on by default. Some ports haven't yet been converted to observe W^X, and they will not run.  Restrictions are by partition, so set
```
01020304050607.h /usr/local ffs rw,nodev,wxallowed 1 2
```
on the partition in `/etc/fstab` if you need to run such code on that partition.