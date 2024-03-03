## Installation
Installed [OpenBSD 7.3](https://www.openbsd.org) from a custom ISO on [vultr](https://www.vultr.com).  ''Note:'' before rebooting you have to detach the ISO from the machine.

I selected ''full disk encryption''.  This means that before startup, the passphrase must be entered.  (I.e. automatic reboot will stop at that prompt and not proceed.)

Read [man afterboot](https://man.openbsd.org/afterboot)!

## Enable `doas`

* As root: `# cp /etc/examples/doas.conf /etc/doas.conf`.
* Add `username` to the wheel group: `# usermod -G wheel username`
* Add `permit persist :wheel` so that you don't have to reenter password for a while

## Permit only `ssh` trafic inbound:
```
pass out all
block in all

pass in quick proto tcp to vio0 port ssh flags S/SA keep state
```

## Run `syspatch`
To incorporate the latest fixes.

## Wireguard
  * https://www.vultr.com/docs/install-wireguard-vpn-server-on-openbsd-7-0/

### Installation
```shell
# sysctl net.inet.ip.forwarding=1 
# sysctl net.inet6.ip6.forwarding=1
# echo "net.inet.ip.forwarding=1" >> /etc/sysctl.conf
# echo "net.inet6.ip6.forwarding=1" >> /etc/sysctl.conf
```

```shell
# pkg_add wireguard-tools
# mkdir -p /etc/wireguard
# cd /etc/wireguard
# umask 077
# wg genkey > private.key
# wg pubkey < private.key > public.key
```