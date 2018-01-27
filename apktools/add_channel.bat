set oPath=%~d0%~p0
set channelPath=%oPath%channels\
set outputPath=%oPath%outputs\

for /f "delims=" %%i in ('dir /b *.apk') do set apkName=%%~ni

rd /s/q %outputPath%
md %outputPath%

SETLOCAL ENABLEDELAYEDEXPANSION
for /f "delims=" %%i in ('dir /ad/b "%channelPath%"') do (
	set output=%outputPath%%apkName%-%%i.apk
	copy %oPath%%apkName%.apk !output! /y
	%oPath%7z a !output! %channelPath%%%i\* -mx=9
    echo |%oPath%sign !output!
)
cd /d %oPath%