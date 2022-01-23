@echo off

:MENU
cls
echo UserTool by Disasterocks
echo.
echo.
echo What would you like to do?
echo.
echo 1. Create a new standard user
echo 2. Create a new administrator
echo 3. Remove a user
echo 4. Remove an administrator
echo 5. Display a list of users
echo 6. Exit
echo.
SET /P M=Choose the number corresponding to your choice and press ENTER: 
IF %M%==1 GOTO CREATEUSER
IF %M%==2 GOTO CREATEADMIN
IF %M%==3 GOTO REMOVEUSER
IF %M%==4 GOTO REMOVEADMIN
IF %M%==5 GOTO DISPLAY
IF %M%==6 GOTO EXIT

:CREATEUSER
cls
echo Welcome to the create user wizard!
echo I will guide you through your way!
echo.
pause

cls
echo What would you like your new username to be?
echo.
SET /P U=Enter username here: 
pause

cls
echo Please type your password. If you would not like one, leave it blank!
echo.
SET /P P=Enter password here:
pause

cls
echo Adding account with name %U%
NET USER %U% %P% /ADD
cls
echo.
pause
goto menu

:CREATEADMIN
cls
echo Welcome to the create admin wizard!
echo I will guide you through your way!
echo.
pause

cls
echo What would you like your new username to be?
echo.
SET /P U=Enter username here: 
pause

cls
echo Please type your password. If you would not like one, leave it blank!
echo.
SET /P P=Enter password here:
pause

cls
echo Adding account with name %U% ...
NET USER %U% %P% /ADD
echo Adding %U% to administrators...
NET LOCALGROUP administrators %U% /ADD
cls
echo.
pause
goto menu

:REMOVEUSER
cls
echo Welcome to the remove user wizard!
echo I will guide you through your way!
echo.
pause

cls
echo Who do you want to remove?
echo.
SET /P U=Enter username here: 
pause

cls
echo Removing %U%
NET USER %U% /DELETE
cls
echo.
pause
goto menu

:REMOVEADMIN
cls
echo Welcome to the remove admin wizard!
echo I will guide you through your way!
echo.
pause

cls
echo Who do you want to remove?
echo.
SET /P U=Enter username here: 
pause

cls
echo Removing %U% from administrators...
NET LOCALGROUP administrators %U% /DELETE
echo Removing %U% ...
NET USER %U% /DELETE
cls
echo.
pause
goto menu

:DISPLAY
net user
echo.
pause
goto menu
