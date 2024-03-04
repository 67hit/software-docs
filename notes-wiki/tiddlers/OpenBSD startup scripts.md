## Script to keep OpenDNS IP address in sync with the local address
Use `ddclient`

### ddclient configuration
```bash
## OpenDNS.com account-configuration
##
protocol=dyndns2
use=web, web=myip.dnsomatic.com
ssl=yes
server=updates.opendns.com
login=username@address.com
password='password'
```

## rc.conf.local
This should not be edited directly.  Instead, use `rcctl`.

```bash
obsd65$ cat /etc/rc.conf.local
#dhcp server
dhcpd_flags="bnx0 bnx1"

#turn *off* sound server (on by default)
sndiod_flags=NO
```

## rc.local
```bash
obsd65$ cat /etc/rc.local
echo -n 'starting custom daemons:'

## ddclient for updating OpenDNS IP address
if [ -x /usr/local/sbin/ddclient ]; then
        echo -n ' ddclient' && /usr/local/sbin/ddclient
fi

echo '.'
```

## sysctl.conf
Edit this via `sysctl`.

```bash
obsd65$ cat /etc/sysctl.conf
machdep.allowaperture=2 # See xf86(4)
net.inet.ip.forwarding=1
net.inet.ip.mforwarding=1
```

## ssh proxy
This will start up ssh (using a "proxy" user on the remotes server and monitors the process to keep it alive.

* `-f` puts this into the background
* Everything after `-i` is passed to the ssh process
* `-N` doesn't log in the proxy user, so there is no need for the user to be able to login on the remote machine
* `-D` is the local port that will be forwarded


```bash
## autossh proxy connection to a server.67hit.com
if [ -x /usr/local/bin/autossh ]; then
        echo -n ' autossh' && autossh -M 0 -f -i /home/levente/proxy/id_rsa -N -D 192.168.1.1:9000 proxy@server.67hit.com
fi
```

### Firefox setup
In the proxy setting use `SOCKS v5` and also set the `Proxy DNS when using SOCKS v5`

### Chrome setup
Run the command line
`"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --proxy-server=socks5://192.168.1.1:9000`


# Not used anymore

## DansGuardian
```bash
chmod +x /usr/local/share/dansguardian/scripts/bsd-init
cat >> /etc/rc.local << EOF
# DansGuardian
if [ -x /usr/local/sbin/dansguardian ]; then
 /usr/local/share/dansguardian/scripts/bsd-init start
fi
EOF
cat >> /etc/rc.shutdown << EOF
vi /etc/rc.shutdown
# DansGuardian
if [ -x /usr/local/sbin/dansguardian ]; then
 /usr/local/share/dansguardian/scripts/bsd-init stop
fi
EOF
```