@echo off

rem This line is commented - remark
:: This is 2nd way to comment line

title Hello, World!

echo %DATE%
echo %TIME%

color 0a

echo Welcome!
echo.
set /p name="Enter your name: "

if "%name%" == "Dima" (echo That's a great name!) else (echo Hello, %name%!)

:: create file if it doesn't exists otherwise override all content
echo %name%> Username.txt

:: append to existing content
echo %name%>> Username.txt

:: create empty file, rename it and then delete it
type NUL > empty.txt
pause
ren empty.txt delete.txt
pause
del delete.txt

:: example usage of "cls", "goto" commands

echo Press any key to clear

pause

cls

:marker

echo Good job!

pause

:: same way
:: GOTO marker
goto :marker
