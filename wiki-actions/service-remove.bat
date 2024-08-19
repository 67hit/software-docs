@echo off
call %~dp0\service-config.bat
echo Stopping Service
nssm stop %SERVICENAME%
echo Removing Service
nssm remove %SERVICENAME% confirm
pause
