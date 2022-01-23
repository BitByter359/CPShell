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

echo Welcome to CPShell Launcher!
echo Coded by Disasterocks.
echo Ideas by Watrmeln.
echo -------------------------
echo Type the number that corresponds to the option you want to select.
echo -------------------------
echo 1. Windows Explorer
echo 2. CPShell (You must know how to use command prompt!)
echo 3. Power Options
echo 4. Allow elevated permissions (Allows you to do more commands)
echo 5. CPShell tools
echo -------------------------
SET /P M=Option Number (e.g CPShell = 2) and press ENTER: 
IF %M%==1 GOTO EXPLORER
IF %M%==2 GOTO CPSHELL
IF %M%==3 GOTO SHUTDOWNPROMPT
IF %M%==4 GOTO UACPrompt
IF %M%==5 GOTO TOOLS

:TOOLS
cls
echo ------CPShell Tools--------
echo You can use these tools for
echo whatever you want! You can
echo also execute these during
echo a CPShell session.
echo ---------------------------
echo.
echo 1. UserTool
echo 2. NewBoot11 (ONLY RUN ON MICROSOFT WINDOWS 11!)
echo 3. Exit

SET /P M=Option Number (e.g NewBoot11 = 2) and press ENTER: 
IF %M%==1 usertool.bat
IF %M%==2 newboot.bat
IF %M%==3 goto MENU

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
echo You are now in the CPShell Prompt! Clack away!
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
SET /P AREYOUSURE=What are you going to do? Enter here: 
IF %M%==1 GOTO shutdown
IF %M%==2 GOTO restart
IF %M%==3 GOTO logoff

:shutdown
cls
title Shutting down...
echo It's sad to see you go!
echo CPShell will shutdown your PC in a few seconds...
shutdown /s
pause

:restart
cls
title Restarting...
echo It's sad to see you go!
echo CPShell will restart your PC in a few seconds...
shutdown /r
pause

:logoff
cls
title Logging off...
echo It's sad to see you go!
echo CPShell will log you out in a few seconds...
shutdown /l
pause

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
echo Would you like to give elevated permissions to CPShell to allow more commands? (Y/N)
SET /P M=Type "Y" or "N" to choose:  
IF %M%==Y GOTO YES
IF %M%==N GOTO MENU

:YES
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


