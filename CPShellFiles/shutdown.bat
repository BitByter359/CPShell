@echo off
setlocal
if "%version%" == "10.0" == 1 set result=true
if "%version%" == "6.4" == 1 set result=true
if "%version%" == "6.3" == 1 set result=true
if "%version%" == "6.2" == 1 set result=true
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if ("%result%" == true) ( GOTO shd ) ELSE ( GOTO hybrid )
rem check to see if hybrid is a thing
endlocal
cls

:shd
title Shutting down...
echo It's sad to see you go!
echo CPShell will shut down your PC in a few seconds...
shutdown /s /t 10
pause

:hybrid
title Shutting down as Fast Startup...
echo It's sad to see you go!
echo CPShell will shut down your PC in a few seconds...
shutdown /s /t /hybrid 10
pause
