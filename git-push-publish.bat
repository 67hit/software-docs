@echo off

git checkout publish
git push
git checkout main

timeout 10