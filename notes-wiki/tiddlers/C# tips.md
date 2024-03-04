## HttpListener Access Control
### Official
```bat
netsh http add urlacl url=http://+:80/MyUri user=DOMAIN\user
```
### What worked for me
Only the explicit specs worked for me, like this:
```bat
netsh http add urlacl url=http://localhost:80/MyUri user=DOMAIN\user
netsh http add urlacl url=http://host:80/MyUri user=DOMAIN\user
netsh http add urlacl url=http://host.domain.tld:80/MyUri user=DOMAIN\user
```
