rem
@echo off

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

cls

echo ##############################
echo #CPshell v1.2 Installler
echo #Made by disasterocks and watrmeln
echo ##############################
echo Press 1 to Install CPshell
echo Press 2 to Uninstall CPshell
echo.
SET /P M=Option Number (e.g Install = 1) and press ENTER: 
IF %M%==1 GOTO INSTALLPROMPT
IF %M%==2 GOTO UNINSTALLPROMPT

:INSTALLPROMPT
echo Are you sure you would like to install CPShell? (Y/N)
echo.
SET /P M=Choose option (e.g Install = Y) and press ENTER: 
IF %M%==Y GOTO INSTALL
IF %M%==N exit

:INSTALL
cls
echo Preparing Installation...
mkdir C:\CPShellFiles
echo Copying Files...
pushd "%~dp0"
copy "%CD%\CPShellFiles\" C:\CPShellFiles\ /Y
copy "%CD%\CPShellFiles\CPShell.bat" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /Y
pause
cls
echo Badabing-badaboom, CPShell is now installed! Please follow the post-setup instructions!
echo Press any key to open the Post-Install instructions.
pause
notepad Post.txt
pause
exit

:UNINSTALLPROMPT
echo Are you sure you would like to uninstall CPShell and all components? (Y/[N])
echo.
SET /P A=Choose option (e.g Uninstall = Y) and press ENTER: 
IF %A%==Y GOTO UNINSTALL
IF %A%==N exit

:UNINSTALL
cls
echo Preparing Uninstallation...
del C:\CPShellFiles\*.* /F /Q
echo Removing Files...
pushd "%~dp0"
rmdir C:\CPShellFiles /Q
del "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CPShell.bat" /F /Q
pause
cls
echo Sucessfully Uninstalled! It's sad to say goodbye!
pause
exit
