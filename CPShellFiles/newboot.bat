@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Prompting UAC...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:-------------------------------------- 
setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" GOTO RUN
if NOT "%version%" == "10.0" GOTO INC
rem etc etc
endlocal
cls
:RUN
echo    ________  ________  ________  ________  ________  ________  ________ 
echo   /    /   \/        \/  /  /  \/       / /        \/        \/        \
echo  /         /         /         /  __    \/         /         /_______ _/
echo /         /        _/         /  /_/    /         /         //       /  
echo \__/_____/\________/\________/\_______ /\________/\________/ \______/   
color 03
echo E L E V E N
echo --------------------------------------------------------------------------------------
echo NEWBOOT FOR WINDOWS(R) 11
echo Coded by Watrmeln
echo --------------------------------------------------------------------------------------
echo Newboot allows you to enable the new startup animation in Windows 11.
echo (windows is a registered trademark of Microsoft Corporation.)
echo Select whether you would like to un/install the new animation.
echo --------------------------------------------------------------------------------------
echo 1. Install
echo 2. Disable
echo 3. Quit Newboot 11
echo --------------------------------------------------------------------------------------
SET /P M=Type number, then press the enter key: 
IF %M%==1 GOTO INS
IF %M%==2 GOTO UNS
IF %M%==3 GOTO QUITPROG

:QUITPROG
cls 
exit
#####################################

:REBOOT
cls
echo Newboot will now restart your pc...
shutdown /r /t 10
echo Your device will restart in 10 seconds.
pause
goto QUITPROG
#####################################

:INS
cls 
reg  add  HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\BootControl\ /v  BootProgressAnimation /t  REG_DWORD /d  1
echo The new animation is now installed on your PC!
echo --------------------------------------------------------------------------------------
echo 1. Restart now
echo 2. Restart later
echo --------------------------------------------------------------------------------------
SET /P M=Type number, then press the enter key: 
IF %M%==1 GOTO REBOOT
IF %M%==2 GOTO QUITPROG
#####################################

:UNS
cls 
reg  add  HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\BootControl\ /v  BootProgressAnimation /t  REG_DWORD /d  0 /f
echo The new animation is now Uninstalled.
echo --------------------------------------------------------------------------------------
echo 1. Restart now
echo 2. Restart later
echo --------------------------------------------------------------------------------------
SET /P M=Type number, then press the enter key: 
IF %M%==1 GOTO REBOOT
IF %M%==2 GOTO QUITPROG
#####################################

:INC
cls
echo Your version of windows is incompatibile with this program!!!
echo Come back on windows 11.
pause
exit