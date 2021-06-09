@echo off

REM | Description: Script to download streaming video
REM | Author: Lenar Bashirov
REM | links: ruframe.com | youtube.com/ruframe | 
REM | email: info@ruframe.com
REM | https://www.youtube.com/watch?v=bY8GME5HnUg

color 0A
mode con:cols=90 lines=25
title "Download streaming video | youtube.com/ruframe"

REM | video download agent
set agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/537.86.7"

REM | input string for video link
:link
cls
:repeat
set /p Link="Link: "

if NOT "%link%"=="" (goto name) else (
	cls
	echo.
	echo Error! Please input video link.
	goto :repeat
)

REM | input string for video name
:name
set /p Name="Video Name: "

if NOT "%Name%"=="" (goto app) else (
	cls
	echo.
	echo Error! Please input video name
	goto name
)

:app
ffmpeg -user_agent %agent% -i "%link%" -c copy "%name%.mp4"

echo.
echo Done.
pause

REM | erase the variable
cls
set Link=
set Name=

REM | request for next action
echo What's next?
echo 1 - Repeat download
echo 2 - Exit
choice /C:12 /n /m "Select 1 or 2:"
if "%errorlevel%"=="1" goto link
if "%errorlevel%"=="2" goto end

:end