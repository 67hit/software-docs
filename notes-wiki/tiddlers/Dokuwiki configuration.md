## Customize `css` across all templates
Create a `userstyle.css` in the `conf` directory with the needed customizations, e.g.
```css
h2 { margin-top: 1em}
pre {
  background-color: #fffff6;
  white-space: pre-wrap;
}
```

## Mediawiki SMTP configuration
This goes into `LocalSettings.php` after local smtp mail has been set up.
```php
$wgSMTP = array (
        'host'   => '127.0.0.1',
        'IDHost' => 'localhost',
        'port'   => 25,
        'auth'   => false
);
```

On OpenBSD smtpd (OpenSMTPD) is used.
