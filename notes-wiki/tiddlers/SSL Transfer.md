This procedure works for transferring existing Let's Encrypt certificates to a new machine which has been assigned the same domain name.  (With the intent that the new machine is taking the place of the old and the old will be retired.)  After the transfer, the certificates can be renewed on the new machine.

1. Copy the site files, data etc to your new server

1. On the new server, create a directory for temporary certificates/keys, e.g. /etc/cert-migration

1. Create a file name-of-site-fullchain.pem in your migration directory, and copy and paste the contents of your certificate file on the old server from /etc/letsencrypt/live/name.of.site/fullchain.pem into it. Do the same for the key. Create  name-of-site-privkey.pem in your migrations directory and copy/paste from /etc/letsencrypt/live/name.of.site/privkey.pem. You probably need to set 600 permissions on the key file too.

1. Configure your webserver software on the new server to use the cert/key in the migrations directory.

1. Update your DNS records. While they propagate, some users get the old server, some get the new, but both work fine because they have the same, valid, SSL cert.

1. Next day, when the DNS has propagated, you'll be able to run certbot on your new server to get an updated cert, which you can renew at any time.

1. Alter your webserver configuration on the new server to use the new letsencrypt cert.

1. Delete the cert/key in the migration directory which are no longer needed.

1. Delete the website and the cert on your old server.

Source: [Daniel Howard - ServerFault](https://serverfault.com/a/932037)