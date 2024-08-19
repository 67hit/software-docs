@echo off
call %~dp0\service-config.bat
echo Starting Service
nssm start %SERVICENAME%
pause
