@echo off

git checkout publish
git add .
git commit -m Updates
git push

timeout 10