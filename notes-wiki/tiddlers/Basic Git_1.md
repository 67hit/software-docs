Git is a distributed version-control system for tracking changes in source code during software development, more generally, changes in a set of files which could, e.g. be TeX "source" code for a document.

## Create repository
Use the TortoiseGit menu **in the folder** you want to bring under version control.

## Add files
You can add files individually, or all files in a folder (and its subfolders).  Eventually, adding the folder will list files that should be ignored by git, for example byte-compiled .pyc files that should not be under version control.  For this purpose is ```.gitignore```.

### Make git ignore some file types
Create and edit the file ```.gitignore```.  (This is easiest done the first time there are files you don't want to add.)  You can add files to ```.gitignore``` from Tortoise, or look up the [syntax](https://git-scm.com/docs/gitignore) and play with setting up the file until unwanted files don't show up for ```add```.

## Commit the latest file version
Committing will record the latest version of files in the history.  To be able to commit your changes you will have to enter a commit message.

## Renaming files
You can use ```rename``` from Tortoise.

If you renamed the file (under version control) outside of git, at the time of ```commit``` the file will appear as ```missing```.  If you ```add``` the file with new name and ```delete``` the ```missing``` one, git will recognize that the file has been renamed.  (It is generally important for tracking changes across renaming files.)

## Deleting files
If you delete files (that are under version control) git will show them as missing.

## Diffing
Typically you want to diff against your last commit.  (But you can use diff to compare any two selected -- text -- files.  In fact, the script coming with Tortoise under Windows allows you to keep Word documents in git and compare them to their previously committed versions.)

## Customize TortoiseGit
Configure the main right-click menu from the ```Settings``` menu item.  It is practical to show the most often used commands here.

# "Advanced" git
Later...
## Remote repositories
## Collaboration on GitHub / GitLab / BitBucket /etc.
### Automatic credentials on OpenBSD
```sh
> git config credential.helper store
```
then
```sh
> git pull
```
and provide a username and password.  This will be recorded in `~/.git-credentials`. (The credentials are stored with the disk permissions of "just user readable/writable" but still in plaintext.)

If you change the password later `git pull` Will fail, because the password is incorrect, git then removes the offending user+password from the `~/.git-credentials` file, so now re-run `git pull`
to provide a new password so it works as earlier.

Information taken from [StackOverflow](https://stackoverflow.com/questions/35942754/how-to-save-username-and-password-in-git).