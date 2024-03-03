@echo off

git checkout publish
git merge main
git checkout main

timeout 10