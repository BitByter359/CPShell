@echo off
echo Number 1
set/p one=
echo.
echo What would you like to do? (+,-,*,/)
echo + = Add
echo - = Subtract
echo * = Multiply
echo / = Divide
set/p two=%one%
echo.
echo And type the last number.
set/p three=%one%%two%
echo.
set/a final=%one%%two%%three%
echo Total:
echo %one%%two%%three%=%final%
pause