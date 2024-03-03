@echo off

taskkill /FI "windowtitle eq SOFTWARE-NOTES-WIKI*"
taskkill /FI "windowtitle eq SOFTWARE-NOTES-BACKUP*"

timeout 10