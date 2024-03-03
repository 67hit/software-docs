@echo off

:loop
git checkout main
git add .
git commit -m Update
git push
timeout 3600
goto loop
