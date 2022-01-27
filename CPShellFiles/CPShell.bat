rem
@echo off



echo Loading CPShell Launcher...
taskkill /IM explorer.exe /F

goto MENU

call getcmdbit.bat
call windowmode.bat -pid %errorlevel% -mode maximized

:MENU
taskkill /IM explorer.exe /F
cls
title CPShell Launcher

echo  ______   ______   ______   ___   ___   ______   __       __           
echo /_____/\ /_____/\ /_____/\ /__/\ /__/\ /_____/\ /_/\     /_/\          
echo \:::__\/ \:::_ \ \\::::_\/_\::\ \\  \ \\::::_\/_\:\ \    \:\ \         
echo  \:\ \  __\:(_) \ \\:\/___/\\::\/_\ .\ \\:\/___/\\:\ \    \:\ \        BETA
echo   \:\ \/_/\\: ___\/ \_::._\:\\:: ___::\ \\::___\/_\:\ \____\:\ \____   
echo    \:\_\ \ \\ \ \     /____\:\\: \ \\::\ \\:\____/\\:\/___/\\:\/___/\  
echo     \_____\/ \_\/     \_____\/ \__\/ \::\/ \_____\/ \_____\/ \_____\/  
                                                                       
echo Because you deserve choice!
echo.
echo Welcome to CPShell!
echo -------------------------
echo Type the number that corresponds to the option you want to select.
echo -------------------------
echo 1. Windows Explorer
echo 2. CPShell (You must know how to use command prompt!)
echo 3. Power Options
echo 4. Restart with Admin (Allows you to execute more commands)
echo -------------------------
SET /P M=Option Number (e.g CPShell = 2) and press ENTER: 
IF %M%==1 GOTO EXPLORER
IF %M%==2 GOTO CPSHELL
IF %M%==3 GOTO SHUTDOWNPROMPT
IF %M%==4 GOTO UACPrompt

:EXPLORER
cls
echo Launching explorer...
\Windows\explorer.exe
exit

:CPSHELL
taskkill /IM explorer.exe /F
cls
title CPShell
cd \Windows\
echo You are now in the Command Prompt! Clack away!
echo Coded by disasterocks - ideas and stuff by Watrmeln
echo --
echo Use commands.bat (or just commands) for a list of commands
cmd
setx path "> "

:SHUTDOWNPROMPT
cls
title Power Options
echo Time to go?
echo 1. Shut down
echo 2. Restart
echo 3. Log off
echo 4. Cancel (Back to Menu)
SET /P AREYOUSURE=What are you going to do? Enter here: 
IF %M%==1 GOTO shutdown
IF %M%==2 GOTO restart
IF %M%==3 GOTO logoff
IF %M%==4 GOTO MENU

:shutdown
cls
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

:restart
cls
title Restarting...
echo It's sad to see you go!
echo CPShell will now restart your PC...
pause
shutdown /r /t 5
pause

:logoff
cls
title Logging off...
echo It's sad to see you go!
echo CPShell will now log you out...
pause
shutdown /l /t 0
pause

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "net" "session"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------



