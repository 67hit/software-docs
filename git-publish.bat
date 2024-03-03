@echo off

git checkout publish
git merge main
git push
git checkout main

timeout 10