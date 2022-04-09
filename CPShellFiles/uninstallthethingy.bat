@echo off
cls
echo This program will completely uninstall CPshell and its components!!!
SET /P M=Please  type "confirm uninstall"
IF %M%=="confirm uninstall" GOTO uninstall else GOTO reverse

:reverse
cls
title CPShell
cd \Windows\
echo You are now in the Command Prompt! Clack away!
echo Coded by disasterocks - ideas and stuff by Watrmeln
echo --
echo Use commands.bat (or just commands) for a list of commands
cmd
setx path "> "
:uninstall
taskkill /f /im cmd.exe
cls
echo Preparing Uninstallation...
echo on
del C:\CPShellFiles\*.* /F /Q
echo Removing Files...
pushd "%~dp0"
rmdir C:\CPShellFiles /Q
del "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CPShell.bat" /F /Q
echo off
pause
cls
echo Sucessfully Uninstalled! Your pc will reboot in 10 seconds.
pause
shutdown /r /t 10
exit
