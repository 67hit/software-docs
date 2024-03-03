@echo off

taskkill /FI "windowtitle eq SOFTWARE-NOTES*"
taskkill /FI "windowtitle eq SOFTWARE-NOTES-BACKUP*"

timeout 10