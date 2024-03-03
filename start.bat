@echo off

start "SOFTWARE-NOTES" run-wiki.bat
start /min "SOFTWARE-NOTES-BACKUP" periodic-backup.bat