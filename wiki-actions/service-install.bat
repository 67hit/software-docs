@echo off
call %~dp0\service-config.bat
echo Installing Service
nssm install %SERVICENAME% %TIDDLYCMD% %WIKIDIR% --listen host=%HOST% port=%PORT%
echo Starting Service
nssm start %SERVICENAME%
pause
