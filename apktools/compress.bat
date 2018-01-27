set oPath=%~d0%~p0
set tempPath=%oPath%temp\
set apk=%1

if exist %oPath%%apk% set apk=%oPath%%apk%

rd /s/q %tempPath%
%oPath%7z x %apk% -o%tempPath%
%oPath%7z a %apk% %tempPath%* -mx=9
rd /s/q %tempPath%
echo |%oPath%sign %apk%
cd /d %oPath%