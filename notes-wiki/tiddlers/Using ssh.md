## To authenticate via private/public key pair
Generate key pair:
```
$ cd ~/.ssh
$ ssh-keygen -t ed25519
```
Alternative:
```
$ cd ~/.ssh
$ ssh-keygen -t rsa -b 4096
```
Use `ssh-copy-id` to copy the public key to the remote machine you want to log in, either as `ssh-copy-id user@remote.com` or `ssh-copy-id remote.com` (in case the remote user is the same as the local).

Now you can just do:
```
$ ssh remote.com
```
### Passphrase
[Here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/working-with-ssh-key-passphrases) is some commentary on the use of passphrases.

### File permissions
```
$ chmod 600 ~/.ssh/id_rsa
$ chmod 600 ~/.ssh/id_rsa.pub
``` 
For the public key file 644 is also okay.  For the `.ssh` directory, use 700, i.e
```
$ chmod u=rwx,go= ~/.ssh
```
Taken from [here](https://unix.stackexchange.com/questions/257590/ssh-key-permissions-chmod-settings).

## Alias for remote hosts
Edit `~/.ssh/config` and add sections (separated by `Host` specifications) like this:
```
Host myhost
Hostname remote.host.com
User myusername

Host myotherhost
Hostname other.host.com
User myothername
```
then you can log via:
```
$ ssh myhost
```
instead of
```
$ ssh -l myusername remote.host.com
```
For more options (e.g. `Port` or `IdentityFile`) see the [manual](https://man.openbsd.org/ssh_config).

## SSH with GitHub
To use ssh with github, generate a keypair with
```
$ ssh-keygen -t ed25519
```
and copy the content of the public key file to ***Settings > Access > [SSH and GPG keys](https://github.com/settings/keys)*** in github.

### TortoiseGit
To use TortoiseGit, generate a key pair with `PuTTYgen` (selecting type `ed25519`), copy the public key from the top of the GUI and [add it to GitHub](https://github.com/settings/keys), and set up the private key in TortoiseGit ***Settings > Git > Remote > Putty Key***.



## SSH Proxy
### Steps
* create proxy user with `/bin/nologin` as the shell
* create ssh key pair for automatic login
* create `_sshproxy` user

### Command line
`$ doas autossh -M 0 -f -i <private key path> -N -D 192.168.1.1:9000 proxy@server.domain.com`

### Proxy configuration file for the browser

```javascript
function FindProxyForURL(url, host)
{
  if ( shExpMatch(host, "*.netflix.com" )
    || shExpMatch(host, "*.hulu.com" )
    || shExpMatch(host, "*.apple.com" )
    || shExpMatch(host, "*.other.net" ) )
  {
    return "DIRECT";
  }

  return "SOCKS5 192.168.1.1:9000";
}
```

### Using proxy with Chrome

`"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --proxy-server=socks5://192.168.1.1:9000`

The important part here is that there are no (double) quotes around the `--proxy-server` argument.  It doesn't work with quotes (which is what many sites suggest).
