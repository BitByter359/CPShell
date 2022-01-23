@echo off
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"