@echo off

start "SOFTWARE-NOTES" tiddlywiki notes-wiki --listen host=0.0.0.0 port=9001
start /min "SOFTWARE-NOTES-BACKUP" periodic-backup.bat