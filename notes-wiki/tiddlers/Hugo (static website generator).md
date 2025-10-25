## Introduction

Hugo is software to generate "static" websites, i.e. sites where the pages are not generated "on the fly" (like php, etc.) but already available before page requests.  Hugo takes *content files* (e.g. written in markdown), passes them through *templates* to generate *html* and copies these, along with optional javascript, css, image, etc. files to the *public* folder which then can be moved to the web server.

## Useful Hugo information
- [Template types](https://gohugo.io/templates/types/)
  - [Template lookup order](https://gohugo.io/templates/lookup-order/)
- [Shortcodes](https://gohugo.io/content-management/shortcodes/)
- [Menus](https://gohugo.io/content-management/menus/)
- [resources.GetRemote](https://gohugo.io/functions/resources/getremote/)
  - [Resource functions](https://gohugo.io/functions/resources/)
- [partials.Include](https://gohugo.io/functions/partials/include/)

## Local site development
```
$ hugo serve -D
```
At startup this will show the local port and URL where the site can be accessed.  The site as seen locally will update for any file changes.  The `-D` flag will display the pages having `draft: true` in their front matter.


## Building
```
$ hugo build
```
This will create the site in the `public` directory.


## Deploying
If you can host your own site and have ssh access to it you can use `rsync` via ssh for deployment.

```
$ rsync -rv --delete -e ssh public/ user@example.com:sites/your-site.com/htdocs/target/
```

(The `-r` flag is for recursive operation.)  For this to work as shown, you need passowrdless login already set up to the target site.

### Complete script
```bash
#!/usr/bin/bash
echo "*** BUILDING SITE ***"
hugo build

echo
echo "*** COPYING TO TARGET ***"
rsync -r --info=STATS --delete -e ssh public/ user@example.com:sites/your-site.com/htdocs/target/

echo
echo "*** UPDATING TARGET PERMISSIONS ***"
ssh example.com chmod --changes --recursive a+rx user@example.com:sites/your-site.com/htdocs/target

echo
echo "*** DONE ***"
```

## Templates
### Template lookup

Each page has a *[Kind](https://gohugo.io/methods/page/kind/)* property:

```
content/
├── books/
│   ├── book-1/
│   │   └── index.md    <-- kind = page
│   ├── book-2.md       <-- kind = page
│   └── _index.md       <-- kind = section
├── tags/
│   ├── fiction/
│   │   └── _index.md   <-- kind = term
│   └── _index.md       <-- kind = taxonomy
└── _index.md           <-- kind = home
```

