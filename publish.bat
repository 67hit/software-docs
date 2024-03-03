@echo off

git checkout publish
git add .
git commit -m Updates
git push
git checkout main

timeout 10