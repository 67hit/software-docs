@echo off

taskkill /FI "windowtitle eq notes-wiki*"
taskkill /FI "windowtitle eq SOFTWARE-NOTES-BACKUP*"

timeout 10