Build/update the site on `main`.  When ready, do this:

```
git fetch origin
git switch publish
git merge --ff-only origin/main
git push origin publish
```

Or on a single line:

`git fetch origin; git switch publish; git merge --ff-only origin/main; git push origin publish; git switch main`

Note that the workflow action is set up to deploy the new site when push to `publish` happens.