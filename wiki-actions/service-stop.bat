@echo off
call %~dp0\service-config.bat
echo Stopping Service
nssm stop %SERVICENAME%
pause
